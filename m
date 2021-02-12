Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2231974C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 01:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84095.157676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAM2g-0002Rp-R4; Fri, 12 Feb 2021 00:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84095.157676; Fri, 12 Feb 2021 00:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAM2g-0002RN-Mo; Fri, 12 Feb 2021 00:10:38 +0000
Received: by outflank-mailman (input) for mailman id 84095;
 Fri, 12 Feb 2021 00:10:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAM2e-0002RF-Nw; Fri, 12 Feb 2021 00:10:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAM2e-0007vW-9U; Fri, 12 Feb 2021 00:10:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAM2d-000802-Vr; Fri, 12 Feb 2021 00:10:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lAM2d-0002tY-VQ; Fri, 12 Feb 2021 00:10:35 +0000
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
	bh=kZQGa21+YcXovjtvFVHApJxwWbjOcQ9GqUgZ2uTm7SY=; b=oW/tXWL2r9fK8yr7NalDKmN8d/
	ELmQaZW9BjbdX0a7baf1uEpwtntUX+EMUowtoB5e2vQxbKuLnsTlZBiT3Vjc+VQXezkv8HjHU21H5
	6vbR1CF1Ezq1SBnYE/4X11x//9XuFqiOGMYWm2ivqpiJjxa24WF42ltOfN5wIkq56Uuk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159204-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.11-testing test] 159204: regressions - FAIL
X-Osstest-Failures:
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-intel:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-libvirt:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-shadow:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-xl-raw:<job status>:broken:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.11-testing:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    xen-4.11-testing:test-armhf-armhf-xl-vhd:guest-start:fail:regression
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:guest-start:fail:regression
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-freebsd10-i386:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-pygrub:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-raw:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-amd:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-freebsd10-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-intel:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-pvshim:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-libvirt:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-i386-xl-shadow:host-install(5):broken:heisenbug
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:heisenbug
    xen-4.11-testing:test-armhf-armhf-xl-vhd:debian-di-install:fail:heisenbug
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:debian-di-install:fail:heisenbug
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1c7d984645f9ade9b47e862b5880734ad498fea8
X-Osstest-Versions-That:
    xen=310ab79875cb705cc2c7daddff412b5a4899f8c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Feb 2021 00:10:35 +0000

flight 159204 xen-4.11-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159204/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>           broken in 159042
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>           broken in 159042
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>           broken in 159042
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>      broken in 159042
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>        broken in 159042
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  <job status> broken in 159042
 test-amd64-i386-xl              <job status>                 broken  in 159042
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>          broken in 159042
 test-amd64-i386-xl-xsm          <job status>                 broken  in 159042
 test-amd64-i386-freebsd10-i386    <job status>                broken in 159042
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>          broken in 159042
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm <job status> broken in 159042
 test-amd64-i386-xl-qemut-win7-amd64    <job status>           broken in 159042
 test-amd64-i386-libvirt-xsm     <job status>                 broken  in 159042
 test-amd64-i386-xl-pvshim       <job status>                 broken  in 159042
 test-amd64-amd64-libvirt-vhd    <job status>                 broken  in 159042
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken in 159042
 test-amd64-i386-libvirt         <job status>                 broken  in 159042
 test-amd64-amd64-libvirt-xsm    <job status>                 broken  in 159042
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>   broken in 159042
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>          broken in 159042
 test-amd64-i386-xl-shadow       <job status>                 broken  in 159042
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>            broken in 159042
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>      broken in 159042
 test-amd64-amd64-pygrub         <job status>                 broken  in 159042
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>   broken in 159042
 test-amd64-i386-freebsd10-amd64    <job status>               broken in 159042
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 159042
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>          broken in 159042
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>           broken in 159042
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm <job status> broken in 159042
 test-amd64-i386-xl-raw          <job status>                 broken  in 159042
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>            broken in 159042
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 159042
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken in 159042
 test-armhf-armhf-xl-vhd      13 guest-start    fail in 159042 REGR. vs. 157566
 test-armhf-armhf-libvirt-raw 13 guest-start    fail in 159042 REGR. vs. 157566

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-xsm  5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-ws16-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-freebsd10-i386 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemut-win7-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-debianhvm-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-pygrub      5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-raw       5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-qemut-rhel6hvm-amd 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-qemuu-rhel6hvm-amd 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-libvirt-vhd 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-libvirt-xsm 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-freebsd10-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-xsm       5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-qemut-rhel6hvm-intel 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-pvshim    5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-win7-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-libvirt      5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemut-ws16-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-amd64-pvgrub 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl           5 host-install(5) broken in 159042 pass in 159204
 test-amd64-i386-xl-shadow    5 host-install(5) broken in 159042 pass in 159204
 test-amd64-amd64-xl-pvhv2-amd 5 host-install(5) broken in 159042 pass in 159204
 test-armhf-armhf-xl-vhd      12 debian-di-install          fail pass in 159042
 test-armhf-armhf-libvirt-raw 12 debian-di-install          fail pass in 159042

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 157566
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 157566
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 157566
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 157566
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 157566
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 157566
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 157566
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 157566
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 157566
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 157566
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 157566
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 157566
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  1c7d984645f9ade9b47e862b5880734ad498fea8
baseline version:
 xen                  310ab79875cb705cc2c7daddff412b5a4899f8c9

Last test of basis   157566  2020-12-15 14:05:54 Z   58 days
Failing since        159016  2021-02-04 15:05:58 Z    7 days    7 attempts
Testing same since   159042  2021-02-05 12:13:30 Z    6 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-shadow broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-amd64-pvgrub broken

Not pushing.

------------------------------------------------------------
commit 1c7d984645f9ade9b47e862b5880734ad498fea8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 08:54:03 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again, part 2)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f9090d990e201a5ca045976b8ddaab9fa6ee69dd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 15:41:12 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Reported-by: James Dingwall <james@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

