Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F99786C40
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589868.921926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6wa-00007S-4y; Thu, 24 Aug 2023 09:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589868.921926; Thu, 24 Aug 2023 09:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6wa-0008WN-1R; Thu, 24 Aug 2023 09:48:00 +0000
Received: by outflank-mailman (input) for mailman id 589868;
 Thu, 24 Aug 2023 09:47:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ6wZ-0008WD-5x; Thu, 24 Aug 2023 09:47:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ6wY-0000hR-QK; Thu, 24 Aug 2023 09:47:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ6wY-0007Ya-9e; Thu, 24 Aug 2023 09:47:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ6wY-00046I-94; Thu, 24 Aug 2023 09:47:58 +0000
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
	bh=AlILVGiYl+KNHj20Jnl7zL+vE1Sc8/6uLfax34zmSok=; b=sq4JRDXHmzxi+5CCJoGsKgRQDw
	6ponCJ45ZCtUN7Tg8r2ghA7Lk9eJ7jkvXEqXYpYjwBtBoB5j0QCuKZLcKJ7G2612kgP/Ik5M0L+/F
	OOHz61btt4Ykez5YKqz0cK8tBPR2pqsJNad7lMg0qPCCwOtY/mDEKB0FFttrEFKtB/D8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182481-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 182481: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a943a4f119cd0d969631b4ada878974828a7064d
X-Osstest-Versions-That:
    xen=3fae7c56b313a12288a05e0a8c14c47bfd4dc40e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Aug 2023 09:47:58 +0000

flight 182481 xen-unstable real [real]
flight 182500 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182481/
http://logs.test-lab.xenproject.org/osstest/logs/182500/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 182419

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail pass in 182500-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 182500 like 182419
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182419
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182419
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182419
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182419
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182419
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182419
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182419
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182419
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182419
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182419
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182419
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  a943a4f119cd0d969631b4ada878974828a7064d
baseline version:
 xen                  3fae7c56b313a12288a05e0a8c14c47bfd4dc40e

Last test of basis   182419  2023-08-22 08:52:42 Z    2 days
Failing since        182425  2023-08-22 19:08:38 Z    1 days    2 attempts
Testing same since   182481  2023-08-23 15:37:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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
commit a943a4f119cd0d969631b4ada878974828a7064d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 23 09:36:21 2023 +0200

    Revert "xen/hypercalls: address violations of MISRA C:2012 Rule 8.3"
    
    This reverts commit 18fa10108198379c46286381856df04f172992c6.
    A nack arrived just after committing / pushing.

commit 18fa10108198379c46286381856df04f172992c6
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Wed Aug 23 09:28:33 2023 +0200

    xen/hypercalls: address violations of MISRA C:2012 Rule 8.3
    
    Make function declarations and definitions consistent to address
    violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
    function shall use the same names and type qualifiers").
    
    No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 18b4f7e1e1a0ba0ad6df8643cfea560fc32b3ca9
Author: Shawn Anastasio <sanastasio@raptorengineering.com>
Date:   Wed Aug 23 09:28:02 2023 +0200

    xen/ppc: Relocate kernel to physical address 0 on boot
    
    Introduce a small assembly loop in `start` to copy the kernel to
    physical address 0 before continuing. This ensures that the physical
    address lines up with XEN_VIRT_START (0xc000000000000000) and allows us
    to identity map the kernel when the MMU is set up in the next patch.
    
    We are also able to start execution at XEN_VIRT_START after the copy
    since hardware will ignore the top 4 address bits when operating in Real
    Mode (MMU off).
    
    Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 2115b443ab5039990398f936d1efe40b75bc296d
Author: Shawn Anastasio <sanastasio@raptorengineering.com>
Date:   Wed Aug 23 09:27:29 2023 +0200

    xen/ppc: Bump minimum target ISA to 3.0 (POWER9)
    
    In preparation for implementing ISA3+ Radix MMU support, drop ISA 2.07B
    from the supported ISA list to avoid having a non-working
    configuration in tree. It can be re-added at a later point when Hash
    MMU support is added.
    
    Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 145a69c0944ac70cfcf9d247c85dee9e99d9d302
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 23 09:26:36 2023 +0200

    x86/AMD: extend Zenbleed check to models "good" ucode isn't known for
    
    Reportedly the AMD Custom APU 0405 found on SteamDeck, models 0x90 and
    0x91, (quoting the respective Linux commit) is similarly affected. Put
    another instance of our Zen1 vs Zen2 distinction checks in
    amd_check_zenbleed(), forcing use of the chickenbit irrespective of
    ucode version (building upon real hardware never surfacing a version of
    0xffffffff).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 824b5a40dd3de0bd58fa306f4be8d6e13e1c327d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 23 09:25:52 2023 +0200

    build: make cc-option properly deal with unrecognized sub-options
    
    In options like -march=, it may be only the sub-option which is
    unrecognized by the compiler. In such an event the error message often
    splits option and argument, typically saying something like "bad value
    '<argument>' for '<option>'. Instead of extend the grep invocation, stop
    parsing compiler output altogether. Instead substitute -Wno-* options by
    their -W* counterparts for probing (obviously assuming that such a
    counterpart always exists).
    
    Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit a73560896ce3c513460f26bd1c205060d6ec4f8a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Aug 22 13:56:17 2023 +0100

    CI: Update FreeBSD to 12.4
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit a7d04b0e7935620e9f8b9e693d818bf043a5ecd6
Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
Date:   Tue Aug 22 08:53:56 2023 +0200

    xen/pci: address a violation of MISRA C:2012 Rule 8.3
    
    Make the paramater names of the prototype match the definition. No functional
    change.
    
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b3bb51f718bd513264129a407fc1836682b689a7
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Tue Aug 22 08:53:24 2023 +0200

    vm_event: rework inclusions to use arch-indipendent header
    
    The arch-specific header <asm/vm_event.h> should be included by the
    common header <xen/vm_event.h>, so that the latter can be included
    in the source files.
    
    This also resolves violations of MISRA C:2012 Rule 8.4 that were
    caused by declarations for
    'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
    in <asm/vm_event.h> not being visible when
    defining functions in 'xen/arch/x86/vm_event.c'
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit db75dfdb11dc4e837585bf61cc25dc0c8f048288
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Aug 22 08:52:49 2023 +0200

    mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_info()
    
    When !MEM_SHARING no useful output is produced. Move the function into
    mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
    drop it altogether from Arm (and eliminating the need to introduce stubs
    on PPC and RISC-V).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> #arm
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 5eb8c15171f72f155a5cba8400eb940b44187867
Author: Simon Gaiser <simon@invisiblethingslab.com>
Date:   Tue Aug 22 08:51:38 2023 +0200

    x86/hpet: Disable legacy replacement mode after IRQ test
    
    As far as I understand the HPET legacy mode is not required after the
    timer IRQ test. For previous discussion see [1] and [2]. Keeping it
    enabled prevents reaching deeper C-states on some systems and thereby
    also S0ix residency. So disable it after the timer IRQ test worked. Note
    that this code path is only reached when opt_hpet_legacy_replacement < 0,
    so explicit user choice is still honored.
    
    Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
    Link: https://lore.kernel.org/xen-devel/20230718122603.2002-1-simon@invisiblethingslab.com/ # [2]
    Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

