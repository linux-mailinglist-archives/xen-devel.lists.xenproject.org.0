Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E991F2179
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 23:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiPHF-0002tc-5G; Mon, 08 Jun 2020 21:25:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Py4y=7V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jiPHD-0002tX-HX
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 21:25:51 +0000
X-Inumbo-ID: 9ee280c6-a9ce-11ea-b2be-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ee280c6-a9ce-11ea-b2be-12813bfff9fa;
 Mon, 08 Jun 2020 21:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8A7Kl5cxYRFXeXDbNrg8l4Ik4YNFNfUwokBYZVMUKxo=; b=qc6xl4FO4bjm/A8W9gH5Xq5wF
 deIaK/YNwuJ4MARRvPS1PQtnzOHKMTkToK3ZLHWfnc63yamyTW6pfkr45dztzQFh9BdVN5kMGRIw6
 VeS4Cb3zgMf0beXVBLXS25m8a8c5DmA6YZLlmi+mrHBAJhBWBWicNFAb9g9W6h4kZW5xU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiPH9-00018Y-Ow; Mon, 08 Jun 2020 21:25:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiPH9-0007jY-FQ; Mon, 08 Jun 2020 21:25:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jiPH9-0002tL-Ei; Mon, 08 Jun 2020 21:25:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150923-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150923: regressions - trouble:
 blocked/broken/fail/pass
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit2:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl:<job status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit1:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt:<job status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-pygrub:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-rtds:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-credit1:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-shadow:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-arndale:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
 qemu-mainline:test-amd64-coresched-amd64-xl:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:<job
 status>:broken:regression
 qemu-mainline:build-amd64-xsm:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-credit2:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-pair:<job status>:broken:regression
 qemu-mainline:test-arm64-arm64-xl-thunderx:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-pair:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-amd64-pvgrub:hosts-allocate:broken:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-coresched-amd64-xl:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-shadow:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-i386-pvgrub:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:broken:regression
 qemu-mainline:test-amd64-amd64-xl-credit1:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvshim:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-xl-multivcpu:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-pair:host-install/src_host(4):broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-libvirt:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-pair:host-install/dst_host(5):broken:regression
 qemu-mainline:test-arm64-arm64-xl-thunderx:host-install(4):broken:regression
 qemu-mainline:test-armhf-armhf-xl-arndale:host-install(4):broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit1:host-install(4):broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit2:host-install(4):broken:regression
 qemu-mainline:test-armhf-armhf-xl-multivcpu:host-install(4):broken:regression
 qemu-mainline:test-amd64-amd64-pair:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-xl-credit1:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-xl-multivcpu:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvshim:syslog-server:broken:regression
 qemu-mainline:test-arm64-arm64-xl-thunderx:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl-arndale:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit2:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl-credit1:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl-cubietruck:syslog-server:broken:regression
 qemu-mainline:test-armhf-armhf-xl-multivcpu:syslog-server:broken:regression
 qemu-mainline:test-amd64-amd64-pygrub:xen-install:fail:regression
 qemu-mainline:build-amd64-xsm:host-build-prep:fail:regression
 qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:host-ping-check-xen:fail:regression
 qemu-mainline:test-amd64-amd64-xl-credit2:debian-fixup:fail:regression
 qemu-mainline:test-amd64-amd64-xl:guest-start:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
 qemu-mainline:build-i386-pvops:kernel-build:fail:regression
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
 qemu-mainline:build-armhf-libvirt:libvirt-build:fail:regression
 qemu-mainline:build-i386:xen-build:fail:regression
 qemu-mainline:build-i386-xsm:xen-build:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):running:regression
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):running:regression
 qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):running:regression
 qemu-mainline:test-armhf-armhf-libvirt:build-check(1):running:regression
 qemu-mainline:test-amd64-amd64-libvirt-xsm:build-check(1):running:regression
 qemu-mainline:test-amd64-amd64-xl-xsm:build-check(1):running:regression
 qemu-mainline:build-amd64-xsm:syslog-server:running:regression
 qemu-mainline:build-i386-pvops:syslog-server:running:regression
 qemu-mainline:build-armhf-libvirt:syslog-server:running:regression
 qemu-mainline:test-armhf-armhf-xl-rtds:hosts-allocate:broken:allowable
 qemu-mainline:test-amd64-amd64-xl-rtds:hosts-allocate:broken:allowable
 qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:capture-logs(5):broken:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-pvshim:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-multivcpu:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-pair:capture-logs/src_host(6):broken:nonblocking
 qemu-mainline:test-amd64-amd64-pair:capture-logs/dst_host(7):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-credit1:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-pygrub:capture-logs(7):broken:nonblocking
 qemu-mainline:build-amd64-xsm:capture-logs:broken:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl:capture-logs(13):broken:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:capture-logs(11):broken:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-credit2:capture-logs(12):broken:nonblocking
 qemu-mainline:build-i386-pvops:capture-logs:broken:nonblocking
 qemu-mainline:build-armhf-libvirt:capture-logs:broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:capture-logs(9):broken:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=5a922419feb980592ef3dc16d74f0d9cf5ca4830
X-Osstest-Versions-That: qemuu=66234fee9c2d37bfbc523aa8d0ae5300a14cc10e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jun 2020 21:25:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150923 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150923/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-arm64-arm64-xl-thunderx    <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-libvirt-pair  2 hosts-allocate        broken REGR. vs. 150694
 test-amd64-amd64-amd64-pvgrub  2 hosts-allocate        broken REGR. vs. 150694
 test-armhf-armhf-xl-vhd       2 hosts-allocate         broken REGR. vs. 150694
 test-amd64-coresched-amd64-xl  2 hosts-allocate        broken REGR. vs. 150694
 test-amd64-amd64-xl-shadow    2 hosts-allocate         broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-ws16-amd64  2 hosts-allocate broken REGR. vs. 150694
 test-amd64-amd64-xl-pvhv2-amd  2 hosts-allocate        broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 2 hosts-allocate broken REGR. vs. 150694
 test-amd64-amd64-i386-pvgrub  2 hosts-allocate         broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 2 hosts-allocate broken REGR. vs. 150694
 test-amd64-amd64-xl-qcow2     2 hosts-allocate         broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-ovmf-amd64  2 hosts-allocate broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-win7-amd64  2 hosts-allocate broken REGR. vs. 150694
 test-amd64-amd64-qemuu-nested-amd  2 hosts-allocate    broken REGR. vs. 150694
 test-amd64-amd64-xl-credit1   4 host-install(4)        broken REGR. vs. 150694
 test-amd64-amd64-xl-pvshim    4 host-install(4)        broken REGR. vs. 150694
 test-amd64-amd64-xl-multivcpu  4 host-install(4)       broken REGR. vs. 150694
 test-amd64-amd64-libvirt-vhd  4 host-install(4)        broken REGR. vs. 150694
 test-amd64-amd64-pair       4 host-install/src_host(4) broken REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 4 host-install(4) broken REGR. vs. 150694
 test-amd64-amd64-libvirt      4 host-install(4)        broken REGR. vs. 150694
 test-amd64-amd64-pair       5 host-install/dst_host(5) broken REGR. vs. 150694
 test-arm64-arm64-xl-thunderx  4 host-install(4)        broken REGR. vs. 150694
 test-armhf-armhf-xl-arndale   4 host-install(4)        broken REGR. vs. 150694
 test-armhf-armhf-xl-credit1   4 host-install(4)        broken REGR. vs. 150694
 test-armhf-armhf-xl-credit2   4 host-install(4)        broken REGR. vs. 150694
 test-armhf-armhf-xl-multivcpu  4 host-install(4)       broken REGR. vs. 150694
 test-amd64-amd64-pair         3 syslog-server          broken REGR. vs. 150694
 test-amd64-amd64-libvirt      3 syslog-server          broken REGR. vs. 150694
 test-amd64-amd64-xl-credit1   3 syslog-server          broken REGR. vs. 150694
 test-amd64-amd64-xl-multivcpu  3 syslog-server         broken REGR. vs. 150694
 test-amd64-amd64-xl-pvshim    3 syslog-server          broken REGR. vs. 150694
 test-arm64-arm64-xl-thunderx  3 syslog-server          broken REGR. vs. 150694
 test-armhf-armhf-xl-arndale   3 syslog-server          broken REGR. vs. 150694
 test-amd64-amd64-libvirt-vhd  3 syslog-server          broken REGR. vs. 150694
 test-armhf-armhf-xl-credit2   3 syslog-server          broken REGR. vs. 150694
 test-armhf-armhf-xl-credit1   3 syslog-server          broken REGR. vs. 150694
 test-armhf-armhf-xl           3 syslog-server          broken REGR. vs. 150694
 test-armhf-armhf-xl-cubietruck  3 syslog-server        broken REGR. vs. 150694
 test-armhf-armhf-xl-multivcpu  3 syslog-server         broken REGR. vs. 150694
 test-amd64-amd64-pygrub       6 xen-install              fail REGR. vs. 150694
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 150694
 test-amd64-amd64-xl-pvhv2-intel  8 host-ping-check-xen   fail REGR. vs. 150694
 test-amd64-amd64-xl-credit2  11 debian-fixup             fail REGR. vs. 150694
 test-amd64-amd64-xl          12 guest-start              fail REGR. vs. 150694
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail REGR. vs. 150694
 build-i386-pvops              6 kernel-build             fail REGR. vs. 150694
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 150694
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 150694
 build-i386                    6 xen-build                fail REGR. vs. 150694
 build-i386-xsm                6 xen-build                fail REGR. vs. 150694
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)         running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  1 build-check(1)   running
 test-armhf-armhf-libvirt-raw  1 build-check(1)               running
 test-armhf-armhf-libvirt      1 build-check(1)               running
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               running
 test-amd64-amd64-xl-xsm       1 build-check(1)               running
 build-amd64-xsm               3 syslog-server                running
 build-i386-pvops              3 syslog-server                running
 build-armhf-libvirt           3 syslog-server                running

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      2 hosts-allocate         broken REGR. vs. 150694
 test-amd64-amd64-xl-rtds      2 hosts-allocate         broken REGR. vs. 150694

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-libvirt-vhd  5 capture-logs(5)       broken blocked in 150694
 test-armhf-armhf-xl-multivcpu  5 capture-logs(5)      broken blocked in 150694
 test-amd64-amd64-xl-pvshim    5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-libvirt      5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-xl-multivcpu  5 capture-logs(5)      broken blocked in 150694
 test-amd64-amd64-pair      6 capture-logs/src_host(6) broken blocked in 150694
 test-amd64-amd64-pair      7 capture-logs/dst_host(7) broken blocked in 150694
 test-amd64-amd64-xl-credit1   5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-pygrub       7 capture-logs(7)       broken blocked in 150694
 build-amd64-xsm               6 capture-logs          broken blocked in 150694
 test-armhf-armhf-xl-arndale   5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-xl          13 capture-logs(13)      broken blocked in 150694
 test-amd64-amd64-qemuu-nested-intel 11 capture-logs(11) broken blocked in 150694
 test-armhf-armhf-xl-credit2   5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-xl-credit2  12 capture-logs(12)      broken blocked in 150694
 build-i386-pvops              7 capture-logs          broken blocked in 150694
 build-armhf-libvirt           7 capture-logs          broken blocked in 150694
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 capture-logs(5) broken never pass
 test-amd64-amd64-xl-pvhv2-intel  9 capture-logs(9)           broken never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass

version targeted for testing:
 qemuu                5a922419feb980592ef3dc16d74f0d9cf5ca4830
baseline version:
 qemuu                66234fee9c2d37bfbc523aa8d0ae5300a14cc10e

Last test of basis   150694  2020-06-04 11:44:20 Z    4 days
Failing since        150831  2020-06-05 13:06:20 Z    3 days    8 attempts
Testing same since   150923  2020-06-08 11:57:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Bulekov <alxndr@bu.edu>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Eden Mikitas <e.mikitas@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jared Rossi <jrossi@linux.ibm.com>
  Kevin Wolf <kwolf@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Zimmerman <pauldzim@gmail.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daude <f4bug@amsat.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Richard Henderson <richard.henderson@linaro.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             fail    
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 broken  
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-xl-vhd                                      broken  


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

broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-amd64-amd64-xl broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job build-amd64-xsm broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-pair broken
broken-job test-arm64-arm64-xl-thunderx broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-step test-amd64-amd64-libvirt-pair hosts-allocate
broken-step test-amd64-amd64-amd64-pvgrub hosts-allocate
broken-step test-armhf-armhf-xl-vhd hosts-allocate
broken-step test-armhf-armhf-xl-rtds hosts-allocate
broken-step test-armhf-armhf-xl-credit1 capture-logs(5)
broken-step test-amd64-amd64-libvirt-vhd capture-logs(5)
broken-step test-amd64-coresched-amd64-xl hosts-allocate
broken-step test-amd64-amd64-xl-shadow hosts-allocate
broken-step test-armhf-armhf-xl-multivcpu capture-logs(5)
broken-step test-amd64-amd64-xl-pvshim capture-logs(5)
broken-step test-amd64-amd64-libvirt capture-logs(5)
broken-step test-amd64-amd64-xl-multivcpu capture-logs(5)
broken-step test-amd64-amd64-pair capture-logs/src_host(6)
broken-step test-amd64-amd64-pair capture-logs/dst_host(7)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-pvhv2-amd hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 hosts-allocate
broken-step test-amd64-amd64-i386-pvgrub hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow hosts-allocate
broken-step test-amd64-amd64-xl-qcow2 hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-rtds hosts-allocate
broken-step test-amd64-amd64-xl-credit1 capture-logs(5)
broken-step test-amd64-amd64-qemuu-nested-amd hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict capture-logs(5)
broken-step test-amd64-amd64-xl-pvhv2-intel capture-logs(9)
broken-step test-amd64-amd64-pygrub capture-logs(7)
broken-step test-amd64-amd64-xl-credit1 host-install(4)
broken-step test-amd64-amd64-xl-pvshim host-install(4)
broken-step test-amd64-amd64-xl-multivcpu host-install(4)
broken-step test-amd64-amd64-libvirt-vhd host-install(4)
broken-step test-amd64-amd64-pair host-install/src_host(4)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(4)
broken-step test-amd64-amd64-libvirt host-install(4)
broken-step test-amd64-amd64-pair host-install/dst_host(5)
broken-step build-amd64-xsm capture-logs
broken-step test-armhf-armhf-xl-arndale capture-logs(5)
broken-step test-amd64-amd64-xl capture-logs(13)
broken-step test-amd64-amd64-qemuu-nested-intel capture-logs(11)
broken-step test-armhf-armhf-xl-credit2 capture-logs(5)
broken-step test-arm64-arm64-xl-thunderx host-install(4)
broken-step test-amd64-amd64-xl-credit2 capture-logs(12)
broken-step test-armhf-armhf-xl-arndale host-install(4)
broken-step test-armhf-armhf-xl-credit1 host-install(4)
broken-step test-armhf-armhf-xl-credit2 host-install(4)
broken-step test-armhf-armhf-xl-multivcpu host-install(4)
broken-step build-i386-pvops capture-logs
broken-step test-amd64-amd64-pair syslog-server
broken-step test-amd64-amd64-libvirt syslog-server
broken-step test-amd64-amd64-xl-credit1 syslog-server
broken-step test-amd64-amd64-xl-multivcpu syslog-server
broken-step test-amd64-amd64-xl-pvshim syslog-server
broken-step test-arm64-arm64-xl-thunderx syslog-server
broken-step test-armhf-armhf-xl-arndale syslog-server
broken-step test-amd64-amd64-libvirt-vhd syslog-server
broken-step test-armhf-armhf-xl-credit2 syslog-server
broken-step test-armhf-armhf-xl-credit1 syslog-server
broken-step test-armhf-armhf-xl syslog-server
broken-step test-armhf-armhf-xl-cubietruck syslog-server
broken-step test-armhf-armhf-xl-multivcpu syslog-server
broken-step build-armhf-libvirt capture-logs

Not pushing.

(No revision log; it would be 973 lines long.)

