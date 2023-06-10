Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321E72AC81
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 17:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546528.853469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q80GQ-00036S-QU; Sat, 10 Jun 2023 15:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546528.853469; Sat, 10 Jun 2023 15:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q80GQ-00034i-NA; Sat, 10 Jun 2023 15:12:26 +0000
Received: by outflank-mailman (input) for mailman id 546528;
 Sat, 10 Jun 2023 15:12:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q80GP-00034Y-Ej; Sat, 10 Jun 2023 15:12:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q80GP-00072D-0P; Sat, 10 Jun 2023 15:12:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q80GO-0003Ea-Gg; Sat, 10 Jun 2023 15:12:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q80GO-0001nv-FR; Sat, 10 Jun 2023 15:12:24 +0000
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
	bh=dZbAOeVbKJ8y0bMczQzLyINTAU+qlGg2YzVAZUg59WA=; b=juvIBRoMYKUD73EG26q140RBJb
	GH4jaE3TW6gPnWRt9rDxtbaiYSphHKgYvMqi2BZHmFVYijyceNJJ97DOGzfdvEMd53VHWe8YISYIW
	is3QcIzpQt6zNPJXzoRfqTr7teH4FDP3T/19jBLxL70pkCG37C+k6zyyjbguk/8Rzv8Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181354-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 181354: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-raw:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f568a20f058fa1e37069cff4aac4187c1650a0e9
X-Osstest-Versions-That:
    linux=cf0b1e5482eaeb4db15c9e703267483dba88b575
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Jun 2023 15:12:24 +0000

flight 181354 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181354/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-vhd      21 guest-start/debian.repeat fail REGR. vs. 181182
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail in 181336 REGR. vs. 181182

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd12-amd64 19 guest-localmigrate/x10 fail in 181336 pass in 181354
 test-armhf-armhf-xl-multivcpu 14 guest-start     fail in 181336 pass in 181354
 test-armhf-armhf-libvirt-raw 17 guest-start/debian.repeat fail in 181336 pass in 181354
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail pass in 181336
 test-amd64-i386-libvirt-pair 10 xen-install/src_host       fail pass in 181336
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host       fail pass in 181336
 test-amd64-i386-libvirt-raw   7 xen-install                fail pass in 181336
 test-armhf-armhf-xl-credit2  14 guest-start                fail pass in 181336

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-raw 14 migrate-support-check fail in 181336 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 181336 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 181336 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181182
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181182
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181182
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181182
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181182
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181182
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181182
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 181182
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181182
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181182
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181182
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181182
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                f568a20f058fa1e37069cff4aac4187c1650a0e9
baseline version:
 linux                cf0b1e5482eaeb4db15c9e703267483dba88b575

Last test of basis   181182  2023-06-05 06:43:42 Z    5 days
Testing same since   181336  2023-06-09 08:40:57 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Borowski <kilobyte@angband.pl>
  Andreas Svensson <andreas.svensson@axis.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Bart Van Assche <bvanassche@acm.org>
  Ben Hutchings <benh@debian.org>
  Benedict Wong <benedictwong@google.com>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov <bp@suse.de>
  Cambda Zhu <cambda@linux.alibaba.com>
  Chao Wang <D202280639@hust.edu.cn>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  David S. Miller <davem@davemloft.net>
  Deren Wu <deren.wu@mediatek.com>
  Devesh Sharma <devesh.sharma@broadcom.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Haibo Li <haibo.li@mediatek.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Helge Deller <deller@gmx.de>
  Hyunwoo Kim <imv4bel@gmail.com>
  Hyunwoo Kim <v4bel@theori.io>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jason Baron <jbaron@akamai.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Gunthorpe <jgg@mellanox.com> # IB
  Jason Gunthorpe <jgg@nvidia.com>
  Jassi Brar <jaswinder.singh@linaro.org>
  Jens Axboe <axboe@kernel.dk>
  Jiakai Luo <jkluo@hust.edu.cn>
  Jim Wylder <jwylder@google.com
  Jim Wylder <jwylder@google.com>
  Jiri Kosina <jkosina@suse.cz>
  Joao Martins <joao.m.martins@oracle.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Thumshirn <jth@kernel.org>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kalle Valo <kvalo@codeaurora.org> # wireless drivers
  Kalle Valo <kvalo@kernel.org>
  Kees Cook <keescook@chromium.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Lee Jones <lee@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luiz Capitulino <luizcap@amazon.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lyude Paul <lyude@redhat.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Liska <mliska@suse.cz>
  Martin Liška <mliska@suse.cz>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxim Kochetkov <fido_max@inbox.ru
  Maxim Kochetkov <fido_max@inbox.ru>
  Michael Büsch <m@bues.ch>
  Min-Hua Chen <minhuadotchen@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Mukesh Ojha <quic_mojha@quicinc.com>
  Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Paweł Anikiel <pan@semihalf.com
  Paweł Anikiel <pan@semihalf.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Pietro Borrello <borrello@diag.uniroma1.it>
  Ping-Ke Shih <pkshih@realtek.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Richard Acayan <mailingradian@gmail.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sasha Levin <sashal@kernel.org>
  Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shay Drory <shayd@nvidia.com>
  Sherry Sun <sherry.sun@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Simon Kapadia <szymon@kapadia.pl>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Sudarsana Reddy Kalluru <skalluru@marvell.com>
  Sudheesh Mavila <sudheesh.mavila@amd.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sung-Chi Li <lschyi@chromium.org>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Tom Rix <trix@redhat.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>
  Vinod Koul <vkoul@kernel.org>
  Vladislav Efanov <VEfanov@ispras.ru>
  Wei Chen <harperchen1110@gmail.com>
  Wenchao Hao <haowenchao2@huawei.com>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Yonatan Nachum <ynachum@amazon.com>
  YongSu Yoo <yongsuyoo0215@gmail.com>
  YueHaibing <yuehaibing@huawei.com>
  Yun Lu <luyun@kylinos.cn>
  Zhang Shurong <zhang_shurong@foxmail.com>
  Zhengchao Shao <shaozhengchao@huawei.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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

(No revision log; it would be 3047 lines long.)

