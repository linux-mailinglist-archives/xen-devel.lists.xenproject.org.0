Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68B690FED
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 19:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492892.762657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQBJj-0006KF-Sm; Thu, 09 Feb 2023 18:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492892.762657; Thu, 09 Feb 2023 18:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQBJj-0006IY-Pa; Thu, 09 Feb 2023 18:06:43 +0000
Received: by outflank-mailman (input) for mailman id 492892;
 Thu, 09 Feb 2023 18:06:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQBJi-0006IO-7U; Thu, 09 Feb 2023 18:06:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQBJi-0004TC-3i; Thu, 09 Feb 2023 18:06:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQBJh-0001RS-QR; Thu, 09 Feb 2023 18:06:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQBJh-0000pR-Pw; Thu, 09 Feb 2023 18:06:41 +0000
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
	bh=WwkSFCETQnBGt7V0q1jAa9hm7mVDQu0d1ukAXglJx/w=; b=rsB9YDVH0n0o2W5Vl6Mhrz7/NQ
	MLpk9awgLuZxbt8pD1yqGz41jlHTU0uJYwJK6SfHRcQfYSFoLzZeXha6DUmwbxHJvPCR/tgYZ/MzM
	59xJ+/JLdlbHaHzciP8+edhtcV+WF23JvnjaCx6RH4AKP3VF5vIZmPMhqBPFB3c/kb7Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176697-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 176697: regressions - trouble: broken/fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-credit1:host-ping-check-native:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-install/src_host:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-localmigrate/x10:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
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
    xen=6d317b10f8e4cbc8092c00ce462d79f13e3ca4f6
X-Osstest-Versions-That:
    xen=c0e202194bfcb413d7cf662b333550ed444c469b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Feb 2023 18:06:41 +0000

flight 176697 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176697/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 176591
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 176591
 test-amd64-amd64-xl-credit1   6 host-ping-check-native   fail REGR. vs. 176591
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 176591
 test-amd64-i386-xl-qemuu-debianhvm-amd64 18 guest-localmigrate/x10 fail REGR. vs. 176591

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176591
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176591
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176591
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 176591
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 176591
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176591
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176591
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176591
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176591
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
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
 xen                  6d317b10f8e4cbc8092c00ce462d79f13e3ca4f6
baseline version:
 xen                  c0e202194bfcb413d7cf662b333550ed444c469b

Last test of basis   176591  2023-02-08 02:50:13 Z    1 days
Testing same since   176697  2023-02-09 02:53:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
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
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
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
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
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

broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)

Not pushing.

------------------------------------------------------------
commit 6d317b10f8e4cbc8092c00ce462d79f13e3ca4f6
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Feb 2 09:49:05 2023 +0100

    xen/arm: Add support for booting gzip compressed uImages
    
    At the moment, Xen does not support booting gzip compressed uImages.
    This is because we are trying to decompress the kernel before probing
    the u-boot header. This leads to a failure as the header always appears
    at the top of the image (and therefore obscuring the gzip header).
    
    Move the call to kernel_uimage_probe before kernel_decompress and make
    the function self-containing by taking the following actions:
     - take a pointer to struct bootmodule as a parameter,
     - check the comp field of a u-boot header to determine compression type,
     - in case of compressed image, call kernel_decompress passing uImage
       header size as an offset to gzip header,
     - set up zimage.{kernel_addr,len} accordingly,
     - return -ENOENT in case of a u-boot header not found to distinguish it
       amongst other return values and make it the only case for falling
       through to try to probe other image types.
    
    Modify kernel_decompress to take an additional parameter being an offset
    to a gzip header from start address. This is needed so that a function
    can first operate on a region containing actually compressed kernel (in case
    of compressed uImage, size of u-boot header is an offset to a gzip header)
    and then at the end pass the entire region (as it was before taking an offset
    into account) to fw_unreserved_regions for freeing.
    
    This approach avoids splitting the uImage probing into 2 stages (executed
    before and after decompression) which otherwise would be necessary to
    properly parse header, update boot module start and size before
    decompression and update zimage.{kernel_addr,len} afterwards.
    
    Remove the limitation from the booting.txt documentation.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewwed-by: Julien Grall <jgrall@amazon.com>

commit 3da5c20cd9223ae122611270bdf25cb29fd9c42a
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Feb 2 09:49:04 2023 +0100

    xen/arm: Move kernel_uimage_probe definition after kernel_decompress
    
    In a follow-up patch, we will be calling kernel_decompress function from
    within kernel_uimage_probe to support booting compressed images with
    u-boot header. Therefore, move the kernel_uimage_probe definition after
    kernel_decompress so that the latter is visible to the former.
    
    No functional change intended.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit b9adcb5ab910b61e5332728bd248906e68a45900
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Fri Feb 3 21:09:08 2023 +0200

    xen/device_tree: remove incorrect and unused dt_irq() and dt_irq_flags() macros
    
    Macro dt_irq() is broken because the macro parameter has the same name with
    the struct dt_irq member "irq".
    Macro dt_irq_flags() is broken as well because struct dt_irq has no member
    named "flags".
    
    Since no one seems to have ever tried to use them and eventually stumble upon
    the issues above, remove them instead of fixing them.
    
    Fixes: 886f34045bf0 ("xen/arm: Add helpers to retrieve an interrupt description from the device tree")
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 97266d2ac71e0d966debd9e0b847502b1815e41b
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Fri Feb 3 21:09:07 2023 +0200

    xen/device_tree: add parentheses around macro parameters
    
    Add parentheses around macro parameters when the precedence and
    associativity of the performed operators can lead to unintended order of evaluation.
    
    This is fixing some ECLAIR finding for Misra Rule 20.7.
    
    Link: https://lore.kernel.org/xen-devel/20230203190908.211541-2-burzalodowa@gmail.com/
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    [jgrall: Reworded the commit message]
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 78c04e24adff84e3325fbdb04e8ffae559876aba
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Feb 8 09:21:24 2023 +0100

    libs/light: Makefile cleanup
    
    Rework "libacpi.h" include in "libxl_x86_acpi.c" as to be more
    selective about the include path and only add "tools/libacpi/". Also
    "libxl_dom.c" don't use "libacpi.h" anymore. Use "-iquote" for libacpi
    headers.
    
    Get rid of the weird "$(eval stem =" in the middle of a recipe and use
    a make automatic variable "$(*F)" instead.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit a2a5d091d0ca78c6a9346c8d4bb8cddc37a07375
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Feb 8 09:21:11 2023 +0100

    libs/light: Rework targets prerequisites
    
    No need for $(AUTOSRCS), GNU make can generate them as needed when
    trying to build them as needed when trying to build the object. Also,
    those two AUTOSRCS don't need to be a prerequisite of "all". As for
    the "clean" target, those two files are already removed via "_*.c".
    
    We don't need $(AUTOINCS) either:
    - As for both _libxl_save_msgs*.h headers, we are adding more
      selective dependencies so the headers will still be generated as
      needed.
    - "clean" rule already delete the _*.h files, so AUTOINCS aren't needed
      there.
    
    "libxl_internal_json.h" doesn't seems to have ever existed, so the
    dependency is removed.
    
    Rework objects prerequisites, to have them dependents on either
    "libxl.h" or "libxl_internal.h". "libxl.h" is not normally included
    directly in the source code as "libxl_internal.h" is used instead, but
    we have "libxl.h" as prerequisite of "libxl_internal.h", so generated
    headers will still be generated as needed.
    
    Make doesn't need "libxl.h" to generate "testidl.c", "libxl.h" is only
    needed later when building "testidl.o". This avoid the need to
    regenerate "testidl.c" when only "libxl.h" changed. Also use automatic
    variables $< and $@.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 826b270337fe9380519e8dea03442d5430a916b9
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed Feb 8 09:20:39 2023 +0100

    xen/riscv: introduce empty <asm/cache.h>
    
    To include <xen/lib.h> <asm/cache.h> is required
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit a49cf4fb61946d79d997eb83b7695f2c5f29892c
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed Feb 8 09:20:37 2023 +0100

    xen/riscv: introduce empty <asm/string.h>
    
    To include <xen/lib.h> <asm/string.h> is required
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit aa492912a64c051e4d3a9246c0d8d7b0f5269152
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed Feb 8 09:20:35 2023 +0100

    xen/riscv: add <asm/riscv_encoding.h header
    
    The following changes were done in Xen code base in comparison with OpenSBI:
      * Remove "#include <sbi/sbi_const.h>" as most of the stuff inside
        it is present in Xen code base.
      * Add macros _UL and _ULL as they were in <sbi/sbi_const.h> before
      * Add SATP32_MODE_SHIFT/SATP64_MODE_SHIFT/SATP_MODE_SHIFT as they will
        be used in riscv/mm.c
      * Add CAUSE_IRQ_FLAG which is going to be used insised exception
        handler
      * Change ulong to unsigned long in macros REG_PTR(...)
      * Change s32 to int32_t
    
    Originally authored by Anup Patel <anup.patel@wdc.com>
    
    Origin: https://github.com/riscv-software-src/opensbi.git c45992cc2b12
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit 48aabc5de261177c011a55732afbe09373acf465
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed Feb 8 09:20:33 2023 +0100

    xen/riscv: change ISA to r64G
    
    Work with some registers requires csr command which is part of
    Zicsr.
    
    Also ISA was changed from r64ima to r64g where G is represented the
    “IMAFDZicsr Zifencei” base and extensions so basically it is the same
    as it was before plus additional extensions we will need in the
    nearest future.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
(qemu changes not included)

