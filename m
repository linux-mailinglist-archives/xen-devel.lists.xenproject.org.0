Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D8967366
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 23:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787269.1196830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skW2J-0007PI-Cd; Sat, 31 Aug 2024 21:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787269.1196830; Sat, 31 Aug 2024 21:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skW2J-0007Nn-9L; Sat, 31 Aug 2024 21:53:35 +0000
Received: by outflank-mailman (input) for mailman id 787269;
 Sat, 31 Aug 2024 21:53:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skW2H-0007Nd-GO; Sat, 31 Aug 2024 21:53:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skW2H-0002SD-AF; Sat, 31 Aug 2024 21:53:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skW2G-0000GB-N0; Sat, 31 Aug 2024 21:53:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skW2G-0003gl-MV; Sat, 31 Aug 2024 21:53:32 +0000
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
	bh=hEyZM9i44jvdbf1tmNnU2y/tJf0xLvOtNWMMKw/rKlg=; b=Fnv/IS4H4sI/pYfBPfEHIHsuLO
	O130rwldCs/yHefjSgVNnbZiNEY7h5SPLEE3CiI7cYGRBuQpiOz83ZCa07NxkPzSYLUZ0Wm5q0+Kr
	xT65W5xJ9iiKbnMfQfCUTMt9zSunC+ut6930JhesWl710pyDV5fZWv3/NONeoMvkUNLg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187439-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 187439: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-xtf-amd64-amd64-2:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-3:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-unstable:build-arm64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-unstable:build-arm64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-qcow2:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-pair:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-raw:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-livepatch:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-1:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-raw:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-vhd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-libvirt:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-libvirt-vhd:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-qcow2:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-xl-raw:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-4:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-5:<job status>:broken:regression
    xen-unstable:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable:build-arm64:host-install(4):broken:regression
    xen-unstable:build-arm64-pvops:host-install(4):broken:regression
    xen-unstable:test-armhf-armhf-xl:host-ping-check-xen:fail:regression
    xen-unstable:test-armhf-armhf-xl:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-vhd:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-raw:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit1:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-multivcpu:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-qcow2:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-arndale:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-rtds:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-xl-credit2:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-examine:host-install:broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-pair:host-install/src_host(6):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-multivcpu:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-pair:host-install/dst_host(7):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-vhd:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-livepatch:host-install(5):broken:heisenbug
    xen-unstable:test-xtf-amd64-amd64-1:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvshim:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    xen-unstable:test-xtf-amd64-amd64-2:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-migrupgrade:host-install/src_host(6):broken:heisenbug
    xen-unstable:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:heisenbug
    xen-unstable:test-amd64-amd64-examine-uefi:host-install:broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-credit1:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-xsm:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qcow2:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-pygrub:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-xtf-amd64-amd64-4:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-shadow:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-qcow2:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-examine-bios:host-install:broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-raw:host-install(5):broken:heisenbug
    xen-unstable:test-xtf-amd64-amd64-3:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-rtds:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-raw:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:heisenbug
    xen-unstable:test-xtf-amd64-amd64-5:host-install(5):broken:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-coresched-amd64-xl:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-examine:host-install:broken:heisenbug
    xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1436593d5f8f7f700478e307d5198535ba69f88d
X-Osstest-Versions-That:
    xen=99f942f3d410059dc223ee0a908827e928ef3592
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 21:53:32 +0000

flight 187439 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187439/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-xtf-amd64-amd64-3          <job status>                 broken
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
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 build-arm64                     <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-qcow2    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-raw    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-xtf-amd64-amd64-1          <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-raw         <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-vhd         <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt-vhd    <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-qcow2       <job status>                 broken
 test-armhf-armhf-xl-raw         <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-xtf-amd64-amd64-5          <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 187415
 build-arm64                   4 host-install(4)        broken REGR. vs. 187415
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 187415
 test-armhf-armhf-xl     10 host-ping-check-xen fail in 187431 REGR. vs. 187415

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl           5 host-install(5)          broken pass in 187431
 test-armhf-armhf-libvirt-vhd  5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-raw       5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-credit1   5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-multivcpu  5 host-install(5)         broken pass in 187431
 test-armhf-armhf-xl-qcow2     5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-arndale   5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-rtds      5 host-install(5)          broken pass in 187431
 test-armhf-armhf-xl-credit2   5 host-install(5)          broken pass in 187431
 test-armhf-armhf-examine      5 host-install             broken pass in 187431
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken pass in 187431
 test-amd64-amd64-libvirt-xsm  5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-qemuu-ws16-amd64  5 host-install(5)  broken pass in 187431
 test-amd64-amd64-pair         6 host-install/src_host(6) broken pass in 187431
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-multivcpu  5 host-install(5)         broken pass in 187431
 test-amd64-amd64-pair         7 host-install/dst_host(7) broken pass in 187431
 test-amd64-amd64-xl-vhd       5 host-install(5)          broken pass in 187431
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)       broken pass in 187431
 test-amd64-amd64-livepatch    5 host-install(5)          broken pass in 187431
 test-xtf-amd64-amd64-1        5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-pvshim    5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemuu-ovmf-amd64  5 host-install(5)  broken pass in 187431
 test-amd64-amd64-xl-qemuu-win7-amd64  5 host-install(5)  broken pass in 187431
 test-amd64-amd64-xl-credit2   5 host-install(5)          broken pass in 187431
 test-xtf-amd64-amd64-2        5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl           5 host-install(5)          broken pass in 187431
 test-amd64-amd64-libvirt-vhd  5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemut-ws16-amd64  5 host-install(5)  broken pass in 187431
 test-amd64-amd64-migrupgrade  6 host-install/src_host(6) broken pass in 187431
 test-amd64-amd64-migrupgrade  7 host-install/dst_host(7) broken pass in 187431
 test-amd64-amd64-examine-uefi  5 host-install            broken pass in 187431
 test-amd64-amd64-xl-credit1   5 host-install(5)          broken pass in 187431
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)     broken pass in 187431
 test-amd64-amd64-xl-xsm       5 host-install(5)          broken pass in 187431
 test-amd64-amd64-qemuu-nested-intel  5 host-install(5)   broken pass in 187431
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken pass in 187431
 test-amd64-amd64-xl-qemut-win7-amd64  5 host-install(5)  broken pass in 187431
 test-amd64-amd64-xl-qcow2     5 host-install(5)          broken pass in 187431
 test-amd64-amd64-pygrub       5 host-install(5)          broken pass in 187431
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken pass in 187431
 test-xtf-amd64-amd64-4        5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)       broken pass in 187431
 test-amd64-amd64-xl-shadow    5 host-install(5)          broken pass in 187431
 test-amd64-amd64-libvirt-qcow2  5 host-install(5)        broken pass in 187431
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken pass in 187431
 test-amd64-amd64-libvirt      5 host-install(5)          broken pass in 187431
 test-amd64-amd64-examine-bios  5 host-install            broken pass in 187431
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken pass in 187431
 test-amd64-amd64-libvirt-raw  5 host-install(5)          broken pass in 187431
 test-xtf-amd64-amd64-3        5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)         broken pass in 187431
 test-amd64-amd64-xl-rtds      5 host-install(5)          broken pass in 187431
 test-amd64-amd64-xl-raw       5 host-install(5)          broken pass in 187431
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)     broken pass in 187431
 test-xtf-amd64-amd64-5        5 host-install(5)          broken pass in 187431
 test-armhf-armhf-libvirt      5 host-install(5)          broken pass in 187431
 test-amd64-coresched-amd64-xl  5 host-install(5)         broken pass in 187431
 test-amd64-amd64-examine      5 host-install             broken pass in 187431

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop  fail in 187431 like 187415
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 187431 like 187415
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 187431 like 187415
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 187431 like 187415
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop  fail in 187431 like 187415
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail in 187431 like 187415
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 187431 never pass
 test-amd64-amd64-libvirt    15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 187431 never pass
 test-arm64-arm64-xl         15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 187431 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 187431 never pass
 test-arm64-arm64-xl-credit1 15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-credit1 16 saverestore-support-check fail in 187431 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 187431 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 187431 never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check fail in 187431 never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 187431 never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 187431 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 187431 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 187431 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 187431 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 187431 never pass

version targeted for testing:
 xen                  1436593d5f8f7f700478e307d5198535ba69f88d
baseline version:
 xen                  99f942f3d410059dc223ee0a908827e928ef3592

Last test of basis   187415  2024-08-30 05:21:05 Z    1 days
Testing same since   187431  2024-08-31 01:39:54 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@vates.tech>
  Christian Lindig <christian.lindig@cloud.com>
  Victor Lira <victorm.lira@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       broken  
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        broken  
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-libvirt-qcow2                               broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-xl-qcow2                                    broken  
 test-amd64-amd64-libvirt-raw                                 broken  
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      broken  
 test-armhf-armhf-xl-raw                                      broken  
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-amd64-xl-shadow                                   broken  
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-libvirt-vhd                                 broken  
 test-amd64-amd64-xl-vhd                                      broken  
 test-arm64-arm64-xl-vhd                                      blocked 


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

broken-job test-xtf-amd64-amd64-2 broken
broken-job test-xtf-amd64-amd64-3 broken
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
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job build-arm64 broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-libvirt-qcow2 broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-raw broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-raw broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-vhd broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-libvirt-vhd broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-qcow2 broken
broken-job test-armhf-armhf-xl-raw broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-xtf-amd64-amd64-5 broken
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-libvirt-vhd host-install(5)
broken-step test-armhf-armhf-xl-raw host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-qcow2 host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-examine host-install
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-vhd host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-livepatch host-install(5)
broken-step test-xtf-amd64-amd64-1 host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-xtf-amd64-amd64-2 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(6)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(7)
broken-step test-amd64-amd64-examine-uefi host-install
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-xtf-amd64-amd64-4 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-libvirt-qcow2 host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-examine-bios host-install
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-libvirt-raw host-install(5)
broken-step test-xtf-amd64-amd64-3 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-amd64-xl-raw host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-xtf-amd64-amd64-5 host-install(5)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-amd64-examine host-install

Not pushing.

------------------------------------------------------------
commit 1436593d5f8f7f700478e307d5198535ba69f88d
Author: Anthony PERARD <anthony.perard@vates.tech>
Date:   Fri Aug 30 09:49:40 2024 +0000

    libxl: Probe QEMU for -run-with user=user and use it
    
    "-runas" is deprecated since QEMU 9.1 and will be remove in a future
    release.
    
    Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

commit 82335a8cc54c009792d44f0be51213da48303a68
Author: Anthony PERARD <anthony.perard@vates.tech>
Date:   Fri Aug 30 09:49:40 2024 +0000

    libxl: Probe QEMU for -run-with chroot=dir and use it
    
    QEMU 9.0 have removed "-chroot" command line option, which have been
    deprecated since QEMU 8.1 in favor of "-run-with chroot=dir".
    
    Look into the result of the QMP command "query-command-line-options"
    to find out if "-run-with chroot=dir" is available. Then use it in
    place of "-chroot".
    
    Resolves: xen-project/xen#187
    Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

commit 7ab0f83e604d44c92daa218423bf7644502fcefe
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 28 20:20:34 2024 +0100

    x86/pv: Make cr4_pv32_mask be PV32-only
    
    The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
    CONFIG_PV32 build, but right now the variable is unconditionally set up.
    
    To start with, move the setup into set_in_cr4() and remove it from it's
    somewhat ad-hoc position in __start_xen().  This means the variable will be
    set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
    robust logic overall.
    
    With that, there's no good reason for the variable to stay in setup.c.  Move
    it to x86/pv/domain.c (beside opt_pv32, for want of any better place to live),
    and move the declaration to beside set_in_cr4() and mmu_cr4_features which is
    a better position than setup.h.
    
    Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
    comment while at it.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8d336fcb6ea6b486ceccef2e36d003db032131fe
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 30 22:14:20 2023 +0000

    tools/ocaml: Factor out compatiblity handling
    
    ... rather than having each library implement its own subset.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 5e99a40ea54a6bf0bdc18241992866a642d7782b
Author: Victor Lira <victorm.lira@amd.com>
Date:   Thu Aug 29 15:34:23 2024 -0700

    automation: use expect utility in xilinx tests
    
    Fixes: 95764a0817a5 (automation: update xilinx test scripts (tty))
    This patch introduced a CI failure due to a timeout in xilinx-x86_64 test.
    
    Change xilinx-x86_64 and xilinx-arm64 scripts to use "expect" utility
    to determine test result and allow early exit from tests.
    Add "expect" to xilinx container environment (dockerfile).
    Rename references to "QEMU" in "qemu-key.exp" expect script to "TEST" to be
    used by both QEMU and hardware tests.
    
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 740c41ca05a83a2c3629eb2ff323877c37d95c1e
Author: Victor Lira <victorm.lira@amd.com>
Date:   Thu Aug 29 15:34:22 2024 -0700

    automation: fix false success in qemu tests
    
    Fix flaw in qemu-*.sh tests that producess a false success. The following
    lines produces success despite the "expect" script producing nonzero exit
    status:
    
        set +e
    ...
        ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
        (end of file)
    
    The default exit status for a pipeline using "|" operator is that of the
    rightmost command. Fix this by setting the "pipefail" option in the shell,
    and removing "set +e" allowing the expect script to determine the result.
    
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

