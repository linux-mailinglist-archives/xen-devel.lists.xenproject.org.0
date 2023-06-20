Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9297370A5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551956.861750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdQJ-0001Yv-VM; Tue, 20 Jun 2023 15:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551956.861750; Tue, 20 Jun 2023 15:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdQJ-0001XD-Rp; Tue, 20 Jun 2023 15:37:39 +0000
Received: by outflank-mailman (input) for mailman id 551956;
 Tue, 20 Jun 2023 15:37:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBdQI-0001X3-OS; Tue, 20 Jun 2023 15:37:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBdQI-0001O6-Bw; Tue, 20 Jun 2023 15:37:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBdQH-00024B-S2; Tue, 20 Jun 2023 15:37:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBdQH-0004Wo-RU; Tue, 20 Jun 2023 15:37:37 +0000
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
	bh=8RaEKD+kUJxwYxoHJZYA28TKdbHidl7Dj7uqms1xYlQ=; b=ab4P8kSDFmEaI+dQ38inxUBX+n
	FPg+nFOsItF8W3J1gf3S/IRVw6voxqkNFDy4hwEiGm+JghC0onqcs0Jk+o/1Vb0CjgoLxx8MkUA8+
	nr+tnFM7PZHK5JkWmly9nmasm2sz9TNENlPrQKdLgLR3LIi4BOteOL7mV2VhcL35+CXk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181513-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 181513: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:build-armhf:<job status>:broken:regression
    xen-unstable:build-armhf:host-install(4):broken:regression
    xen-unstable:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    xen-unstable:build-armhf-libvirt:<job status>:broken:regression
    xen-unstable:build-armhf-libvirt:host-install(4):broken:regression
    xen-unstable:test-armhf-armhf-xl-arndale:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-rtds:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit1:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-vhd:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-multivcpu:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit2:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:heisenbug
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
X-Osstest-Versions-That:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jun 2023 15:37:37 +0000

flight 181513 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181513/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181498
 test-armhf-armhf-xl-vhd         <job status>                 broken  in 181498
 test-armhf-armhf-xl-arndale     <job status>                 broken  in 181498
 test-armhf-armhf-xl-credit2     <job status>                 broken  in 181498
 test-armhf-armhf-xl-rtds        <job status>                 broken  in 181498
 test-armhf-armhf-xl             <job status>                 broken  in 181498
 test-armhf-armhf-xl-credit1     <job status>                 broken  in 181498
 test-armhf-armhf-xl-multivcpu    <job status>                 broken in 181498
 build-armhf-libvirt             <job status>                 broken  in 181498
 build-armhf-libvirt        4 host-install(4) broken in 181498 REGR. vs. 181481

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-arndale  5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl-rtds     5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl-credit1  5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl-vhd      5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl-multivcpu 5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl          5 host-install(5) broken in 181498 pass in 181481
 test-armhf-armhf-xl-credit2  5 host-install(5) broken in 181498 pass in 181481
 test-amd64-i386-xl-qemuu-ovmf-amd64 7 xen-install fail in 181498 pass in 181513
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail in 181498 pass in 181513
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail in 181498 pass in 181513
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-install fail pass in 181498

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 181481 blocked in 181513
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 181481 blocked in 181513
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 181481 blocked in 181513
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 181481 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 181481 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 181481 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181486
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail like 181498
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181498
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181498
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181498
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181498
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181498
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181498
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181498
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181498
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587
baseline version:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587

Last test of basis   181513  2023-06-20 01:52:05 Z    0 days
Testing same since                          (not found)         0 attempts

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      blocked 
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job build-armhf-libvirt broken

Published tested tree is already up to date.


