Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E728124F9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 03:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654277.1021007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb84-0008FP-BQ; Thu, 14 Dec 2023 02:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654277.1021007; Thu, 14 Dec 2023 02:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDb84-0008CF-8S; Thu, 14 Dec 2023 02:07:12 +0000
Received: by outflank-mailman (input) for mailman id 654277;
 Thu, 14 Dec 2023 02:07:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDb82-0008C3-E3; Thu, 14 Dec 2023 02:07:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDb82-0006cu-9C; Thu, 14 Dec 2023 02:07:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDb81-0000YN-Qu; Thu, 14 Dec 2023 02:07:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDb81-000360-QS; Thu, 14 Dec 2023 02:07:09 +0000
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
	bh=yQXRQbDe/7iJz3TpFwNCbPcfHqHApSbb0sRzeVGjO68=; b=l/NL4LP7Qgjsm0BTzKwFAjhCkn
	k9khrD03kssFD3hHwPyBK0CQuGtFfNCrLFtBLtuAvq8nSUaBA731xjpdOG+k3DG8dc6sY6AxFcswR
	qEcNQN6ky9FemMRHvuJJO9j+tluS0jZnc8sy66/LFym0OsD+hykZlZqfGWnFY9ZLrYKY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184121-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.18-testing test] 184121: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-4.18-testing:build-arm64-pvops:kernel-build:fail:regression
    xen-4.18-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt:hosts-allocate:starved:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-multivcpu:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=1792d1723b7fb45a20b145d2de4d233913b22c09
X-Osstest-Versions-That:
    xen=a4f3f5a62c10a5adc898cf45261783209f5bc037
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Dec 2023 02:07:09 +0000

flight 184121 xen-4.18-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184121/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184105

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop       fail blocked in 184105
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184105
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184105
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184105
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184105
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184105
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184105
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184105
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184105
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184105
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184105
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt      3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-multivcpu  3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  1792d1723b7fb45a20b145d2de4d233913b22c09
baseline version:
 xen                  a4f3f5a62c10a5adc898cf45261783209f5bc037

Last test of basis   184105  2023-12-12 13:37:12 Z    1 days
Testing same since   184121  2023-12-13 09:00:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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
commit 1792d1723b7fb45a20b145d2de4d233913b22c09
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Dec 12 14:45:52 2023 +0100

    x86/x2apic: introduce a mixed physical/cluster mode
    
    The current implementation of x2APIC requires to either use Cluster Logical or
    Physical mode for all interrupts.  However the selection of Physical vs Logical
    is not done at APIC setup, an APIC can be addressed both in Physical or Logical
    destination modes concurrently.
    
    Introduce a new x2APIC mode called Mixed, which uses Logical Cluster mode for
    IPIs, and Physical mode for external interrupts, thus attempting to use the
    best method for each interrupt type.
    
    Using Physical mode for external interrupts allows more vectors to be used, and
    interrupt balancing to be more accurate.
    
    Using Logical Cluster mode for IPIs allows fewer accesses to the ICR register
    when sending those, as multiple CPUs can be targeted with a single ICR register
    write.
    
    A simple test calling flush_tlb_all() 10000 times on a tight loop on AMD EPYC
    9754 with 512 CPUs gives the following figures in nano seconds:
    
    x mixed
    + phys
    * cluster
        N           Min           Max        Median           Avg        Stddev
    x  25 3.5131328e+08 3.5716441e+08 3.5410987e+08 3.5432659e+08     1566737.4
    +  12  1.231082e+09  1.238824e+09 1.2370528e+09 1.2357981e+09     2853892.9
    Difference at 95.0% confidence
            8.81472e+08 +/- 1.46849e+06
            248.774% +/- 0.96566%
            (Student's t, pooled s = 2.05985e+06)
    *  11 3.5099276e+08 3.5561459e+08 3.5461234e+08 3.5415668e+08     1415071.9
    No difference proven at 95.0% confidence
    
    So Mixed has no difference when compared to Cluster mode, and Physical mode is
    248% slower when compared to either Mixed or Cluster modes with a 95%
    confidence.
    
    Note that Xen uses Cluster mode by default, and hence is already using the
    fastest way for IPI delivery at the cost of reducing the amount of vectors
    available system-wide.
    
    Make the newly introduced mode the default one.
    
    Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
    been removed, as with the newly introduced mixed mode this would require more
    fine grained printing, or else would be incorrect.  The addressing mode can
    already be derived from the APIC driver in use, which is printed by different
    helpers.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Henry Wang <Henry.Wang@arm.com>
    master commit: e3c409d59ac87ccdf97b8c7708c81efa8069cb31
    master date: 2023-11-07 09:59:48 +0000
(qemu changes not included)

