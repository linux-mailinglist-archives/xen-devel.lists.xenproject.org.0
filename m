Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489F6C76E1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 06:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514119.796154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfZjj-0000T7-Sj; Fri, 24 Mar 2023 05:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514119.796154; Fri, 24 Mar 2023 05:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfZjj-0000R9-PG; Fri, 24 Mar 2023 05:13:11 +0000
Received: by outflank-mailman (input) for mailman id 514119;
 Fri, 24 Mar 2023 00:18:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aperard@xenbits.xen.org>) id 1pfV8W-0002Ue-4r
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 00:18:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aperard@xenbits.xen.org>)
 id 1pfV8U-00005c-FG; Fri, 24 Mar 2023 00:18:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aperard@xenbits.xen.org>)
 id 1pfV8U-00084Z-3O; Fri, 24 Mar 2023 00:18:26 +0000
Received: from aperard by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <aperard@xenbits.xen.org>)
 id 1pfV8U-0006eX-2p; Fri, 24 Mar 2023 00:18:26 +0000
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
To: anthony.perard@citrix.com,jgross@suse.com,xen-devel@lists.xenproject.org
Subject: [adhoc test] 179901: regressions - trouble: blocked/broken/fail/pass
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-Id: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
From: aperard@xenbits.xen.org
Date: Fri, 24 Mar 2023 00:18:26 +0000

[adhoc play] <osstest master /dev/pts/16>
harness ed1d8de4: PDU/IPMI: Be less aggressive with IPMI commands
179901: regressions - trouble: blocked/broken/fail/pass

flight 179901 linux-linus play [play]
http://logs.test-lab.xenproject.org/osstest/logs/179901/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   5 capture-logs           broken REGR. vs. 178042
 test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-freebsd12-amd64 13 guest-start          fail REGR. vs. 178042
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 178042
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 178042
 test-amd64-amd64-freebsd11-amd64 13 guest-start          fail REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 178042
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 178042
 test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 178042
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 178042
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-raw 12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 178042
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 build-armhf                   4 host-install(4)       broken blocked in 178042
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail  like 178042
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl          15 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl          16 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail  like 178042
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail  like 178042
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail  like 178042
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail  like 178042
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail  like 178042
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 178042

baseline version:
 flight               178042

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      blocked 


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


