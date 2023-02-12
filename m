Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511746935B0
	for <lists+xen-devel@lfdr.de>; Sun, 12 Feb 2023 03:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493972.763963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pR2NX-0003K0-Bd; Sun, 12 Feb 2023 02:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493972.763963; Sun, 12 Feb 2023 02:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pR2NX-0003HG-5j; Sun, 12 Feb 2023 02:46:11 +0000
Received: by outflank-mailman (input) for mailman id 493972;
 Sun, 12 Feb 2023 02:46:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pR2NU-0003H6-QY; Sun, 12 Feb 2023 02:46:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pR2NU-0001jU-O1; Sun, 12 Feb 2023 02:46:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pR2NU-0006rV-8r; Sun, 12 Feb 2023 02:46:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pR2NU-00073o-8N; Sun, 12 Feb 2023 02:46:08 +0000
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
	bh=BZK67UzwHTzMxr4NkOYYx3B3q9XOhmjiP/K06SQF5bU=; b=m0jlGPjKcQVoImv/cDED78A5jn
	WGSeOL0Mmn3/gYx2v2Q3scnq8BeHqF1YH1Ae/jFFyM3Hiwe41kl+4ZuGlsdU8PSVQdPLarYZylteO
	bErwBVEqxLsOhiw0moFyuruO5FK5MTrQJ15mtj+HNBEStGIKwUGbJTAE70bgY42utJCE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176989-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 176989: regressions - trouble: broken/fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-start/freebsd.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:host-install(5):broken:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=420b2d431d18a2572c8e86579e78105cb5ed45b0
X-Osstest-Versions-That:
    linux=38c1e0c65865426676123cc9a127526fa02bcac6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Feb 2023 02:46:08 +0000

flight 176989 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176989/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-freebsd11-amd64 21 guest-start/freebsd.repeat fail REGR. vs. 176875
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 176875

Tests which are failing intermittently (not blocking):
 test-amd64-coresched-amd64-xl  5 host-install(5)         broken pass in 176941

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176875
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176875
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176875
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176875
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176875
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                420b2d431d18a2572c8e86579e78105cb5ed45b0
baseline version:
 linux                38c1e0c65865426676123cc9a127526fa02bcac6

Last test of basis   176875  2023-02-10 16:48:08 Z    1 days
Testing same since   176941  2023-02-11 07:35:11 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexey Firago <a.firago@yadro.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andy Chi <andy.chi@canonical.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Yan <andyshrk@163.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnaud Ferraris <arnaud.ferraris@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Artemii Karasev <karasev@ispras.ru>
  Bjorn Helgaas <bhelgaas@google.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Christoph Hellwig <hch@lst.de>
  Chukun Pan <amadeus@jmu.edu.cn>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Conor Dooley <conor.dooley@microchip.com>
  Corentin Labbe <clabbe@baylibre.com>
  Dan Carpenter <error27@gmail.com>
  Dan Johansen <strit@manjaro.org>
  Daniel Beer <daniel.beer@igorinstitute.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Elvis Angelaccio <elvis.angelaccio@kde.org>
  FUKAUMI Naoki <naoki@radxa.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guillaume Pinot <texitoi@texitoi.eu>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Guodong Liu <Guodong.Liu@mediatek.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jack Yu <jack.yu@realtek.com>
  Jarrah Gosbell <kernel@undef.tools>
  Jens Axboe <axboe@kernel.dk>
  Jensen Huang <jensenhuang@friendlyarm.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jim Minter <jimminter@microsoft.com>
  Joel Stanley <joel@jms.id.au>
  Johan Jonker <jbx6244@gmail.com>
  Jonas Karlman <jonas@kwiboo.se>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Shixin <liushixin2@huawei.com>
  Lorenzo Pieralisi <lpieralisi@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Enriquez <enriquezmark36@gmail.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Matthias Brugger <matthias.bgg@gmail.com>
  Maxim Korotkov <korotkov.maxim.s@gmail.com>
  Mayuresh Chitale <mchitale@ventanamicro.com>
  Michael Riesch <michael.riesch@wolfvision.net>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Paul Cercueil <paul@crapouillou.net>
  Peter Suti <peter.suti@streamunlimited.com>
  Samuel Holland <samuel@sholland.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stephen Boyd <sboyd@kernel.org>
  Takashi Iwai <tiwai@suse.de>
  Thomas Witt <kernel@witt.link>
  Tom Rix <trix@redhat.com>
  V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
  Vyacheslav Bocharov <adeep@lexina.in>
  Xiubo Li <xiubli@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 


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

broken-job test-amd64-coresched-amd64-xl broken
broken-step test-amd64-coresched-amd64-xl host-install(5)

Not pushing.

(No revision log; it would be 1334 lines long.)

