Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BE68A7C1
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 03:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489411.757762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO83J-0001rK-Jc; Sat, 04 Feb 2023 02:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489411.757762; Sat, 04 Feb 2023 02:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO83J-0001oA-Dz; Sat, 04 Feb 2023 02:13:17 +0000
Received: by outflank-mailman (input) for mailman id 489411;
 Sat, 04 Feb 2023 02:13:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO83I-0001o0-EH; Sat, 04 Feb 2023 02:13:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO83I-0006Ph-6h; Sat, 04 Feb 2023 02:13:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pO83H-0002oT-PN; Sat, 04 Feb 2023 02:13:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pO83H-0000GB-Of; Sat, 04 Feb 2023 02:13:15 +0000
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
	bh=dlh0q19pvs0zo1TdN3R2bZMhs59FY+QeOQlvM3LTokA=; b=dEtGU0/QiToZ1jzW1wilvyQtDL
	momzTkUYHDI+9ZuQ5DSeVDBenTJgpkbM50DfUVe0WhpxsAlzIlZXi91PJDFMh9KOuQzFOe7i79IOV
	6OCV18bzHcrihvBb3d6ksMTAamdrwW3aVlivqBxti+k+SCqnmdwmSe4EfUB2eGX0s1ZQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176345-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 176345: trouble: fail/pass/starved
X-Osstest-Failures:
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-4.17-testing:build-armhf:<job status>:broken:regression
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.17-testing:build-armhf:host-install(4):broken:regression
    xen-4.17-testing:build-armhf:syslog-server:running:regression
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:heisenbug
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-migrupgrade:xen-install/src_host:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-migrupgrade:xen-install/dst_host:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-pair:xen-install/src_host:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-pair:xen-install/dst_host:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-libvirt:leak-check/check:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-libvirt-raw:xen-install:fail:heisenbug
    xen-4.17-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.17-testing:build-armhf:capture-logs:broken:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:build-check(1):starved:nonblocking
    xen-4.17-testing:build-arm64-pvops:hosts-allocate:starved:nonblocking
    xen-4.17-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.17-testing:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=2f8851c37f88e4eb4858e16626fcb2379db71a4f
X-Osstest-Versions-That:
    xen=c4972a4272690384b15d5706f2a833aed636895e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 02:13:15 +0000

flight 176345 xen-4.17-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176345/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>        broken in 176317
 build-armhf                     <job status>                 broken  in 176317
 test-amd64-i386-xl-qemut-win7-amd64    <job status>           broken in 176317
 build-armhf                4 host-install(4) broken in 176317 REGR. vs. 175447
 build-armhf                   3 syslog-server                running in 176317

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken in 176317 pass in 176345
 test-amd64-i386-xl-qemut-win7-amd64 5 host-install(5) broken in 176317 pass in 176345
 test-amd64-i386-xl-qemuu-ovmf-amd64 7 xen-install fail in 176317 pass in 176345
 test-amd64-i386-migrupgrade 10 xen-install/src_host fail in 176338 pass in 176345
 test-amd64-i386-migrupgrade 11 xen-install/dst_host fail in 176338 pass in 176345
 test-amd64-i386-pair     10 xen-install/src_host fail in 176338 pass in 176345
 test-amd64-i386-pair     11 xen-install/dst_host fail in 176338 pass in 176345
 test-amd64-i386-libvirt      23 leak-check/check fail in 176338 pass in 176345
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install          fail pass in 176317
 test-amd64-i386-libvirt-raw   7 xen-install                fail pass in 176338

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale   1 build-check(1)           blocked in 176317 n/a
 build-armhf                  5 capture-logs broken in 176317 blocked in 175447
 test-amd64-i386-libvirt-raw 14 migrate-support-check fail in 176338 never pass
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175447
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175447
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175447
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175447
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175447
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175447
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175447
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175447
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175447
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm       1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-xl           1 build-check(1)           starved in 176317 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           starved in 176317 n/a
 build-arm64-pvops             2 hosts-allocate           starved in 176317 n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  2f8851c37f88e4eb4858e16626fcb2379db71a4f
baseline version:
 xen                  c4972a4272690384b15d5706f2a833aed636895e

Last test of basis   175447  2022-12-22 00:40:06 Z   44 days
Testing same since   176224  2023-01-26 22:14:43 Z    8 days   17 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Andryuk <jandryuk@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
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

broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job build-armhf broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken

Not pushing.

------------------------------------------------------------
commit 2f8851c37f88e4eb4858e16626fcb2379db71a4f
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Thu Jan 26 11:00:24 2023 +0100

    Revert "tools/xenstore: simplify loop handling connection I/O"
    
    I'm observing guest kexec trigger xenstored to abort on a double free.
    
    gdb output:
    Program received signal SIGABRT, Aborted.
    __pthread_kill_implementation (no_tid=0, signo=6, threadid=140645614258112) at ./nptl/pthread_kill.c:44
    44    ./nptl/pthread_kill.c: No such file or directory.
    (gdb) bt
        at ./nptl/pthread_kill.c:44
        at ./nptl/pthread_kill.c:78
        at ./nptl/pthread_kill.c:89
        at ../sysdeps/posix/raise.c:26
        at talloc.c:119
        ptr=ptr@entry=0x559fae724290) at talloc.c:232
        at xenstored_core.c:2945
    (gdb) frame 5
        at talloc.c:119
    119            TALLOC_ABORT("Bad talloc magic value - double free");
    (gdb) frame 7
        at xenstored_core.c:2945
    2945                talloc_increase_ref_count(conn);
    (gdb) p conn
    $1 = (struct connection *) 0x559fae724290
    
    Looking at a xenstore trace, we have:
    IN 0x559fae71f250 20230120 17:40:53 READ (/local/domain/3/image/device-model-dom
    id )
    wrl: dom    0      1  msec      10000 credit     1000000 reserve        100 disc
    ard
    wrl: dom    3      1  msec      10000 credit     1000000 reserve        100 disc
    ard
    wrl: dom    0      0  msec      10000 credit     1000000 reserve          0 disc
    ard
    wrl: dom    3      0  msec      10000 credit     1000000 reserve          0 disc
    ard
    OUT 0x559fae71f250 20230120 17:40:53 ERROR (ENOENT )
    wrl: dom    0      1  msec      10000 credit     1000000 reserve        100 disc
    ard
    wrl: dom    3      1  msec      10000 credit     1000000 reserve        100 disc
    ard
    IN 0x559fae71f250 20230120 17:40:53 RELEASE (3 )
    DESTROY watch 0x559fae73f630
    DESTROY watch 0x559fae75ddf0
    DESTROY watch 0x559fae75ec30
    DESTROY watch 0x559fae75ea60
    DESTROY watch 0x559fae732c00
    DESTROY watch 0x559fae72cea0
    DESTROY watch 0x559fae728fc0
    DESTROY watch 0x559fae729570
    DESTROY connection 0x559fae724290
    orphaned node /local/domain/3/device/suspend/event-channel deleted
    orphaned node /local/domain/3/device/vbd/51712 deleted
    orphaned node /local/domain/3/device/vkbd/0 deleted
    orphaned node /local/domain/3/device/vif/0 deleted
    orphaned node /local/domain/3/control/shutdown deleted
    orphaned node /local/domain/3/control/feature-poweroff deleted
    orphaned node /local/domain/3/control/feature-reboot deleted
    orphaned node /local/domain/3/control/feature-suspend deleted
    orphaned node /local/domain/3/control/feature-s3 deleted
    orphaned node /local/domain/3/control/feature-s4 deleted
    orphaned node /local/domain/3/control/sysrq deleted
    orphaned node /local/domain/3/data deleted
    orphaned node /local/domain/3/drivers deleted
    orphaned node /local/domain/3/feature deleted
    orphaned node /local/domain/3/attr deleted
    orphaned node /local/domain/3/error deleted
    orphaned node /local/domain/3/console/backend-id deleted
    
    and no further output.
    
    The trace shows that DESTROY was called for connection 0x559fae724290,
    but that is the same pointer (conn) main() was looping through from
    connections.  So it wasn't actually removed from the connections list?
    
    Reverting commit e8e6e42279a5 "tools/xenstore: simplify loop handling
    connection I/O" fixes the abort/double free.  I think the use of
    list_for_each_entry_safe is incorrect.  list_for_each_entry_safe makes
    traversal safe for deleting the current iterator, but RELEASE/do_release
    will delete some other entry in the connections list.  I think the
    observed abort is because list_for_each_entry has next pointing to the
    deleted connection, and it is used in the subsequent iteration.
    
    Add a comment explaining the unsuitability of list_for_each_entry_safe.
    Also notice that the old code takes a reference on next which would
    prevents a use-after-free.
    
    This reverts commit e8e6e42279a5723239c5c40ba4c7f579a979465d.
    
    This is XSA-425/CVE-2022-42330.
    
    Fixes: e8e6e42279a5 ("tools/xenstore: simplify loop handling connection I/O")
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

