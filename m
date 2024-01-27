Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772583EEDB
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jan 2024 17:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672672.1046824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTlyc-00021v-Ez; Sat, 27 Jan 2024 16:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672672.1046824; Sat, 27 Jan 2024 16:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTlyc-00020M-C3; Sat, 27 Jan 2024 16:56:18 +0000
Received: by outflank-mailman (input) for mailman id 672672;
 Sat, 27 Jan 2024 16:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTlyb-00020C-Ki; Sat, 27 Jan 2024 16:56:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTlyb-000278-GY; Sat, 27 Jan 2024 16:56:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rTlyb-00085h-4g; Sat, 27 Jan 2024 16:56:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rTlyb-0004gG-4F; Sat, 27 Jan 2024 16:56:17 +0000
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
	bh=sZ/+IHKwWCNTUV5ypDMAY9Lsn6DoimV3Z53j0ybixuY=; b=y5I7zVVSErg4Khw+A/ARRXlHDd
	sL5duZbjDL/X+RNZsK8N1edPOuTSVZuxEXQLuIg0MyeqLHlUZd5aQRndQD0n03TyiLCDnBAJYTCyD
	t4RguNY4Ft/L5nF9z6ropee/TdGsiXxjttS44qaUgKt60pJtGeYIujUExs2GtQ0GOza0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184487-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184487: tolerable FAIL - PUSHED
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
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=3a5879d495b226d0404098e3564462d5f1daa33b
X-Osstest-Versions-That:
    linux=ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Jan 2024 16:56:17 +0000

flight 184487 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184487/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184474
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184474
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184474
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184474
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184474
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184474
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184474
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184474
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                3a5879d495b226d0404098e3564462d5f1daa33b
baseline version:
 linux                ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7

Last test of basis   184474  2024-01-26 07:24:13 Z    1 days
Testing same since   184487  2024-01-27 02:12:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alvin Lee <alvin.lee2@amd.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
  Andreas Larsson <andreas@gaisler.com>
  Arnd Bergmann <arnd@arndb.de>
  Artur Weber <aweber.kernel@gmail.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Gaignard <benjamin.gaignard@collabora.com>
  Brandon Brnich <b-brnich@ti.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Wang <unicorn_wang@outlook.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian König <christian.koenig@amd.com>
  ChunTao Tso <chuntao.tso@amd.com>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Conrad Kostecki <conikost@gentoo.org>
  Cristian Marussi <cristian.marussi@arm.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Lechner <dlechner@baylibre.com>
  Devyn Liu <liudingyuan@huawei.com>
  Douglas Anderson <dianders@chromium.org>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gustavo Sousa <gustavo.sousa@intel.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Heiko Stuebner <heiko@sntech.de>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  Hsin-Yi Wang <hsinyi@chromium.org>
  Hu Haowen <2023002089@link.tyut.edu.cn>
  Inki Dae <inki.dae@samsung.com>
  Inochi Amaoto <inochiama@outlook.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jani Nikula <jani.nikula@intel.com>
  Jens Axboe <axboe@kernel.dk>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jonathan Corbet <corbet@lwn.net>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jose E. Marchesi <jose.marchesi@oracle.com>
  Kamal Dasu <kamal.dasu@broadcom.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Khaled Almahallawy <khaled.almahallawy@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lennert Buytenhek <kernel@wantstofly.org>
  Li Lingfeng <lilingfeng3@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Ma Jun <Jun.Ma2@amd.com>
  Maksim Kiselev <bigunclemax@gmail.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Broadworth <mark.broadworth@amd.com>
  Mark Brown <broonie@kernel.org>
  Markus Niebel <Markus.Niebel@ew.tq-group.com>
  Matt Roper <matthew.d.roper@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Maxime Ripard <mripard@kernel.org>
  Maxime Ripard <mripard@redhat.com>
  Maíra Canal <mcanal@igalia.com>
  Michael Walle <mwalle@kernel.org>
  Michał Winiarski <michal.winiarski@intel.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Moti Haimovski <mhaimovski@habana.ai>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Niklas Cassel <cassel@kernel.org>
  Paul Moore <paul@paul-moore.com>
  Pin-yen Lin <treapking@chromium.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rob Herring <robh@kernel.org>
  Roman Li <roman.li@amd.com>
  Sam Ravnborg <sam@ravnborg.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Song Liu <song@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Stanley Chan <schan@cloudflare.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Tanzir Hasan <tanzirh@google.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom St Denis <tom.stdenis@amd.com>
  Tomasz Figa <tfiga@chromium.org>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
  Vegard Nossum <vegard.nossum@oracle.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wachowski, Karol <karol.wachowski@intel.com>
  Wenhua Lin <Wenhua.Lin@unisoc.com>
  Xinglong Yang <xinglong.yang@cixtech.com>
  Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
  Yang Wang <kevinyang.wang@amd.com>
  Yangyu Chen <cyy@cyyself.name>

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
   ecb1b8288dc7..3a5879d495b2  3a5879d495b226d0404098e3564462d5f1daa33b -> tested/linux-linus

