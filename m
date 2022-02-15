Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283294B6B98
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273101.468169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwVV-0001PT-G7; Tue, 15 Feb 2022 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273101.468169; Tue, 15 Feb 2022 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwVV-0001NF-Cl; Tue, 15 Feb 2022 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 273101;
 Tue, 15 Feb 2022 12:00:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJwVU-0001N5-D1; Tue, 15 Feb 2022 12:00:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJwVU-00004v-9k; Tue, 15 Feb 2022 12:00:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJwVT-0004RS-NU; Tue, 15 Feb 2022 12:00:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nJwVT-0007BD-N2; Tue, 15 Feb 2022 12:00:31 +0000
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
	bh=l0FOX4uWb6ewbWaY/apQENy+hZUki9BugP8xIGr4O64=; b=Ff7qccol8JYVA7FBnmSZwzcx7y
	au65nDM4R0BrPt5CaRYFxFTiLR1FF32VhAhOP5YlYK5qoj54Pjm1M7Nx6K26NzxEVdjfe30/BEDv2
	DEak79FmN0hrXmrsaa3vyEjNtKgVWAz6ylP4fziOw0KjOezGQ+P8TXRyu9cqUqtcEbl0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168113-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168113: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d567f5db412ed52de0b3b3efca4a451263de6108
X-Osstest-Versions-That:
    linux=f1baf68e1383f6ed93eb9cff2866d46562607a43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Feb 2022 12:00:31 +0000

flight 168113 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168113/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 168080

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168080
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168080
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168080
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168080
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168080
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                d567f5db412ed52de0b3b3efca4a451263de6108
baseline version:
 linux                f1baf68e1383f6ed93eb9cff2866d46562607a43

Last test of basis   168080  2022-02-11 00:09:22 Z    4 days
Failing since        168086  2022-02-11 20:11:19 Z    3 days    8 attempts
Testing same since   168113  2022-02-14 19:11:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Liu <aaron.liu@amd.com>
  Adam Ford <aford173@gmail.com>
  Al Cooper <alcooperx@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alexandre.ghiti@canonical.com>
  Alim Akhtar <alim.akhtar@samsung.com>
  Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>
  Ammar Faizi <ammarfaizi2@gnuweeb.org>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrzej Pietrasiewicz <andrzej.p@collabora.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Aswath Govindraju <a-govindraju@ti.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bean Huo <beanhuo@micron.com>
  Benjamin Gaignard <benjamin.gaignard@collabora.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Peterson <rpeterso@redhat.com>
  Brenda Streiff <brenda.streiff@ni.com>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Brian Norris <briannorris@chromium.org>
  Cai Huoqing <cai.huoqing@linux.dev>
  Cameron Williams <cang1@live.co.uk>
  Catalin Marinas <catalin.marinas@arm.com>
  Changbin Du <changbin.du@gmail.com>
  Chia-Wei Wang <chiawei_wang@aspeedtech.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Hewitt <christianshewitt@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Stone <daniels@collabora.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  David Hildenbrand <david@redhat.com>
  David Rientjes <rientjes@google.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Dongjin Kim <tobetter@gmail.com>
  Fabio Estevam <festevam@gmail.com>
  Fabio M. De Francesco <fmdefrancesco@gmail.com>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>Cc: Dave Airlie <airlied@gmail.com>
  Guido Günther <agx@sigxcpu.org> # Librem 5 (imx8mq) with it's rather picky panel
  Guo Ren <guoren@linux.alibaba.com>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
  JaeSang Yoo <js.yoo.5b@gmail.com>
  JaeSang Yoo <jsyoo5b@gmail.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  James Smart <jsmart2021@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jarkko Nikula <jarkko.nikula@bitmer.com>
  Jarkko Sakkinen <jarkko@kernel.org>  (kselftest as sanity check)
  Jasdeep Dhillon <jdhillon@amd.com>
  Jayesh Choudhary <j-choudhary@ti.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jeremy Linton <jeremy.linton@arm.com>
  Jerome Forissier <jerome@forissier.org>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jing Leng <jleng@ambarella.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joel Stanley <joel@jms.id.au>
  Johan Hovold <johan@kernel.org>
  Jonas Malaco <jonas@protocubo.io>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juergen Gross <jgross@suse.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kees Cook <keescook@chromium.org>
  Kishon Vijay Abraham I <kishon@ti.com>
  Kosuke Tatsukawa <tatsu-ab1@nec.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Ying <victor.liu@nxp.com>
  Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Lutz Koschorreck <theleks@ko-hh.de>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Zyngier <maz@kernel.org>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Kepplinger <martin.kepplinger@puri.sm>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Krause <minipli@grsecurity.net>
  Maxime Ripard <maxime@cerno.tech>
  Mel Gorman <mgorman@suse.de>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Michal Simek <michal.simek@xilinx.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Myrtle Shah <gatecat@ds0.me>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <narmstrong@baylibre.com>
  Neil Armstrong <narmstrong@baylibre.com> # for phy-meson-axg-mipi-dphy.c
  Nick Desaulniers <ndesaulniers@google.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Nishanth Menon <nm@ti.com>
  Oliver Barta <oliver.barta@aptiv.com>
  Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pavel Hofman <pavel.hofman@ivitera.com>
  Pawel Dembicki <paweldembicki@gmail.com>
  Peng Liu <liupeng256@huawei.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Philippe Cornu <philippe.cornu@foss.st.com>
  Pingfan Liu <kernelfans@gmail.com>
  Pratham Pratap <quic_ppratap@quicinc.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Reinette Chatre <reinette.chatre@intel.com>
  Rob Herring <robh@kernel.org>
  Robert Hancock <robert.hancock@calian.com>
  Robin Murphy <robin.murphy@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Gushchin <guro@fb.com>
  Roman Li <Roman.Li@amd.com>
  Rui Salvaterra <rsalvaterra@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sam Ravnborg <sam@ravnborg.org>
  Samuel Holland <samuel@sholland.org>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sean Anderson <sean.anderson@seco.com>
  Shakeel Butt <shakeelb@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Slark Xiao <slark_xiao@163.com>
  Song Liu <song@kernel.org>
  Steev Klimaszewski <steev@kali.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stephan Brunner <s.brunner@stephan-brunner.net>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sven Peter <sven@svenpeter.dev>
  Sven Schnelle <svens@linux.ibm.com>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Szymon Heidrich <szymon.heidrich@gmail.com>
  Tadeusz Struk <tadeusz.struk@linaro.org>
  TATSUKAWA KOSUKE (立川 江介) <tatsu-ab1@nec.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Harvey <tharvey@gateworks.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tommaso Merciai <tomm.merciai@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  Vinod Koul <vkoul@kernel.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wan Jiabing <wanjiabing@vivo.com>
  Yang Shi <shy828301@gmail.com>
  Yang Wang <KevinYang.Wang@amd.com>
  Ye Guojin <ye.guojin@zte.com.cn>
  Yizhuo Zhai <yzhai003@ucr.edu>
  Zhan Liu <Zhan.Liu@amd.com>
  Zoltán Böszörményi <zboszor@gmail.com>

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
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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
   f1baf68e1383..d567f5db412e  d567f5db412ed52de0b3b3efca4a451263de6108 -> tested/linux-linus

