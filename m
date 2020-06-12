Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE411F7E4B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 23:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjqsE-0000FX-BE; Fri, 12 Jun 2020 21:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lA85=7Z=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jjqsD-0000FS-5g
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 21:06:01 +0000
X-Inumbo-ID: 83386e06-acf0-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83386e06-acf0-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 21:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z7n8dmGQJ7sabJlerTDWQ7TwMJuCseX4DcSNsEQroAk=; b=PIRRnfk/t113yC4iJsU04eCAe
 Fzdg5yvHXhG6EaCZp9Qap4UaSPy9akw6pOoHAH29/M8i4YUqZHfLNFCEWhbQt9ivgw3RB1XrZShQH
 fvRZAjudzaA3NM6CG4NOQ5MJtGQPqwMSMjJYyAEdrjcKAcTeukui0sQlcTvELQt734isI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjqs9-0002dB-Sx; Fri, 12 Jun 2020 21:05:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjqs9-0004KG-Hp; Fri, 12 Jun 2020 21:05:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jjqs9-0006RA-FL; Fri, 12 Jun 2020 21:05:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 151044: regressions - FAIL
X-Osstest-Failures: linux-linus:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=b29482fde649c72441d5478a4ea2c52c56d97a5e
X-Osstest-Versions-That: linux=5b14671be58d0084e7e2d1cc9c2c36a94467f6e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jun 2020 21:05:57 +0000
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

flight 151044 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151044/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 151016
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151016
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151016

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds   16 guest-start/debian.repeat fail blocked in 151016
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151016
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151016
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151016
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151016
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151016
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151016
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151016
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151016
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                b29482fde649c72441d5478a4ea2c52c56d97a5e
baseline version:
 linux                5b14671be58d0084e7e2d1cc9c2c36a94467f6e0

Last test of basis   151016  2020-06-10 12:58:42 Z    2 days
Testing same since   151044  2020-06-11 10:29:35 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Rafael J. Wysocki" <rafael@kernel.org> # for the export
  Abel Vesa <abel.vesa@nxp.com>
  Adam Ford <aford173@gmail.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Al Viro <viro@zeniv.linux.org.uk>
  Alain Volmat <avolmat@me.com>
  Alan Mikhak <alan.mikhak@sifive.com>
  Alexander A. Klimov <grandmaster@al2klimov.de>
  Alexander Duyck <alexander.h.duyck@linux.intel.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Gladkov <gladkov.alexey@gmail.com>
  Amelie Delaunay <amelie.delaunay@st.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anson Huang <Anson.Huang@nxp.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Arnd Bergmann <arnd@arndb.de>
  Arne Edholm <arne.edholm@axis.com>
  Baolin Wang <baolin.wang7@gmail.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bob Moore <robert.moore@intel.com>
  Boris Brezillon <bbrezillon@kernel.org>
  Boris Brezillon <boris.brezillon@bootlin.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Brian Masney <masneyb@onstation.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  ChenTao <chentao107@huawei.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Kerello <christophe.kerello@st.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Clément Péron <peron.clem@gmail.com>
  Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Murphy <dmurphy@ti.com>
  Daniel Golle <daniel@makrotopia.org>
  Dave Jiang <dave.jiang@intel.com>
  David Heidelberg <david@ixit.cz>
  David Hildenbrand <david@redhat.com>
  Dejin Zheng <zhengdejin5@gmail.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Osipenko <digetx@gmail.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eddie James <eajames@linux.ibm.com>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Erik Kaneda <erik.kaneda@intel.com>
  Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Geordan Neukum <gneukum1@gmail.com>
  Georg Waibel <georg.waibel@wiedemann-group.de>
  Georgi Djakov <georgi.djakov@linaro.org>
  Gonglei <arei.gonglei@huawei.com>
  Green Wan <green.wan@sifive.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Gustavo Pimentel <gustavo.pimentel@synopsys.com>
  Hans de Goede <hdegoede@redhat.com>
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  Hongbo Yao <yaohongbo@huawei.com>
  Jason Wang <jasowang@redhat.com>
  Jason Yan <yanaijie@huawei.com>
  Jasper Korten <jja2000@gmail.com>
  Jean-Francois Dagenais <jeff.dagenais@gmail.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff LaBundy <jeff@labundy.com>
  Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiada Wang <jiada_wang@mentor.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joe Perches <joe@perches.com>
  Johnny Chuang <johnny.chuang@emc.com.tw>
  Jolly Shah <jolly.shah@xilinx.com>
  Jonathan Bakker <xc-racer2@live.ca>
  Jonathan Corbet <corbet@lwn.net>
  Joseph Lo <josephl@nvidia.com>
  Julia Lawall <julia.lawall@inria.fr>
  Jungseung Lee <js07.lee@samsung.com>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Kamil Konieczny <k.konieczny@samsung.com>
  Kejia Hu <kejia.hu@codethink.co.uk>
  Kenny Levinsen <kl@kl.wtf>
  Konrad Dybcio <konradybcio@gmail.com>
  Kuldeep Singh <kuldeep.singh@nxp.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Leonid Ravich <Leonid.Ravich@emc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Longpeng(Mike) <longpeng2@huawei.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luca Ceresoli <luca@lucaceresoli.net>
  Ludovic Desroches<ludovic.desroches@microchip.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> # actions
  Mantas Pucka <mantas@8devices.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Ziswiler <marcel@ziswiler.com>
  Marco Elver <elver@google.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Mark Rutland <mark.rutland@arm.com>
  Markus Elfring <elfring@users.sourceforge.net>
  Mars Cheng <mars.cheng@mediatek.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Mason Yang <masonccyang@mxic.com.tw>
  Matej Genci <matej.genci@nutanix.com>
  Mathew King <mathewk@chromium.org>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Maxime Ripard <maxime@cerno.tech>
  Mian Yousaf Kaukab <ykaukab@suse.de>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Hocko <mhocko@suse.com> # for the export
  Michal Hocko <mhocko@suse.com> # to export contig range allocator API
  Michal Simek <michal.simek@xilinx.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Looijmans <mike.looijmans@topic.nl>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com> [build]
  Neil Armstrong <narmstrong@baylibre.com>
  Nicolas Chauvet <kwizart@gmail.com>
  Nikolay Borisov <nborisov@suse.com>
  Owen Chen <owen.chen@mediatek.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Paul Cercueil <paul@crapouillou.net>
  Peng Fan <peng.fan@nxp.com>
  Peter De Schrijver <pdeschrijver@nvidia.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Zijlstra <peterz@infradead.org>
  Pratyush Yadav <p.yadav@ti.com>
  Qiushi Wu <wu000273@umn.edu>
  Quanyang Wang <quanyang.wang@windriver.com>
  Rafael Gandolfi <rafirafi.at@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Tanwar <rahul.tanwar@linux.intel.com>
  Rajan Vaja <rajan.vaja@xilinx.com>
  Rajat Jain <rajatja@google.com>
  Richard Weinberger <richard@nod.at>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Rob Herring <robh@kernel.org>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Ron Minnich <rminnich@google.com>
  Samuel Zou <zou_wei@huawei.com>
  Saravana Kannan <saravanak@google.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sebastian Reichel <sre@kernel.org>
  SeongJae Park <sj38.park@gmail.com>
  SeongJae Park <sjpark@amazon.de>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Shawn Guo <shawn.guo@linaro.org>
  Shawn Guo <shawnguo@kernel.org>
  Shengju Zhang <zhangshengju@cmss.chinamobile.com>
  Shreyas Joshi <shreyasjoshi15@gmail.com>
  Sibi Sankar <sibis@codeaurora.org>
  Sivaprakash Murugesan <sivaprak@codeaurora.org>
  Sowjanya Komatineni <skomatineni@nvidia.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Taniya Das <tdas@codeaurora.org>
  Tejas Patel <tejas.patel@xilinx.com>
  Tero Kristo <t-kristo@ti.com>
  Thierry Reding <treding@nvidia.com>
  Tobias Schramm <t.schramm@manjaro.org>
  Tony Lindgren <tony@atomide.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vincent Knecht <vincent.knecht@mailoo.org>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Waibel Georg <Georg.Waibel@wiedemann-group.com>
  Weiyi Lu <weiyi.lu@mediatek.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@the-dreams.de> # for the I2C part
  Xiang Chen <chenxiang66@hisilicon.com>
  Xiaoming Ni <nixiaoming@huawei.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  youling257@gmail.com
  Yuanjiang Yu <yuanjiang.yu@unisoc.com>
  YueHaibing <yuehaibing@huawei.com>
  Yufen Yu <yuyufen@huawei.com>
  Zach van Rijn <me@zv.io>
  Zhu Lingshan <lingshan.zhu@intel.com>
  Álvaro Fernández Rojas <noltari@gmail.com>
  周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-xl-rtds                                     pass    
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

(No revision log; it would be 12474 lines long.)

