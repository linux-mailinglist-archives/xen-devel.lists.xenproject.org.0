Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D9545BA4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345778.571443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzX8I-0002SS-LF; Fri, 10 Jun 2022 05:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345778.571443; Fri, 10 Jun 2022 05:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzX8I-0002P8-HU; Fri, 10 Jun 2022 05:24:30 +0000
Received: by outflank-mailman (input) for mailman id 345778;
 Fri, 10 Jun 2022 05:24:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzX8H-0002Oy-Hu; Fri, 10 Jun 2022 05:24:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzX8H-0000NJ-FK; Fri, 10 Jun 2022 05:24:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzX8H-0002ss-3T; Fri, 10 Jun 2022 05:24:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzX8H-0003rz-31; Fri, 10 Jun 2022 05:24:29 +0000
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
	bh=j9Ub6tfday/VbGweocQvGhPoP6gaeHolRHIbUB+IXVU=; b=dzSHTCksB8tXMsJCOous/mgaJi
	iLzzdHxT/Q70d/lr+baEzfR9VTnSsq6Q5x/fk273X14p0UHZ4JvIIZ8070Wi4X7dZ2PguCvsvMIMB
	ue13jVr8p3eftur3MJBLQHNCNrDpG9D7mHkE0nbhy/+thXZCKXaIOGIKen1qX0zTf7lA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170902-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 170902: FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:host-install(5):broken:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-saverestore.2:fail:heisenbug
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=6d940eff4734bcb40b1a25f62d7cec5a396f994a
X-Osstest-Versions-That:
    qemuu=9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 05:24:29 +0000

flight 170902 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170902/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-rtds        <job status>                 broken  in 170891

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-rtds     5 host-install(5) broken in 170891 pass in 170902
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 16 guest-saverestore.2 fail in 170891 pass in 170902
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail in 170891 pass in 170902
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat  fail pass in 170891

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170884
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170884
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170884
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170884
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170884
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170884
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170884
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170884
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                6d940eff4734bcb40b1a25f62d7cec5a396f994a
baseline version:
 qemuu                9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5

Last test of basis   170884  2022-06-08 10:42:45 Z    1 days
Testing same since   170891  2022-06-09 01:39:44 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Peter Maydell <peter.maydell@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Stefan Berger <stefanb@linux.ibm.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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

broken-job test-amd64-amd64-xl-rtds broken

Not pushing.

------------------------------------------------------------
commit 6d940eff4734bcb40b1a25f62d7cec5a396f994a
Merge: 9b1f588549 e37a0ef460
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue Jun 7 19:22:18 2022 -0700

    Merge tag 'pull-tpm-2022-06-07-1' of https://github.com/stefanberger/qemu-tpm into staging
    
    Merge tpm 2022/06/07 v1
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQEzBAABCAAdFiEEuBi5yt+QicLVzsZrda1lgCoLQhEFAmKf8HgACgkQda1lgCoL
    # QhHx8Qf/QB2z+0B1xKKn8NqrWbZ+FaVlnPu/3hX4kraCY5zAYV9e64kdWhuIKRbM
    # 74/KARGMpkme6Y8rUSK6mVeiY+ul+egfVMnKyfhsM1jhAQT/DzSlht/XZzbn3Mg+
    # FFXQBMqcvcNWH53q9zi9GJYqH4tcxUku3ejgodU4+SO2wB5S59pS/tD+i5H06Vy5
    # Iw1kW6I11gYhJGETxVgb6F2Jfyu6uPWFhIg7eN06XwNExFc45E8GjrpIs2rO78GN
    # OzMBjwAG+C+/PU+UZDOd5Zhq5qv+8DcvDQuPXyqksxPcFvouvLghQvQL/h7neMlM
    # jOwHS153ay0EAT/t2lZafsBwqKQxvQ==
    # =b9Qe
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Tue 07 Jun 2022 05:42:32 PM PDT
    # gpg:                using RSA key B818B9CADF9089C2D5CEC66B75AD65802A0B4211
    # gpg: Good signature from "Stefan Berger <stefanb@linux.vnet.ibm.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: B818 B9CA DF90 89C2 D5CE  C66B 75AD 6580 2A0B 4211
    
    * tag 'pull-tpm-2022-06-07-1' of https://github.com/stefanberger/qemu-tpm:
      tpm_crb: mark command buffer as dirty on request completion
      hw/tpm/tpm_tis_common.c: Assert that locty is in range
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit e37a0ef4605e5d2041785ff3fc89ca6021faf7a0
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Apr 11 15:47:49 2022 +0100

    tpm_crb: mark command buffer as dirty on request completion
    
    At the moment, there doesn't seems to be any way to know that QEMU
    made modification to the command buffer. This is potentially an issue
    on Xen while migrating a guest, as modification to the buffer after
    the migration as started could be ignored and not transfered to the
    destination.
    
    Mark the memory region of the command buffer as dirty once a request
    is completed.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Message-id: 20220411144749.47185-1-anthony.perard@citrix.com

commit 4d84bb6c8b42cc781a02e1ac6648875966abc877
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed May 25 08:59:04 2022 -0400

    hw/tpm/tpm_tis_common.c: Assert that locty is in range
    
    In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
    tpm_tis_dump_state(), we calculate a locality index with
    tpm_tis_locality_from_addr() and then use it as an index into the
    s->loc[] array.  In all these cases, the array index can't overflow
    because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
    TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
    it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).
    
    Add an assertion to tpm_tis_locality_from_addr() that the calculated
    locality index is valid, which will help Coverity and also catch any
    potential future bug where the MemoryRegion isn't sized exactly.
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Message-id: 20220525125904.483075-1-stefanb@linux.ibm.com

