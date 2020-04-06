Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD019FB75
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVWr-0000Fd-0j; Mon, 06 Apr 2020 17:27:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zgfQ=5W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jLVWp-0000FY-P8
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:27:19 +0000
X-Inumbo-ID: d9f9d5c6-782b-11ea-800d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9f9d5c6-782b-11ea-800d-12813bfff9fa;
 Mon, 06 Apr 2020 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WH78+oljqyiccsCqsgXH7b2K3uqBVsRSi+g8n7mWBEg=; b=FsinFbfdwlhwcBQbBfbXwe8vu
 j7K+oq9iFMMLvY+RR3He485YzETHLlhJP9uLiPWF27ES4asjXLfRoz/LIaoPHt/OYER6JQqtshAEE
 YsL0kmWsMSQAebkTZda3z3Yl0UtQvj9DphkVcF8p/JLzSavHX200o9xb8ARv1eWWxmZvE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLVWi-0007Sm-4g; Mon, 06 Apr 2020 17:27:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jLVWh-0001Ih-OC; Mon, 06 Apr 2020 17:27:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jLVWh-0003SQ-NY; Mon, 06 Apr 2020 17:27:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149452-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 149452: regressions - trouble: broken/fail/pass
X-Osstest-Failures: linux-linus:test-amd64-i386-freebsd10-amd64:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-pvshim:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-raw:<job status>:broken:regression
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-xsm:<job status>:broken:regression
 linux-linus:test-amd64-i386-libvirt-pair:<job status>:broken:regression
 linux-linus:test-amd64-i386-pair:<job status>:broken:regression
 linux-linus:test-amd64-i386-libvirt:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 linux-linus:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl:<job status>:broken:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:<job
 status>:broken:regression
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:<job status>:broken:regression
 linux-linus:test-amd64-i386-xl-shadow:<job status>:broken:regression
 linux-linus:test-amd64-i386-examine:capture-logs:broken:regression
 linux-linus:test-amd64-amd64-dom0pvh-xl-intel:capture-logs(16):broken:regression
 linux-linus:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-examine:reboot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/src_host:fail:regression
 linux-linus:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-raw:xen-boot:fail:regression
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-xsm:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
 linux-linus:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
 linux-linus:test-amd64-i386-xl-pvshim:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-freebsd10-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-libvirt:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-shadow:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-libvirt-pair:capture-logs/src_host(12):broken:nonblocking
 linux-linus:test-amd64-i386-libvirt-pair:capture-logs/dst_host(13):broken:nonblocking
 linux-linus:test-amd64-i386-pair:capture-logs/src_host(12):broken:nonblocking
 linux-linus:test-amd64-i386-pair:capture-logs/dst_host(13):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-raw:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-freebsd10-i386:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-i386-xl-xsm:capture-logs(8):broken:nonblocking
 linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-saverestore:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=a10c9c710f9ecea87b9f4bbb837467893b4bef01
X-Osstest-Versions-That: linux=458ef2a25e0cbdc216012aa2b9cf549d64133b08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Apr 2020 17:27:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149452 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149452/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>                broken
 test-amd64-i386-freebsd10-i386    <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-raw          <job status>                 broken
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <job status>       broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-xsm          <job status>                 broken
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-libvirt         <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 test-amd64-i386-qemut-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-shadow       <job status>                 broken
 test-amd64-i386-examine       9 capture-logs           broken REGR. vs. 149238
 test-amd64-amd64-dom0pvh-xl-intel 16 capture-logs(16)  broken REGR. vs. 149238
 test-amd64-i386-xl-pvshim     7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-boot          fail REGR. vs. 149238
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 149238
 test-amd64-i386-freebsd10-amd64  7 xen-boot              fail REGR. vs. 149238
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 149238
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-boot     fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-boot          fail REGR. vs. 149238
 test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-xl-shadow     7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-boot fail REGR. vs. 149238
 test-amd64-i386-libvirt-pair 10 xen-boot/src_host        fail REGR. vs. 149238
 test-amd64-i386-libvirt-pair 11 xen-boot/dst_host        fail REGR. vs. 149238
 test-amd64-i386-pair         10 xen-boot/src_host        fail REGR. vs. 149238
 test-amd64-i386-pair         11 xen-boot/dst_host        fail REGR. vs. 149238
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-boot          fail REGR. vs. 149238
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  7 xen-boot  fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-boot     fail REGR. vs. 149238
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-boot         fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-boot fail REGR. vs. 149238
 test-amd64-i386-libvirt-xsm   7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 149238
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 149238
 test-amd64-i386-xl            7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-xl-raw        7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-boot           fail REGR. vs. 149238
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail REGR. vs. 149238
 test-amd64-i386-xl-xsm        7 xen-boot                 fail REGR. vs. 149238
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-boot          fail REGR. vs. 149238
 test-amd64-i386-freebsd10-i386  7 xen-boot               fail REGR. vs. 149238
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-boot          fail REGR. vs. 149238

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    16 guest-start/debian.repeat fail REGR. vs. 149238

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim     8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-xl-qemuu-ws16-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-qemuu-rhel6hvm-intel 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-freebsd10-amd64  8 capture-logs(8)    broken blocked in 149238
 test-amd64-i386-xl-qemut-debianhvm-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemuu-ovmf-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-libvirt       8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-xl-shadow     8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-libvirt-pair 12 capture-logs/src_host(12) broken blocked in 149238
 test-amd64-i386-libvirt-pair 13 capture-logs/dst_host(13) broken blocked in 149238
 test-amd64-i386-pair     12 capture-logs/src_host(12) broken blocked in 149238
 test-amd64-i386-pair     13 capture-logs/dst_host(13) broken blocked in 149238
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemuu-debianhvm-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-qemut-rhel6hvm-intel 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-libvirt-xsm   8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-xl-qemut-ws16-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl            8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-xl-raw        8 capture-logs(8)       broken blocked in 149238
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-qemuu-win7-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-freebsd10-i386  8 capture-logs(8)     broken blocked in 149238
 test-amd64-i386-xl-qemut-win7-amd64 8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-qemut-rhel6hvm-amd  8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-qemuu-rhel6hvm-amd  8 capture-logs(8) broken blocked in 149238
 test-amd64-i386-xl-xsm        8 capture-logs(8)       broken blocked in 149238
 test-amd64-amd64-dom0pvh-xl-intel 15 guest-saverestore        fail like 149238
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 149238
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149238
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149238
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149238
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149238
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149238
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149238
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                a10c9c710f9ecea87b9f4bbb837467893b4bef01
baseline version:
 linux                458ef2a25e0cbdc216012aa2b9cf549d64133b08

Last test of basis   149238  2020-03-31 07:17:53 Z    6 days
Failing since        149266  2020-04-01 03:55:53 Z    5 days    7 attempts
Testing same since   149452  2020-04-06 01:54:46 Z    0 days    1 attempts

------------------------------------------------------------
1640 people touched revisions under test,
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
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         broken  
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      broken  
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 broken  
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       broken  
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    broken  
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-qemut-rhel6hvm-intel broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-shadow broken
broken-step test-amd64-i386-examine capture-logs
broken-step test-amd64-i386-xl-pvshim capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 capture-logs(8)
broken-step test-amd64-i386-qemuu-rhel6hvm-intel capture-logs(8)
broken-step test-amd64-i386-freebsd10-amd64 capture-logs(8)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 capture-logs(8)
broken-step test-amd64-i386-libvirt capture-logs(8)
broken-step test-amd64-i386-xl-shadow capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict capture-logs(8)
broken-step test-amd64-i386-libvirt-pair capture-logs/src_host(12)
broken-step test-amd64-i386-libvirt-pair capture-logs/dst_host(13)
broken-step test-amd64-i386-pair capture-logs/src_host(12)
broken-step test-amd64-i386-pair capture-logs/dst_host(13)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 capture-logs(8)
broken-step test-amd64-i386-qemut-rhel6hvm-intel capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow capture-logs(8)
broken-step test-amd64-i386-libvirt-xsm capture-logs(8)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 capture-logs(8)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm capture-logs(8)
broken-step test-amd64-i386-xl capture-logs(8)
broken-step test-amd64-i386-xl-raw capture-logs(8)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm capture-logs(8)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 capture-logs(8)
broken-step test-amd64-i386-freebsd10-i386 capture-logs(8)
broken-step test-amd64-i386-xl-qemut-win7-amd64 capture-logs(8)
broken-step test-amd64-i386-qemut-rhel6hvm-amd capture-logs(8)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd capture-logs(8)
broken-step test-amd64-i386-xl-xsm capture-logs(8)
broken-step test-amd64-amd64-dom0pvh-xl-intel capture-logs(16)

Not pushing.

(No revision log; it would be 187263 lines long.)

