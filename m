Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C430791317C
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 04:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745727.1152864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKq3U-0006J1-6E; Sat, 22 Jun 2024 02:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745727.1152864; Sat, 22 Jun 2024 02:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKq3U-0006Gy-3B; Sat, 22 Jun 2024 02:00:40 +0000
Received: by outflank-mailman (input) for mailman id 745727;
 Sat, 22 Jun 2024 02:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKq3S-0006Gl-IH; Sat, 22 Jun 2024 02:00:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKq3S-0007c5-5J; Sat, 22 Jun 2024 02:00:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKq3R-0000Wd-JI; Sat, 22 Jun 2024 02:00:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sKq3R-0002Kb-FY; Sat, 22 Jun 2024 02:00:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Abjw08gUudcfhckiWdyhT0cJFqZi9piOwUfMANAUC2w=; b=g3F1+gz6DgWU1F6dBtb8g7V/AD
	74ncyvnhd5DwRZmO7Bj4lCheEGJeGdFX9FsLGoh2X+hg7uQYb8+7YzkjFkWTkNH05/jBDV5UW/WTM
	lVylBuZ7TgcxMvwKrgleVmTJogfCfR3aMcYXhvakKB99YvArAYH/QAdvJ30iT8OvpgSA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186445-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186445: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a6398e37309000e35cedb5cc328a0f8d00d7d7b9
X-Osstest-Versions-That:
    linux=eb44d83053d66372327e69145e8d2fa7400a4991
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Jun 2024 02:00:37 +0000

flight 186445 linux-6.1 real [real]
flight 186450 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186445/
http://logs.test-lab.xenproject.org/osstest/logs/186450/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 186450-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186370
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186370
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186370
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186370
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186370
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186370
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a6398e37309000e35cedb5cc328a0f8d00d7d7b9
baseline version:
 linux                eb44d83053d66372327e69145e8d2fa7400a4991

Last test of basis   186370  2024-06-16 12:15:05 Z    5 days
Testing same since   186445  2024-06-21 12:46:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Csókás, Bence" <csokas.bence@prolan.hu>
  Aapo Vienamo <aapo.vienamo@linux.intel.com>
  Adam Miotk <adam.miotk@arm.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexey Kodanev <aleksei.kodanev@bell-sw.com>
  Allen Pais <apais@linux.microsoft.com>
  Amit Sunil Dhamne <amitsd@google.com>
  Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andrei Coardos <aboutphysycs@gmail.com>
  Andrei Vagin <avagin@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antonio Quartulli <a@unstable.cc>
  Apurva Nandan <a-nandan@ti.com>
  Armin Wolf <W_Armin@gmx.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Baokun Li <libaokun1@huawei.com>
  Baoquan He <bhe@redhat.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Beleswar Padhi <b-padhi@ti.com>
  Ben Segall <bsegall@google.com>
  Benjamin Segall <bsegall@google.com>
  Benjamin Tissoires <bentiss@kernel.org>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Björn Töpel <bjorn@rivosinc.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Chandan Kumar Rout <chandanx.rout@intel.com>
  Chen Hanxiao <chenhx.fnst@fujitsu.com>
  Chris Maness <christopher.maness@gmail.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Cong Wang <cong.wang@bytedance.com>
  Cong Yang <yangcong5@huaqin.corp-partner.google.com>
  Csókás, Bence <csokas.bence@prolan.hu>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Cross <crossd@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Jiang <dave.jiang@intel.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Lechner <dlechner@baylibre.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  DelphineCCChiu <delphine_cc_chiu@wiwynn.com>
  Dev Jain <dev.jain@arm.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Brown <doug@schmorgal.com>
  Douglas Anderson <dianders@chromium.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gabor Juhos <j4g8y7@gmail.com>
  Gal Pressman <gal@nvidia.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregor Herburger <gregor.herburger@tq-group.com>
  Hagar Gamal Halim Hemdan <hagarhem@amazon.com>
  Hagar Hemdan <hagarhem@amazon.com>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hailong.Liu <hailong.liu@oppo.com>
  Hamish Martin <hamish.martin@alliedtelesis.co.nz>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Hersen Wu <hersenxs.wu@amd.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Ian Forbes <ian.forbes@broadcom.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Inki Dae <inki.dae@samsung.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Jason Xing <kernelxing@tencent.com>
  Jean Delvare <jdelvare@suse.de>
  Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jia Zhu <zhujia.zj@bytedance.com>
  Jie Wang <wangjie125@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Jiri Kosina <jkosina@suse.com>
  Jiri Olsa <jolsa@kernel.org>
  Jisheng Zhang <jszhang@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Ernberg <john.ernberg@actia.se>
  John Keeping <john@metanate.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joshua Washington <joshwash@google.com>
  José Expósito <jose.exposito89@gmail.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karol Kolacinski <karol.kolacinski@intel.com>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  Kory Maincent <kory.maincent@bootlin.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kuangyi Chiang <ki.chiang65@gmail.com>
  Kun(llfl) <llfl@linux.alibaba.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kyle Tso <kyletso@google.com>
  Lars Kellogg-Stedman <lars@oddbit.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Lin Ma <linma@zju.edu.cn>
  Lingbo Kong <quic_lingbok@quicinc.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lion Ackermann <nnamrec@gmail.com>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Ferland <marc.ferland@sonatest.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Krastev <martin.krastev@broadcom.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <mripard@kernel.org>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Michal Wilczynski <michal.wilczynski@intel.com>
  Mickaël Salaün <mic@digikod.net>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Moshe Shemesh <moshe@mellanox.com>
  Moshe Shemesh <moshe@nvidia.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nam Cao <namcao@linutronix.de>
  NeilBrown <neilb@suse.de>
  Nicolas Escande <nico.escande@gmail.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nirmoy Das <nirmoy.das@intel.com>
  Nuno Sa <nuno.sa@analog.com>
  Oleg Nesterov <oleg@redhat.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Olga Kornievskaia <kolga@netapp.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Delevoryas <peter@pjd.dev>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Pavlu <petr.pavlu@suse.com>
  Pierre Tomon <pierretom+12@ik.me>
  Przemek Kitszel <przemyslaw.kitszel@intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com>
  Qu Wenruo <wqu@suse.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rao Shoaib <Rao.Shoaib@oracle.com>
  Remi Pommarel <repk@triplefau.lt>
  Richard Cochran <richardcochran@gmail.com>
  Rick Wertenbroek <rick.wertenbroek@gmail.com>
  Rik van Riel <riel@surriel.com>
  Ron Economos <re@w6rz.net>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam James <sam@gentoo.org>
  Samuel Holland <samuel.holland@sifive.com>
  Sasha Levin <sashal@kernel.org>
  SeongJae Park <sj@kernel.org>
  Sergey Ryazanov <ryazanov.s.a@gmail.com>
  Shahar S Matityahu <shahar.s.matityahu@intel.com>
  Shay Drory <shayd@nvidia.com>
  Shichao Lai <shichaorai@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sicong Huang <congei42@163.com>
  Steev Klimaszewski <steev@kali.org>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Su Yue <glass.su@suse.com>
  Subbaraya Sundeep <sbhatta@marvell.com>
  Sven Joachim <svenjoac@gmx.de>
  Taehee Yoo <ap420073@gmail.com>
  Tariq Toukan <tariqt@nvidia.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadym Krevs <vkrevs@yahoo.com>
  Vamshi Gajjela <vamshigajjela@google.com>
  Vidya Srinivas <vidya.srinivas@intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vinod Koul <vkoul@kernel.org>
  Vlastimil Babka <vbabka@suse.cz>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>
  Wei Fu <fuweid89@gmail.com>
  Wen Gu <guwen@linux.alibaba.com>
  Wesley Cheng <quic_wcheng@quicinc.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xin Yin <yinxin.x@bytedance.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yonglong Liu <liuyonglong@huawei.com>
  YonglongLi <liyonglong@chinatelecom.cn>
  Yongzhi Liu <hyperlyzcs@gmail.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zack Rusin <zackr@vmware.com>
  Ziwei Xiao <ziweixiao@google.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   eb44d83053d6..a6398e373090  a6398e37309000e35cedb5cc328a0f8d00d7d7b9 -> tested/linux-6.1

