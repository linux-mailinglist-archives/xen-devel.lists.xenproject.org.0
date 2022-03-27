Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9D4E8AFC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 00:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295249.502337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYbnW-0005x0-M3; Sun, 27 Mar 2022 22:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295249.502337; Sun, 27 Mar 2022 22:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYbnW-0005uV-Hn; Sun, 27 Mar 2022 22:55:46 +0000
Received: by outflank-mailman (input) for mailman id 295249;
 Sun, 27 Mar 2022 22:55:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYbnU-0005uK-QN; Sun, 27 Mar 2022 22:55:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYbnU-00046t-Mw; Sun, 27 Mar 2022 22:55:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYbnU-0007uT-Am; Sun, 27 Mar 2022 22:55:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nYbnU-0002bU-AL; Sun, 27 Mar 2022 22:55:44 +0000
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
	bh=ivZxh7mbHytXTb4tMrNKeTYh2xC2G1JnlNwZH1qGwpE=; b=GN9Q3oKHqsHifDx7IgVxMb9ZQX
	5opVMylYzOWAJsaXohwYC65oHQK6b/+xX2R9PU7jyjuq2K1Ghtv36X/LlBNZiKNV+u8KUuNOh9t9l
	TyXAjH9GoQZTvpDolw2lbsMnYIv1n9lo1lf+11rEro+kWFNVJk3gT2FYPXiPNL/61OYU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168873-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 168873: trouble: blocked/broken/pass
X-Osstest-Failures:
    qemu-mainline:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    qemu-mainline:build-arm64-pvops:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    qemu-mainline:build-i386:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    qemu-mainline:build-i386-pvops:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    qemu-mainline:build-i386-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-pair:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-pygrub:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:regression
    qemu-mainline:build-i386-pvops:host-install(4):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-pygrub:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-pair:host-install/src_host(6):broken:regression
    qemu-mainline:test-amd64-amd64-pair:host-install/dst_host(7):broken:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    qemu-mainline:build-i386:host-install(4):broken:regression
    qemu-mainline:build-i386-xsm:host-install(4):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    qemu-mainline:build-arm64-pvops:host-install(4):broken:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:host-install(5):broken:allowable
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=3d31fe4d662f13c70eb7e87f29513623ccd76322
X-Osstest-Versions-That:
    qemuu=f345abe36527a8b575482bb5a0616f43952bf1f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Mar 2022 22:55:44 +0000

flight 168873 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168873/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 build-i386                      <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt-xsm  5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken REGR. vs. 168856
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)     broken REGR. vs. 168856
 test-amd64-amd64-pygrub       5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)   broken REGR. vs. 168856
 test-amd64-amd64-xl           5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)   broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-libvirt      5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)       broken REGR. vs. 168856
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-pair       6 host-install/src_host(6) broken REGR. vs. 168856
 test-amd64-amd64-pair       7 host-install/dst_host(7) broken REGR. vs. 168856
 test-amd64-amd64-xl-xsm       5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)     broken REGR. vs. 168856
 test-amd64-amd64-qemuu-nested-intel  5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-xl-multivcpu  5 host-install(5)       broken REGR. vs. 168856
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken REGR. vs. 168856
 test-amd64-amd64-libvirt-vhd  5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-pvshim    5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 168856
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 168856
 build-i386                    4 host-install(4)        broken REGR. vs. 168856
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 168856
 test-amd64-amd64-xl-qcow2     5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-credit1   5 host-install(5)        broken REGR. vs. 168856
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken REGR. vs. 168856
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 168856
 test-amd64-coresched-amd64-xl  5 host-install(5)       broken REGR. vs. 168856

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      5 host-install(5)        broken REGR. vs. 168856

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168856
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168856
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168856
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                3d31fe4d662f13c70eb7e87f29513623ccd76322
baseline version:
 qemuu                f345abe36527a8b575482bb5a0616f43952bf1f4

Last test of basis   168856  2022-03-25 15:08:16 Z    2 days
Testing same since   168873  2022-03-26 10:38:21 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Peter Maydell <peter.maydell@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    broken  
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       blocked 


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
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step build-i386-pvops host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step build-arm64-pvops host-install(4)
broken-step test-amd64-coresched-amd64-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 3d31fe4d662f13c70eb7e87f29513623ccd76322
Merge: f345abe365 c7ca3ad5e7
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Mar 25 15:02:39 2022 +0000

    Merge tag 'pull-target-arm-20220325' of https://git.linaro.org/people/pmaydell/qemu-arm into staging
    
    target-arm queue:
     * hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging
     * target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
    
    # gpg: Signature made Fri 25 Mar 2022 14:56:48 GMT
    # gpg:                using RSA key E1A5C593CD419DE28E8315CF3C2525ED14360CDE
    # gpg:                issuer "peter.maydell@linaro.org"
    # gpg: Good signature from "Peter Maydell <peter.maydell@linaro.org>" [ultimate]
    # gpg:                 aka "Peter Maydell <pmaydell@gmail.com>" [ultimate]
    # gpg:                 aka "Peter Maydell <pmaydell@chiark.greenend.org.uk>" [ultimate]
    # Primary key fingerprint: E1A5 C593 CD41 9DE2 8E83  15CF 3C25 25ED 1436 0CDE
    
    * tag 'pull-target-arm-20220325' of https://git.linaro.org/people/pmaydell/qemu-arm:
      hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging
      target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit c7ca3ad5e756e263daf082c315e311593ccec3d1
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Mar 25 14:41:06 2022 +0000

    hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging
    
    In commit 84d43d2e82da we rearranged the logging of errors in
    process_mapc(), and inadvertently dropped the trailing newlines
    from the log messages. Restore them. The same commit also
    attempted to switch the ICID printing to hex (which is how we
    print ICIDs elsewhere) but only did half the job, adding the
    0x prefix but leaving the format string at %d; correct to %x.
    
    Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

commit 6222c3acc4f36fc31d057e1afb6b5c408f83d343
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Mar 25 14:41:06 2022 +0000

    target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
    
    Both of these functions missed handling the TLB_MMIO flag
    during the conversion to handle MTE.
    
    Fixes: 10a85e2c8ab6 ("target/arm: Reuse sve_probe_page for gather loads")
    Resolves: https://gitlab.com/qemu-project/qemu/-/issues/925
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Message-id: 20220324010932.190428-1-richard.henderson@linaro.org
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

