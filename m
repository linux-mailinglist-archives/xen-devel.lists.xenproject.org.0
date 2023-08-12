Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96077A1B5
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 20:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582919.912913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUtEG-0008RM-PK; Sat, 12 Aug 2023 18:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582919.912913; Sat, 12 Aug 2023 18:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUtEG-0008P2-MB; Sat, 12 Aug 2023 18:20:48 +0000
Received: by outflank-mailman (input) for mailman id 582919;
 Sat, 12 Aug 2023 18:20:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUtEF-0008Os-3w; Sat, 12 Aug 2023 18:20:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUtEE-0005gg-RG; Sat, 12 Aug 2023 18:20:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUtEE-0005YE-Ex; Sat, 12 Aug 2023 18:20:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qUtEE-0000BP-EK; Sat, 12 Aug 2023 18:20:46 +0000
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
	bh=yUVb94pBIxFVmlZa0fY8OJGZZsx67dZ4JisHp0YnFFM=; b=fzBHQaoItE20BkOHAOnvm7RvVv
	gGPXKctSQmBkO5jV/yoJ2UASutgyioRtwTCsh+omOOPTxaTzx+yFC2jV5F+sEyEt9TQgw/MaWuNOx
	ywQutXvTpDiNTdspcpWQid5bxg1xl4X7yhEX0Mxil5uY6cMpXild56an6bx2bArCSeQk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182292-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 182292: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start.2:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=4b4223f7d26d90087de52c8649e42ad8fff2e90a
X-Osstest-Versions-That:
    linux=887433e4bc9394676d22c038dba33a27405f94e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Aug 2023 18:20:46 +0000

flight 182292 linux-5.4 real [real]
flight 182299 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182292/
http://logs.test-lab.xenproject.org/osstest/logs/182299/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install     fail REGR. vs. 182076
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 182076

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemuu-rhel6hvm-amd 7 xen-install fail in 182299 pass in 182292
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail pass in 182299-retest
 test-armhf-armhf-xl-multivcpu 19 guest-start.2      fail pass in 182299-retest
 test-armhf-armhf-xl-vhd      13 guest-start         fail pass in 182299-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 182299 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 182299 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182076
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182076
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182076
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182076
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182076
 test-armhf-armhf-xl-credit1  18 guest-start/debian.repeat    fail  like 182076
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182076
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182076
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182076
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182076
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182076
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 182076
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182076
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182076
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                4b4223f7d26d90087de52c8649e42ad8fff2e90a
baseline version:
 linux                887433e4bc9394676d22c038dba33a27405f94e8

Last test of basis   182076  2023-07-29 17:15:26 Z   14 days
Failing since        182239  2023-08-08 18:13:15 Z    4 days    4 attempts
Testing same since   182292  2023-08-12 02:13:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alexander Aring <aahringo@redhat.com>
  Alexander Steffen <Alexander.Steffen@infineon.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrzej Hajda <a.hajda@samsung.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Hutchings <benh@debian.org>
  Bikash Hazarika <bhazarika@marvell.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chao Yu <chao@kernel.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chengfeng Ye <dg573847474@gmail.com>
  Christian Brauner <brauner@kernel.org>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Chunguang Xu <brookxu@tencent.com>
  Cixi Geng <cixi.geng1@unisoc.com>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  D Scott Phillips <scott@os.amperecomputing.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Scally <dan.scally@ideasonboard.com>
  Daniel Sneddon <daniel.sneddon@linux.intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Teigland <teigland@redhat.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Eric Dumazet <edumazet@google.com>
  Esben Haabendal <esben@geanix.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georg Müller <georgmueller@gmx.net>
  Gilles Buloz <gilles.buloz@kontron.com>
  Gratian Crisan <gratian.crisan@ni.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guiting Shen <aarongt.shen@gmail.com>
  Hagar Hemdan <hagarhem@amazon.de>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Ian Rogers <irogers@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Vanek <linuxtardis@gmail.com>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Wang <jasowang@redhat.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jerry Meng <jerry-meng@foxmail.com>
  Jiri Benc <jbenc@redhat.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joe Thornber <ejt@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Jonas Gorski <jonas.gorski@gmail.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Kaufmann Automotive GmbH <info@kaufmann-automotive.ch>
  Kim Phillips <kim.phillips@amd.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Laszlo Ersek <lersek@redhat.com>
  Leon Romanovsky <leon@kernel.org>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maciej Żenczykowski <maze@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matus Gajdos <matuszpd@gmail.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxim Mikityanskiy <maxtram95@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Jeanson <mjeanson@efficios.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Snitzer <snitzer@kernel.org>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Mohsen Tahmasebi <moh53n@moh53n.ir>
  Mostafa Ghofrani <mostafaghrr@gmail.com>
  ndesaulniers@google.com <ndesaulniers@google.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nilesh Javali <njavali@marvell.com>
  Oliver Neukum <oneukum@suse.com>
  Olivier Maignial <olivier.maignial@hotmail.fr>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Pavlu <petr.pavlu@suse.com>
  Pratyush Yadav <ptyadav@amazon.de>
  Prince Kumar Maurya <princekumarmaurya06@gmail.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Richard Weinberger <richard@nod.at>
  Rob Clark <robdclark@chromium.org>
  Roger Quadros <rogerq@kernel.org>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Ross Maynard <bids.7405@bigpond.com>
  Ruihong Luo <colorsu1922@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Samuel Holland <samuel.holland@sifive.com>
  Samuel Mendoza-Jonas <samjonas@amazon.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Shaoying Xu <shaoyi@amazon.com>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Stefan Haberland <sth@linux.ibm.com>
  Steffen Maier <maier@linux.ibm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Stewart Smith <trawets@amazon.com>
  Sungwoo Kim <iam@sung-woo.kim>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <thierry.reding@gmail.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomas Glozar <tglozar@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  valis <sec@valis.email>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Ming <machel@vivo.com>
  Xianting Tian <xianting_tian@126.com>
  Xiubo Li <xiubli@redhat.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Ye Bin <yebin10@huawei.com>
  Yu Kuai <yukuai3@huawei.com>
  Yuanjun Gong <ruc_gongyuanjun@163.com>
  Yue Haibing <yuehaibing@huawei.com>
  Zhang Shurong <zhang_shurong@foxmail.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zheng Wang <zyytlz.wz@163.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zubin Mithra <zsm@chromium.org>
  Łukasz Bartosik <lb@semihalf.com>

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
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      fail    
 test-amd64-i386-xl-vhd                                       pass    


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

(No revision log; it would be 5380 lines long.)

