Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA776A107E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 20:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500662.772128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVH9j-0002wH-Ry; Thu, 23 Feb 2023 19:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500662.772128; Thu, 23 Feb 2023 19:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVH9j-0002vL-P7; Thu, 23 Feb 2023 19:21:27 +0000
Received: by outflank-mailman (input) for mailman id 500662;
 Thu, 23 Feb 2023 19:21:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVH9j-0002vB-3u; Thu, 23 Feb 2023 19:21:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVH9i-0005Yi-Vv; Thu, 23 Feb 2023 19:21:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVH9i-0006J9-HZ; Thu, 23 Feb 2023 19:21:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pVH9i-0004Hl-H9; Thu, 23 Feb 2023 19:21:26 +0000
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
	bh=vSJG+bza9bTOtUA3gt4cl2wwUDpgQqhhpHMu6ZFLQkY=; b=FgMlf/Jwk8aO4LGRl9tRvMBMp0
	5tQT6ZplDCxTy+KMgv5NKO0KQ5J468Y/gTacCFRTHxs5ScayFP/mK3DNHNGlbCiIlbDrPBm0dNxiO
	V5jQaJDOD6+ZabjuoGY9OXlJybboXMmGEJBGpDXmPRNfSobfMOgyRM6LfcRAxbpEKqgM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178185-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 178185: trouble: broken/fail/pass/starved
X-Osstest-Failures:
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-localmigrate/x10:fail:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-pvshim:guest-localmigrate/x10:fail:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-4.14-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.14-testing:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=c267abfaf2d8176371eda037f9b9152458e0656d
X-Osstest-Versions-That:
    xen=46040a5fe68831530b8ffdea7d264e52ae316c87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Feb 2023 19:21:26 +0000

flight 178185 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178185/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>          broken in 178136

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken in 178136 pass in 178185
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken pass in 178136
 test-amd64-amd64-xl-qemut-debianhvm-amd64 18 guest-localmigrate/x10 fail in 178136 pass in 178185
 test-amd64-amd64-xl-pvshim   20 guest-localmigrate/x10     fail pass in 178136

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174677
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174677
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174677
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174677
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174677
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174677
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174677
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174677
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174677
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl           3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate           starved in 178136 n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate           starved in 178136 n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 xen                  c267abfaf2d8176371eda037f9b9152458e0656d
baseline version:
 xen                  46040a5fe68831530b8ffdea7d264e52ae316c87

Last test of basis   174677  2022-11-08 18:07:02 Z  107 days
Testing same since   178136  2023-02-22 14:37:17 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
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
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
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

broken-job test-amd64-amd64-libvirt-pair broken
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken

Not pushing.

------------------------------------------------------------
commit c267abfaf2d8176371eda037f9b9152458e0656d
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Feb 21 16:55:38 2023 +0000

    automation: Remove clang-8 from Debian unstable container
    
    First, apt complain that it isn't the right way to add keys anymore,
    but hopefully that's just a warning.
    
    Second, we can't install clang-8:
    The following packages have unmet dependencies:
     clang-8 : Depends: libstdc++-8-dev but it is not installable
               Depends: libgcc-8-dev but it is not installable
               Depends: libobjc-8-dev but it is not installable
               Recommends: llvm-8-dev but it is not going to be installed
               Recommends: libomp-8-dev but it is not going to be installed
     libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
    E: Unable to correct problems, you have held broken packages.
    
    clang on Debian unstable is now version 14.0.6.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    (cherry picked from commit a6b1e2b80fe2053b1c9c9843fb086a668513ea36)
(qemu changes not included)

