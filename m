Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28246F22A5
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 05:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527530.820238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psb74-0005FB-LX; Sat, 29 Apr 2023 03:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527530.820238; Sat, 29 Apr 2023 03:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psb74-0005DE-IX; Sat, 29 Apr 2023 03:19:06 +0000
Received: by outflank-mailman (input) for mailman id 527530;
 Sat, 29 Apr 2023 03:19:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psb73-0005D2-5K; Sat, 29 Apr 2023 03:19:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psb72-0008S7-So; Sat, 29 Apr 2023 03:19:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psb72-0000Ku-CQ; Sat, 29 Apr 2023 03:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psb72-0005ux-Bz; Sat, 29 Apr 2023 03:19:04 +0000
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
	bh=S+rNsLaSiqZwcMlz88sKbD1YbbF5ZmRpbuNkKb7Pq/M=; b=1dZWs/zkubUSXU3SUxYDhUlwSd
	Cv90AyAIynAOJVoWdTQFUfydooEAE/spkrTl4ic4/KWkfio6OZgLPWsDZxft/KOzBpT4Pg7/1QTz0
	Lyv++ynpN97O/YUdf65S1zPz0yele91ucxNRZMdEV28RCQQUdlVG3VSTZzMKmgxfQBKM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180464-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 180464: regressions - FAIL
X-Osstest-Failures:
    xen-4.16-testing:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    xen-4.16-testing:build-arm64:xen-build:fail:regression
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:heisenbug
    xen-4.16-testing:test-amd64-amd64-xl-pvhv2-intel:debian-fixup:fail:heisenbug
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    xen-4.16-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.16-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7251cea957cbe4a0772651a4ab110ed76f689f96
X-Osstest-Versions-That:
    xen=6f6526ac7e342b2f125ffba649d4f13e22bbc860
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Apr 2023 03:19:04 +0000

flight 180464 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180464/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 180407
 build-arm64                   6 xen-build      fail in 180445 REGR. vs. 180407

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ws16-amd64 7 xen-install fail in 180445 pass in 180464
 test-amd64-amd64-xl-pvhv2-intel 13 debian-fixup            fail pass in 180445
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail pass in 180445

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 180445 n/a
 build-arm64-libvirt           1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 180445 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 180445 n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180407
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180407
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180407
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180407
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180407
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180407
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180407
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180407
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180407
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180407
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180407
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180407
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  7251cea957cbe4a0772651a4ab110ed76f689f96
baseline version:
 xen                  6f6526ac7e342b2f125ffba649d4f13e22bbc860

Last test of basis   180407  2023-04-25 08:21:48 Z    3 days
Testing same since   180445  2023-04-27 13:08:28 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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

------------------------------------------------------------
commit 7251cea957cbe4a0772651a4ab110ed76f689f96
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 27 14:54:26 2023 +0200

    update Xen version to 4.16.4
(qemu changes not included)

