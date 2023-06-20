Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789873626C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551418.860962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBSUL-0005TY-SB; Tue, 20 Jun 2023 03:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551418.860962; Tue, 20 Jun 2023 03:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBSUL-0005Rj-NV; Tue, 20 Jun 2023 03:57:05 +0000
Received: by outflank-mailman (input) for mailman id 551418;
 Tue, 20 Jun 2023 03:57:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBSUK-0005RZ-JZ; Tue, 20 Jun 2023 03:57:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBSUK-0000R3-EJ; Tue, 20 Jun 2023 03:57:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBSUJ-0001ih-Tw; Tue, 20 Jun 2023 03:57:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBSUJ-0003Rf-TR; Tue, 20 Jun 2023 03:57:03 +0000
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
	bh=Hup0l4x/wtkKN+zxXvqklxyZwVpG/YIoAlG8aXVryOA=; b=02eANS0N2bDKJ5XVGyrkENchCx
	00hYH+Bs4m29M2HirRNm0Eu8mHP6h5vMvuwNY86efRBVeMy/kYFKunXZEVkvjtdWBfnGtAmTbR8ig
	cDoXd9/fRCTN6WSyjtK/MnAfLLntfqjasjMMmRDNr3OPgTNnsSbbcZghDgnALaopZvrc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181508-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 181508: trouble: blocked/broken/fail/pass/starved
X-Osstest-Failures:
    linux-5.4:build-armhf:<job status>:broken:regression
    linux-5.4:build-armhf:host-install(4):broken:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:debian-di-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    linux-5.4:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=61a2f83e4762ee0c766f86944e612305f5888bcb
X-Osstest-Versions-That:
    linux=f568a20f058fa1e37069cff4aac4187c1650a0e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jun 2023 03:57:03 +0000

flight 181508 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181508/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181363

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw 13 guest-start      fail in 181494 pass in 181482
 test-armhf-armhf-xl-vhd     12 debian-di-install fail in 181494 pass in 181482
 test-amd64-i386-xl-qemuu-debianhvm-amd64 7 xen-install fail in 181494 pass in 181508
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail in 181494 pass in 181508
 test-amd64-i386-xl-qemut-debianhvm-amd64 7 xen-install fail in 181494 pass in 181508
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 181494 pass in 181508
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install          fail pass in 181494

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 181482 like 181363
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 181482 like 181363
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 181482 never pass
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 181482 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 181482 never pass
 test-armhf-armhf-xl-credit2  14 guest-start         fail in 181494 like 181354
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 181494 like 181363
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 181494 like 181363
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail in 181494 like 181363
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 181494 like 181363
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 181494 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 181494 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 181494 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 181494 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 181494 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 181494 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 181494 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 181494 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 181494 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181363
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181363
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181363
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                61a2f83e4762ee0c766f86944e612305f5888bcb
baseline version:
 linux                f568a20f058fa1e37069cff4aac4187c1650a0e9

Last test of basis   181363  2023-06-10 15:39:59 Z    9 days
Testing same since   181425  2023-06-14 10:50:49 Z    5 days   10 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ai Chao <aichao@kylinos.cn>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Hutchings <ben@decadent.org.uk>
  Chia-I Wu <olvaffe@gmail.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  David Jander <david@protonic.nl>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Hangyu Hua <hbh25y@gmail.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ismael Ferreras Morezuelas <swyterzone@gmail.com>
  JaimeLiao <jaimeliao.tw@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Martin Hundebøll <martin@geanix.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Chan <michael.chan@broadcom.com>
  Min Li <lm0963hack@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Qingfang DENG <qingfang.deng@siflower.com.cn>
  Randy Dunlap <rdunlap@infradead.org>
  RenHai <kean0048@gmail.com>
  Rishabh Bhatnagar <risbhat@amazon.com>
  Ruihan Li <lrh2000@pku.edu.cn>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Somnath Kotur <somnath.kotur@broadcom.com>
  Stefan Ghinea <stefan.ghinea@windriver.com>
  Stephan Gerhold <stephan@gerhold.net>
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sungwoo Kim <iam@sung-woo.kim>
  Sven Eckelmann <sven@narfation.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vladislav Efanov <VEfanov@ispras.ru>
  Wolfram Sang <wsa@kernel.org>
  Xiubo Li <xiubli@redhat.com>
  Ying Hsu <yinghsu@chromium.org>
  YouChing Lin <ycllin@mxic.com.tw>
  Zixuan Fu <r33s3n6@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      blocked 
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 1380 lines long.)

