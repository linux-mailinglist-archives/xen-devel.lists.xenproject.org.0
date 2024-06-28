Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0891B587
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 05:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750461.1158591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN2R2-00013o-Ht; Fri, 28 Jun 2024 03:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750461.1158591; Fri, 28 Jun 2024 03:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN2R2-00011A-F5; Fri, 28 Jun 2024 03:38:04 +0000
Received: by outflank-mailman (input) for mailman id 750461;
 Fri, 28 Jun 2024 03:38:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sN2R0-00010h-Rj; Fri, 28 Jun 2024 03:38:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sN2R0-0001Rm-Ks; Fri, 28 Jun 2024 03:38:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sN2R0-0001cf-7q; Fri, 28 Jun 2024 03:38:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sN2R0-0005Nz-7N; Fri, 28 Jun 2024 03:38:02 +0000
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
	bh=8IPbMy3tcM9ucdvhgl8J/Vdfaug4nNgVXvK5Jb0QKPU=; b=YUVsx5FAsk70wbm6tgvRKledRY
	4Ax+8ve2ActmEAjVQGTf2Q5o9P3iD6hoxEqtDGYWChY9NK/SbBflMC8a/U5FWHwogI2qjB3Tk5P77
	GwZyJTWT7fxJAniqZVM8NGstuaF3wp1UaTsqhPso3jjAp+XbGhg9sAIC2tYcgeFpbQwE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186532: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
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
    linux=99e6a620de00b96f059c9e7f14b5795ca0c6b125
X-Osstest-Versions-That:
    linux=a6398e37309000e35cedb5cc328a0f8d00d7d7b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Jun 2024 03:38:02 +0000

flight 186532 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186532/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186445
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186445
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186445
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186445
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186445
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186445
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
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
 linux                99e6a620de00b96f059c9e7f14b5795ca0c6b125
baseline version:
 linux                a6398e37309000e35cedb5cc328a0f8d00d7d7b9

Last test of basis   186445  2024-06-21 12:46:38 Z    6 days
Testing same since   186532  2024-06-27 12:12:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Ajrat Makhmutov <rauty@altlinux.org>
  Ajrat Makhmutov <rautyrauty@gmail.com>
  Aleksandr Aprelkov <aaprelkov@usergate.com>
  Aleksandr Nogikh <nogikh@google.com>
  Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Alex Hung <alex.hung@amd.com>
  Allen Pais <apais@linux.microsoft.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Ballance <andrewjballance@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Chi <andy.chi@canonical.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antje Miederhöfer <a.miederhoefer@gmx.de>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvid Norlander <lkml@vorpal.se>
  Ben Fradella <bfradell@netapp.com>
  Benjamin Tissoires <bentiss@kernel.org>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Changbin Du <changbin.du@huawei.com>
  Chenghai Huang <huangchenghai2@huawei.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Cyrus Lien <cyrus.lien@canonical.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Jordan <daniel.m.jordan@oracle.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Ertman <david.m.ertman@intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Ruth <druth@chromium.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Dustin L. Howett <dustin@howett.net>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  En-Wei Wu <en-wei.wu@canonical.com>
  Eric Dumazet <edumazet@google.com>
  Eric Heintzmann <heintzmann.eric@free.fr>
  Erico Nunes <nunes.erico@gmail.com>
  Esben Haabendal <esben@geanix.com>
  Fabio Estevam <festevam@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grygorii Tertychnyi <grembeter@gmail.com>
  Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
  Hans de Goede <hdegoede@redhat.com>
  Heng Qi <hengqi@linux.alibaba.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ido Schimmel <idosch@nvidia.com>
  Ignat Korchagin <ignat@cloudflare.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Jiri Kosina <jkosina@suse.com>
  Joao Pinto <Joao.Pinto@synopsys.com>
  Joao Pinto <jpinto@synopsys.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Justin Stitt <justinstitt@google.com>
  Kalle Niemi <kaleposti@gmail.com>
  Kalle Valo <quic_kvalo@quicinc.com>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Klara Modin <klarasmodin@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Leon Romanovsky <leon@kernel.org>
  Leon Yen <leon.yen@mediatek.com>
  Li RongQing <lirongqing@baidu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luiz Angelo Daros de Luca <luizluca@gmail.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Manish Rangankar <mrangankar@marvell.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin Hoyer <mhoyer@redhat.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Leung <martin.leung@amd.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthias Maennich <maennich@google.com>
  Max Krummenacher <max.krummenacher@toradex.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
  Namhyung Kim <namhyung@kernel.org>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nikita Shubin <n.shubin@yadro.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Parker Newman <pnewman@connecttech.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Patrisious Haddad <phaddad@nvidia.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qiang Yu <yuq825@gmail.com>
  Rafael Aquini <aquini@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Ron Economos <re@w6rz.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sanath S <Sanath.S@amd.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sean O'Brien <seobrien@chromium.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  SeongJae Park <sj@kernel.org>
  Shawn Guo <shawnguo@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <horms@kernel.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Songyang Li <leesongyang@outlook.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stefan Wahren <wahrenst@gmx.net>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Sven Eckelmann <sven@narfation.org>
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tony Luck <tony.luck@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uri Arev <me@wantyapps.xyz>
  Vinod Koul <vkoul@kernel.org>
  Wander Lairson Costa <wander@redhat.com>
  Wayne Lin <wayne.lin@amd.com>
  Will Deacon <will@kernel.org>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xin Long <lucien.xin@gmail.com>
  Xu Liang <lxu@maxlinear.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yongqin Liu <yongqin.liu@linaro.org>
  Yuchung Cheng <ycheng@google.com>
  Yue Haibing <yuehaibing@huawei.com>
  Yunlei He <heyunlei@oppo.com>
  Zqiang <qiang.zhang1211@gmail.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
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
   a6398e373090..99e6a620de00  99e6a620de00b96f059c9e7f14b5795ca0c6b125 -> tested/linux-6.1

