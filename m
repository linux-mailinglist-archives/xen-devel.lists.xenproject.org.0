Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F203120F3
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 03:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82294.152074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8a0Y-0000xQ-Dw; Sun, 07 Feb 2021 02:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82294.152074; Sun, 07 Feb 2021 02:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8a0Y-0000wf-2V; Sun, 07 Feb 2021 02:41:06 +0000
Received: by outflank-mailman (input) for mailman id 82294;
 Sun, 07 Feb 2021 02:41:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8a0V-0000wH-KW; Sun, 07 Feb 2021 02:41:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8a0V-0000MI-7n; Sun, 07 Feb 2021 02:41:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8a0U-000742-Sb; Sun, 07 Feb 2021 02:41:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l8a0U-0000lF-S6; Sun, 07 Feb 2021 02:41:02 +0000
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
	bh=FMGPEN/Gj+W5tZJ0TjKwQrr0VZTummbpJQ/UiDsDodQ=; b=BNH83XXSoTFxDDrZCXmy0l0sku
	b2Nad1yTYvGBvALzHCUU72lIIAuDS9m0bBMN5eQ4BdIeelUh0C0568PRIlQ1DolHaX78T1GItLaod
	4NsRsIhNfMoWANDqVthkjNKpDa6IwgASP4k3+OruLKN9yTMxfigzGgd1zKUvIR+9b1T4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159052-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 159052: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-1:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    xen-4.12-testing:build-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-livepatch:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-raw:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-livepatch:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-3:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-pvshim:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-pygrub:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-3:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-livepatch:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit1:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-livepatch:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-raw:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:host-install(5):broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-1:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-2:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-shadow:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:host-install(5):broken:regression
    xen-4.12-testing:build-i386-xsm:host-install(4):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-pair:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-amd64-pair:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-i386-pair:host-install/src_host(6):broken:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-i386-pair:host-install/dst_host(7):broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-i386-xl:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:regression
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:guest-start:fail:regression
    xen-4.12-testing:test-armhf-armhf-xl-vhd:guest-start:fail:regression
    xen-4.12-testing:test-armhf-armhf-xl-arndale:debian-fixup:fail:regression
    xen-4.12-testing:test-amd64-amd64-xl-rtds:host-install(5):broken:allowable
    xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8d26cdd3b66ab86d560dacd763d76ff3da95723e
X-Osstest-Versions-That:
    xen=cce7cbd986c122a86582ff3775b6b559d877407c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Feb 2021 02:41:02 +0000

flight 159052 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159052/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>                 broken
 test-xtf-amd64-amd64-1          <job status>                 broken
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-amd64-i386-freebsd10-amd64    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
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
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-i386-xl-shadow       <job status>                 broken
 test-amd64-i386-xl-raw          <job status>                 broken
 test-amd64-i386-freebsd10-i386    <job status>                 broken
 test-amd64-i386-libvirt         <job status>                 broken
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-livepatch       <job status>                 broken
 test-amd64-i386-migrupgrade     <job status>                 broken
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
 test-xtf-amd64-amd64-3          <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-amd64-amd64-xl-xsm       5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-pvshim    5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemut-ws16-amd64  5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-amd64-pvgrub  5 host-install(5)       broken REGR. vs. 158556
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl-pvshim     5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-pygrub       5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-libvirt-xsm  5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken REGR. vs. 158556
 test-xtf-amd64-amd64-3        5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemut-win7-amd64  5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)       broken REGR. vs. 158556
 test-amd64-i386-qemuu-rhel6hvm-amd  5 host-install(5)  broken REGR. vs. 158556
 test-amd64-i386-livepatch     5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-ovmf-amd64  5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-libvirt       5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qcow2     5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-libvirt      5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-qemut-rhel6hvm-amd  5 host-install(5)  broken REGR. vs. 158556
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)     broken REGR. vs. 158556
 test-amd64-amd64-xl-credit1   5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-multivcpu  5 host-install(5)       broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-livepatch    5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-xl-raw        5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl           5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken REGR. vs. 158556
 test-xtf-amd64-amd64-4        5 host-install(5)        broken REGR. vs. 158556
 test-xtf-amd64-amd64-1        5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-qemuu-nested-intel  5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 158556
 test-xtf-amd64-amd64-2        5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-win7-amd64  5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl-shadow     5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-freebsd10-i386  5 host-install(5)      broken REGR. vs. 158556
 test-amd64-i386-xl-qemuu-ws16-amd64  5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-qemut-rhel6hvm-intel 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-i386-pvgrub  5 host-install(5)        broken REGR. vs. 158556
 test-amd64-i386-freebsd10-amd64  5 host-install(5)     broken REGR. vs. 158556
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-libvirt-vhd  5 host-install(5)        broken REGR. vs. 158556
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-migrupgrade 6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-amd64-migrupgrade 6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-amd64-migrupgrade 7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken REGR. vs. 158556
 test-amd64-amd64-pair       6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-amd64-pair       7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-i386-libvirt-pair 6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-i386-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-i386-pair        6 host-install/src_host(6) broken REGR. vs. 158556
 test-amd64-i386-migrupgrade 7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-i386-pair        7 host-install/dst_host(7) broken REGR. vs. 158556
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 158556
 test-amd64-i386-xl            5 host-install(5)        broken REGR. vs. 158556
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)   broken REGR. vs. 158556
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken REGR. vs. 158556
 test-armhf-armhf-libvirt-raw 13 guest-start              fail REGR. vs. 158556
 test-armhf-armhf-xl-vhd      13 guest-start              fail REGR. vs. 158556
 test-armhf-armhf-xl-arndale  13 debian-fixup             fail REGR. vs. 158556

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      5 host-install(5)        broken REGR. vs. 158556

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 158556
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  8d26cdd3b66ab86d560dacd763d76ff3da95723e
baseline version:
 xen                  cce7cbd986c122a86582ff3775b6b559d877407c

Last test of basis   158556  2021-01-21 15:37:26 Z   16 days
Failing since        159017  2021-02-04 15:06:13 Z    2 days    2 attempts
Testing same since   159052  2021-02-05 18:27:22 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
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
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      broken  
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    broken  
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  broken  
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
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       broken  
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    broken  
 test-arm64-arm64-xl-thunderx                                 pass    
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

broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-amd64-xl-xsm broken
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
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-i386-xl-shadow broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-i386-livepatch broken
broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-amd64-pvgrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-i386-xl-pvshim host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-xtf-amd64-amd64-3 host-install(5)
broken-step test-amd64-i386-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(5)
broken-step test-amd64-i386-livepatch host-install(5)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-i386-libvirt host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-amd host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-livepatch host-install(5)
broken-step test-amd64-i386-xl-raw host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-intel host-install(5)
broken-step test-xtf-amd64-amd64-4 host-install(5)
broken-step test-xtf-amd64-amd64-1 host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-xtf-amd64-amd64-2 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-i386-xl-shadow host-install(5)
broken-step test-amd64-i386-freebsd10-i386 host-install(5)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-intel host-install(5)
broken-step test-amd64-amd64-i386-pvgrub host-install(5)
broken-step test-amd64-i386-freebsd10-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step build-i386-xsm host-install(4)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-i386-migrupgrade host-install/src_host(6)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(6)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-i386-libvirt-pair host-install/src_host(6)
broken-step test-amd64-i386-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-i386-pair host-install/src_host(6)
broken-step test-amd64-i386-migrupgrade host-install/dst_host(7)
broken-step test-amd64-i386-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-i386-xl host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)

Not pushing.

------------------------------------------------------------
commit 8d26cdd3b66ab86d560dacd763d76ff3da95723e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 08:52:54 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again, part 2)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f1f322610718c40680ac09e66f6c82e69c78ba3a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 15:39:45 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Reported-by: James Dingwall <james@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

