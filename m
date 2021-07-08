Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA43BF6AB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 10:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152932.282524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Oxf-0003Lr-71; Thu, 08 Jul 2021 08:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152932.282524; Thu, 08 Jul 2021 08:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Oxf-0003IU-3s; Thu, 08 Jul 2021 08:00:43 +0000
Received: by outflank-mailman (input) for mailman id 152932;
 Thu, 08 Jul 2021 08:00:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Oxe-0003IK-7k; Thu, 08 Jul 2021 08:00:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Oxd-0001PB-S2; Thu, 08 Jul 2021 08:00:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Oxd-0000hB-Il; Thu, 08 Jul 2021 08:00:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1Oxd-0002pN-IG; Thu, 08 Jul 2021 08:00:41 +0000
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
	bh=mZLxDGi3yw/w2Yyb8lbfT+anEU0J4H/Lv4oowxlcWjs=; b=DOeYslDRLS5eFndU65qaKHf/0E
	pd2Or9U3kkB27eaCzG4XWIsE8w646XwrJ6e+wCCoroc/+x+3ij99cniRb3UawxyqWaWVvm5AtHjZm
	XyS9yjk2s91kzGte49HaMuNZyPjhV3lOGX9X7OLgsRtG5OFytqKsL3zMPTuak1u+hwQ8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163416-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 163416: trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e362d3276d40e4f370c92eaa6c0e84e34badb92b
X-Osstest-Versions-That:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jul 2021 08:00:41 +0000

flight 163416 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163416/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 163386

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 163386
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 163386
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 163386
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 163386
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 163386
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 163386
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 163386
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 163386
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 163386
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 163386
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 163386
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  e362d3276d40e4f370c92eaa6c0e84e34badb92b
baseline version:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a

Last test of basis   163386  2021-07-07 05:04:03 Z    1 days
Testing same since   163416  2021-07-07 19:07:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Rahul Singh <rahul.singh@arm.com>
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
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
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
 test-armhf-armhf-xl-rtds                                     pass    
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

broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)

Not pushing.

------------------------------------------------------------
commit e362d3276d40e4f370c92eaa6c0e84e34badb92b
Author: Rahul Singh <rahul.singh@arm.com>
Date:   Tue Jul 6 11:53:59 2021 +0100

    xen/arm: smmuv1: Switch from kzalloc_array(..) to devm_kcalloc(..)
    
    Switch from kzalloc_array(..) to devm_kcalloc(..) when allocating the
    SMR to make code coherent.
    
    Signed-off-by: Rahul Singh <rahul.singh@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 63fdea768d175e96443a53b95a6441f520743e2e
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Tue Jul 6 12:28:53 2021 +0200

    arm: Fix arch_initialise_vcpu to be unsupported
    
    Function arch_initialise_vcpu is not reachable as the
    VCPUOP_initialise is an unsupported operation on arm.
    Modify the function by adding ASSERT_UNREACHABLE() and
    returning -EOPNOTSUPP.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 32cbc7f96ffa3ddceacb3812da0e31a82840b138
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Tue Jul 6 16:28:57 2021 +0100

    tools: Fix CPSR/SPSR print size
    
    918b8842a852 changed CPSR and SPSR to be stored as 64bit values.
    
    This is fixing the print size in some tools to use 64bit type.
    
    Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t")
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Michal Orzel <michal.orzel@arm.com>
    Tested-by: Michal Orzel <michal.orzel@arm.com>

commit cc83cae4de8116c7a8c9c9510d6b117745f42ff5
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jul 6 14:20:00 2021 +0100

    tools/xen-foreign: Update the size for vcpu_guest_{core_regs, context}
    
    Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
    uint64_t") updated the size of the structure vcpu_guest_core_regs and
    indirectly vcpu_guest_context.
    
    On Arm, the two structures are only accessible to the tools and the
    hypervisor (and therefore stable). However, they are still checked
    by the scripts in tools/include/xen-foreign are not able to understand
    that.
    
    Ideally we should rework the scripts so we don't have to update
    the size for non-stable structure. But I don't have limited time
    to spend on the issue. So chose the simple solution and update
    the size accordingly.
    
    Note that we need to keep vcpu_guest_core_regs around because
    the structure is used by vcpu_guest_context and therefore the
    scripts expects the generated header to contain it.
    
    Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t")
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Michal Orzel <michal.orzel@arm.com>
    Tested-by: Michal Orzel <michal.orzel@arm.com>

commit b8d27e5b3391f4f90744f6ce75c02bd2661f7788
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:35:54 2021 +0200

    x86/mem-sharing: mov {get,put}_two_gfns()
    
    There's no reason for every CU including p2m.h to have these two
    functions compiled, when they're both mem-sharing specific right now and
    for the foreseeable future.
    
    Largely just code movement, with some style tweaks, the inline-s
    dropped, and "put" being made consistent with "get" as to their NULL
    checking of the passed in pointer to struct two_gfns.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 09af2d01a2fe6a0af08598bdfe12c9707f4d82ba
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:35:12 2021 +0200

    x86/mem-sharing: ensure consistent lock order in get_two_gfns()
    
    While the comment validly says "Sort by domain, if same domain by gfn",
    the implementation also included equal domain IDs in the first part of
    the check, thus rending the second part entirely dead and leaving
    deadlock potential when there's only a single domain involved.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 980d6acf1517f0602e6dcf05ea922cf14c95e9c0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:32:45 2021 +0200

    IOMMU: make DMA containment of quarantined devices optional
    
    Containing still in flight DMA was introduced to work around certain
    devices / systems hanging hard upon hitting a "not-present" IOMMU fault.
    Passing through (such) devices (on such systems) is inherently insecure
    (as guests could easily arrange for IOMMU faults of any kind to occur).
    Defaulting to a mode where admins may not even become aware of issues
    with devices can be considered undesirable. Therefore convert this mode
    of operation to an optional one, not one enabled by default.
    
    This involves resurrecting code commit ea38867831da ("x86 / iommu: set
    up a scratch page in the quarantine domain") did remove, in a slightly
    extended and abstracted fashion. Here, instead of reintroducing a pretty
    pointless use of "goto" in domain_context_unmap(), and instead of making
    the function (at least temporarily) inconsistent, take the opportunity
    and replace the other similarly pointless "goto" as well.
    
    In order to key the re-instated bypasses off of there (not) being a root
    page table this further requires moving the allocate_domain_resources()
    invocation from reassign_device() to amd_iommu_setup_domain_device() (or
    else reassign_device() would allocate a root page table anyway); this is
    benign to the second caller of the latter function.
    
    In VT-d's domain_context_unmap(), instead of adding yet another
    "goto out" when all that's wanted is a "return", eliminate the "out"
    label at the same time.
    
    Take the opportunity and also limit the control to builds supporting
    PCI.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit f17a73b3c0264c62dd6b5dae01ed621c051c3038
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:08 2021 +0200

    tools/migration: unify type checking for data pfns in migration stream
    
    Introduce a helper which decides if a given pfn type has data
    in the migration stream.
    
    No change in behaviour intended, except for invalid page types which now
    have a safer default.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 5588ebcfca774477cf823949e5703b0ac48818cc
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:07 2021 +0200

    tools/migration: unify type checking for data pfns in the VM
    
    Introduce a helper which decides if a given pfn in the migration
    stream is backed by memory.
    
    This highlights more clearly that type XEN_DOMCTL_PFINFO_XALLOC (a
    synthetic toolstack-only type used between Xen 4.2 to 4.5 which
    indicated a dirty page on the sending side for which no data will be
    send in the initial iteration) does get populated in the VM.
    
    No change in behaviour intended, except for invalid page types which now
    have a safer default.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9e59d9f8ee3808acde9833192211da25f66d8cc2
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:05 2021 +0200

    tools/migration: unify known page type checking
    
    Users of xc_get_pfn_type_batch may want to sanity check the data
    returned by Xen. Add helpers for this purpose:
    
    is_known_page_type verifies the type returned by Xen on the saving
    side, or the incoming type for a page on the restoring side, is known
    by the save/restore code.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a27976a1080d537fb1f212a8f9133d60daa0025b
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:01 2021 +0200

    tools/python: fix Python3.4 TypeError in format string
    
    Using the first element of a tuple for a format specifier fails with
    python3.4 as included in SLE12:
        b = b"string/%x" % (i, )
    TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'
    
    It happens to work with python 2.7 and 3.6.
    To support older Py3, format as strings and explicitly encode as ASCII.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit c8f88810db2a25d6aacf65c1c60bc4f5d848a483
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:00 2021 +0200

    tools/python: handle libxl__physmap_info.name properly in convert-legacy-stream
    
    The trailing member name[] in libxl__physmap_info is written as a
    cstring into the stream. The current code does a sanity check if the
    last byte is zero. This attempt fails with python3 because name[-1]
    returns a type int. As a result the comparison with byte(\00) fails:
    
      File "/usr/lib/xen/bin/convert-legacy-stream", line 347, in read_libxl_toolstack
        raise StreamError("physmap name not NUL terminated")
      StreamError: physmap name not NUL terminated
    
    To handle both python variants, cast to bytearray().
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit 918b8842a852e0e7446286f546724b1c63c56c66
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Mon Jul 5 08:39:52 2021 +0200

    arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of hsr, cpsr, spsr_el1 to uint64_t.
    Previously we relied on the padding after spsr_el1.
    As we removed the padding, modify the union to be 64bit so we don't corrupt spsr_fiq.
    No need to modify the assembly code because the accesses were based on 64bit
    registers as there was a 32bit padding after spsr_el1.
    
    Remove 32bit padding in cpu_user_regs before spsr_fiq
    as it is no longer needed due to upper union being 64bit now.
    Add 64bit padding in cpu_user_regs before spsr_el1
    because the kernel frame should be 16-byte aligned.
    
    Change type of cpsr to uint64_t in the public outside interface
    "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
    Increment XEN_DOMCTL_INTERFACE_VERSION.
    
    Change type of cpsr to uint64_t in the public outside interface
    "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

