Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB96E725A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 06:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523114.812863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pozaL-0006Mh-7i; Wed, 19 Apr 2023 04:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523114.812863; Wed, 19 Apr 2023 04:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pozaL-0006K7-4c; Wed, 19 Apr 2023 04:38:25 +0000
Received: by outflank-mailman (input) for mailman id 523114;
 Wed, 19 Apr 2023 04:38:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pozaI-0006Jx-SK; Wed, 19 Apr 2023 04:38:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pozaI-0000rD-JU; Wed, 19 Apr 2023 04:38:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pozaI-0003CY-8a; Wed, 19 Apr 2023 04:38:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pozaI-0001Ye-85; Wed, 19 Apr 2023 04:38:22 +0000
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
	bh=quyhWiDR8ugSYMEHC17ftEBaMoVS5HZHCZ5lFqFsZC8=; b=rchT557psE6q+jcfJJAnzqCVqe
	ane1IUOMGextfc8aEQQc1UFCoGK7UnHmfLjA8YSDDMlRFige+8rxmYL9lqoxzkPDlOwL1Y/YbTZvI
	FEd8LvzrCjMAah2BUY9pqHN300jzv19osJMI4Y39JZNUoL9vqaLeZ566TAdilozR1f5o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180301-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180301: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-livepatch:xen-install:fail:regression
    xen-unstable:test-armhf-armhf-examine:examine-serial/bootloader:fail:regression
    xen-unstable:test-armhf-armhf-examine:examine-serial/kernel:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cbe828581b4a1717a4331b754c25a27a41d1bc58
X-Osstest-Versions-That:
    xen=5eb6bd7454e253f4907dbeb7aa982967b21698bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Apr 2023 04:38:22 +0000

flight 180301 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180301/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-livepatch     7 xen-install              fail REGR. vs. 180287
 test-armhf-armhf-examine    11 examine-serial/bootloader fail REGR. vs. 180287
 test-armhf-armhf-examine     12 examine-serial/kernel    fail REGR. vs. 180287
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 180287

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180287
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180287
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180287
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180287
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180287
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180287
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180287
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180287
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180287
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180287
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180287
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install       fail like 180287
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  cbe828581b4a1717a4331b754c25a27a41d1bc58
baseline version:
 xen                  5eb6bd7454e253f4907dbeb7aa982967b21698bc

Last test of basis   180287  2023-04-17 18:09:05 Z    1 days
Failing since        180296  2023-04-18 06:36:57 Z    0 days    2 attempts
Testing same since   180301  2023-04-18 18:07:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Dietmar Hahn <dietmar.hahn@fujitsu.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    fail    
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
 test-amd64-amd64-libvirt-vhd                                 fail    
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
commit cbe828581b4a1717a4331b754c25a27a41d1bc58
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Apr 18 08:28:15 2023 +0200

    xen: update CONFIG_DEBUG_INFO help text
    
    Update the help text of the CONFIG_DEBUG_INFO option to be a little
    bit more specific.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 14a9f07d99f314a86fc4e94d5e5577fbf3f8a3ef
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Apr 18 08:26:24 2023 +0200

    xen: move CONFIG_DEBUG_INFO out of EXPERT section
    
    In order to support hypervisor analysis of crash dumps, xen-syms needs
    to contain debug_info. It should be allowed to configure the hypervisor
    to be built with CONFIG_DEBUG_INFO in non-debug builds without having
    to enable EXPERT.
    
    Using a rather oldish gcc (7.5) it was verified that code generation
    doesn't really differ between CONFIG_DEBUG_INFO on or off without
    CONFIG_DEBUG being set (only observed differences were slightly
    different symbol addresses, verified via "objdump -d", resulting from
    the different config.gz in the binary). The old gcc version selection
    was based on the assumption, that newer gcc won't regress in this
    regard.
    
    So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.
    
    It should be mentioned that there have been reports that the linking
    of the xen.efi might take considerably longer with CONFIG_DEBUG_INFO
    selected when using newer binutils.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Tested-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 3146c0f10140e23594c8185568f887111e504977
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Tue Apr 18 08:25:50 2023 +0200

    xen/riscv: add explicit check that .got{.plt} is empty
    
    The GOT sections usage should be avoided in the hypervisor
    so to catch such use cases earlier when GOT things are
    produced the patch introduces .got and .got.plt sections
    and adds asserts that they're empty.
    
    The sections won't be created until they remain
    empty otherwise the asserts would cause early failure.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit c57cd4d45c4e54b3906171499258dbd3556855d4
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Tue Apr 18 08:22:20 2023 +0200

    xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
    
    The patch is needed to keep all address of cpu0_boot_stack
    PC-relative.
    
    Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
    'auipc/l{w|d}'. It depends on the .option directive: nopic and pic
    or compiler flags.
    
    Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
    cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
    where all addresses will be without counting that it might happen
    that linker address != load address ( so addresses inside got
    sections will be relative to linker time ).
    
    It happens becuase the compiler from riscv64 docker compiled with
    --enable-default-pie:
      [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -v
      Using built-in specs.
      COLLECT_GCC=riscv64-linux-gnu-gcc
      COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-linux-gnu/12.2.0/lto-wrapper
      Target: riscv64-linux-gnu
      Configured with: /build/riscv64-linux-gnu-gcc/src/gcc-12.2.0/configure
      --prefix=/usr --program-prefix=riscv64-linux-gnu- --with-local-
      prefix=/usr/riscv64-linux-gnu --with-sysroot=/usr/riscv64-linux-gnu --
      with-build-sysroot=/usr/riscv64-linux-gnu --libdir=/usr/lib --
      libexecdir=/usr/lib --target=riscv64-linux-gnu --host=x86_64-pc-linux-
      gnu --build=x86_64-pc-linux-gnu --with-system-zlib --with-isl --with-
      linker-hash-style=gnu --disable-nls --disable-libunwind-exceptions --
      disable-libstdcxx-pch --disable-libssp --disable-multilib --disable-
      werror --enable-languages=c,c++ --enable-shared --enable-threads=posix
      --enable-__cxa_atexit --enable-clocale=gnu --enable-gnu-unique-object -
      -enable-linker-build-id --enable-lto --enable-plugin --enable-install-
      libiberty --enable-gnu-indirect-function --enable-default-pie --enable-
      checking=release
      Thread model: posix
      Supported LTO compression algorithms: zlib zstd
      gcc version 12.2.0 (GCC)
    
    Looking at gcc spec file for the RISC-V architecture:
      [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i
      pic
      --traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno-
      PIE|fno-pic|fno-PIC:;:-fpic} %{march=*} %{mabi=*} %{mno-relax} %{mbig-
      endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=*}
    which means that -fpic is enabled if none of the following options are
    present on the command line:
        -fno-pie
        -fno-PIE
        -fno-pic
        -fno-PIC
    
    That's the reasons why 'la' is transformed to 'aupic/l{w|d} GOT' and
    not be dependent on the toolchain used.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit 1213ebfb9f35920b3e0f5dff71bb917f5fb4be5f
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Apr 5 13:17:50 2023 +0200

    xen/arm: vpl011: Do not try to handle TX FIFO status when backend in Xen
    
    >From vpl011_rx_char_xen(), we call vpl011_data_avail() that handles both
    RX and TX state. Because we are passing 0 as out_fifo_level and
    SBSA_UART_FIFO_SIZE as out_size, we end up calling a function
    vpl011_update_tx_fifo_status() which performs TXI bit handling
    depending on the FIFO trigger level. This does not make sense when backend
    is in Xen, as we maintain a single TX state where data can always be
    written and as such there is no TX FIFO handling. Furthermore, this
    function assumes that the backend is in domain by making use of struct
    xencons_interface unconditionally. Fix it by calling this function only
    when backend is in domain. Also add an assert for sanity.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Tested-by: Henry Wang <Henry.Wang@arm.com>

commit d3784f16bbfeabde92b55ee6d5d66dcb1d82d060
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Apr 5 13:17:49 2023 +0200

    xen/arm: vpl011: Handle correctly TXFE when backend in Xen
    
    When backend is in Xen, the handling of data written to DR register is a
    bit special because we want to tell guest that we are always ready for new
    data to be written (i.e. no real FIFO, TXFF/BUSY never set and TXI always
    set). This conflicts with the current handling of TXFE bit, which we
    always clear and never set on a write path (we happen to set it when we
    receive char from serial input due to use of vpl011_data_avail() but this
    might never be called). This can lead to issues if a guest driver makes
    use of TXFE bit to check for TX transmission completion (such guest could
    then wait endlessly). Fix it by keeping TXFE always set to match the
    current emulation logic.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
    Tested-by: Henry Wang <Henry.Wang@arm.com>

commit 005e84e695ed086b9ebb281ee6711fd1aa6aaaba
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Apr 5 13:17:48 2023 +0200

    xen/arm: vpl011: Fix misleading comments
    
    In both vpl011_read_data() and vpl011_read_data_xen(), there is a comment
    stating that the guest is expected to read the DR register only if the
    TXFE bit of FR register is not set. This is obviously logically wrong and
    it should be RXFE (i.e. RX FIFO empty bit set -> nothing to read).
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit 65c4e7472cafb60f478e7a5f358ee1eeac28b5a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:11:45 2023 +0200

    x86emul: support AVX-NE-CONVERT insns
    
    Matching what was done earlier, explicit tests are added only for
    irregular insn / memory access patterns.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 842acaa743a503726d6c4d77a7982cc64f07c4bf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:11:06 2023 +0200

    x86emul: support AVX-VNNI-INT8
    
    These are close relatives of the AVX-VNNI ISA extension. Since the insns
    here and in particular their memory access patterns follow the usual
    scheme (and especially the byte variants of AVX-VNNI), I didn't think it
    was necessary to add a contrived test specifically for them.
    
    While making the addition also re-wire AVX-VNNI's handling to
    simd_0f_ymm: There's no reason to check the AVX feature alongside the
    one actually of interest (there are a few features where two checks are
    actually necessary, e.g. GFNI+AVX, but this isn't the case here).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit da232f1f1118e8c8fad520dedee312005c2984fb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:10:14 2023 +0200

    x86emul: support AVX-IFMA insns
    
    As in a few cases before (in particular: AVX512_IFMA), since the insns
    here and in particular their memory access patterns follow the usual
    scheme, I didn't think it was necessary to add a contrived test
    specifically for them.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

