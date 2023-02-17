Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4429569A896
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 10:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496975.767906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSxNV-0007Uz-1C; Fri, 17 Feb 2023 09:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496975.767906; Fri, 17 Feb 2023 09:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSxNU-0007QN-SU; Fri, 17 Feb 2023 09:50:04 +0000
Received: by outflank-mailman (input) for mailman id 496975;
 Fri, 17 Feb 2023 09:50:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSxNT-0007Gt-ST; Fri, 17 Feb 2023 09:50:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSxNT-0007x8-Oq; Fri, 17 Feb 2023 09:50:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSxNT-0002wk-Fy; Fri, 17 Feb 2023 09:50:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pSxNT-000191-FX; Fri, 17 Feb 2023 09:50:03 +0000
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
	bh=x0NJCwoL1LC4J1fTDTopDzwIfBSqe+f8D6Hb3IXW9ws=; b=lBl5JDXPSqr9AFl884jystRMVO
	da5Xs1eS88knA5/3co2ABCMzJbYDmcb7XQ9S27ZZaSEVl3YIh0o5rQju9GJBCm9XiVjfRlyGzak15
	QZw4aV38ky3FE3mHPv38gbPpJ5Wc5LtxHpGJXHCewuQ8LgcRUIvFIEkZDZXSYbiZV4MM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 177538: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start.2:fail:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-unstable:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=2e52dcc853a7183784cd9bdfb1e78ff366035209
X-Osstest-Versions-That:
    xen=5b9bb91abba7c983def3b4bef71ab08ad360a242
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Feb 2023 09:50:03 +0000

flight 177538 xen-unstable real [real]
flight 177584 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/177538/
http://logs.test-lab.xenproject.org/osstest/logs/177584/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    22 guest-start.2            fail REGR. vs. 177428

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 177584 pass in 177538
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 177584-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 177428
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 177428
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 177428
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 177428
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 177428
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 177428
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 177428
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 177428
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 177428
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
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
 xen                  2e52dcc853a7183784cd9bdfb1e78ff366035209
baseline version:
 xen                  5b9bb91abba7c983def3b4bef71ab08ad360a242

Last test of basis   177428  2023-02-15 22:10:26 Z    1 days
Failing since        177485  2023-02-16 10:25:30 Z    0 days    2 attempts
Testing same since   177538  2023-02-16 22:08:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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


Not pushing.

------------------------------------------------------------
commit 2e52dcc853a7183784cd9bdfb1e78ff366035209
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Thu Feb 16 10:15:35 2023 +0100

    x86/vlapic: call vmx_vlapic_msr_changed through an hvm_function callback
    
    APIC virtualization support is currently implemented only for Intel VT-x.
    To aid future work on separating AMD-V from Intel VT-x code, instead of
    calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
    to the hvm_function_table, named update_vlapic_mode, and create a wrapper
    function, called hvm_vlapic_mode(), to be used by common hvm code.
    
    After the change above, do not include header asm/hvm/vmx/vmx.h as it is
    not required anymore and resolve subsequent build errors for implicit
    declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
    missing asm/hvm/trace.h header.
    
    No functional change intended.
    
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit 727bf4cd0751782d100603a076f0e66f218cc3b8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 16 10:14:49 2023 +0100

    ACPI/CPER: use standard C types
    
    Consolidate cper.h to use exclusively standard types.
    
    No functional change intended.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 91c45cfbab5d9878c0a7021f762988a688d5e91d
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Mon Feb 6 14:05:28 2023 +0100

    xen/arm: Print return code from domain_create and construct_dom{0,U} on panic
    
    This might be helpful in providing additional debugging information (in
    most cases, at least to distinguish -EINVAL from -ENOMEM), so modify the
    code to include printing return code in panic message. In create_dom0,
    move the call to alloc_dom0_vcpu0() to a separate condition and call a
    meaningful panic message.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 768e405feabe58effbba75e5b1f782d678119c60
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Feb 14 16:38:42 2023 +0100

    automation: Add a true dom0less test on arm32
    
    Add a new test job qemu-smoke-dom0less-arm32-gcc-without-dom0 in debug
    and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
    script to test dom0less domU boot without dom0 (i.e. true dom0less
    configuration).
    
    By passing "without-dom0" as a test variant, the test will clear the
    dom0 prompt that we grep for as a last step and remove all the DOM0
    related options in ImageBuilder configuration.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit d28b226244abcb4b32e07de52df96b6b1686a240
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Feb 14 16:38:41 2023 +0100

    automation: Add a gzip compressed kernel image test on arm32
    
    Xen supports booting gzip compressed kernels, therefore add a new test
    job qemu-smoke-dom0less-arm32-gcc-gzip in debug and non-debug variant
    that will execute qemu-smoke-dom0less-arm32.sh script to test booting
    a domU with a gzip compressed kernel image (in our case zImage).
    
    By passing "gzip" as a test variant, the test will call gzip command
    to compress kernel image and use it in ImageBuilder configuration for
    domU1. No need for a specific check to be executed from domU. Being able
    to see a test message from a boot log is sufficient to mark a test as
    passed.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a6ce51ac3de8267ed4e2e7f2e1cf93d51c6d797a
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Feb 14 16:38:40 2023 +0100

    automation: Add a static memory allocation test on arm32
    
    Add a new test job qemu-smoke-dom0less-arm32-gcc-staticmem in debug
    and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
    script to test static memory allocation feature. The test case itself
    is directly taken from dom0less arm64 testing.
    
    Populate build jobs to compile Xen with config options necessary to
    enable static memory feature. Populate test jobs passing "static-mem"
    as a test variant. The test configures domU with a static memory region
    (direct-mapped) and adds a check using /proc/iomem to determine the
    memory region marked as "System RAM".
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 42ea8ddab8e003d272e897abec0b89270a90a9b0
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Feb 14 16:38:39 2023 +0100

    automation: Add arm32 dom0less testing
    
    At the moment, we only perform a single arm32 test in our CI, checking
    whether dom0 boots successfully or not. This is mostly because we do not
    have any arm32 runners and we only execute a hypervisor only build.
    
    In order not to leave the arm32 testing in such a poor state, add a
    script qemu-smoke-dom0less-arm32.sh to start testing dom0less
    configuration, while keeping dom0 to make the test more interesting.
    
    The script is mostly based on the one used for dom0 arm32 testing as well
    as the one used for dom0less arm64 testing. We obtain Debian Bullseye
    kernel and Alpine Linux busybox-based rootfs. Depending on the test
    variant, we prepare a test case contained within domU_check variable,
    that will be executed as part of /init script from domU rootfs.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a35fccc8df93de7154dba87db6e7bcf391e9d51c
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Feb 14 16:38:38 2023 +0100

    automation: Switch arm32 cross builds to run on arm64
    
    Due to the limited x86 CI resources slowing down the whole pipeline,
    switch the arm32 cross builds to be executed on arm64 which is much more
    capable. For that, rename the existing debian container dockerfile
    from unstable-arm32-gcc to unstable-arm64v8-arm32-gcc and use
    arm64v8/debian:unstable as an image. Note, that we cannot use the same
    container name as we have to keep the backwards compatibility.
    Take the opportunity to remove extra empty line at the end of a file.
    
    Modify the tag of .arm32-cross-build-tmpl to arm64 and update the build
    jobs accordingly.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

