Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1D3EC397
	for <lists+xen-devel@lfdr.de>; Sat, 14 Aug 2021 17:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167005.304837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEvjK-0005tQ-HG; Sat, 14 Aug 2021 15:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167005.304837; Sat, 14 Aug 2021 15:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEvjK-0005q1-Ct; Sat, 14 Aug 2021 15:37:50 +0000
Received: by outflank-mailman (input) for mailman id 167005;
 Sat, 14 Aug 2021 15:37:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mEvjI-0005pr-Vy; Sat, 14 Aug 2021 15:37:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mEvjI-0008N8-PJ; Sat, 14 Aug 2021 15:37:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mEvjI-0008CH-Ez; Sat, 14 Aug 2021 15:37:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mEvjI-00042h-EQ; Sat, 14 Aug 2021 15:37:48 +0000
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
	bh=bve1FKXhL1bIN9hv4UvM9m6llHYpulKb8Hehxl3w4wQ=; b=4T5wmsGnDu1pQ5HWnTony3oxcC
	+ErzCV/G5rg+57lx9Mwoe/uL6kkhykio5/ndG5vD3PMhOzP8wS5Iz6y/JU+kT9GEK99PV3PGPMvF3
	X0s5Gq/JhdYzOJKeXlZwJsIeTzXLOAKol7nLVWoOloDeAa4S4jFximchh4kEvPessKh0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164183-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 164183: trouble: broken/fail/pass
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-libvirt:<job status>:broken:regression
    linux-5.4:test-armhf-armhf-xl-rtds:host-install(5):broken:heisenbug
    linux-5.4:test-armhf-armhf-libvirt:host-install(5):broken:heisenbug
    linux-5.4:test-armhf-armhf-xl-arndale:host-install(5):broken:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:host-install(5):broken:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-localmigrate:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a998faa9c4cee7dc68f3f6f82be93bbb99dda322
X-Osstest-Versions-That:
    linux=e350cd02e293be9a6b93398b2d3ff1edf7695ab2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 14 Aug 2021 15:37:48 +0000

flight 164183 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164183/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken  in 164174
 test-armhf-armhf-xl-arndale     <job status>                 broken  in 164180
 test-armhf-armhf-libvirt        <job status>                 broken  in 164180

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-rtds     5 host-install(5) broken in 164174 pass in 164183
 test-armhf-armhf-libvirt     5 host-install(5) broken in 164180 pass in 164183
 test-armhf-armhf-xl-arndale  5 host-install(5) broken in 164180 pass in 164183
 test-armhf-armhf-xl-credit1   5 host-install(5)          broken pass in 164174
 test-armhf-armhf-xl-credit2   5 host-install(5)          broken pass in 164180
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 164174 pass in 164180
 test-amd64-amd64-xl-qemuu-ovmf-amd64 16 guest-localmigrate fail in 164180 pass in 164183
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail in 164180 pass in 164183
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 164180 pass in 164183
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat  fail pass in 164180
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 164180

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 164174 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 164174 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 164180 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 164180 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164131
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 164131
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 164131
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164131
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164131
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164131
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 164131
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164131
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 164131
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164131
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164131
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a998faa9c4cee7dc68f3f6f82be93bbb99dda322
baseline version:
 linux                e350cd02e293be9a6b93398b2d3ff1edf7695ab2

Last test of basis   164131  2021-08-08 07:11:59 Z    6 days
Testing same since   164167  2021-08-12 11:47:56 Z    2 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
  Alexander Monakov <amonakov@ispras.ru>
  Alexander Tsoy <alexander@tsoy.me>
  Alexei Starovoitov <ast@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Antoine Tenart <atenart@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Brian Norris <briannorris@chromium.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Chanho Park <chanho61.park@samsung.com>
  chihhao.chen <chihhao.chen@mediatek.com>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniele Palmas <dnlplm@gmail.com>
  Dario Binacchi <dariobin@libero.it>
  David Bauer <mail@david-bauer.net>
  David S. Miller <davem@davemloft.net>
  Dmitry Osipenko <digetx@gmail.com>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Eero Lehtinen <debiangamer2@gmail.com>
  Fei Qin <fei.qin@corigine.com>
  Felipe Balbi <balbi@kernel.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Guido Kiener <guido.kiener@rohde-schwarz.com>
  Guoqing Jiang <jiangguoqing@kylinos.cn>
  H. Nikolaus Schaller <hns@goldelico.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hervé Codina <herve.codina@bootlin.com>
  Hui Su <suhui@zeku.com>
  Hulk Robot <hulkrobot@huawei.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jan Kara <jack@suse.cz>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Juergen Borleis <jbe@pengutronix.de>
  Kieran Bingham <kieran.bingham@ideasonboard.com>
  Kim Phillips <kim.phillips@amd.com>
  Letu Ren <fantasquex@gmail.com>
  Li Manyi <limanyi@uniontech.com>
  Liam Merwick <liam.merwick@oracle.com>
  Like Xu <likexu@tencent.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Louis Peens <louis.peens@corigine.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Marek Vasut <marex@denx.de>
  Mario Kleiner <mario.kleiner.de@gmail.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matt Turner <mattst88@gmail.com>
  Matteo Croce <mcroce@microsoft.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxim Devaev <mdevaev@gmail.com>
  Maxime Chevallier <maxime.chevallier@bootlin.com>
  Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Pali Rohár <pali@kernel.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Pawel Laszczak <pawell@cadence.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phil Elwell <phil@raspberrypi.com>
  Prarit Bhargava <prarit@redhat.com>
  Qiang.zhang <qiang.zhang@windriver.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sean Young <sean@mess.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shawn Guo <shawnguo@kernel.org>
  Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@corigine.com>
  Song Liu <song@kernel.org>
  Stas Sergeev <stsp2@yandex.ru>
  Stephen Boyd <sboyd@kernel.org>
  Steve Bennett <steveb@workware.net.au>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  syzbot+de271708674e2093097b@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tony Lindgren <tony@atomide.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Hai <wanghai38@huawei.com>
  Wei Shuyu <wsy@dogben.com>
  Will Deacon <will@kernel.org>
  Willy Tarreau <w@1wt.eu>
  Xiangyang Zhang <xyz.sun.ok@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yu Kuai <yukuai3@huawei.com>
  Zheyu Ma <zheyuma97@gmail.com>
  Zhiyong Tao <zhiyong.tao@mediatek.com>

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
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
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

broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-arndale broken

Not pushing.

(No revision log; it would be 2637 lines long.)

