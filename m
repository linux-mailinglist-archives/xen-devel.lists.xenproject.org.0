Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDD41BD5F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 05:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198570.352118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVQCO-0006mL-Qz; Wed, 29 Sep 2021 03:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198570.352118; Wed, 29 Sep 2021 03:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVQCO-0006kC-LI; Wed, 29 Sep 2021 03:24:00 +0000
Received: by outflank-mailman (input) for mailman id 198570;
 Wed, 29 Sep 2021 03:23:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVQCN-0006k2-TN; Wed, 29 Sep 2021 03:23:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVQCN-0005rh-AZ; Wed, 29 Sep 2021 03:23:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVQCN-00043R-1l; Wed, 29 Sep 2021 03:23:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVQCN-0002yr-1I; Wed, 29 Sep 2021 03:23:59 +0000
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
	bh=hHjy9WVntmWy4XX4GdkY4cv9CIAQVZ5DymJc9b3wx9k=; b=P8gjU7iwxsUvEPxKRcncJL5NC5
	oMnFLmDQgwcn1KNCbasj4SnF+XcZO0i8HgXG4mc6r5JD/o/Fi/7dmLZI3ElOKd937Egg8c9eVTy4e
	dlbi8zJKfWRWufZy4EDtgR6V75NpFIxLUxJFcapxjiC782rsZFyy3VbFg5Xg2XAnPklE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165236-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 165236: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-vhd:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-xsm:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-credit1:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-credit2:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-seattle:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-thunderx:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-vhd:<job status>:broken:regression
    xen-unstable:test-arm64-arm64-xl-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-unstable:build-armhf:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-pair:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-i386-xl:<job status>:broken:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
    xen-unstable:test-amd64-i386-libvirt:<job status>:broken:regression
    xen-unstable:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-libvirt-raw:<job status>:broken:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-livepatch:<job status>:broken:regression
    xen-unstable:test-amd64-i386-migrupgrade:<job status>:broken:regression
    xen-unstable:test-amd64-i386-pair:<job status>:broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:<job status>:broken:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-2:<job status>:broken:regression
    xen-unstable:test-xtf-amd64-amd64-4:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:host-install(5):broken:regression
    xen-unstable:test-amd64-coresched-i386-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-libvirt:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-migrupgrade:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:regression
    xen-unstable:test-xtf-amd64-amd64-4:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-pygrub:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-credit1:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-freebsd10-i386:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-libvirt:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-libvirt-raw:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-pair:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-i386-xl-shadow:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-vhd:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:regression
    xen-unstable:test-arm64-arm64-xl-seattle:host-install(5):broken:regression
    xen-unstable:test-arm64-arm64-xl-vhd:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:regression
    xen-unstable:test-arm64-arm64-xl-credit2:capture-logs(22):broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-pair:host-install/dst_host(7):broken:regression
    xen-unstable:test-arm64-arm64-xl-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-migrupgrade:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-i386-migrupgrade:host-install/dst_host(7):broken:regression
    xen-unstable:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-pair:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-amd64-pair:host-install/dst_host(7):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:regression
    xen-unstable:test-xtf-amd64-amd64-2:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-livepatch:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-libvirt-pair:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-i386-libvirt-pair:host-install/dst_host(7):broken:regression
    xen-unstable:test-arm64-arm64-xl-thunderx:host-install(5):broken:regression
    xen-unstable:build-armhf:host-install(4):broken:regression
    xen-unstable:test-xtf-amd64-amd64-5:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:freebsd-install:fail:regression
    xen-unstable:test-amd64-i386-examine:examine-iommu:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:regression
    xen-unstable:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-rtds:host-install(5):broken:allowable
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-libvirt:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-coresched-i386-xl:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qcow2:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-pygrub:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-rtds:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-i386:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:capture-logs(6):broken:nonblocking
    xen-unstable:test-xtf-amd64-amd64-4:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-shadow:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-credit2:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-credit1:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-coresched-amd64-xl:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-shadow:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvshim:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:capture-logs(6):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:capture-logs(6):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(13):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:capture-logs(19):broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-pair:capture-logs/src_host(8):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-amd64-migrupgrade:capture-logs/src_host(8):broken:nonblocking
    xen-unstable:test-amd64-i386-migrupgrade:capture-logs/dst_host(9):broken:nonblocking
    xen-unstable:test-amd64-amd64-pair:capture-logs/dst_host(9):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:capture-logs(6):broken:nonblocking
    xen-unstable:test-amd64-i386-xl-vhd:capture-logs(6):broken:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1c3ed9c908732d19660fbe83580674d585464d4c
X-Osstest-Versions-That:
    xen=c76cfada1cfad05aaf64ce3ad305c5467650e782
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Sep 2021 03:23:59 +0000

flight 165236 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165236/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-shadow       <job status>                 broken
 test-amd64-i386-xl-vhd          <job status>                 broken
 test-amd64-i386-xl-xsm          <job status>                 broken
 test-arm64-arm64-xl-credit1     <job status>                 broken
 test-arm64-arm64-xl-credit2     <job status>                 broken
 test-arm64-arm64-xl-seattle     <job status>                 broken
 test-arm64-arm64-xl-thunderx    <job status>                 broken
 test-arm64-arm64-xl-vhd         <job status>                 broken
 test-arm64-arm64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 build-armhf                     <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-coresched-i386-xl    <job status>                 broken
 test-amd64-i386-freebsd10-amd64    <job status>                 broken
 test-amd64-i386-freebsd10-i386    <job status>                 broken
 test-amd64-i386-libvirt         <job status>                 broken
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <job status>       broken
 test-amd64-i386-libvirt-raw     <job status>                 broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-i386-livepatch       <job status>                 broken
 test-amd64-i386-migrupgrade     <job status>                 broken
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemut-ws16-amd64  5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)       broken REGR. vs. 164945
 test-amd64-i386-qemut-rhel6hvm-amd  5 host-install(5)  broken REGR. vs. 164945
 test-amd64-coresched-i386-xl  5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-libvirt      5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-migrupgrade 6 host-install/src_host(6) broken REGR. vs. 164945
 test-amd64-amd64-libvirt-vhd  5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-libvirt-xsm  5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)   broken REGR. vs. 164945
 test-xtf-amd64-amd64-4        5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-qemuu-nested-intel  5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl           5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-qcow2     5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-xsm        5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-qemut-rhel6hvm-intel 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-ovmf-amd64  5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-freebsd10-amd64  5 host-install(5)     broken REGR. vs. 164945
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-ws16-amd64  5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-pygrub       5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl-credit1   5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-xsm       5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-pvshim    5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)     broken REGR. vs. 164945
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-freebsd10-i386  5 host-install(5)      broken REGR. vs. 164945
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-libvirt       5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl            5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-libvirt-raw   5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-pvshim     5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-pair        6 host-install/src_host(6) broken REGR. vs. 164945
 test-amd64-i386-xl-shadow     5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-xl-qemuu-win7-amd64  5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-xl-vhd        5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-libvirt-xsm   5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)     broken REGR. vs. 164945
 test-amd64-i386-qemuu-rhel6hvm-amd  5 host-install(5)  broken REGR. vs. 164945
 test-arm64-arm64-xl-seattle   5 host-install(5)        broken REGR. vs. 164945
 test-arm64-arm64-xl-vhd       5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken REGR. vs. 164945
 test-arm64-arm64-xl-credit2  22 capture-logs(22)       broken REGR. vs. 164945
 test-amd64-coresched-amd64-xl  5 host-install(5)       broken REGR. vs. 164945
 test-amd64-i386-pair        7 host-install/dst_host(7) broken REGR. vs. 164945
 test-arm64-arm64-xl-xsm       5 host-install(5)        broken REGR. vs. 164945
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)   broken REGR. vs. 164945
 test-amd64-i386-migrupgrade 6 host-install/src_host(6) broken REGR. vs. 164945
 test-amd64-i386-migrupgrade 7 host-install/dst_host(7) broken REGR. vs. 164945
 test-amd64-amd64-migrupgrade 7 host-install/dst_host(7) broken REGR. vs. 164945
 test-amd64-i386-xl-qemut-win7-amd64  5 host-install(5) broken REGR. vs. 164945
 test-amd64-amd64-pair       6 host-install/src_host(6) broken REGR. vs. 164945
 test-amd64-amd64-pair       7 host-install/dst_host(7) broken REGR. vs. 164945
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken REGR. vs. 164945
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken REGR. vs. 164945
 test-xtf-amd64-amd64-2        5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-livepatch     5 host-install(5)        broken REGR. vs. 164945
 test-amd64-i386-libvirt-pair 6 host-install/src_host(6) broken REGR. vs. 164945
 test-amd64-i386-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 164945
 test-arm64-arm64-xl-thunderx  5 host-install(5)        broken REGR. vs. 164945
 build-armhf                   4 host-install(4)        broken REGR. vs. 164945
 test-xtf-amd64-amd64-5        7 xen-install              fail REGR. vs. 164945
 test-amd64-amd64-qemuu-freebsd12-amd64 12 freebsd-install fail REGR. vs. 164945
 test-amd64-i386-examine      13 examine-iommu            fail REGR. vs. 164945
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 164945
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 164945
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 164945
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 164945
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 164945

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      5 host-install(5)        broken REGR. vs. 164945

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-libvirt       6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-xsm       6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-dom0pvh-xl-amd  6 capture-logs(6)    broken blocked in 164945
 test-amd64-amd64-libvirt-xsm  6 capture-logs(6)       broken blocked in 164945
 test-amd64-coresched-i386-xl  6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-freebsd10-amd64  6 capture-logs(6)    broken blocked in 164945
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-libvirt-xsm   6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-qemut-rhel6hvm-amd  6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemuu-win7-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-xsm        6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-dom0pvh-xl-intel  6 capture-logs(6)  broken blocked in 164945
 test-amd64-amd64-libvirt-vhd  6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-xl-qemut-debianhvm-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-qemuu-ws16-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemuu-ovmf-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-qemuu-win7-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-qcow2     6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-pygrub       6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-xl-pvshim     6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-xl-qemuu-ws16-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-pvhv2-intel  6 capture-logs(6)    broken blocked in 164945
 test-amd64-amd64-qemuu-nested-intel 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl-rtds      6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-qemut-debianhvm-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-freebsd10-i386  6 capture-logs(6)     broken blocked in 164945
 test-amd64-i386-xl            6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-xl-qemut-ws16-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-qemuu-freebsd11-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-qemut-rhel6hvm-intel 6 capture-logs(6) broken blocked in 164945
 test-xtf-amd64-amd64-4        6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-shadow    6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-credit2   6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-credit1   6 capture-logs(6)       broken blocked in 164945
 test-amd64-coresched-amd64-xl  6 capture-logs(6)      broken blocked in 164945
 test-amd64-i386-xl-qemuu-debianhvm-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-amd64-xl           6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-xl-shadow     6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-pvshim    6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-pvhv2-amd  6 capture-logs(6)      broken blocked in 164945
 test-amd64-i386-qemuu-rhel6hvm-amd  6 capture-logs(6) broken blocked in 164945
 test-arm64-arm64-xl-seattle   6 capture-logs(6)       broken blocked in 164945
 test-arm64-arm64-xl-vhd       6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 13 capture-logs(13) broken blocked in 164945
 test-arm64-arm64-xl-credit1  19 capture-logs(19)      broken blocked in 164945
 test-amd64-amd64-xl-qemut-win7-amd64 6 capture-logs(6) broken blocked in 164945
 test-amd64-i386-pair       8 capture-logs/src_host(8) broken blocked in 164945
 test-arm64-arm64-xl-xsm       6 capture-logs(6)       broken blocked in 164945
 test-amd64-amd64-migrupgrade 8 capture-logs/src_host(8) broken blocked in 164945
 test-amd64-i386-migrupgrade 9 capture-logs/dst_host(9) broken blocked in 164945
 test-amd64-amd64-pair      9 capture-logs/dst_host(9) broken blocked in 164945
 test-arm64-arm64-xl-thunderx  6 capture-logs(6)       broken blocked in 164945
 test-amd64-i386-libvirt-raw   6 capture-logs(6)              broken never pass
 test-amd64-i386-xl-vhd        6 capture-logs(6)              broken never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1c3ed9c908732d19660fbe83580674d585464d4c
baseline version:
 xen                  c76cfada1cfad05aaf64ce3ad305c5467650e782

Last test of basis   164945  2021-09-10 21:23:48 Z   18 days
Failing since        164951  2021-09-12 00:14:36 Z   17 days   34 attempts
Testing same since   165236  2021-09-28 16:08:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Wei Chen <wei.chen@arm.com>

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
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       fail    
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           broken  
 test-amd64-coresched-i386-xl                                 broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      broken  
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  broken  
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  broken  
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      broken  
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    broken  
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  broken  
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      broken  
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    broken  
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  broken  
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    broken  
 test-arm64-arm64-xl-thunderx                                 broken  
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-arm64-arm64-xl-vhd                                      broken  
 test-armhf-armhf-xl-vhd                                      blocked 
 test-amd64-i386-xl-vhd                                       broken  


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
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-xl-shadow broken
broken-job test-amd64-i386-xl-vhd broken
broken-job test-amd64-i386-xl-xsm broken
broken-job test-arm64-arm64-xl-credit1 broken
broken-job test-arm64-arm64-xl-credit2 broken
broken-job test-arm64-arm64-xl-seattle broken
broken-job test-arm64-arm64-xl-thunderx broken
broken-job test-arm64-arm64-xl-vhd broken
broken-job test-arm64-arm64-xl-xsm broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-coresched-i386-xl broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-libvirt-raw broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-i386-livepatch broken
broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-step test-amd64-amd64-libvirt capture-logs(6)
broken-step test-amd64-i386-libvirt capture-logs(6)
broken-step test-amd64-i386-libvirt-raw capture-logs(6)
broken-step test-amd64-amd64-xl-xsm capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm capture-logs(6)
broken-step test-amd64-amd64-dom0pvh-xl-amd capture-logs(6)
broken-step test-amd64-amd64-libvirt-xsm capture-logs(6)
broken-step test-amd64-coresched-i386-xl capture-logs(6)
broken-step test-amd64-i386-freebsd10-amd64 capture-logs(6)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm capture-logs(6)
broken-step test-amd64-i386-libvirt-xsm capture-logs(6)
broken-step test-amd64-i386-qemut-rhel6hvm-amd capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 capture-logs(6)
broken-step test-amd64-i386-xl-vhd capture-logs(6)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm capture-logs(6)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm capture-logs(6)
broken-step test-amd64-i386-xl-xsm capture-logs(6)
broken-step test-amd64-amd64-dom0pvh-xl-intel capture-logs(6)
broken-step test-amd64-amd64-libvirt-vhd capture-logs(6)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow capture-logs(6)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict capture-logs(6)
broken-step test-amd64-amd64-xl-qcow2 capture-logs(6)
broken-step test-amd64-amd64-pygrub capture-logs(6)
broken-step test-amd64-i386-xl-pvshim capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl-pvhv2-intel capture-logs(6)
broken-step test-amd64-amd64-qemuu-nested-intel capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm capture-logs(6)
broken-step test-amd64-amd64-xl-rtds capture-logs(6)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict capture-logs(6)
broken-step test-amd64-i386-freebsd10-i386 capture-logs(6)
broken-step test-amd64-i386-xl capture-logs(6)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow capture-logs(6)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 capture-logs(6)
broken-step test-amd64-i386-qemut-rhel6hvm-intel capture-logs(6)
broken-step test-xtf-amd64-amd64-4 capture-logs(6)
broken-step test-amd64-amd64-xl-shadow capture-logs(6)
broken-step test-amd64-amd64-xl-credit2 capture-logs(6)
broken-step test-amd64-amd64-xl-credit1 capture-logs(6)
broken-step test-amd64-coresched-amd64-xl capture-logs(6)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 capture-logs(6)
broken-step test-amd64-amd64-xl capture-logs(6)
broken-step test-amd64-i386-xl-shadow capture-logs(6)
broken-step test-amd64-amd64-xl-pvshim capture-logs(6)
broken-step test-amd64-amd64-xl-pvhv2-amd capture-logs(6)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd capture-logs(6)
broken-step test-arm64-arm64-xl-seattle capture-logs(6)
broken-step test-arm64-arm64-xl-vhd capture-logs(6)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-amd host-install(5)
broken-step test-amd64-coresched-i386-xl host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(6)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-xtf-amd64-amd64-4 host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-i386-xl-xsm host-install(5)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-i386-qemut-rhel6hvm-intel host-install(5)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-i386-freebsd10-amd64 host-install(5)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-i386-freebsd10-i386 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-i386-libvirt host-install(5)
broken-step test-amd64-i386-xl host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-i386-libvirt-raw host-install(5)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-i386-xl-pvshim host-install(5)
broken-step test-amd64-i386-pair host-install/src_host(6)
broken-step test-amd64-i386-xl-shadow host-install(5)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-i386-xl-vhd host-install(5)
broken-step test-amd64-i386-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm capture-logs(13)
broken-step test-arm64-arm64-xl-seattle host-install(5)
broken-step test-arm64-arm64-xl-vhd host-install(5)
broken-step test-arm64-arm64-xl-credit1 capture-logs(19)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 capture-logs(6)
broken-step test-arm64-arm64-xl-credit2 capture-logs(22)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-i386-pair host-install/dst_host(7)
broken-step test-amd64-i386-pair capture-logs/src_host(8)
broken-step test-arm64-arm64-xl-xsm host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-i386-migrupgrade host-install/src_host(6)
broken-step test-amd64-i386-migrupgrade host-install/dst_host(7)
broken-step test-arm64-arm64-xl-xsm capture-logs(6)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(7)
broken-step test-amd64-i386-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-migrupgrade capture-logs/src_host(8)
broken-step test-amd64-i386-qemuu-rhel6hvm-intel host-install(5)
broken-step test-xtf-amd64-amd64-2 host-install(5)
broken-step test-amd64-i386-livepatch host-install(5)
broken-step test-amd64-i386-libvirt-pair host-install/src_host(6)
broken-step test-amd64-i386-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-i386-migrupgrade capture-logs/dst_host(9)
broken-step test-amd64-amd64-pair capture-logs/dst_host(9)
broken-step test-arm64-arm64-xl-thunderx host-install(5)
broken-step test-arm64-arm64-xl-thunderx capture-logs(6)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 1013 lines long.)

