Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879C3164E3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83537.155704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nUK-00088g-9x; Wed, 10 Feb 2021 11:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83537.155704; Wed, 10 Feb 2021 11:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nUK-00088B-5M; Wed, 10 Feb 2021 11:16:52 +0000
Received: by outflank-mailman (input) for mailman id 83537;
 Wed, 10 Feb 2021 11:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nUI-00087w-Le; Wed, 10 Feb 2021 11:16:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nUI-0007q3-Cz; Wed, 10 Feb 2021 11:16:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nUI-0000Uc-57; Wed, 10 Feb 2021 11:16:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nUI-0005sP-4a; Wed, 10 Feb 2021 11:16:50 +0000
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
	bh=r/u1gg3xQw4rEIpEsZNUS8xRb3lPJnLFodcoe/Alx9U=; b=IGZEAoyKaMJRx4NsHJ6EkMarwx
	NF8s86U/eLKOLrUK3oXbYvxDvFwVIHaFCBhiT/1koDLj32l4BsRc26fQiEDA/fTAE56+7asmYZGYp
	tbso+HIKikSHVF1FXpVAhVcQtCM56Z9ZqZxydXmt6fzN6IsWL9ZOvN0iC+/Gff4Gbhzc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 159187: regressions - trouble: fail/pass/preparing/queued
X-Osstest-Failures:
    xen-4.12-testing:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-livepatch:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-4.12-testing:build-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-1:<job status>:broken:regression
    xen-4.12-testing:test-xtf-amd64-amd64-3:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-libvirt:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-raw:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-livepatch:<job status>:broken:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-shadow:<job status>:broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.12-testing:build-i386-xsm:host-install(4):broken:regression
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:guest-start:fail:regression
    xen-4.12-testing:test-armhf-armhf-xl-vhd:guest-start:fail:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-armhf-armhf-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-4.12-testing:build-i386-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.12-testing:build-armhf-libvirt:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    xen-4.12-testing:build-i386-pvops:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    xen-4.12-testing:build-i386-prev:hosts-allocate:running:regression
    xen-4.12-testing:build-i386-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:hosts-allocate:running:regression
    xen-4.12-testing:build-i386:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:hosts-allocate:running:regression
    xen-4.12-testing:test-xtf-amd64-amd64-3:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    xen-4.12-testing:test-xtf-amd64-amd64-2:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl:hosts-allocate:running:regression
    xen-4.12-testing:test-xtf-amd64-amd64-5:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-livepatch:hosts-allocate:running:regression
    xen-4.12-testing:test-xtf-amd64-amd64-1:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-pair:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-pvshim:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-pygrub:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-shadow:host-install(5):broken:heisenbug
    xen-4.12-testing:test-xtf-amd64-amd64-3:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-livepatch:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-libvirt:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-credit1:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-livepatch:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-raw:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl:host-install(5):broken:heisenbug
    xen-4.12-testing:test-xtf-amd64-amd64-4:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:heisenbug
    xen-4.12-testing:test-xtf-amd64-amd64-1:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    xen-4.12-testing:test-xtf-amd64-amd64-2:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-shadow:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-rtds:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-migrupgrade:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-pair:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-pair:host-install/src_host(6):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/dst_host(7):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-i386-xl:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:heisenbug
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:heisenbug
    xen-4.12-testing:test-armhf-armhf-xl-arndale:debian-fixup:fail:heisenbug
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:debian-di-install:fail:heisenbug
    xen-4.12-testing:test-armhf-armhf-xl-vhd:debian-di-install:fail:heisenbug
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
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
    xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8d26cdd3b66ab86d560dacd763d76ff3da95723e
X-Osstest-Versions-That:
    xen=cce7cbd986c122a86582ff3775b6b559d877407c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:16:50 +0000

flight 159187 xen-4.12-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159187/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit1     <job status>                 broken  in 159052
 test-amd64-amd64-pair           <job status>                 broken  in 159052
 test-amd64-amd64-migrupgrade    <job status>                 broken  in 159052
 test-amd64-amd64-livepatch      <job status>                 broken  in 159052
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>        broken in 159052
 test-amd64-i386-pair            <job status>                 broken  in 159052
 test-amd64-i386-xl              <job status>                 broken  in 159052
 test-amd64-amd64-libvirt-pair    <job status>                 broken in 159052
 test-xtf-amd64-amd64-2          <job status>                 broken  in 159052
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>          broken in 159052
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>            broken in 159052
 test-amd64-i386-freebsd10-amd64    <job status>               broken in 159052
 test-amd64-i386-freebsd10-i386    <job status>                broken in 159052
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>          broken in 159052
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm <job status> broken in 159052
 test-amd64-amd64-xl-credit2     <job status>                 broken  in 159052
 test-amd64-amd64-qemuu-nested-intel    <job status>           broken in 159052
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  <job status> broken in 159052
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>          broken in 159052
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>     broken in 159052
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 159052
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm <job status> broken in 159052
 test-amd64-amd64-libvirt        <job status>                 broken  in 159052
 test-amd64-amd64-xl             <job status>                 broken  in 159052
 test-amd64-amd64-qemuu-nested-amd    <job status>             broken in 159052
 test-amd64-amd64-libvirt-xsm    <job status>                 broken  in 159052
 build-i386-xsm                  <job status>                 broken  in 159052
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>           broken in 159052
 test-amd64-amd64-libvirt-vhd    <job status>                 broken  in 159052
 test-amd64-i386-xl-qemut-win7-amd64    <job status>           broken in 159052
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow <job status> broken in 159052
 test-amd64-i386-libvirt-pair    <job status>                 broken  in 159052
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>  broken in 159052
 test-amd64-amd64-pygrub         <job status>                 broken  in 159052
 test-amd64-amd64-i386-pvgrub    <job status>                 broken  in 159052
 test-xtf-amd64-amd64-4          <job status>                 broken  in 159052
 test-xtf-amd64-amd64-1          <job status>                 broken  in 159052
 test-xtf-amd64-amd64-3          <job status>                 broken  in 159052
 test-amd64-i386-xl-pvshim       <job status>                 broken  in 159052
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>      broken in 159052
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>          broken in 159052
 test-amd64-i386-migrupgrade     <job status>                 broken  in 159052
 test-amd64-i386-libvirt         <job status>                 broken  in 159052
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>          broken in 159052
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 159052
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>  broken in 159052
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>          broken in 159052
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>     broken in 159052
 test-amd64-amd64-xl-qcow2       <job status>                 broken  in 159052
 test-amd64-amd64-xl-pvshim      <job status>                 broken  in 159052
 test-amd64-amd64-xl-pvhv2-intel    <job status>               broken in 159052
 test-amd64-amd64-xl-multivcpu    <job status>                 broken in 159052
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken in 159052
 test-amd64-amd64-xl-xsm         <job status>                 broken  in 159052
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken in 159052
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>        broken in 159052
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>           broken in 159052
 test-amd64-i386-xl-raw          <job status>                 broken  in 159052
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>            broken in 159052
 test-amd64-amd64-xl-rtds        <job status>                 broken  in 159052
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>          broken in 159052
 test-amd64-i386-livepatch       <job status>                 broken  in 159052
 test-amd64-amd64-xl-shadow      <job status>                 broken  in 159052
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>           broken in 159052
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>           broken in 159052
 test-amd64-i386-xl-shadow       <job status>                 broken  in 159052
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>      broken in 159052
 build-i386-xsm             4 host-install(4) broken in 159052 REGR. vs. 158556
 test-armhf-armhf-libvirt-raw 13 guest-start    fail in 159052 REGR. vs. 158556
 test-armhf-armhf-xl-vhd      13 guest-start    fail in 159052 REGR. vs. 158556
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-livepatch       <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 build-armhf-libvirt           2 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 build-i386-prev               2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate   running
 test-armhf-armhf-xl-cubietruck  3 hosts-allocate               running
 test-amd64-amd64-migrupgrade  4 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate         running
 test-xtf-amd64-amd64-4        3 hosts-allocate               running
 test-xtf-amd64-amd64-3        3 hosts-allocate               running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-i386-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-amd64-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-xtf-amd64-amd64-2        3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-xtf-amd64-amd64-5        3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-livepatch    3 hosts-allocate               running
 test-xtf-amd64-amd64-1        3 hosts-allocate               running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 hosts-allocate running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-xsm      5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-pvshim   5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemut-ws16-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-amd64-pvgrub 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-pvshim    5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-pygrub      5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt-xsm 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-debianhvm-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-shadow   5 host-install(5) broken in 159052 pass in 159131
 test-xtf-amd64-amd64-3       5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-qemuu-rhel6hvm-amd 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemut-win7-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-pvhv2-amd 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-livepatch    5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-libvirt      5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt     5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qcow2    5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-qemut-rhel6hvm-amd 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-credit1  5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-pvhv2-intel 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-multivcpu 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-livepatch   5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-raw       5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl          5 host-install(5) broken in 159052 pass in 159131
 test-xtf-amd64-amd64-4       5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-qemuu-nested-intel 5 host-install(5) broken in 159052 pass in 159131
 test-xtf-amd64-amd64-1       5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-credit2  5 host-install(5) broken in 159052 pass in 159131
 test-xtf-amd64-amd64-2       5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-win7-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-shadow    5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-freebsd10-i386 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemuu-ws16-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-qemut-rhel6hvm-intel 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-i386-pvgrub 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-freebsd10-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt-vhd 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-xl-rtds     5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-migrupgrade 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-amd64-migrupgrade 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-amd64-migrupgrade 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-pair 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-amd64-pair 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-i386-libvirt-pair 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-i386-libvirt-pair 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-i386-pair 6 host-install/src_host(6) broken in 159052 pass in 159131
 test-amd64-i386-pair 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-i386-migrupgrade 7 host-install/dst_host(7) broken in 159052 pass in 159131
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-i386-xl           5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-qemuu-nested-amd 5 host-install(5) broken in 159052 pass in 159131
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken in 159052 pass in 159131
 test-armhf-armhf-xl-arndale  13 debian-fixup     fail in 159052 pass in 159131
 test-armhf-armhf-libvirt-raw 12 debian-di-install fail in 159131 pass in 159052
 test-armhf-armhf-xl-vhd      12 debian-di-install          fail pass in 159052

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-xsm   1 build-check(1)           blocked in 159052 n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 159052 n/a
 test-amd64-i386-xl-xsm        1 build-check(1)           blocked in 159052 n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked in 159052 n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 1 build-check(1) blocked in 159052 n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 159052 n/a
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 159052 like 158556
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check fail in 159052 never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check fail in 159052 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 159052 never pass
 test-amd64-amd64-xl-qcow2 19 guest-localmigrate/x10 fail in 159131 like 158556
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop   fail in 159131 like 158556
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 159131 like 158556
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop  fail in 159131 like 158556
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop   fail in 159131 like 158556
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop  fail in 159131 like 158556
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop   fail in 159131 like 158556
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 159131 like 158556
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop   fail in 159131 like 158556
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail in 159131 like 158556
 test-amd64-i386-xl-pvshim    14 guest-start          fail in 159131 never pass
 test-amd64-amd64-libvirt    15 migrate-support-check fail in 159131 never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 159131 never pass
 test-amd64-i386-libvirt     15 migrate-support-check fail in 159131 never pass
 test-amd64-i386-libvirt-xsm 15 migrate-support-check fail in 159131 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 159131 never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 159131 never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check fail in 159131 never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
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
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8d26cdd3b66ab86d560dacd763d76ff3da95723e
baseline version:
 xen                  cce7cbd986c122a86582ff3775b6b559d877407c

Last test of basis   158556  2021-01-21 15:37:26 Z   19 days
Failing since        159017  2021-02-04 15:06:13 Z    5 days    4 attempts
Testing same since   159052  2021-02-05 18:27:22 Z    4 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               preparing
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   preparing
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          preparing
 build-i386-libvirt                                           queued  
 build-amd64-prev                                             pass    
 build-i386-prev                                              preparing
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             preparing
 test-xtf-amd64-amd64-1                                       preparing
 test-xtf-amd64-amd64-2                                       preparing
 test-xtf-amd64-amd64-3                                       preparing
 test-xtf-amd64-amd64-4                                       preparing
 test-xtf-amd64-amd64-5                                       preparing
 test-amd64-amd64-xl                                          preparing
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           preparing
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        preparing
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-libvirt-xsm                                 preparing
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       queued  
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemut-debianhvm-amd64                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       preparing
 test-amd64-amd64-qemuu-freebsd12-amd64                       preparing
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         preparing
 test-amd64-i386-xl-qemut-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         preparing
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         preparing
 test-amd64-i386-xl-qemut-ws16-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         preparing
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  preparing
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               preparing
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-livepatch                                   preparing
 test-amd64-i386-livepatch                                    queued  
 test-amd64-amd64-migrupgrade                                 preparing
 test-amd64-i386-migrupgrade                                  queued  
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        preparing
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                preparing
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-amd64-pvgrub                                preparing
 test-amd64-amd64-i386-pvgrub                                 preparing
 test-amd64-amd64-xl-pvshim                                   preparing
 test-amd64-i386-xl-pvshim                                    queued  
 test-amd64-amd64-pygrub                                      preparing
 test-amd64-amd64-xl-qcow2                                    preparing
 test-armhf-armhf-libvirt-raw                                 queued  
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 preparing
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

broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job build-i386-libvirt queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-livepatch queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job build-i386-xsm broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-livepatch broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-shadow broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken

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

