Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CC6E410F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521785.810658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJLH-00041z-WA; Mon, 17 Apr 2023 07:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521785.810658; Mon, 17 Apr 2023 07:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJLH-00040G-T2; Mon, 17 Apr 2023 07:32:03 +0000
Received: by outflank-mailman (input) for mailman id 521785;
 Mon, 17 Apr 2023 07:32:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poJLF-0003zu-VF; Mon, 17 Apr 2023 07:32:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poJLF-0008BN-KT; Mon, 17 Apr 2023 07:32:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poJLF-0006oc-3b; Mon, 17 Apr 2023 07:32:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1poJLF-0002qX-34; Mon, 17 Apr 2023 07:32:01 +0000
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
	bh=nfvdqKNqFrEGAtKqVeAcGSJ+ZlJdbLnuTe2XWEJEU4c=; b=w5UUaz87P+fC7jDTAhhBQVSr1H
	fe5NhuGsKnL8ixNJ2egMsxmaRxb9YOtGCC2RejEXSDR4tIxmApb2Y2EBO02eZIK0rMMlS/lcLoEvw
	gIPStnXR6Fv8WmNeGWq3n7NGdpVN67WTQ2nxPlLlrcunNqVnulf03ZqDHLWgG72oVo8U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180280-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180280: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:kernel-build:fail:regression
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:host-install(5):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:host-install(5):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:host-install(5):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:host-install(5):broken:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=44843cee3d2b8daa09e5860fc4574219b57acde8
X-Osstest-Versions-That:
    xen=f872a624cbf92de9944483eea7674ef80ced1380
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Apr 2023 07:32:01 +0000

flight 180280 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180280/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 180238

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           5 host-install(5)       broken starved in 180238
 test-armhf-armhf-xl-vhd       5 host-install(5)       broken starved in 180238
 test-armhf-armhf-xl-multivcpu  5 host-install(5)      broken starved in 180238
 test-armhf-armhf-xl-credit1   5 host-install(5)       broken starved in 180238
 test-armhf-armhf-xl-arndale   8 xen-boot                fail baseline untested
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180238
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180238
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180238
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180238
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180238
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180238
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180238
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180238
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180238
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt   16 saverestore-support-check fail starved in 180238
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail starved in 180238
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail starved in 180238

version targeted for testing:
 xen                  44843cee3d2b8daa09e5860fc4574219b57acde8
baseline version:
 xen                  f872a624cbf92de9944483eea7674ef80ced1380

Last test of basis   180238  2023-04-13 14:38:34 Z    3 days
Failing since        180256  2023-04-14 05:34:08 Z    3 days    7 attempts
Testing same since   180280  2023-04-17 00:10:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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
 test-armhf-armhf-xl                                          broken  
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-armhf-armhf-xl-multivcpu                                broken  
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      broken  
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

broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-vhd broken
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)

Not pushing.

------------------------------------------------------------
commit 44843cee3d2b8daa09e5860fc4574219b57acde8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Mar 24 22:24:51 2023 +0000

    ARM+RISC-V: BSS handling improvements
    
     * Correct comments in arm{32,64}/head.S
     * Provide Linker assertions to check the safety of the zeroing loops
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 3e25767ea50a95b0bd08c5922e33e601228f7485
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Wed Feb 1 10:15:13 2023 +0800

    xen/arm: Extend the memory overlap check to include EfiACPIReclaimMemory
    
    Similarly as the static regions and boot modules, memory regions with
    EfiACPIReclaimMemory type (defined in bootinfo.acpi if CONFIG_ACPI is
    enabled) should also not be overlapping with memory regions in
    bootinfo.reserved_mem and bootinfo.modules.
    
    Therefore, this commit reuses the `meminfo_overlap_check()` to further
    extends the check in function `check_reserved_regions_overlap()` so that
    memory regions in bootinfo.acpi are included. If any error occurs in the
    extended `check_reserved_regions_overlap()`, the `meminfo_add_bank()`
    defined in `efi-boot.h` will return early.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 4f6a29158273642928db3f73604ac76d6da1d6af
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Wed Feb 1 10:15:12 2023 +0800

    xen/arm: Extend the memory overlap check to include bootmodules
    
    Similarly as the static regions defined in bootinfo.reserved_mem,
    the bootmodule regions defined in bootinfo.modules should also not
    be overlapping with memory regions in either bootinfo.reserved_mem
    or bootinfo.modules.
    
    Therefore, this commit introduces a helper `bootmodules_overlap_check()`
    and uses this helper to extend the check in function
    `check_reserved_regions_overlap()` so that memory regions in
    bootinfo.modules are included. Use `check_reserved_regions_overlap()`
    in `add_boot_module()` to return early if any error occurs.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 6f7d56ccd39940a51282730e121e1c5c64fbf8c0
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Wed Feb 1 10:15:11 2023 +0800

    xen/arm: Add memory overlap check for bootinfo.reserved_mem
    
    As we are having more and more types of static region, and all of
    these static regions are defined in bootinfo.reserved_mem, it is
    necessary to add the overlap check of reserved memory regions in Xen,
    because such check will help user to identify the misconfiguration in
    the device tree at the early stage of boot time.
    
    Currently we have 3 types of static region, namely
    (1) static memory
    (2) static heap
    (3) static shared memory
    
    (1) and (2) are parsed by the function `device_tree_get_meminfo()` and
    (3) is parsed using its own logic. All of parsed information of these
    types will be stored in `struct meminfo`.
    
    Therefore, to unify the overlap checking logic for all of these types,
    this commit firstly introduces a helper `meminfo_overlap_check()` and
    a function `check_reserved_regions_overlap()` to check if an input
    physical address range is overlapping with the existing memory regions
    defined in bootinfo. After that, use `check_reserved_regions_overlap()`
    in `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
    and replace the original overlap check of (3) with
    `check_reserved_regions_overlap()`.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 9c962e07fbf3d7e2f8f92d8834a60fe7d5600637
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Tue Mar 28 15:13:34 2023 +0800

    xen/arm: Clean-up in p2m_init() and p2m_final_teardown()
    
    With the change in previous patch, the initial 16 pages in the P2M
    pool is not necessary anymore. Drop them for code simplification.
    
    Also the call to p2m_teardown() from arch_domain_destroy() is not
    necessary anymore since the movement of the P2M allocation out of
    arch_domain_create(). Drop the code and the above in-code comment
    mentioning it. Take the opportunity to fix a typo in the original
    in-code comment.
    
    With above clean-up, the second parameter of p2m_teardown() is
    also not needed anymore. Drop this parameter and the logic related
    to this parameter.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit 4dbcb0653621f2362e04e43be66197a03de24432
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Tue Mar 28 15:13:33 2023 +0800

    xen/arm: Defer GICv2 CPU interface mapping until the first access
    
    Currently, the mapping of the GICv2 CPU interface is created in
    arch_domain_create(). This causes some troubles in populating and
    freeing of the domain P2M pages pool. For example, a default 16
    P2M pages are required in p2m_init() to cope with the P2M mapping
    of 8KB GICv2 CPU interface area, and these 16 P2M pages would cause
    the complexity of P2M destroy in the failure path of
    arch_domain_create().
    
    As per discussion in [1], similarly as the MMIO access for ACPI, this
    patch defers the GICv2 CPU interface mapping until the first MMIO
    access. This is achieved by moving the GICv2 CPU interface mapping
    code from vgic_v2_domain_init()/vgic_v2_map_resources() to the
    stage-2 data abort trap handling code. The original CPU interface
    size and virtual CPU interface base address is now saved in
    `struct vgic_dist` instead of the local variable of
    vgic_v2_domain_init()/vgic_v2_map_resources().
    
    Take the opportunity to unify the way of data access using the
    existing pointer to struct vgic_dist in vgic_v2_map_resources() for
    new GICv2.
    
    Since gicv2_map_hwdom_extra_mappings() happens after domain_create(),
    so there is no need to map the extra mappings on-demand, and therefore
    keep the hwdom extra mappings as untouched.
    
    [1] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 5ee30222c626fd3224f0b6d59e9856ba77bb89d4
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Tue Mar 28 15:13:32 2023 +0800

    xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
    
    In the follow-up patch from this series, the GICv2 CPU interface
    mapping will be deferred until the first access in the stage-2
    data abort trap handling code. Since the data abort trap handling
    code is common for the current and the new vGIC implementation,
    it is necessary to unify the variable names in struct vgic_dist
    for these two implementations.
    
    Therefore, this commit renames the vgic_cpu_base and vgic_dist_base
    for new vGIC to cbase and dbase. So we can use the same code in
    the data abort trap handling code for both vGIC implementations.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 603956258ceb30bbb621e1acdff1efcfd136212a
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Tue Mar 28 15:13:31 2023 +0800

    xen/arm: Reduce redundant clear root pages when teardown p2m
    
    Currently, p2m for a domain will be teardown from two paths:
    (1) The normal path when a domain is destroyed.
    (2) The arch_domain_destroy() in the failure path of domain creation.
    
    When tearing down p2m from (1), the part to clear and clean the root
    is only needed to do once rather than for every call of p2m_teardown().
    If the p2m teardown is from (2), the clear and clean of the root
    is unnecessary because the domain is not scheduled.
    
    Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
    do the clear and clean of the root, and move this logic outside of
    p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
    check can be dropped.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 18c128ba66e6308744850aca96dbffd18f91c29b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jan 26 14:57:45 2023 +0000

    x86/hvm: Disallow disabling paging in 64bit mode
    
    The Long Mode consistency checks exist to "ensure that the processor does not
    enter an undefined mode or state that results in unpredictable behavior".  APM
    Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
    preventing the OS from trying to exit Long mode while in 64bit mode.  This
    could leave the CPU in Protected Mode with an %rip above the 4G boundary.
    
    Experimentally, AMD CPUs really do permit this state transition.  An OS which
    tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
    to be going on behind the scenes ought to result in sane continued execution.
    
    Furthermore, right from the very outset, the APM Vol2 14.7 "Leaving Long Mode"
    section instructs peoples to switch to a compatibility mode segment first
    before clearing CR0.PG, which does clear out the upper bits in %rip.  This is
    further backed up by Vol2 Figure 1-6 "Operating Modes of the AMD64
    Architecture".
    
    Either way, this appears to have been a genuine oversight in the AMD64 spec.
    
    Intel, on the other hand, rejects this state transition with #GP.
    
    Between revision 71 (Nov 2019) and 72 (May 2020) of SDM Vol3, a footnote to
    4.1.2 "Paging-Mode Enable" was altered from
    
      If CR4.PCIDE= 1, an attempt to clear CR0.PG causes a general-protection
      exception (#GP); software should clear CR4.PCIDE before attempting to
      disable paging.
    
    to
    
      If the logical processor is in 64-bit mode or if CR4.PCIDE= 1, an attempt to
      clear CR0.PG causes a general-protection exception (#GP). Software should
      transition to compatibility mode and clear CR4.PCIDE before attempting to
      disable paging.
    
    which acknowledges this corner case, but there doesn't appear to be any other
    discussion even in the relevant Long Mode sections.
    
    So it appears that Intel spotted and addressed the corner case in IA-32e mode,
    but were 15 years late to document it.
    
    Xen was written to the AMD spec, and misses the check.  Follow the Intel
    behaviour, because it is more sensible and avoids hitting a VMEntry failure.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8363b1f62e561cfb73073b4b094516fcbbd7020e
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 13 14:23:40 2023 +0200

    automation: switch ADL hw tests to debug build
    
    This should give a lot more useful information in case of a failure, and
    also enable some asserts for extra checks.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

