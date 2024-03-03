Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1D86F6E6
	for <lists+xen-devel@lfdr.de>; Sun,  3 Mar 2024 20:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688110.1071957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgrpx-0003Yx-6R; Sun, 03 Mar 2024 19:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688110.1071957; Sun, 03 Mar 2024 19:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgrpx-0003Vw-39; Sun, 03 Mar 2024 19:49:29 +0000
Received: by outflank-mailman (input) for mailman id 688110;
 Sun, 03 Mar 2024 19:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgrpv-0003Vm-D4; Sun, 03 Mar 2024 19:49:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgrpv-0005DW-9j; Sun, 03 Mar 2024 19:49:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgrpu-000699-Vd; Sun, 03 Mar 2024 19:49:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgrpu-0006gT-V9; Sun, 03 Mar 2024 19:49:26 +0000
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
	bh=ROkRM07gJfBS8gD4nCazNDWBlSt4kygb58sVaC5vqV8=; b=BGHPIGTMdI1SAkVEZgNnIBxG93
	QOt0KP2JUcUTek7usgTr2CcIH0vdMFgzt0Weq+qlAzfkWsNGFvEO1EFWUc4K6BvFO8RKanNaRpcQE
	pZHbskbtFwOLqGOAftwy1WBlpilPgvSsuhIXbnCBMO7aJJWK0v23wvkCZt3cqtjptN/w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184875-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 184875: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-localmigrate/x10:fail:regression
    xen-unstable:build-arm64-pvops:kernel-build:fail:regression
    xen-unstable:build-arm64-xsm:xen-build:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-qcow2:guest-start:fail:heisenbug
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=856664f774bd5b66301c5f9022126b61b8cb492d
X-Osstest-Versions-That:
    xen=efad36f1ba18946acecc030166b1a6bebeb88ea2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Mar 2024 19:49:26 +0000

flight 184875 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184875/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail REGR. vs. 184833
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184833
 build-arm64-xsm               6 xen-build      fail in 184852 REGR. vs. 184833

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail in 184852 pass in 184875
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail in 184852 pass in 184875
 test-armhf-armhf-libvirt-qcow2 13 guest-start              fail pass in 184852

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
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail blocked in 184833
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 184852 like 184833
 test-arm64-arm64-xl         15 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 184852 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 184852 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 184852 never pass
 test-arm64-arm64-xl-credit1 15 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-xl-credit1 16 saverestore-support-check fail in 184852 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 184852 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 184852 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 184852 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 184852 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184833
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184833
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184833
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184833
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184833
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184833
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184833
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184833
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184833
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184833
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  856664f774bd5b66301c5f9022126b61b8cb492d
baseline version:
 xen                  efad36f1ba18946acecc030166b1a6bebeb88ea2

Last test of basis   184833  2024-03-01 14:11:30 Z    2 days
Testing same since   184852  2024-03-02 16:36:22 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
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
commit 856664f774bd5b66301c5f9022126b61b8cb492d
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Tue Feb 13 14:33:34 2024 -0800

    docs/misra/rules.rst: add rule 14.4
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit c40bc0576dcc5acd4d7e22ef628eb4642f568533
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Mar 1 13:42:27 2024 +0100

    x86/mm: re-implement get_page_light() using an atomic increment
    
    The current usage of a cmpxchg loop to increase the value of page count is not
    optimal on amd64, as there's already an instruction to do an atomic add to a
    64bit integer.
    
    Switch the code in get_page_light() to use an atomic increment, as that avoids
    a loop construct.  This slightly changes the order of the checks, as current
    code will crash before modifying the page count_info if the conditions are not
    correct, while with the proposed change the crash will happen immediately
    after having carried the counter increase.  Since we are crashing anyway, I
    don't believe the re-ordering to have any meaningful impact.
    
    Note that the page must already have a non-zero reference count which prevents
    the flags from changing, and the previous usage of the cmpxchg loop didn't
    guarantee that the rest of the fields in count_info didn't change while
    updating the reference count.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit de17162cafd27f2865a3102a2ec0f386a02ed03d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 29 11:26:40 2024 +0000

    x86/cpu-policy: Allow for levelling of VERW side effects
    
    MD_CLEAR and FB_CLEAR need OR-ing across a migrate pool.  Allow this, by
    having them unconditinally set in max, with the host values reflected in
    default.  Annotate the bits as having special properies.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 0263dc9069ddb66335c72a159e09050b1600e56a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 29 20:46:13 2024 +0000

    tests/resource: Fix HVM guest in !SHADOW builds
    
    Right now, test-resource always creates HVM Shadow guests.  But if Xen has
    SHADOW compiled out, running the test yields:
    
      $./test-resource
      XENMEM_acquire_resource tests
      Test x86 PV
        Created d1
        Test grant table
      Test x86 PVH
        Skip: 95 - Operation not supported
    
    and doesn't really test HVM guests, but doesn't fail either.
    
    There's nothing paging-mode-specific about this test, so default to HAP if
    possible and provide a more specific message if neither HAP or Shadow are
    available.
    
    As we've got physinfo to hand, also provide more specific message about the
    absence of PV or HVM support.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit e2d8a652251660c3252d92b442e1a9c5d6e6a1e9
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Feb 28 20:22:24 2024 +0000

    x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max policies
    
    The block in recalculate_cpuid_policy() predates the proper split between
    default and max policies, and was a "slightly max for a toolstack which knows
    about it" capability.  It didn't get transformed properly in Xen 4.14.
    
    Because Xen will accept a VM with HTT/CMP_LEGACY seen, they should be visible
    in the max polices.  Keep the default policy matching host settings.
    
    This manifested as an incorrectly-rejected migration across XenServer's Xen
    4.13 -> 4.17 upgrade, as Xapi is slowly growing the logic to check a VM
    against the target max policy.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 5420aa165dfa5fe95dd84bb71cb96c15459935b1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Feb 28 20:21:58 2024 +0000

    x86/cpu-policy: Hide x2APIC from PV guests
    
    PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
    access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
    CPUID bit saying that they can.
    
    Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
    generally see x2APIC except on Zen1-and-older AMD systems.
    
    Linux works around this by explicitly hiding the bit itself, and filtering
    EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
    guests, and entirely ignores the APIC when built as a PV guest.
    
    Change the annotation from !A to !S.  This has a consequence of stripping it
    out of both PV featuremasks.  However, as existing guests may have seen the
    bit, set it back into the PV Max policy; a VM which saw the bit and is alive
    enough to migrate will have ignored it one way or another.
    
    Hiding x2APIC does change the contents of leaf 0xb, but as the information is
    nonsense to begin with, this is likely an improvement on the status quo.
    
    Xen's blind assumption that APIC_ID = vCPU_ID * 2 isn't interlinked with the
    host's topology structure, where a PV guest may see real host values, and the
    APIC_IDs are useless without an MADT to start with.  Dom0 is the only PV VM to
    get an MADT but it's the host one, meaning the two sets of APIC_IDs are from
    different address spaces.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

