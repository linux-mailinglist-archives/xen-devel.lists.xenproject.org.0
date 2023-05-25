Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EFD710F31
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539663.840790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CbS-0003K4-8R; Thu, 25 May 2023 15:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539663.840790; Thu, 25 May 2023 15:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CbS-0003HY-52; Thu, 25 May 2023 15:10:10 +0000
Received: by outflank-mailman (input) for mailman id 539663;
 Thu, 25 May 2023 15:10:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q2CbR-0003HO-87; Thu, 25 May 2023 15:10:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q2CbR-00015M-1N; Thu, 25 May 2023 15:10:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q2CbQ-0004mK-Ck; Thu, 25 May 2023 15:10:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q2CbQ-0003pl-CC; Thu, 25 May 2023 15:10:08 +0000
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
	bh=SiCQDPXsbjnRGwmshGl+X8XyoceOXLNTmElAMqPmKaI=; b=dS2cYWjC/S03q+lclGWvy7KyCa
	wjfYqOrCiHXUCK8/PlfzU0/niyEoGmW4+3W7JXYHdvzepxRrw43TsbDjty/kynXbst3g0lbLdnwTx
	bX2wmYRAXGOkGynEsEMnN0n6w/Ne/ijr0mws0yPupBhZSQJMlJlvZml/IViRIAz6ElzI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180938-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180938: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-xl-vhd:xen-install:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=511b9f286c3dadd041e0d90beeff7d47c9bf3b7a
X-Osstest-Versions-That:
    xen=380c6c170393c48852d4f2b1ea97125a399cfc61
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 May 2023 15:10:08 +0000

flight 180938 xen-unstable real [real]
flight 180944 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180938/
http://logs.test-lab.xenproject.org/osstest/logs/180944/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 180930

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-vhd        7 xen-install         fail pass in 180944-retest
 test-armhf-armhf-libvirt 18 guest-start/debian.repeat fail pass in 180944-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180930
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180930
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180930
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180930
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180930
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180930
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180930
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180930
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180930
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180930
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180930
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180930
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  511b9f286c3dadd041e0d90beeff7d47c9bf3b7a
baseline version:
 xen                  380c6c170393c48852d4f2b1ea97125a399cfc61

Last test of basis   180930  2023-05-24 17:38:36 Z    0 days
Testing same since   180938  2023-05-25 02:40:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-libvirt                                     fail    
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

------------------------------------------------------------
commit 511b9f286c3dadd041e0d90beeff7d47c9bf3b7a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon May 15 19:15:48 2023 +0100

    x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
    
    MSR_ARCH_CAPS data is now included in featureset information.  Replace
    opencoded checks with regular feature ones.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 205a9f970378c31ae3e00b52d59103a2e881b9e0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon May 15 19:05:01 2023 +0100

    x86/tsx: Remove opencoded MSR_ARCH_CAPS check
    
    The current cpu_has_tsx_ctrl tristate is serving double pupose; to signal the
    first pass through tsx_init(), and the availability of MSR_TSX_CTRL.
    
    Drop the variable, replacing it with a once boolean, and altering
    cpu_has_tsx_ctrl to come out of the feature information.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8f6bc7f9b72eb7cf0c8c5ae5d80498a58ba0b7c3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon May 15 16:59:25 2023 +0100

    x86/vtx: Remove opencoded MSR_ARCH_CAPS check
    
    MSR_ARCH_CAPS data is now included in featureset information.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit a87d131a8c2952e53ba9ed513d5553426cdeac34
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue May 16 14:07:43 2023 +0100

    x86/cpufeature: Rework {boot_,}cpu_has()
    
    One area where Xen deviates from Linux is that test_bit() forces a volatile
    read.  This leads to poor code generation, because the optimiser cannot merge
    bit operations on the same word.
    
    Drop the use of test_bit(), and write the expressions in regular C.  This
    removes the include of bitops.h (which is a frequent source of header
    tangles), and it offers the optimiser far more flexibility.
    
    Bloat-o-meter reports a net change of:
    
      add/remove: 0/0 grow/shrink: 21/87 up/down: 641/-2751 (-2110)
    
    with half of that in x86_emulate() alone.  vmx_ctxt_switch_to() seems to be
    the fastpath with the greatest delta at -24, where the optimiser has
    successfully removed the branch hidden in cpu_has_msr_tsc_aux.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit bbb289f3d5bdd3358af748d7c567343532ac45b5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri May 12 15:53:35 2023 +0100

    x86/boot: Expose MSR_ARCH_CAPS data in guest max policies
    
    We already have common and default feature adjustment helpers.  Introduce one
    for max featuresets too.
    
    Offer MSR_ARCH_CAPS unconditionally in the max policy, and stop clobbering the
    data inherited from the Host policy.  This will be necessary to level a VM
    safely for migration.  Annotate the ARCH_CAPS CPUID bit as special.  Note:
    ARCH_CAPS is still max-only for now, so will not be inhereted by the default
    policies.
    
    With this done, the special case for dom0 can be shrunk to just resampling the
    Host policy (as ARCH_CAPS isn't visible by default yet).
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 70553000d6b44dd7c271a35932b0b3e1f22c5532
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri May 12 15:37:02 2023 +0100

    x86/boot: Record MSR_ARCH_CAPS for the Raw and Host CPU policy
    
    Extend x86_cpu_policy_fill_native() with a read of ARCH_CAPS based on the
    CPUID information just read, removing the specially handling in
    calculate_raw_cpu_policy().
    
    Right now, the only use of x86_cpu_policy_fill_native() outside of Xen is the
    unit tests.  Getting MSR data in this context is left to whomever first
    encounters a genuine need to have it.
    
    Extend generic_identify() to read ARCH_CAPS into x86_capability[], which is
    fed into the Host Policy.  This in turn means there's no need to special case
    arch_caps in calculate_host_policy().
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit ce8c930851a5ca21c4e70f83be7e8b290ce1b519
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri May 12 18:50:59 2023 +0100

    x86/cpu-policy: MSR_ARCH_CAPS feature names
    
    Seed the default visibility from the dom0 special case, which for the most
    part just exposes the *_NO bits.  EIBRS is the one non-*_NO bit, which is
    "just" a status bit to the guest indicating a change in implemention of IBRS
    which is already fully supported.
    
    Insert a block dependency from the ARCH_CAPS CPUID bit to the entire content
    of the MSR.  This is because MSRs have no structure information similar to
    CPUID, and used by x86_cpu_policy_clear_out_of_range_leaves(), in order to
    bulk-clear inaccessable words.
    
    The overall CPUID bit is still max-only, so all of MSR_ARCH_CAPS is hidden in
    the default policies.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit d9fe459ffad8a6eac2f695adb2331aff83c345d1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri May 12 17:55:21 2023 +0100

    x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
    
    Bits through 24 are already defined, meaning that we're not far off needing
    the second word.  Put both in right away.
    
    As both halves are present now, the arch_caps field is full width.  Adjust the
    unit test, which notices.
    
    The bool bitfield names in the arch_caps union are unused, and somewhat out of
    date.  They'll shortly be automatically generated.
    
    Add CPUID and MSR prefixes to the ./xen-cpuid verbose output, now that there
    are a mix of the two.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 43912f8dbb1888ffd7f00adb10724c70e71927c4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon May 15 14:14:53 2023 +0100

    x86/boot: Adjust MSR_ARCH_CAPS handling for the Host policy
    
    We are about to move MSR_ARCH_CAPS into featureset, but the order of
    operations (copy raw policy, then copy x86_capabilitiles[] in) will end up
    clobbering the ARCH_CAPS value.
    
    Some toolstacks use this information to handle TSX compatibility across the
    CPUs and microcode versions where support was removed.
    
    To avoid this transient breakage, read from raw_cpu_policy rather than
    modifying it in place.  This logic will be removed entirely in due course.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit ef1987fcb0fdfaa7ee148024037cb5fa335a7b2d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri May 12 13:52:39 2023 +0100

    x86/boot: Rework dom0 feature configuration
    
    Right now, dom0's feature configuration is split between between the common
    path and a dom0-specific one.  This mostly is by accident, and causes some
    very subtle bugs.
    
    First, start by clearly defining init_dom0_cpuid_policy() to be the domain
    that Xen builds automatically.  The late hwdom case is still constructed in a
    mostly normal way, with the control domain having full discretion over the CPU
    policy.
    
    Identifying this highlights a latent bug - the two halves of the MSR_ARCH_CAPS
    bodge are asymmetric with respect to the hardware domain.  This means that
    shim, or a control-only dom0 sees the MSR_ARCH_CAPS CPUID bit but none of the
    MSR content.  This in turn declares the hardware to be retpoline-safe by
    failing to advertise the {R,}RSBA bits appropriately.  Restrict this logic to
    the hardware domain, although the special case will cease to exist shortly.
    
    For the CPUID Faulting adjustment, the comment in ctxt_switch_levelling()
    isn't actually relevant.  Provide a better explanation.
    
    Move the recalculate_cpuid_policy() call outside of the dom0-cpuid= case.
    This is no change for now, but will become necessary shortly.
    
    Finally, place the second half of the MSR_ARCH_CAPS bodge after the
    recalculate_cpuid_policy() call.  This is necessary to avoid transiently
    breaking the hardware domain's view while the handling is cleaned up.  This
    special case will cease to exist shortly.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

