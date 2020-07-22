Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8A22A0B6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 22:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyLJ7-0006tq-QJ; Wed, 22 Jul 2020 20:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/Qh=BB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyLJ5-0006tN-PX
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 20:25:39 +0000
X-Inumbo-ID: 7d7bff18-cc59-11ea-a212-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d7bff18-cc59-11ea-a212-12813bfff9fa;
 Wed, 22 Jul 2020 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ihn2vSdLSXHd02Y9M4dW55OPEV2C4RFjiBd+Mf1w9VA=; b=G0XfLtGu87uWYTbhjqzRqxaES
 Zr/v7FYSgG9AJqT9K1EEx8Z/hItejGzb9+rCHUSThpOzMoqJyeP9WMVXdcDXlsiC2ls4+mOEcn2b8
 iBqIAXX0MRawMcm/debBlyPprqBMyHlnaQVLBhO618UhxgQKVYZ9vw10O6tH9rgdxN/eI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyLIx-0008Mg-F7; Wed, 22 Jul 2020 20:25:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyLIx-0001Z7-2M; Wed, 22 Jul 2020 20:25:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyLIx-0002Ee-1f; Wed, 22 Jul 2020 20:25:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 152123: trouble: preparing/queued
X-Osstest-Failures: xen-4.14-testing:build-i386-libvirt:<none
 executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-libvirt-raw:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-xtf-amd64-amd64-2:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-amd:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-intel:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-coresched-i386-xl:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-freebsd10-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none
 executed>:queued:regression
 xen-4.14-testing:build-arm64-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-freebsd10-i386:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl-thunderx:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-amd64-pvgrub:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-pair:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-livepatch:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-multivcpu:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-pair:<none executed>:queued:regression
 xen-4.14-testing:build-armhf-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-coresched-amd64-xl:<none
 executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-libvirt-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-pair:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-libvirt-pair:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-vhd:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:build-amd64-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none
 executed>:queued:regression
 xen-4.14-testing:test-xtf-amd64-amd64-5:<none executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-multivcpu:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-i386-pvgrub:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none
 executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-qemuu-nested-intel:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
 xen-4.14-testing:test-xtf-amd64-amd64-3:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-libvirt-xsm:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-xtf-amd64-amd64-4:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-pygrub:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-arm64-arm64-xl:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none
 executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-cubietruck:<none
 executed>:queued:regression
 xen-4.14-testing:test-xtf-amd64-amd64-1:<none executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
 xen-4.14-testing:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-migrupgrade:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
 xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-pvhv2-amd:<none
 executed>:queued:regression
 xen-4.14-testing:test-amd64-amd64-xl-pvhv2-intel:<none
 executed>:queued:regression
 xen-4.14-testing:build-amd64-xtf:hosts-allocate:running:regression
 xen-4.14-testing:build-amd64-xsm:hosts-allocate:running:regression
 xen-4.14-testing:build-i386-pvops:hosts-allocate:running:regression
 xen-4.14-testing:build-i386-prev:hosts-allocate:running:regression
 xen-4.14-testing:build-amd64-pvops:hosts-allocate:running:regression
 xen-4.14-testing:build-arm64:hosts-allocate:running:regression
 xen-4.14-testing:build-i386:hosts-allocate:running:regression
 xen-4.14-testing:build-arm64-xsm:hosts-allocate:running:regression
 xen-4.14-testing:build-amd64:hosts-allocate:running:regression
 xen-4.14-testing:build-i386-xsm:hosts-allocate:running:regression
 xen-4.14-testing:build-armhf:hosts-allocate:running:regression
 xen-4.14-testing:build-armhf-pvops:hosts-allocate:running:regression
 xen-4.14-testing:build-arm64-pvops:hosts-allocate:running:regression
 xen-4.14-testing:build-amd64-prev:hosts-allocate:running:regression
X-Osstest-Versions-This: xen=26984f2f432bb880f2bb4954e1248c9c2d1bbd54
X-Osstest-Versions-That: xen=827031adfeb3c2656baa2156d3e7caaea8aec739
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jul 2020 20:25:31 +0000
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

flight 152123 xen-4.14-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/152123/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt              <none executed>              queued
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-xtf-amd64-amd64-2          <none executed>              queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 build-arm64-libvirt             <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-livepatch      <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 build-armhf-libvirt             <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-armhf-armhf-xl             <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-xtf-amd64-amd64-3          <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-arm64-arm64-xl             <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-armhf-armhf-xl-cubietruck    <none executed>              queued
 test-xtf-amd64-amd64-1          <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-migrupgrade    <none executed>              queued
 test-amd64-i386-livepatch       <none executed>              queued
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 build-amd64-xtf               2 hosts-allocate               running
 build-amd64-xsm               2 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 build-i386-prev               2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-arm64                   2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-amd64                   2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 build-armhf                   2 hosts-allocate               running
 build-armhf-pvops             2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-amd64-prev              2 hosts-allocate               running

version targeted for testing:
 xen                  26984f2f432bb880f2bb4954e1248c9c2d1bbd54
baseline version:
 xen                  827031adfeb3c2656baa2156d3e7caaea8aec739

Last test of basis   152081  2020-07-21 16:52:47 Z    1 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Paul Durrant <pdurrant@amazon.com>

jobs:
 build-amd64-xsm                                              preparing
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               preparing
 build-amd64-xtf                                              preparing
 build-amd64                                                  preparing
 build-arm64                                                  preparing
 build-armhf                                                  preparing
 build-i386                                                   preparing
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          queued  
 build-i386-libvirt                                           queued  
 build-amd64-prev                                             preparing
 build-i386-prev                                              preparing
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            preparing
 build-i386-pvops                                             preparing
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          queued  
 test-amd64-i386-xl                                           queued  
 test-amd64-coresched-i386-xl                                 queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      queued  
 test-amd64-i386-xl-xsm                                       queued  
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         queued  
 test-amd64-i386-xl-qemut-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         queued  
 test-amd64-i386-xl-qemut-ws16-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         queued  
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-armhf-armhf-xl-arndale                                  queued  
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  queued  
 test-armhf-armhf-xl-credit2                                  queued  
 test-armhf-armhf-xl-cubietruck                               queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-dom0pvh-xl-intel                            queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-livepatch                                   queued  
 test-amd64-i386-livepatch                                    queued  
 test-amd64-amd64-migrupgrade                                 queued  
 test-amd64-i386-migrupgrade                                  queued  
 test-amd64-amd64-xl-multivcpu                                queued  
 test-armhf-armhf-xl-multivcpu                                queued  
 test-amd64-amd64-pair                                        queued  
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                queued  
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-amd64-pvgrub                                queued  
 test-amd64-amd64-i386-pvgrub                                 queued  
 test-amd64-amd64-xl-pvshim                                   queued  
 test-amd64-i386-xl-pvshim                                    queued  
 test-amd64-amd64-pygrub                                      queued  
 test-amd64-amd64-xl-qcow2                                    queued  
 test-armhf-armhf-libvirt-raw                                 queued  
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     queued  
 test-arm64-arm64-xl-seattle                                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 queued  
 test-amd64-amd64-libvirt-vhd                                 queued  
 test-armhf-armhf-xl-vhd                                      queued  


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

broken-job build-i386-libvirt queued
broken-job test-armhf-armhf-xl-vhd queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-xtf-amd64-amd64-2 queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job build-arm64-libvirt queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-livepatch queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-pair queued
broken-job build-armhf-libvirt queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-xtf-amd64-amd64-5 queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-armhf-armhf-xl queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-xtf-amd64-amd64-3 queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-arm64-arm64-xl queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-armhf-armhf-xl-cubietruck queued
broken-job test-xtf-amd64-amd64-1 queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-migrupgrade queued
broken-job test-amd64-i386-livepatch queued
broken-job test-amd64-amd64-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued

Not pushing.

------------------------------------------------------------
commit 26984f2f432bb880f2bb4954e1248c9c2d1bbd54
Author: Julien Grall <jgrall@amazon.com>
Date:   Wed Jul 22 18:47:10 2020 +0100

    Revert "SUPPORT.md: Set version and release/support dates"
    
    This reverts commit e4670f8b045b11a524171b119d9d4a20bf643367.

commit e4670f8b045b11a524171b119d9d4a20bf643367
Author: Paul Durrant <pdurrant@amazon.com>
Date:   Wed Jul 22 17:55:44 2020 +0100

    SUPPORT.md: Set version and release/support dates
    
    Signed-off-by: Paul Durrant <pdurrant@amazon.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

