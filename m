Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63087CFC9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693902.1082564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl96t-0008VZ-BU; Fri, 15 Mar 2024 15:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693902.1082564; Fri, 15 Mar 2024 15:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl96t-0008T1-6P; Fri, 15 Mar 2024 15:04:39 +0000
Received: by outflank-mailman (input) for mailman id 693902;
 Fri, 15 Mar 2024 15:04:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl96r-0008Sr-Fc; Fri, 15 Mar 2024 15:04:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl96r-0004ag-68; Fri, 15 Mar 2024 15:04:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl96q-0003tY-P7; Fri, 15 Mar 2024 15:04:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rl96q-0005b2-Oe; Fri, 15 Mar 2024 15:04:36 +0000
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
	bh=JeE4ska4QpVPsNd4Lf3AOG3mMHs8jCgAV4YHn8WQruk=; b=6iW2asgPkMUMKMnuCjvZ9Jd2Uy
	CLTCm/Xzxae5oBeuInUucxjCPE1sAdkZ2vWbrDCA3QNgmrWrY2FRUEOBnRMj1h8o6P/GoCSTTbD55
	rkn29zDtu80HBss+d9vlM4GaOECKCQ5H87zRzl022kkBipFg299YmkRAWLwdL5dF8VzM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185045-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 185045: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    xen-unstable:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-qcow2:guest-start:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d638e304f13a5ef7d125de5ace5f7828a7b25bac
X-Osstest-Versions-That:
    xen=af7fed3fdf82981ebbb09628b278df957569333d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Mar 2024 15:04:36 +0000

flight 185045 xen-unstable real [real]
flight 185048 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185045/
http://logs.test-lab.xenproject.org/osstest/logs/185048/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 185036

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd      13 guest-start         fail pass in 185048-retest
 test-armhf-armhf-libvirt-qcow2 13 guest-start       fail pass in 185048-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 185048 like 185036
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 185048 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 185048 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 185048 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185036
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185036
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 185036
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185036
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 185036
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 185036
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185036
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 185036
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185036
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 185036
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  d638e304f13a5ef7d125de5ace5f7828a7b25bac
baseline version:
 xen                  af7fed3fdf82981ebbb09628b278df957569333d

Last test of basis   185036  2024-03-14 16:08:13 Z    0 days
Testing same since   185045  2024-03-15 05:12:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>

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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-armhf-armhf-libvirt-qcow2                               fail    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

------------------------------------------------------------
commit d638e304f13a5ef7d125de5ace5f7828a7b25bac
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Mar 14 17:39:29 2024 +0000

    SUPPORT.MD: Fix matrix generation after 43c416d0d819 and 77c39a53cf5b
    
    The script docs/support-matrix-generate throw the following error on the
    latest staging.
    
    MDCCSR_EL0
    DBGDTR_EL0
    DBGDTRTX_EL0
    DBGDTRRX_EL0
    DBGDSCRINT
    DBGDTRTXINT
    DBGDTRRXINT
    ^ cannot parse status codeblock line:
    MDCCSR_EL0
     ? at docs/parse-support-md line 172, <F> chunk 1.
    
    With the current indentation, it looks like the script thinks this is
    a status code block.
    
    Solve the issue by switching to a bullet list.
    
    Fixes: 43c416d0d819 ("xen/arm: arm64: Add emulation of Debug Data Transfer Registers")
    Fixes: 77c39a53cf5b ("xen/arm: arm32: Add emulation of Debug Data Transfer Registers")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 77c39a53cf5bfe185b7bff6544c63731513830d3
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Thu Mar 7 12:39:43 2024 +0000

    xen/arm: arm32: Add emulation of Debug Data Transfer Registers
    
    When user enables HVC_DCC config option in Linux, it invokes access to debug
    transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
    injects an undefined exception to the guest and Linux crashes.
    
    To prevent this crash, introduce a partial emulation of DBGDTR[TR]XINT (these
    registers share the same encoding) as RAZ/WI and DBGDSCRINT as TXfull.
    
    Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint:
    "If TXfull is set to 1, set DTRTX to UNKNOWN".
    
    As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
    variant (i.e. OSLSR_EL1). This is to ensure that DBGOSLSR.OSLK is 0, which
    allows us to skip the emulation of DBGDSCREXT (TXfull is treated as UNK/SBZP)
    and focus on DBGDSCRINT. DBGOSLSR.OSLM[1] is set to 1 to mantain consistency
    with Arm64.
    
    Take the opportunity to fix the minimum EL for DBGDSCRINT, which should be 0.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 43c416d0d81957229b5b5d73be694fb1ba149a3e
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Mar 7 12:39:42 2024 +0000

    xen/arm: arm64: Add emulation of Debug Data Transfer Registers
    
    Currently, if user enables HVC_DCC config option in Linux, it invokes access
    to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
    arm32). As these registers are not emulated, Xen injects an undefined
    exception to the guest and Linux crashes.
    
    To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
    (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
    
    Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
    "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
    
    Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
    using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
    and returns -ENODEV in case TXfull bit is still set after writing a test
    character. This way we prevent the guest from making use of HVC DCC as a
    console.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit bd06cf74fccc065ea67e9dd8c31e70abad1f0507
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Thu Mar 7 12:39:41 2024 +0000

    xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation" cmd option
    
    There can be situations when the registers cannot be emulated to their full
    functionality. This can be due to the complexity involved. In such cases, one
    can emulate those registers as RAZ/WI for example. We call them as partial
    emulation.
    
    Some registers are non-optional and as such there is nothing preventing an OS
    from accessing them.
    Instead of injecting undefined exception (which might result in crashing a
    guest), one may want to prefer a partial emulation to let the guest running
    (in some cases accepting the fact that it might result in unwanted behavior).
    
    A suitable example of this (as seen in subsequent patches) is emulation of
    DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
    registers can be emulated as RAZ/WI and they can be enclosed within
    CONFIG_PARTIAL_EMULATION.
    
    Further, "partial-emulation" command line option allows us to
    enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
    enables support for partial emulation at compile time (i.e. adds code for
    partial emulation), this option may be enabled or disabled by Yocto or other
    build systems. However if the build system turns this option on, users
    can use scripts like Imagebuilder to generate uboot-script which will append
    "partial-emulation=true" to xen command line to turn on the partial emulation.
    Thus, it helps to avoid rebuilding xen.
    
    By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
    This is done so that Xen supports partial emulation. However, customers are
    fully aware when they enable partial emulation. It's important to note that
    enabling such support might result in unwanted/non-spec compliant behavior.
    
    Added a note in SUPPORT.md to clarify the security support for partial
    emulation.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

