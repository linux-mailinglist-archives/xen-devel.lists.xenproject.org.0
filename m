Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA03ADDFF
	for <lists+xen-devel@lfdr.de>; Sun, 20 Jun 2021 12:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145191.267137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luv9X-0002DS-2F; Sun, 20 Jun 2021 10:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145191.267137; Sun, 20 Jun 2021 10:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luv9W-0002BV-TN; Sun, 20 Jun 2021 10:58:10 +0000
Received: by outflank-mailman (input) for mailman id 145191;
 Sun, 20 Jun 2021 10:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luv9V-0002BL-GK; Sun, 20 Jun 2021 10:58:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luv9V-0004vW-6t; Sun, 20 Jun 2021 10:58:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luv9U-0007eM-RS; Sun, 20 Jun 2021 10:58:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1luv9U-0007iW-R0; Sun, 20 Jun 2021 10:58:08 +0000
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
	bh=uOzLr0T4Vsk/nZEwKEBWOwgqNdou1Tn74eCcHu2Tv0w=; b=IbU6WDjw14IkCUVktsd5do6LIh
	y6RbLGBhfydtXerbXLeG1ktBiWmJpHczfpjtQ2ctu5yS10YeZ15TddIyOnXfcO906peFyEtugA+hW
	Me6RhI7RI3EgTdTKjsaW9+7tI7jPtVaJHmHapp7q6SjYRj73bM7tEkEOMHamtXMnzyVc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162895-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 162895: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-raw:<job status>:broken:regression
    linux-linus:test-amd64-coresched-i386-xl:<job status>:broken:regression
    linux-linus:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    linux-linus:test-amd64-amd64-pygrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
    linux-linus:test-amd64-i386-libvirt:<job status>:broken:regression
    linux-linus:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-pair:<job status>:broken:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:<job status>:broken:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-i386-examine:host-install:broken:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl:debian-fixup:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-coresched-i386-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-libvirt-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-freebsd10-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-raw:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-pvshim:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt:host-install(5):broken:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-i386-pvgrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-pygrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-freebsd10-i386:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-libvirt:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-i386-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-i386-libvirt-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-i386-libvirt-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-amd64-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-amd64-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=728a748b3ff70326f652ab92081d639dc51269ea
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Jun 2021 10:58:08 +0000

flight 162895 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162895/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-raw          <job status>                 broken
 test-amd64-coresched-i386-xl    <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-i386-xl-shadow       <job status>                 broken
 test-amd64-i386-xl-xsm          <job status>                 broken
 test-amd64-i386-freebsd10-amd64    <job status>                 broken
 test-amd64-i386-freebsd10-i386    <job status>                 broken
 test-amd64-i386-libvirt         <job status>                 broken
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <job status>       broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-examine       5 host-install           broken REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm      13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2  13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl          13 debian-fixup             fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd      13 guest-start              fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-amd64-pvgrub  5 host-install(5)      broken blocked in 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-xsm        5 host-install(5)       broken blocked in 152332
 test-amd64-i386-qemut-rhel6hvm-intel 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-credit2   5 host-install(5)       broken blocked in 152332
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl           5 host-install(5)       broken blocked in 152332
 test-amd64-i386-xl-qemuu-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken blocked in 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  5 host-install(5) broken blocked in 152332
 test-amd64-coresched-i386-xl  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)    broken blocked in 152332
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-i386-libvirt-xsm   5 host-install(5)       broken blocked in 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-i386-freebsd10-amd64  5 host-install(5)    broken blocked in 152332
 test-amd64-i386-xl-raw        5 host-install(5)       broken blocked in 152332
 test-amd64-i386-qemut-rhel6hvm-amd  5 host-install(5) broken blocked in 152332
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)  broken blocked in 152332
 test-amd64-i386-xl-pvshim     5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-amd64-xl-multivcpu  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-xl-shadow    5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-libvirt      5 host-install(5)       broken blocked in 152332
 test-amd64-coresched-amd64-xl  5 host-install(5)      broken blocked in 152332
 test-amd64-i386-xl            5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-i386-pvgrub  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-pygrub       5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-freebsd10-i386  5 host-install(5)     broken blocked in 152332
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-xsm  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)    broken blocked in 152332
 test-amd64-amd64-xl-credit1   5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-qemuu-nested-intel 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-shadow     5 host-install(5)       broken blocked in 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-vhd  5 host-install(5)       broken blocked in 152332
 test-amd64-i386-libvirt       5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-rtds      5 host-install(5)       broken blocked in 152332
 test-amd64-i386-xl-qemut-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-pair       6 host-install/src_host(6) broken blocked in 152332
 test-amd64-i386-pair       7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemuu-win7-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-xl-qemut-win7-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qcow2     5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-i386-libvirt-pair 6 host-install/src_host(6) broken blocked in 152332
 test-amd64-i386-libvirt-pair 7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-amd64-pair      6 host-install/src_host(6) broken blocked in 152332
 test-amd64-amd64-pair      7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)  broken blocked in 152332
 test-amd64-amd64-xl-pvshim    5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 152332
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152332
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 152332
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152332
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                728a748b3ff70326f652ab92081d639dc51269ea
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  323 days
Failing since        152366  2020-08-01 20:49:34 Z  322 days  548 attempts
Testing same since   162895  2021-06-18 21:58:18 Z    1 days    1 attempts

------------------------------------------------------------
6184 people touched revisions under test,
not listing them all

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
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           broken  
 test-amd64-coresched-i386-xl                                 broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      broken  
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 broken  
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       broken  
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    broken  
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-xl-vhd                                      fail    


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

broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-coresched-i386-xl broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-i386-xl-shadow broken
broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-step test-amd64-amd64-amd64-pvgrub host-install(5)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-i386-xl-xsm host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-intel host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-intel host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(5)
broken-step test-amd64-i386-examine host-install
broken-step test-amd64-coresched-i386-xl host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-libvirt-xsm host-install(5)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-freebsd10-amd64 host-install(5)
broken-step test-amd64-i386-xl-raw host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-amd host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-i386-xl-pvshim host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-i386-xl host-install(5)
broken-step test-amd64-amd64-i386-pvgrub host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-amd64-i386-freebsd10-i386 host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-i386-xl-shadow host-install(5)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-i386-libvirt host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-i386-pair host-install/src_host(6)
broken-step test-amd64-i386-pair host-install/dst_host(7)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-i386-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-i386-libvirt-pair host-install/src_host(6)
broken-step test-amd64-i386-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)

Not pushing.

(No revision log; it would be 1683232 lines long.)

