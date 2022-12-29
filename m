Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E966588AE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 03:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469611.728997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAiqG-0001cf-NQ; Thu, 29 Dec 2022 02:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469611.728997; Thu, 29 Dec 2022 02:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAiqG-0001ZT-Jk; Thu, 29 Dec 2022 02:40:24 +0000
Received: by outflank-mailman (input) for mailman id 469611;
 Thu, 29 Dec 2022 02:40:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAiqF-0001ZJ-PP; Thu, 29 Dec 2022 02:40:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAiqF-0008Rw-L7; Thu, 29 Dec 2022 02:40:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAiqF-0004Jr-9X; Thu, 29 Dec 2022 02:40:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pAiqF-0005M3-91; Thu, 29 Dec 2022 02:40:23 +0000
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
	bh=SJYlKVow+krxB+PK/s7MOJvFvu5UppcMmUcRuP8Gx6c=; b=5TLdIQTxMTpXG7z29nb2HYC32S
	jOqQ7UOJoQXc12Dncti31iITkxy1tDs63mTSxZrnxUGr4Yq9jmAbTH/RyfuaqCh7vFgofjbrZeg+5
	hA5wJqh9BOmwTyh9nN0hMdMP5MP/GFE7sboI8Sp4QP7H/8q3zQlSUPjA5MYODyWen/rc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175515-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 175515: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-5.4:build-arm64-pvops:kernel-build:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-i386-xl-vhd:xen-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start.2:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
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
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=851c2b5fb7936d54e1147f76f88e2675f9f82b52
X-Osstest-Versions-That:
    linux=66bb2e2b24ce52819a7070d3a3255726cb946b69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Dec 2022 02:40:23 +0000

flight 175515 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175515/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>          broken in 175407
 test-amd64-amd64-xl-credit2     <job status>                 broken  in 175407
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>     broken in 175407
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>           broken in 175407
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 175197

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ws16-amd64 5 host-install(5) broken in 175407 pass in 175515
 test-amd64-amd64-xl-credit2  5 host-install(5) broken in 175407 pass in 175515
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken in 175407 pass in 175515
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 175407 pass in 175515
 test-amd64-i386-xl-vhd        7 xen-install      fail in 175510 pass in 175515
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail in 175510 pass in 175515
 test-amd64-amd64-xl-qcow2    22 guest-start.2    fail in 175513 pass in 175510
 test-armhf-armhf-xl-credit2  14 guest-start      fail in 175513 pass in 175515
 test-armhf-armhf-xl-credit1  14 guest-start      fail in 175513 pass in 175515
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail in 175513 pass in 175515
 test-amd64-i386-xl-qemuu-ws16-amd64 12 windows-install fail in 175513 pass in 175515
 test-armhf-armhf-xl-credit1  18 guest-start/debian.repeat  fail pass in 175407
 test-armhf-armhf-libvirt-raw 13 guest-start                fail pass in 175507
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install          fail pass in 175513
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 175513
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat  fail pass in 175513

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
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail blocked in 175197
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail in 175407 like 175197
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 175507 like 175197
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 175507 never pass
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 175513 like 175197
 test-arm64-arm64-xl-seattle 15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-seattle 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl         15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl-credit1 15 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-credit1 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 175513 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 175513 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 175513 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 175513 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 175513 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175197
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175197
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175197
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175197
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 175197
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 175197
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175197
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175197
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175197
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175197
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175197
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175197
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                851c2b5fb7936d54e1147f76f88e2675f9f82b52
baseline version:
 linux                66bb2e2b24ce52819a7070d3a3255726cb946b69

Last test of basis   175197  2022-12-14 10:43:17 Z   14 days
Testing same since   175407  2022-12-19 11:42:26 Z    9 days   21 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexei Starovoitov <ast@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Heiko Schocher <hs@denx.de>
  Hulk Robot <hulkrobot@huawei.com>
  Jakub Kicinski <kuba@kernel.org>
  Jialiang Wang <wangjialiang0806@163.com>
  Jon Hunter <jonathanh@nvidia.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Colitti <lorenzo@google.com>
  Maciej Żenczykowski <maze@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Ricardo Ribalda <ribalda@chromium.org>
  Samuel Mendoza-Jonas <samjonas@amazon.com>
  Sasha Levin <sashal@kernel.org>
  Shiwei Cui <cuishw@inspur.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@corigine.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Yasushi SHOJI <yashi@spacecubics.com>
  Yasushi SHOJI <yasushi.shoji@gmail.com>

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
 build-arm64-pvops                                            fail    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 fail    
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

broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken

Not pushing.

(No revision log; it would be 410 lines long.)

