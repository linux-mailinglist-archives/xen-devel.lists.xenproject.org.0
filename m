Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A1631148
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 23:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446168.701690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owWZy-0003wb-U8; Sat, 19 Nov 2022 22:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446168.701690; Sat, 19 Nov 2022 22:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owWZy-0003tU-Qc; Sat, 19 Nov 2022 22:44:54 +0000
Received: by outflank-mailman (input) for mailman id 446168;
 Sat, 19 Nov 2022 22:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWZx-0003tJ-7m; Sat, 19 Nov 2022 22:44:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWZx-0004kU-1L; Sat, 19 Nov 2022 22:44:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1owWZw-00031i-KM; Sat, 19 Nov 2022 22:44:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1owWZw-0005hb-Jq; Sat, 19 Nov 2022 22:44:52 +0000
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
	bh=0mtYQHKU6BBsqgs1nqjylZmrpyLarrfYD5LzaO2b3QA=; b=e2MWcXY+zLJRl0hN9UEop8JreH
	RrLfUzFXbZJ/7/R7LUJz4CmFSFoJo5UXBBd3n2Wgvw5Hk+NNVrCnwLS7E/bDNjE6wbML6EP2ixO2g
	oLELVCc9WLdTST5DdCNO+FeYoE5KEiBjPZZadJJTxJKnEhyBvWKw+SxYFZ83UN7ClsVU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174835-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 174835: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-saverestore:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-saverestore:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-saverestore:fail:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-arm64-arm64-examine:reboot:fail:heisenbug
    xen-unstable:test-arm64-arm64-xl:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=db8fa01c61db0317a9ee947925226234c65d48e8
X-Osstest-Versions-That:
    xen=f5d56f4b253072264efc0fece698a91779e362f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Nov 2022 22:44:52 +0000

flight 174835 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174835/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 15 guest-saverestore fail REGR. vs. 174797
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 174797
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 15 guest-saverestore fail REGR. vs. 174797
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 174797
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 174797

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-xsm  5 host-install(5)          broken pass in 174826
 test-arm64-arm64-examine      8 reboot           fail in 174826 pass in 174835
 test-arm64-arm64-xl 18 guest-start/debian.repeat fail in 174826 pass in 174835
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install    fail pass in 174826

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 174826 like 174797
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 174826 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174797
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174797
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174797
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174797
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174797
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174797
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174797
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174797
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 174797
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174797
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174797
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  db8fa01c61db0317a9ee947925226234c65d48e8
baseline version:
 xen                  f5d56f4b253072264efc0fece698a91779e362f5

Last test of basis   174797  2022-11-17 03:03:07 Z    2 days
Testing same since   174809  2022-11-18 00:06:55 Z    1 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 broken  
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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

broken-job test-amd64-amd64-libvirt-xsm broken
broken-step test-amd64-amd64-libvirt-xsm host-install(5)

Not pushing.

------------------------------------------------------------
commit db8fa01c61db0317a9ee947925226234c65d48e8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Oct 20 12:14:30 2022 +0100

    xen/arm: Correct the p2m pool size calculations
    
    Allocating or freeing p2m pages doesn't alter the size of the mempool; only
    the split between free and used pages.
    
    Right now, the hypercalls operate on the free subset of the pool, meaning that
    XEN_DOMCTL_get_paging_mempool_size varies with time as the guest shuffles its
    physmap, and XEN_DOMCTL_set_paging_mempool_size ignores the used subset of the
    pool and lets the guest grow unbounded.
    
    This fixes test-pagign-mempool on ARM so that the behaviour matches x86.
    
    This is part of XSA-409 / CVE-2022-33747.
    
    Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 7c3bbd940dd8aeb1649734e5055798cc6f3fea4e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Oct 25 15:27:05 2022 +0100

    xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
    
    This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
    of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
    
    First of all, with ARM borrowing x86's implementation, the logic to set the
    pool size should have been common, not duplicated.  Introduce
    libxl__domain_set_paging_mempool_size() as a shared implementation, and use it
    from the ARM and x86 paths.  It is left as an exercise to the reader to judge
    how libxl/xl can reasonably function without the ability to query the pool
    size...
    
    Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
    replaced with a working and unit tested interface.
    
    This is part of XSA-409 / CVE-2022-33747.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit bd87315a603bf25e869e6293f7db7b1024d67999
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Oct 20 12:13:46 2022 +0100

    tools/tests: Unit test for paging mempool size
    
    Exercise some basic functionality of the new
    xc_{get,set}_paging_mempool_size() hypercalls.
    
    This passes on x86, but fails currently on ARM.  ARM will be fixed up in
    future patches.
    
    This is part of XSA-409 / CVE-2022-33747.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 22b20bd98c025e06525410e3ab3494d5e63489f7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Oct 21 14:13:00 2022 +0100

    xen: Introduce non-broken hypercalls for the paging mempool size
    
    The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
    
     * All set_allocation() flavours have an overflow-before-widen bug when
       calculating "sc->mb << (20 - PAGE_SHIFT)".
     * All flavours have a granularity of 1M.  This was tolerable when the size of
       the pool could only be set at the same granularity, but is broken now that
       ARM has a 16-page stopgap allocation in use.
     * All get_allocation() flavours round up, and in particular turn 0 into 1,
       meaning the get op returns junk before a successful set op.
     * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
       despite the pool size being a domain property.
     * Even the hypercall names are long-obsolete.
    
    Implement a better interface, which can be first used to unit test the
    behaviour, and subsequently correct a broken implementation.  The old
    interface will be retired in due course.
    
    The unit of bytes (as opposed pages) is a deliberate API/ABI improvement to
    more easily support multiple page granularities.
    
    This is part of XSA-409 / CVE-2022-33747.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit e5ac68a0110cb43a3a0bc17d545ae7a0bd746ef9
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 14 21:47:59 2022 +0000

    x86/hvm: Revert per-domain APIC acceleration support
    
    I was really hoping to avoid this, but its now too late in the 4.17 freeze and
    we still don't have working fixes.
    
    The in-Xen calculations for assistance capabilities are buggy.  For the
    avoidance of doubt, the original intention was to be able to control every
    aspect of a APIC acceleration so we could comprehensively test Xen's support,
    as it has proved to be buggy time and time again.
    
    Even after a protracted discussion on what the new API ought to mean, attempts
    to apply it to the existing logic have been unsuccessful, proving that the
    API/ABI is too complicated for most people to reason about.
    
    This reverts most of:
      2ce11ce249a3981bac50914c6a90f681ad7a4222
      6b2b9b3405092c3ad38d7342988a584b8efa674c
    
    leaving in place the non-APIC specific changes (minimal as they are).
    
    This takes us back to the behaviour of Xen 4.16 where APIC acceleration is
    configured on a per system basis.
    
    This work will be revisted in due course.
    
    Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
    Fixes: 6b2b9b340509 ("x86: report Interrupt Controller Virtualization capabilities")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

