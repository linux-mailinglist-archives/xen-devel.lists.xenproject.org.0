Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C02B53A2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 22:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28622.57685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kelsY-0003vt-Ln; Mon, 16 Nov 2020 21:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28622.57685; Mon, 16 Nov 2020 21:17:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kelsY-0003vT-Hj; Mon, 16 Nov 2020 21:17:38 +0000
Received: by outflank-mailman (input) for mailman id 28622;
 Mon, 16 Nov 2020 21:17:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14IB=EW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kelsX-0003vO-7p
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 21:17:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5d54e00-5d0f-4dfb-8b29-b849479ae93a;
 Mon, 16 Nov 2020 21:17:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kelsT-0005Vi-4S; Mon, 16 Nov 2020 21:17:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kelsS-0006xB-Lg; Mon, 16 Nov 2020 21:17:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kelsS-00074O-LC; Mon, 16 Nov 2020 21:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=14IB=EW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kelsX-0003vO-7p
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 21:17:37 +0000
X-Inumbo-ID: e5d54e00-5d0f-4dfb-8b29-b849479ae93a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e5d54e00-5d0f-4dfb-8b29-b849479ae93a;
	Mon, 16 Nov 2020 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=HL99z43OlAHj3rNWax7Z6lCbejtsAA9F5v3bzWcKixs=; b=Xih8mrZuS56bMdvEVGC2hgfyRT
	11qSq/s0BzNn9OOofqmVeerEqQSYtRfO9YRJuZ1V9Kv0+u71nrSj9OKoMyxqZiE6mT34RtDVpTEJW
	y2mCLd9veKsN8BzinnOGzdOSVoRab+ylbkLOjNPxvCxeooweenhHa9hlta8kMth2i9Oo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kelsT-0005Vi-4S; Mon, 16 Nov 2020 21:17:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kelsS-0006xB-Lg; Mon, 16 Nov 2020 21:17:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kelsS-00074O-LC; Mon, 16 Nov 2020 21:17:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156819-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 156819: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:build-amd64-xsm:xen-build:fail:regression
    linux-linus:build-i386:xen-build:fail:regression
    linux-linus:build-i386-xsm:xen-build:fail:regression
    linux-linus:build-amd64:xen-build:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt:xen-install:fail:regression
    linux-linus:test-amd64-i386-examine:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-libvirt-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-pvshim:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-raw:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-i386:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-coresched-i386-xl:xen-install:fail:regression
    linux-linus:test-arm64-arm64-examine:examine-iommu:fail:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:guest-stop:fail:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:guest-stop:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:build-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:leak-check/basis(11):fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:leak-check/basis(11):fail:nonblocking
    linux-linus:test-arm64-arm64-xl:leak-check/basis(11):fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=09162bc32c880a791c6c0668ce0745cf7958f576
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Nov 2020 21:17:32 +0000

flight 156819 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156819/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 152332
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152332
 build-i386                    6 xen-build                fail REGR. vs. 152332
 build-i386-xsm                6 xen-build                fail REGR. vs. 152332
 build-amd64                   6 xen-build                fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-cubietruck  8 xen-boot               fail REGR. vs. 152332
 test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 152332
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 152332
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-intel 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-xsm        7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-examine       6 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl            7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-pair   10 xen-install/src_host fail in 156815 REGR. vs. 152332
 test-amd64-i386-pair   11 xen-install/dst_host fail in 156815 REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-install  fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-install    fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail in 156815 REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-install/src_host fail in 156815 REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host fail in 156815 REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-install    fail in 156815 REGR. vs. 152332
 test-arm64-arm64-examine     13 examine-iommu  fail in 156815 REGR. vs. 152332
 test-amd64-amd64-amd64-pvgrub 20 guest-stop    fail in 156815 REGR. vs. 152332
 test-amd64-amd64-i386-pvgrub 20 guest-stop     fail in 156815 REGR. vs. 152332
 test-armhf-armhf-xl-credit2   8 xen-boot       fail in 156815 REGR. vs. 152332

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-credit1   8 xen-boot         fail in 156815 pass in 156819
 test-arm64-arm64-xl           8 xen-boot         fail in 156815 pass in 156819
 test-arm64-arm64-xl-seattle   8 xen-boot         fail in 156815 pass in 156819
 test-arm64-arm64-examine      8 reboot                     fail pass in 156815

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-arm64-arm64-xl-seattle  11 leak-check/basis(11)    fail blocked in 152332
 test-arm64-arm64-xl-credit1  11 leak-check/basis(11)    fail blocked in 152332
 test-arm64-arm64-xl          11 leak-check/basis(11)    fail blocked in 152332
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop  fail in 156815 like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 156815 like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop  fail in 156815 like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 156815 like 152332
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail in 156815 like 152332
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 156815 never pass
 test-amd64-amd64-libvirt    15 migrate-support-check fail in 156815 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 156815 never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check fail in 156815 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2   3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                09162bc32c880a791c6c0668ce0745cf7958f576
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  108 days
Failing since        152366  2020-08-01 20:49:34 Z  107 days  177 attempts
Testing same since   156815  2020-11-16 02:08:16 Z    0 days    2 attempts

------------------------------------------------------------
3520 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     fail    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
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


Not pushing.

(No revision log; it would be 672911 lines long.)

