Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FB7E89E8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 09:46:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630893.984061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1jci-0006PJ-PU; Sat, 11 Nov 2023 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630893.984061; Sat, 11 Nov 2023 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1jci-0006Mq-MZ; Sat, 11 Nov 2023 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 630893;
 Sat, 11 Nov 2023 08:45:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1jch-0006Mg-LL; Sat, 11 Nov 2023 08:45:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1jch-0002Cw-Es; Sat, 11 Nov 2023 08:45:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1jch-0005nU-0a; Sat, 11 Nov 2023 08:45:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1jch-0005A2-05; Sat, 11 Nov 2023 08:45:47 +0000
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
	bh=1fQGlQuOlWw4/hVeZOdlbxgKM0U8WUsC0PqFKucr5s4=; b=4y7nypZtwVgxX8+hC8gw+CEEwU
	eOwysN9Th7FKp2C4zdZcUw8LWGsOxwuGsNYS4ZOk0nK3FXBd+nCRC497If5NlVRpIVm10bLaN6lOZ
	0PdxSYbOc+IExhcQVDb6D5wVD8Ael+mHyyZPVBRNizpPihDNgSb4g23JUWKjGLRADsa4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183731-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 183731: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
X-Osstest-Versions-That:
    linux=89cdf9d556016a54ff6ddd62324aa5ec790c05cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Nov 2023 08:45:47 +0000

flight 183731 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183731/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183728
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183728
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183728
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183728
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183728
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183728
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183728
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183728
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
baseline version:
 linux                89cdf9d556016a54ff6ddd62324aa5ec790c05cc

Last test of basis   183728  2023-11-10 06:14:27 Z    1 days
Failing since        183730  2023-11-10 19:13:44 Z    0 days    2 attempts
Testing same since   183731  2023-11-11 01:42:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Spataru <alex_spataru@outlook.com>
  Alexander Koskovich <akoskovich@pm.me>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alvin Lee <alvin.lee2@amd.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andreas Schwab <schwab@suse.de>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anthony Koo <anthony.koo@amd.com>
  Anuj Gupta <anuj20.g@samsung.com>
  Anup Patel <apatel@ventanamicro.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Asad Kamal <asad.kamal@amd.com>
  Bean Huo <beanhuo@micron.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Björn Töpel <bjorn@rivosinc.com>
  Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Dhere <chaitanya.dhere@amd.com>
  Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  ChunTao Tso <chuntao.tso@amd.com>
  Clément Léger <cleger@rivosinc.com>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Miess <daniel.miess@amd.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  David Lin <CTLIN0@nuvoton.com>
  David Rau <David.Rau.opensource@dm.renesas.com>
  David Yat Sin <David.YatSin@amd.com>
  Dennis Chan <Dennis.Chan@amd.com>
  Dominique Martinet <dominique.martinet@atmark-techno.com>
  Douglas Anderson <dianders@chromium.org>
  Drew Fustini <dfustini@baylibre.com>
  Dylan Yudaken <dyudaken@gmail.com>
  Emil Renner Berthing <emil.renner.berthing@canonical.com>
  Emil Renner Berthing <kernel@esmil.dk>
  Eric Biggers <ebiggers@google.com>
  Erik Kurzinger <ekurzinger@nvidia.com>
  Eugen Hristev <eugen.hristev@collabora.com>
  Evan Green <evan@rivosinc.com>
  Fangzhi Zuo <jerry.zuo@amd.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Shen <george.shen@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guo Ren <guoren@kernel.org>
  Hannes Reinecke <hare@suse.de>
  Haorong Lu <ancientmodern4@gmail.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Helge Deller <deller@gmx.de>
  Hersen Wu <hersenxs.wu@amd.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hunter Chasens <hunter.chasens18@ncf.edu>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilya Bakoulin <ilya.bakoulin@amd.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jani Nikula <jani.nikula@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jia He <justin.he@arm.com>
  Jiadong Zhu <Jiadong.Zhu@amd.com>
  Jinyu Tang <tangjinyu@tinylab.org>
  JinZe.Xu <jinze.xu@amd.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joshua Aberback <joshua.aberback@amd.com>
  José Pekkarinen <jose.pekkarinen@foxhound.fi>
  Kai-Heng Feng <kai.heng.geng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kanchan Joshi <joshi.k@samsung.com>
  Keguang Zhang <keguang.zhang@gmail.com>
  Keith Busch <kbusch@kernel.org>
  Kenji Tomonaga <tkenbo@gmail.com>
  Kevin Brodsky <kevin.brodsky@arm.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #On
  Le Ma <le.ma@amd.com>
  Li Lingfeng <lilingfeng3@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Marc Zyngier <maz@kernel.org>
  Marielle Novastrider <marielle@novastrider.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Hasemeyer <markhas@chromium.org>
  Mark O'Donovan <shiftee@posteo.net>
  Mark Rutland <mark.rutland@arm.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Maxime Ripard <mripard@kernel.org>
  Mayuresh Chitale <mchitale@ventanamicro.com>
  Mika Kahola <mika.kahola@intel.com>
  Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nam Cao <namcaov@gmail.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nirmoy Das <nirmoy.das@intel.com>
  Nitin Yadav <n-yadav@ti.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Ovidiu Bunea <ovidiu.bunea@amd.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Moore <paul@paul-moore.com>
  Peter Lafreniere <peter@n8pjl.ca>
  Petr Tesarik <petr.tesarik1@huawei-partners.com>
  Petr Tesarik <petrtesarik@huaweicloud.com>
  Philipp Stanner <pstanner@redhat.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafael Beims <rafael.beims@toradex.com>
  Randy Dunlap <rdunlap@infradead.org> (v2)
  Rob Herring <robh@kernel.org>
  Rodrigo Siqueira <rodrigo.siqueira@amd.com>
  Roman Li <roman.li@amd.com>
  Samuel Holland <samuel.holland@sifive.com>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shuming Fan <shumingf@realtek.com>
  Simon Ser <contact@emersion.fr>
  Steve French <stfrench@microsoft.com>
  Sung Joon Kim <sungkim@amd.com>
  Surbhi Kakarya <surbhi.kakarya@amd.com>
  Syed Saba Kareem <Syed.SabaKareem@amd.com>
  Taimur Hassan <syed.hassan@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Zhou <tao.zhou1@amd.com>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tim Huang <Tim.Huang@amd.com>
  Tony Lindgren <tony@atomide.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Victor Lu <victorchengchi.lu@amd.com>
  Victor Shih <victor.shih@genesyslogic.com.tw>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vitalii Torshyn <vitaly.torshyn@gmail.com>
  Vitaly Prosyak <vitaly.prosyak@amd.com>
  Weidong Wang <wangweidong.a@awinic.com>
  Wenjing Liu <wenjing.liu@amd.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  wuqiang.matt <wuqiang.matt@bytedance.com>
  Xiao Wang <xiao.w.wang@intel.com>
  Xiubo Li <xiubli@redhat.com>
  Yang Wang <kevinyang.wang@amd.com>
  Ye Bin <yebin10@huawei.com>
  Yihan Zhu <yihan.zhu@amd.com>
  Yu Chien Peter Lin <peterlin@andestech.com>
  Yu Kuai <yukuai3@huawei.com>
  Yujie Liu <yujie.liu@intel.com>
  Yunhui Cui <cuiyunhui@bytedance.com>
  Zongmin Zhou <zhouzongmin@kylinos.cn>

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
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
   89cdf9d55601..3ca112b71f35  3ca112b71f35dd5d99fc4571a56b5fc6f0c15814 -> tested/linux-linus

