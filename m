Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1122A927
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 08:56:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyV7o-0004Ln-EN; Thu, 23 Jul 2020 06:54:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/wE=BC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyV7n-0004LT-PQ
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 06:54:39 +0000
X-Inumbo-ID: 5b539358-ccb1-11ea-86e4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b539358-ccb1-11ea-86e4-bc764e2007e4;
 Thu, 23 Jul 2020 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7CCQRDDxvr6h60vTUjlUIjYjB5aIQXzldG9IRcjNUVc=; b=heQX2w/80AadmTLsGIka70A7G
 U7f57ZiMD16MLgkfwmZ++m7QZIp/OspfgaVzGhEVLt66lY4fy2U4HeuEinj/fPAi+sStVU4CAJSZF
 z+TdwkQWWE+ZvwRX+DIP+LL6GXyLWzBirFXPsfx1dvQhuiB8LOcn5bLudOv4qLnB/yKSY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyV7d-0007MN-Mk; Thu, 23 Jul 2020 06:54:29 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyV7d-00019N-EZ; Thu, 23 Jul 2020 06:54:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyV7d-000668-E0; Thu, 23 Jul 2020 06:54:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152100-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 152100: regressions - trouble: fail/pass/starved
X-Osstest-Failures: linux-5.4:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 linux-5.4:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:starved:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=d811d29517d1ea05bc159579231652d3ca1c2a01
X-Osstest-Versions-That: linux=c57b1153a58a6263863667296b5f00933fc46a4f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Jul 2020 06:54:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152100 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152100/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 151939

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10   fail REGR. vs. 151939
 test-armhf-armhf-xl-rtds    16 guest-start/debian.repeat fail REGR. vs. 151939

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-qemuu-freebsd11-amd64  2 hosts-allocate           starved n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  2 hosts-allocate           starved n/a

version targeted for testing:
 linux                d811d29517d1ea05bc159579231652d3ca1c2a01
baseline version:
 linux                c57b1153a58a6263863667296b5f00933fc46a4f

Last test of basis   151939  2020-07-16 06:40:22 Z    7 days
Testing same since   152100  2020-07-22 07:43:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  AceLan Kao <acelan.kao@canonical.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Aharon Landau <aharonl@mellanox.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@canonical.com>
  Alexander Lobakin <alobakin@marvell.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexander Tsoy <alexander@tsoy.me>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Ali Saidi <alisaidi@amazon.com>
  Amir Goldstein <amir73il@gmail.com>
  Ammy Yi <ammy.yi@intel.com>
  Andreas Schwab <schwab@suse.de>
  Andrew F. Davis <afd@ti.com>
  Andrey Lebedev <andrey@lebedev.lt>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Angelo Dureghello <angelo.dureghello@timesys.com>
  Angelo Dureghello <angelo@sysam.it>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anson Huang <Anson.Huang@nxp.com>
  Ard Biesheuvel <ardb@kernel.org>
  Armas Spann <zappel@retarded.farm>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Bernard Zhao <bernard@vivo.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjørn Mork <bjorn@mork.no>
  Bob Peterson <rpeterso@redhat.com>
  Borislav Petkov <bp@suse.de>
  Cameron Berkenpas <cam@neo-zeon.de>
  Chandrakanth Patil <chandrakanth.patil@broadcom.com>
  Chirantan Ekbote <chirantan@chromium.org>
  Chris Mason <clm@fb.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Chris Wulff <crwulff@gmail.com>
  Christoffer Nielsen <cn@obviux.dk>
  Christoph Paasch <cpaasch@apple.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuhong Yuan <hslester96@gmail.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
  Colin Ian King <colin.king@canonical.com>
  Colin Xu <colin.xu@intel.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Wang <dave.wang@emc.com.tw>
  David Ahern <dsahern@kernel.org>
  David Howells <dhowells@redhat.com>
  David Pedersen <limero1337@gmail.com>
  David S. Miller <davem@davemloft.net>
  Diego Elio Pettenò <flameeyes@flameeyes.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  dillon min <dillon.minfei@gmail.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Bogdanov <dbogdanov@marvell.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Eddie James <eajames@linux.ibm.com>
  Emmanuel Pescosta <emmanuelpescosta099@gmail.com>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Eric Dumazet <edumazet@google.com>
  Esben Haabendal <esben@geanix.com>
  Felipe Balbi <balbi@kernel.org>
  Finley Xiao <finley.xiao@rock-chips.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Weimer <fweimer@redhat.com>
  Frank Mori Hess <fmh6jj@gmail.com>
  Frederic Weisbecker <frederic@kernel.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Gregor Pintar <grpintar@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hou Tao <houtao1@huawei.com>
  Igor Moura <imphilippini@gmail.com>
  Ilya Dryomov <idryomov@gmail.com>
  Inki Dae <inki.dae@samsung.com>
  James Chapman <jchapman@katalix.com>
  James Hilliard <james.hilliard1@gmail.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jani Nikula <jani.nikula@intel.com>
  Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jian-Hong Pan <jian-hong@endlessm.com>
  Jin Yao <yao.jin@linux.intel.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Johansen <john.johansen@canonical.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Toppins <jtoppins@redhat.com>
  Juri Lelli <juri.lelli@redhat.com>
  Jörgen Storvist <jorgen.storvist@gmail.com>
  Kailang Yang <kailang@realtek.com>
  Kangmin Park <l4stpr0gr4m@gmail.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kevin Buettner <kevinb@redhat.com>
  Kevin Hilman <khilman@baylibre.com>
  Krishna Manikandan <mkrishn@codeaurora.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Leon Romanovsky <leonro@mellanox.com>
  Lingling Xu <ling_ling.xu@unisoc.com>
  Linus Lüssing <linus.luessing@c0d3.blue>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Machado <luis.machado@linaro.org>
  Maciej S. Szmigiero <mail@maciej.szmigiero.name>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Mark Starovoytov <mstarovoitov@marvell.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Varghese <martin.varghese@nokia.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matt Ranostay <matt.ranostay@konsulko.com>
  Matthias Brugger <matthias.bgg@gmail.com>
  Maulik Shah <mkshah@codeaurora.org>
  Maxime Ripard <maxime@cerno.tech>
  Maxime Ripard <mripard@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Simek <michal.simek@xilinx.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Rapoport <rppt@linux.ibm.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Minas Harutyunyan <hminas@synopsys.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Minchan Kim <minchan@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Oded Gabbay <oded.gabbay@gmail.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Paul Wouters <pwouters@redhat.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petteri Aimonen <jpa@git.mail.kapsi.fi>
  Philippe Schenker <philippe.schenker@toradex.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
  Renato Lui Geh <renatogeh@gmail.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Robin Gong <yibin.gong@nxp.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sabrina Dubroca <sd@queasysnail.net>
  Saravana Kannan <saravanak@google.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
  Sean Tranchetti <stranche@codeaurora.org>
  Sean Wang <sean.wang@mediatek.com>
  Sebastian Parschauer <s.parschauer@gmx.de>
  Sergei A. Trusov <sergei.a.trusov@ya.ru>
  Shannon Nelson <snelson@pensando.io>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Suman Anna <s-anna@ti.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tero Kristo <t-kristo@ti.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Lamprecht <t.lamprecht@proxmox.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Rix <trix@redhat.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tomasz Duszynski <tomasz.duszynski@octakon.com>
  Tomer Tayar <ttayar@habana.ai>
  Tony Lindgren <tony@atomide.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Averin <vvs@virtuozzo.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vishwas M <vishwas.reddy.vr@gmail.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wade Mealing <wmealing@redhat.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaojie Yuan <xiaojie.yuan@amd.com>
  Xin Long <lucien.xin@gmail.com>
  Yariv <oigevald+kernel@gmail.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  youngjun <her0gyugyu@gmail.com>
  YueHaibing <yuehaibing@huawei.com>
  Zhang Qiang <qiang.zhang@windriver.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Álvaro Fernández Rojas <noltari@gmail.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       starved 
 test-amd64-amd64-qemuu-freebsd12-amd64                       starved 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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


Not pushing.

(No revision log; it would be 5921 lines long.)

