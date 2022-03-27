Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B854E87D1
	for <lists+xen-devel@lfdr.de>; Sun, 27 Mar 2022 14:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295168.502212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYSSa-0004lY-8a; Sun, 27 Mar 2022 12:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295168.502212; Sun, 27 Mar 2022 12:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYSSa-0004j7-4t; Sun, 27 Mar 2022 12:57:32 +0000
Received: by outflank-mailman (input) for mailman id 295168;
 Sun, 27 Mar 2022 12:57:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYSSY-0004ix-1L; Sun, 27 Mar 2022 12:57:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYSSX-0001xr-Ob; Sun, 27 Mar 2022 12:57:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYSSX-0003QR-FZ; Sun, 27 Mar 2022 12:57:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nYSSX-0001SJ-F3; Sun, 27 Mar 2022 12:57:29 +0000
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
	bh=BIdWirETFVJPsND7NcyImcLfgDrQCHQrXztJ8TV/1q4=; b=Z2o5rBzOhnsx38r8SEXGA6y6qr
	cvouSWbVHs9RpahpAAVV6CgMjCmc4qOKCp2DZHcWEOOyhxlJ5rdCrpKnIUFD1t/93bNJXq7fvJs+m
	IfLGHM6T9l7ZyJVtDnVTRfyIRZ4doX7iOEeEpQQ/uLdCZByBYhFeK3QrSEjln+3+9WdI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168866-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168866: trouble: broken/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-vhd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-raw:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-vhd:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-raw:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-credit1:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    linux-linus:test-amd64-coresched-amd64-xl:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-rtds:host-install(5):broken:allowable
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-pair:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=50560ce6a0bdab2fc37384c52aa02c7043909d2c
X-Osstest-Versions-That:
    linux=34af78c4e616c359ed428d79fe4758a35d2c5473
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Mar 2022 12:57:29 +0000

flight 168866 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168866/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-vhd         <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-libvirt-qcow2    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-libvirt-raw    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-vhd       5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-libvirt-raw  5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-libvirt      5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)     broken REGR. vs. 168838
 test-amd64-amd64-xl-credit1   5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl           5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 168838
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken REGR. vs. 168838
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 168838
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)   broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)       broken REGR. vs. 168838
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-xsm       5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken REGR. vs. 168838
 test-amd64-amd64-libvirt-xsm  5 host-install(5)        broken REGR. vs. 168838
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 168838
 test-amd64-coresched-amd64-xl  5 host-install(5)       broken REGR. vs. 168838

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      5 host-install(5)        broken REGR. vs. 168838

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168838
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168838
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168838
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-pair         4 hosts-allocate               starved  n/a

version targeted for testing:
 linux                50560ce6a0bdab2fc37384c52aa02c7043909d2c
baseline version:
 linux                34af78c4e616c359ed428d79fe4758a35d2c5473

Last test of basis   168838  2022-03-25 06:20:14 Z    2 days
Testing same since   168866  2022-03-25 20:12:03 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Anders Roxell <anders.roxell@linaro.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Arnd Bergmann <arnd@arndb.de>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Atish Patra <atish.patra@wdc.com>
  Atish Patra <atishp@rivosinc.com>
  Atsushi Nemoto <anemo@mba.ocn.ne.jp>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bhaskar Chowdhury <unixbhaskar@gmail.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Jingwen <chenjingwen6@huawei.com>
  Chongxi Zhao <zhaochongxi2019@email.szu.edu.cn>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Conor Dooley <conor.dooley@microchip.com>
  Corentin Labbe <clabbe@baylibre.com>
  Daire McNamara <daire.mcnamara@microchip.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  David Hildenbrand <david@redhat.com>
  David Rientjes <rientjes@google.com>
  David Sterba <dsterba@suse.com>
  Eric Lin <eric.lin@sifive.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Feiyang Chen <chenfeiyang@loongson.cn>
  Feiyang Chen <chris.chenfeiyang@gmail.com>
  Ganesh Goudar <ganeshgr@linux.ibm.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Geoff Levand <geoff@infradead.org>
  Guenter Roeck <linux@roeck-us.net>
  Guo Zhengkui <guozhengkui@vivo.com>
  Halil Pasic <pasic@linux.ibm.com>
  Hangyu Hua <hbh25y@gmail.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Haren Myneni <haren@linux.ibm.com>
  Hari Bathini <hbathini@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Hugh Dickins <hughd@google.com>
  Igor Zhbanov <i.zhbanov@omprussia.ru>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jani Nikula <jani.nikula@intel.com>
  Janis Schoetterl-Glausch <scgl@linux.ibm.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jason Wang <wangborong@cdjrlc.com>
  Jiajian Ye <yejiajian2018@email.szu.edu.cn>
  jing yangyang <cgel.zte@gmail.com>
  jing yangyang <jing.yangyang@zte.com.cn>
  Jisheng Zhang <jszhang@kernel.org>
  Joachim Wiberg <troglobit@gmail.com>
  Joe Lawrence <joe.lawrence@redhat.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Jordan Niethe <jniethe5@gmail.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Jürgen Christ <jchrist@linux.ibm.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kees Cook <keescook@chromium.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Laurent Dufour <ldufour@linux.ibm.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Madhavan Srinivasan <maddy@linux.ibm.com>
  Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
  Marco Elver <elver@google.com>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxim Kiselev <bigunclemax@gmail.com>
  Maxime Bizon <mbizon@freebox.fr>
  Mayuresh Chitale <mchitale@ventanamicro.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Neuling <mikey@neuling.org>
  Michael T. Kloos <michael@michaelkloos.com>
  Michal Hocko <mhocko@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Rapoport <rppt@kernel.org>
  Mike Rapoport <rppt@linux.ibm.com>
  Miroslav Benes <mbenes@suse.cz>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nemanja Rakovic <nemanja.rakovic@syrmia.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nikita Shubin <n.shubin@yadro.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nour-eddine Taleb <kernel.noureddine@gmail.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Peter Collingbourne <pcc@google.com>
  Petr Mladek <pmladek@suse.com>
  Pratik R. Sampat <psampat@linux.ibm.com>
  Qinglin Pan <panqinglin2020@iscas.ac.cn>
  Rafael Aquini <aquini@redhat.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Ritesh Harjani <riteshh@linux.ibm.com>
  Rob Herring <robh@kernel.org>
  Rohan McLure <rmclure@linux.ibm.com>
  Roman Gushchin <guro@fb.com>
  Sachin Sant <sachinp@linux.ibm.com>
  Scott Wood <oss@buserror.net>
  Sean Anderson <seanga2@gmail.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13.0.0 (x86-64)
  Serge Semin <fancer.lancer@gmail.com>
  Shenghong Han <hanshenghong2019@email.szu.edu.cn>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sourabh Jain <sourabhjain@linux.ibm.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  tangmeng <tangmeng@uniontech.com>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tobias Huschle <huschle@linux.ibm.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tsukasa OI <research_trasio@irq.a4lg.com>
  Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vincent Chen <vincent.chen@sifive.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wedson Almeida Filho <wedsonaf@google.com>
  Wenli Looi <wlooi@ucalgary.ca>
  Xi Ruoyao <xry111@mengyan1223.wang>
  Yaliang Wang <Yaliang.Wang@windriver.com>
  Yinan Zhang <zhangyinan2019@email.szu.edu.cn>
  Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
  Yu Zhao <yuzhao@google.com>
  YueHaibing <yuehaibing@huawei.com>

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
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        starved 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               broken  
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 broken  
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-amd64-xl-shadow                                   broken  
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      broken  
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-vhd broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-libvirt-qcow2 broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-libvirt-raw broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-vhd host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-amd64-libvirt-raw host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-qcow2 host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)

Not pushing.

(No revision log; it would be 11576 lines long.)

