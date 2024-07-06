Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F892951C
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 21:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754721.1163109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQB2e-0006Ga-IG; Sat, 06 Jul 2024 19:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754721.1163109; Sat, 06 Jul 2024 19:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQB2e-0006EX-FM; Sat, 06 Jul 2024 19:25:52 +0000
Received: by outflank-mailman (input) for mailman id 754721;
 Sat, 06 Jul 2024 19:25:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQB2c-0006EN-Ld; Sat, 06 Jul 2024 19:25:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQB2c-000570-IG; Sat, 06 Jul 2024 19:25:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQB2c-0000N9-61; Sat, 06 Jul 2024 19:25:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sQB2c-0000ys-5U; Sat, 06 Jul 2024 19:25:50 +0000
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
	bh=9KVpAF5wFmAlZLEtjsuBhel7B5K9WdPbNFkIQ7/UCLk=; b=12Ef5EJOSMc3p8MNMZArK4AXmY
	Aiy0KENvhQn725qX+Ixp75hohxlSwpX9npcz0a5PuZ+ynlXoD58ZyB24W6RNezee7ElDP349tpFHk
	qXaFRsZ4drW3yvEVfgRc0aabLC9fN1pYWwNfz6LnieOrbqBFaXaR5OplDFMId7aqHrpE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186712-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186712: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7753af06eebfb56b44673bbfcb0b78d73a54ede9
X-Osstest-Versions-That:
    linux=99e6a620de00b96f059c9e7f14b5795ca0c6b125
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jul 2024 19:25:50 +0000

flight 186712 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186712/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186532
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186532
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186532
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186532
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186532
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186532
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                7753af06eebfb56b44673bbfcb0b78d73a54ede9
baseline version:
 linux                99e6a620de00b96f059c9e7f14b5795ca0c6b125

Last test of basis   186532  2024-06-27 12:12:34 Z    9 days
Testing same since   186692  2024-07-05 07:43:01 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Rainbolt <arainbolt@kfocus.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Bee <knaerzche@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Hölzl <alexander.hoelzl@gmx.net>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Alexei Starovoitov <ast@kernel.org>
  Alibek Omarov <a1ba.omarov@gmail.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Davis <afd@ti.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Chiu <andy.chiu@sifive.com>
  Anton Protopopov <aspsk@isovalent.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arun Ramadoss <arun.ramadoss@microchip.com>
  Ashish Kalra <Ashish.Kalra@amd.com>
  Barry Song <v-songbaohua@oppo.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bing-Jhong Billy Jheng <billy@starlabs.sg>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Clayton Casciato <majortomtosourcecontrol@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniil Dulov <d.dulov@aladdin.ru>
  David Lechner <dlechner@baylibre.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dawei Li <dawei.li@shingroup.cn>
  Denis Arefev <arefev@swemel.ru>
  Dirk Su <dirk.su@canonical.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dragan Simic <dsimic@manjaro.org>
  Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
  Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
  Eric Dumazet <edumazet@google.com>
  Erick Archer <erick.archer@outlook.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Fernando Yang <hagisf@usp.br>
  Florian Fainelli <florian.fainelli@broadcom.com>
  FUKAUMI Naoki <naoki@radxa.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guo Ren <guoren@kernel.org>
  Hagar Hemdan <hagarhem@amazon.com>
  Hannes Reinecke <hare@kernel.org>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com> # s390
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Huacai Chen <chenhuacai@loongson.cn>
  Huang-Huang Bao <i@eh5.me>
  Ido Schimmel <idosch@nvidia.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
  Jeremy Kerr <jk@codeconstruct.com.au>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Joachim Vandersmissen <git@jvdsn.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Keeping <jkeeping@inmusicbrands.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Karlman <jonas@kwiboo.se>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Julia Zhang <Julia.Zhang@amd.com>
  Juntong Deng <juntong.deng@outlook.com>
  Kamal Dasu <kamal.dasu@broadcom.com>
  Kees Cook <kees@kernel.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  Kent Gibson <warthog618@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Leon Romanovsky <leon@kernel.org>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Ying <victor.liu@nxp.com>
  luoxuanqiang <luoxuanqiang@kylinos.cn>
  Lyude Paul <lyude@redhat.com>
  Ma Ke <make24@iscas.ac.cn>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Martin Schiller <ms@dev.tdt.de>
  Masahiro Yamada <masahiroy@kernel.org>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Meng Li <Meng.Li@windriver.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Neal Cardwell <ncardwell@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nick Child <nnac123@linux.ibm.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklas Cassel <cassel@kernel.org>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nishanth Menon <nm@ti.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Petr Machata <petrm@nvidia.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Rob Herring <robh@kernel.org>
  Ron Economos <re@w6rz.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <sean.anderson@linux.dev>
  SeongJae Park <sj@kernel.org>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Eichenberger <stefan.eichenberger@toradex.com>
  Sven Eckelmann <sven@narfation.org>
  syzbot+1a3cf6f08d68868f9db3@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tianli Xiong <xiongtianli@loongson.cn>
  Tristram Ha <tristram.ha@microchip.com>
  Udit Kumar <u-kumar1@ti.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vasileios Amoiridis <vassilisamir@gmail.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Vitor Soares <vitor.soares@toradex.com>
  Wenchao Hao <haowenchao2@huawei.com>
  William Breathitt Gray <wbg@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  yangge <yangge1116@126.com>
  Yeoreum Yun <yeoreum.yun@arm.com>
  Yunseong Kim <yskelg@gmail.com>
  Yuntao Liu <liuyuntao12@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>

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
   99e6a620de00..7753af06eebf  7753af06eebfb56b44673bbfcb0b78d73a54ede9 -> tested/linux-6.1

