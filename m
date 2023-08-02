Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166976D05B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575007.900746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD4B-0005ms-Kh; Wed, 02 Aug 2023 14:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575007.900746; Wed, 02 Aug 2023 14:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD4B-0005k4-Hw; Wed, 02 Aug 2023 14:43:11 +0000
Received: by outflank-mailman (input) for mailman id 575007;
 Wed, 02 Aug 2023 14:43:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRD4A-0005ju-Ha; Wed, 02 Aug 2023 14:43:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRD4A-000480-Bl; Wed, 02 Aug 2023 14:43:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRD49-0007at-QU; Wed, 02 Aug 2023 14:43:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qRD49-0001EQ-Pq; Wed, 02 Aug 2023 14:43:09 +0000
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
	bh=u2Piyq9SZRJ88ivwyRjoHVgJQI/01i9aGzgHVMqXNPo=; b=oie3te2etrlngw1ljuE8VxW5z7
	uLteLa4GnkPQUTmy2SosYxkbxg0Ri18n+f+c8ypAGqKXGW2G9Kpo2Rfi+WJ+JQ7gF5LgemHxN/LnH
	lXm0pKYR8Uc+/uBJ5poHUHXSwY96hrqEoUQMARKkQ1X/XSZr9HE46M5sCIh4EQi1AE1M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182110-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 182110: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-4.17-testing:test-amd64-i386-migrupgrade:xen-install/dst_host:fail:regression
    xen-4.17-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.17-testing:build-arm64-libvirt:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:build-check(1):starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:build-check(1):starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.17-testing:build-arm64:hosts-allocate:starved:nonblocking
    xen-4.17-testing:build-arm64-pvops:hosts-allocate:starved:nonblocking
    xen-4.17-testing:build-arm64-xsm:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=3d0aa6f23d54a4d3c608010c58c1147a1500d865
X-Osstest-Versions-That:
    xen=c18b2dd93f396eadd116d0016cf7285523a13505
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Aug 2023 14:43:09 +0000

flight 182110 xen-4.17-testing real [real]
flight 182117 xen-4.17-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182110/
http://logs.test-lab.xenproject.org/osstest/logs/182117/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-migrupgrade  11 xen-install/dst_host     fail REGR. vs. 182095

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 182117-retest

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182095
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182095
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182095
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182095
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182095
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182095
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182095
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182095
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182095
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw  1 build-check(1)               starved  n/a
 build-arm64-libvirt           1 build-check(1)               starved  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               starved  n/a
 test-arm64-arm64-xl           1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  3 hosts-allocate               starved  n/a
 build-arm64                   2 hosts-allocate               starved  n/a
 build-arm64-pvops             2 hosts-allocate               starved  n/a
 build-arm64-xsm               2 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt      3 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt-qcow2  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-vhd       3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl           3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-arndale   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit1   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-multivcpu  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-rtds      3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit2   3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  3d0aa6f23d54a4d3c608010c58c1147a1500d865
baseline version:
 xen                  c18b2dd93f396eadd116d0016cf7285523a13505

Last test of basis   182095  2023-07-31 13:07:46 Z    2 days
Testing same since   182110  2023-08-02 06:56:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Luca Fancellu <luca.fancellu@arm.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              starved 
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  starved 
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          starved 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            starved 
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
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
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
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
 test-armhf-armhf-xl-arndale                                  starved 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  starved 
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
 test-amd64-i386-migrupgrade                                  fail    
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
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
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
commit 3d0aa6f23d54a4d3c608010c58c1147a1500d865
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Mon Jul 17 13:25:46 2023 +0100

    xen/arm: Add Cortex-A77 erratum 1508412 handling
    
    Cortex-A77 cores (r0p0, r1p0) could deadlock on a sequence of a
    store-exclusive or read of PAR_EL1 and a load with device or non-cacheable
    memory attributes.
    A workaround is available, but it depends on a firmware counterpart.
    
    The proposed workaround from the errata document is to modify the software
    running at EL1 and above to include a DMB SY before and after accessing
    PAR_EL1.
    
    In conjunction to the above, the firmware needs to use a specific write
    sequence to several IMPLEMENTATION DEFINED registers to have the hardware
    insert a DMB SY after all load-exclusive and store-exclusive instructions.
    
    Apply the workaround to Xen where PAR_EL1 is read, implementing an helper
    function to do that.
    Since Xen can be interrupted by irqs in any moment, add a barrier on
    entry/exit when we are running on the affected cores.
    
    A guest without the workaround can deadlock the system, so warn the users
    of Xen with the above type of cores to use only trusted guests, by
    printing a message on Xen startup.
    
    This is XSA-436 / CVE-2023-34320.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    [stefano: add XSA-436 to commit message]
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

