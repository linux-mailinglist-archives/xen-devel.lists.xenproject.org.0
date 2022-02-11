Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB34B312C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 00:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270665.464989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIf8a-0007YJ-7c; Fri, 11 Feb 2022 23:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270665.464989; Fri, 11 Feb 2022 23:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIf8a-0007WT-3l; Fri, 11 Feb 2022 23:15:36 +0000
Received: by outflank-mailman (input) for mailman id 270665;
 Fri, 11 Feb 2022 23:15:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIf8Y-0007WJ-0l; Fri, 11 Feb 2022 23:15:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIf8X-0002lU-Th; Fri, 11 Feb 2022 23:15:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nIf8X-0007vk-Cd; Fri, 11 Feb 2022 23:15:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nIf8X-000652-B1; Fri, 11 Feb 2022 23:15:33 +0000
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
	bh=XyIEuoNYzh9Gc+rMZWeTGgv4VhHMuOkJkpATNIX7NFM=; b=1GmE6DbVXtu97OjZPBzalY7TJ7
	StrO2Zy/X5tNAVxcBk4WDeQ9ePbVgzvDoIee0CIL97uyUbct04knMPFw9LwMpaA8UbC9yRuSp/YsY
	wdNIbJidBwktEPP/MG9tXWAUCHLilh0ksWKqq8orU9O17kemjLKYUaqE8PIYs8kNhPQc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168085-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 168085: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-5.4:build-arm64:<job status>:broken:regression
    linux-5.4:build-arm64-pvops:<job status>:broken:regression
    linux-5.4:build-arm64-xsm:<job status>:broken:regression
    linux-5.4:build-arm64-pvops:host-install(4):broken:regression
    linux-5.4:build-arm64-xsm:host-install(4):broken:regression
    linux-5.4:build-arm64:host-install(4):broken:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=52871671099d1bb3fca5ed076029e4b937bfc053
X-Osstest-Versions-That:
    linux=76fd334f07cc11e047c2237a19b2cf8b1f653ba2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Feb 2022 23:15:33 +0000

flight 168085 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168085/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 168060
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 168060
 build-arm64                   4 host-install(4)        broken REGR. vs. 168060

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 168084
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat  fail pass in 168084

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168060
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 168060
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168060
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168060
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168060
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168060
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168060
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 168060
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 168060
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168060
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168060
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 168060
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                52871671099d1bb3fca5ed076029e4b937bfc053
baseline version:
 linux                76fd334f07cc11e047c2237a19b2cf8b1f653ba2

Last test of basis   168060  2022-02-08 17:43:16 Z    3 days
Testing same since   168084  2022-02-11 08:43:38 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Slade Watkins <slade@sladewatkins.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Ulf Hansson <ulf.hansson@linaro.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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

broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64 host-install(4)
broken-job build-arm64-xsm broken
broken-job build-arm64-pvops broken
broken-job build-arm64 broken

Not pushing.

------------------------------------------------------------
commit 52871671099d1bb3fca5ed076029e4b937bfc053
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Fri Feb 11 09:07:52 2022 +0100

    Linux 5.4.179
    
    Link: https://lore.kernel.org/r/20220209191248.688351316@linuxfoundation.org
    Tested-by: Shuah Khan <skhan@linuxfoundation.org>
    Tested-by: Florian Fainelli <f.fainelli@gmail.com>
    Tested-by: Jon Hunter <jonathanh@nvidia.com>
    Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
    Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
    Tested-by: Slade Watkins <slade@sladewatkins.com>
    Tested-by: Guenter Roeck <linux@roeck-us.net>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit d692e3406e052dbf9f6d9da0cba36cb763272529
Author: Jon Maloy <jmaloy@redhat.com>
Date:   Sat Feb 5 14:11:18 2022 -0500

    tipc: improve size validations for received domain records
    
    commit 9aa422ad326634b76309e8ff342c246800621216 upstream.
    
    The function tipc_mon_rcv() allows a node to receive and process
    domain_record structs from peer nodes to track their views of the
    network topology.
    
    This patch verifies that the number of members in a received domain
    record does not exceed the limit defined by MAX_MON_DOMAIN, something
    that may otherwise lead to a stack overflow.
    
    tipc_mon_rcv() is called from the function tipc_link_proto_rcv(), where
    we are reading a 32 bit message data length field into a uint16.  To
    avert any risk of bit overflow, we add an extra sanity check for this in
    that function.  We cannot see that happen with the current code, but
    future designers being unaware of this risk, may introduce it by
    allowing delivery of very large (> 64k) sk buffers from the bearer
    layer.  This potential problem was identified by Eric Dumazet.
    
    This fixes CVE-2022-0435
    
    Reported-by: Samuel Page <samuel.page@appgate.com>
    Reported-by: Eric Dumazet <edumazet@google.com>
    Fixes: 35c55c9877f8 ("tipc: add neighbor monitoring framework")
    Signed-off-by: Jon Maloy <jmaloy@redhat.com>
    Reviewed-by: Xin Long <lucien.xin@gmail.com>
    Reviewed-by: Samuel Page <samuel.page@appgate.com>
    Reviewed-by: Eric Dumazet <edumazet@google.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 3a0a7ec5574b510b067cfc734b8bdb6564b31d4e
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu Jan 27 08:16:38 2022 +0100

    moxart: fix potential use-after-free on remove path
    
    commit bd2db32e7c3e35bd4d9b8bbff689434a50893546 upstream.
    
    It was reported that the mmc host structure could be accessed after it
    was freed in moxart_remove(), so fix this by saving the base register of
    the device and using it instead of the pointer dereference.
    
    Cc: Ulf Hansson <ulf.hansson@linaro.org>
    Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
    Cc: Xin Xiong <xiongx18@fudan.edu.cn>
    Cc: Xin Tan <tanxin.ctf@gmail.com>
    Cc: Tony Lindgren <tony@atomide.com>
    Cc: Yang Li <yang.lee@linux.alibaba.com>
    Cc: linux-mmc@vger.kernel.org
    Cc: stable <stable@vger.kernel.org>
    Reported-by: whitehat002 <hackyzh002@gmail.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Link: https://lore.kernel.org/r/20220127071638.4057899-1-gregkh@linuxfoundation.org
    Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

