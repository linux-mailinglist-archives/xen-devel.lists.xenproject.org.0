Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD44B32EB
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 05:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270712.465045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIjZK-0004f5-Ar; Sat, 12 Feb 2022 03:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270712.465045; Sat, 12 Feb 2022 03:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIjZK-0004cg-77; Sat, 12 Feb 2022 03:59:30 +0000
Received: by outflank-mailman (input) for mailman id 270712;
 Sat, 12 Feb 2022 03:59:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIjZI-0004cW-3G; Sat, 12 Feb 2022 03:59:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIjZI-00021g-08; Sat, 12 Feb 2022 03:59:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIjZH-0002X8-DU; Sat, 12 Feb 2022 03:59:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nIjZH-00033a-Cs; Sat, 12 Feb 2022 03:59:27 +0000
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
	bh=f6NvD0T36fo8IdNuhaSFShMm+dVquZPUtjprW0QWVOQ=; b=NQ2OPCXQqc3kUbX3DEOrgE+R2q
	6PcdHtdSYfqoTccAezmfti7r/rzOSJiq5vV5/UbzfJ5t8u5bKd7rdrrWZIbZD9DGYuZI7K9SZC+mC
	BQIQ32MSYDu5d0uYer/vMJvyK5+KX3aGlo7snwoBL+WCwq2kuKcf3OSQBld9/PFgRvZk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168086-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168086: trouble: blocked/broken/fail/pass
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
    linux=1d41d2e82623b40ee27811fe9ea38bafe2e722e9
X-Osstest-Versions-That:
    linux=f1baf68e1383f6ed93eb9cff2866d46562607a43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Feb 2022 03:59:27 +0000

flight 168086 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168086/

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
 linux                1d41d2e82623b40ee27811fe9ea38bafe2e722e9
baseline version:
 linux                f1baf68e1383f6ed93eb9cff2866d46562607a43

Last test of basis   168080  2022-02-11 00:09:22 Z    1 days
Testing same since   168086  2022-02-11 20:11:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Liu <aaron.liu@amd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre Ghiti <alexandre.ghiti@canonical.com>
  Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>
  Ammar Faizi <ammarfaizi2@gnuweeb.org>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrzej Pietrasiewicz <andrzej.p@collabora.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bean Huo <beanhuo@micron.com>
  Bob Peterson <rpeterso@redhat.com>
  Brian Norris <briannorris@chromium.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Changbin Du <changbin.du@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Stone <daniels@collabora.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Stevenson <dave.stevenson@raspberrypi.com>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>Cc: Dave Airlie <airlied@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  JaeSang Yoo <js.yoo.5b@gmail.com>
  JaeSang Yoo <jsyoo5b@gmail.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jasdeep Dhillon <jdhillon@amd.com>
  Jens Axboe <axboe@kernel.dk>
  Jisheng Zhang <jszhang@kernel.org>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Maxime Ripard <maxime@cerno.tech>
  Myrtle Shah <gatecat@ds0.me>
  Niklas Cassel <niklas.cassel@wdc.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pingfan Liu <kernelfans@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Robin Murphy <robin.murphy@arm.com>
  Roman Li <Roman.Li@amd.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sam Ravnborg <sam@ravnborg.org>
  Sascha Hauer <s.hauer@pengutronix.de>
  Shakeel Butt <shakeelb@google.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Yang Wang <KevinYang.Wang@amd.com>
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

(No revision log; it would be 1680 lines long.)

