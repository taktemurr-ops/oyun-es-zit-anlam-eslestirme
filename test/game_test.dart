import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_es_zit_anlam_eslestirme/oyun_es_zit_anlam_eslestirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(esZitConfig.title.length, 33);
    expect(esZitConfig.tagline.length, 33);
    for (final s in esZitConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(esZitConfig.gameId, esZitId);
    expect(esZitRules.gameId, esZitId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(esZitRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: esZitId, optionalMechanics: esZitRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      esZitRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(esZitRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
