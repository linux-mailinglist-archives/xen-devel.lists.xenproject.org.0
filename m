Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C24B356A
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 15:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270797.465121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIswV-00045W-1S; Sat, 12 Feb 2022 14:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270797.465121; Sat, 12 Feb 2022 14:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIswU-000426-U2; Sat, 12 Feb 2022 14:00:02 +0000
Received: by outflank-mailman (input) for mailman id 270797;
 Sat, 12 Feb 2022 14:00:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIswT-0003jv-7s; Sat, 12 Feb 2022 14:00:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIswT-0005KC-3z; Sat, 12 Feb 2022 14:00:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIswS-0006hK-JV; Sat, 12 Feb 2022 14:00:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nIswS-0001z9-J5; Sat, 12 Feb 2022 14:00:00 +0000
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
	bh=G0nOJtPRlkHeNXVACA2uTjYxQB13qRgtKuDC3D0xbb8=; b=WymxO89xEfZAwPqdFq536L0Fdn
	mXvM3u2zPIisml3TCgLOxBx5TsOWHPMrCVnGzp0sB6WQJKKfvCGwzQ8YB7HarbLsrjmDycLToIcKQ
	wkOsrnRinnc15JWW3A0NaD1nPkOAn/PYrwy/JcakQdMVvxnpnwrOu6GR8Ea+vBetZ4fE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168089-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168089: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-linus:build-arm64:<job status>:broken:regression
    linux-linus:build-arm64-pvops:<job status>:broken:regression
    linux-linus:build-arm64-xsm:<job status>:broken:regression
    linux-linus:build-arm64-xsm:host-install(4):broken:regression
    linux-linus:build-arm64:host-install(4):broken:regression
    linux-linus:build-arm64-pvops:host-install(4):broken:regression
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=83e396641110663d3c7bb25b9bc0c6a750359ecf
X-Osstest-Versions-That:
    linux=f1baf68e1383f6ed93eb9cff2866d46562607a43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Feb 2022 14:00:00 +0000

flight 168089 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168089/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 168080
 build-arm64                   4 host-install(4)        broken REGR. vs. 168080
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 168080

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168080
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168080
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail like 168080
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168080
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168080
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168080
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                83e396641110663d3c7bb25b9bc0c6a750359ecf
baseline version:
 linux                f1baf68e1383f6ed93eb9cff2866d46562607a43

Last test of basis   168080  2022-02-11 00:09:22 Z    1 days
Failing since        168086  2022-02-11 20:11:19 Z    0 days    2 attempts
Testing same since   168089  2022-02-12 04:02:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Liu <aaron.liu@amd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alexandre.ghiti@canonical.com>
  Alim Akhtar <alim.akhtar@samsung.com>
  Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>
  Ammar Faizi <ammarfaizi2@gnuweeb.org>
  Andreas Gruenbacher <agruenba@redhat.com>
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
  Brian Norris <briannorris@chromium.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Changbin Du <changbin.du@gmail.com>
  Chia-Wei Wang <chiawei_wang@aspeedtech.com>
  Christian Hewitt <christianshewitt@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Stone <daniels@collabora.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Dongjin Kim <tobetter@gmail.com>
  Fabio Estevam <festevam@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>Cc: Dave Airlie <airlied@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
  JaeSang Yoo <js.yoo.5b@gmail.com>
  JaeSang Yoo <jsyoo5b@gmail.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jarkko Nikula <jarkko.nikula@bitmer.com>
  Jasdeep Dhillon <jdhillon@amd.com>
  Jayesh Choudhary <j-choudhary@ti.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerome Forissier <jerome@forissier.org>
  Jisheng Zhang <jszhang@kernel.org>
  Joel Stanley <joel@jms.id.au>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Lutz Koschorreck <theleks@ko-hh.de>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin Kepplinger <martin.kepplinger@puri.sm>
  Maxime Ripard <maxime@cerno.tech>
  Michael Walle <michael@walle.cc>
  Myrtle Shah <gatecat@ds0.me>
  Neil Armstrong <narmstrong@baylibre.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Nishanth Menon <nm@ti.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Philippe Cornu <philippe.cornu@foss.st.com>
  Pingfan Liu <kernelfans@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Roman Li <Roman.Li@amd.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sam Ravnborg <sam@ravnborg.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Shakeel Butt <shakeelb@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sven Peter <sven@svenpeter.dev>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Harvey <tharvey@gateworks.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tony Lindgren <tony@atomide.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wan Jiabing <wanjiabing@vivo.com>
  Yang Wang <KevinYang.Wang@amd.com>
  Ye Guojin <ye.guojin@zte.com.cn>
  Yizhuo Zhai <yzhai003@ucr.edu>
  Zhan Liu <Zhan.Liu@amd.com>
  Zoltán Böszörményi <zboszor@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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

broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-pvops host-install(4)

Not pushing.

(No revision log; it would be 2806 lines long.)

