Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9631F069E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 14:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhYOl-0000PT-0v; Sat, 06 Jun 2020 12:58:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUo7=7T=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhYOi-0000PM-SX
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 12:58:04 +0000
X-Inumbo-ID: 578ad8a2-a7f5-11ea-b0e0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 578ad8a2-a7f5-11ea-b0e0-12813bfff9fa;
 Sat, 06 Jun 2020 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pqe0TdNrUbVAh/80q4Dgk+MQ8QlJ1NooTj222jvok1k=; b=Ycy4gkvaRuhb7DO20BXyXoRCJ
 NZpLAmg3y+gvpe+tApv6kxJquyxdb6xHSHcDQtipVdqXBbt9Tqh2HCbBt88YDDa3hDPCqhvXaRFyy
 BNwrTaEYDjPwmwaO9ThjcOLw9yU1KCZxLkaXlqOYgKTyjmOH2pucQWLEjkTCwej268awc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhYOa-0005J7-Bh; Sat, 06 Jun 2020 12:57:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhYOZ-0004AR-6d; Sat, 06 Jun 2020 12:57:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhYOZ-0004zt-62; Sat, 06 Jun 2020 12:57:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150876-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 150876: regressions - trouble:
 blocked/broken/fail/pass
X-Osstest-Failures: xen-unstable:test-amd64-amd64-xl-multivcpu:<job
 status>:broken:regression
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 xen-unstable:test-amd64-coresched-amd64-xl:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-migrupgrade:<job status>:broken:regression
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
 xen-unstable:test-amd64-i386-xl-xsm:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-xsm:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
 xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
 xen-unstable:build-arm64-libvirt:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-rtds:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-shadow:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-unstable:test-amd64-amd64-pair:<job status>:broken:regression
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:<job
 status>:broken:regression
 xen-unstable:build-arm64-libvirt:host-install(4):broken:regression
 xen-unstable:build-i386:xen-build:fail:regression
 xen-unstable:build-arm64-pvops:kernel-build:fail:regression
 xen-unstable:build-armhf:xen-build:fail:regression
 xen-unstable:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
 xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-xl-seattle:build-check(1):running:regression
 xen-unstable:build-armhf-libvirt:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-examine:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-xl:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):running:regression
 xen-unstable:test-armhf-armhf-libvirt:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):running:regression
 xen-unstable:test-arm64-arm64-examine:build-check(1):running:regression
 xen-unstable:build-arm64-libvirt:syslog-server:running:regression
 xen-unstable:build-arm64-pvops:syslog-server:running:regression
 xen-unstable:build-armhf:syslog-server:running:regression
 xen-unstable:test-amd64-amd64-pair:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-coresched-amd64-xl:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-libvirt-pair:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-qcow2:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-libvirt-vhd:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-i386-xl-xsm:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-migrupgrade:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-multivcpu:hosts-allocate:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-unstable:test-amd64-amd64-i386-pvgrub:host-install(4):broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-unstable:test-amd64-amd64-amd64-pvgrub:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-amd64-i386-pvgrub:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-amd64-examine:host-install:broken:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-amd64-examine:capture-logs:broken:heisenbug
 xen-unstable:test-amd64-amd64-examine:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:syslog-server:broken:heisenbug
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
 xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(5):broken:nonblocking
 xen-unstable:build-arm64-libvirt:capture-logs:broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:capture-logs(5):broken:nonblocking
 xen-unstable:test-amd64-amd64-i386-pvgrub:capture-logs(5):broken:nonblocking
 xen-unstable:test-amd64-amd64-amd64-pvgrub:capture-logs(11):broken:nonblocking
 xen-unstable:build-arm64-pvops:capture-logs:broken:nonblocking
 xen-unstable:build-armhf:capture-logs:broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-shadow:hosts-allocate:broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-rtds:hosts-allocate:broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-xsm:capture-logs(5):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:capture-logs(5):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(4):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-xsm:host-install(4):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-xsm:syslog-server:broken:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:capture-logs(5):broken:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:capture-logs(11):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:capture-logs(19):broken:nonblocking
 xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: xen=51ca66c37371b10b378513af126646de22eddb17
X-Osstest-Versions-That: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jun 2020 12:57:55 +0000
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

flight 150876 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150876/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-i386-xl-xsm          <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 build-arm64-libvirt             <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 build-arm64-libvirt           4 host-install(4)        broken REGR. vs. 150714
 build-i386                    6 xen-build                fail REGR. vs. 150714
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 150714
 build-armhf                   6 xen-build                fail REGR. vs. 150714
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail in 150869 REGR. vs. 150714
 test-arm64-arm64-xl-credit1   1 build-check(1)               running
 test-armhf-armhf-xl-credit1   1 build-check(1)               running
 test-arm64-arm64-xl-seattle   1 build-check(1)               running
 build-armhf-libvirt           1 build-check(1)               running
 test-armhf-armhf-xl-credit2   1 build-check(1)               running
 test-armhf-armhf-xl-vhd       1 build-check(1)               running
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               running
 test-armhf-armhf-xl-arndale   1 build-check(1)               running
 test-armhf-armhf-xl           1 build-check(1)               running
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               running
 test-arm64-arm64-xl-credit2   1 build-check(1)               running
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               running
 test-armhf-armhf-examine      1 build-check(1)               running
 test-armhf-armhf-libvirt-raw  1 build-check(1)               running
 test-arm64-arm64-xl           1 build-check(1)               running
 test-armhf-armhf-xl-rtds      1 build-check(1)               running
 test-arm64-arm64-xl-xsm       1 build-check(1)               running
 test-armhf-armhf-libvirt      1 build-check(1)               running
 test-arm64-arm64-xl-thunderx  1 build-check(1)               running
 test-arm64-arm64-examine      1 build-check(1)               running
 build-arm64-libvirt           3 syslog-server                running
 build-arm64-pvops             3 syslog-server                running
 build-armhf                   3 syslog-server                running

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-pair         2 hosts-allocate           broken pass in 150869
 test-amd64-coresched-amd64-xl  2 hosts-allocate          broken pass in 150869
 test-amd64-amd64-libvirt-pair  2 hosts-allocate          broken pass in 150869
 test-amd64-amd64-xl-qcow2     2 hosts-allocate           broken pass in 150869
 test-amd64-amd64-libvirt-vhd  2 hosts-allocate           broken pass in 150869
 test-amd64-amd64-xl-qemut-win7-amd64  2 hosts-allocate   broken pass in 150869
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 2 hosts-allocate broken pass in 150869
 test-amd64-amd64-xl-pvhv2-intel  2 hosts-allocate        broken pass in 150869
 test-amd64-i386-xl-xsm        2 hosts-allocate           broken pass in 150869
 test-amd64-amd64-xl-qemut-ws16-amd64  2 hosts-allocate   broken pass in 150869
 test-amd64-amd64-migrupgrade  2 hosts-allocate           broken pass in 150869
 test-amd64-amd64-xl-multivcpu  2 hosts-allocate          broken pass in 150869
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken pass in 150869
 test-amd64-amd64-i386-pvgrub  4 host-install(4)          broken pass in 150869
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken pass in 150869
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken pass in 150869
 test-amd64-amd64-amd64-pvgrub  3 syslog-server           broken pass in 150869
 test-amd64-amd64-i386-pvgrub  3 syslog-server            broken pass in 150869
 test-amd64-amd64-examine      5 host-install             broken pass in 150869
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 syslog-server broken pass in 150869
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 3 syslog-server broken pass in 150869
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 3 syslog-server broken pass in 150869
 test-amd64-amd64-examine      6 capture-logs             broken pass in 150869
 test-amd64-amd64-examine      3 syslog-server            broken pass in 150869
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 3 syslog-server broken pass in 150869
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail pass in 150869
 test-amd64-amd64-amd64-pvgrub 10 debian-di-install         fail pass in 150869
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 18 guest-start/debianhvm.repeat fail pass in 150869

Tests which did not succeed, but are not blocking:
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 capture-logs(5) broken blocked in 150714
 build-arm64-libvirt           5 capture-logs          broken blocked in 150714
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 capture-logs(5) broken blocked in 150714
 test-amd64-amd64-i386-pvgrub  5 capture-logs(5)       broken blocked in 150714
 test-amd64-amd64-amd64-pvgrub 11 capture-logs(11)     broken blocked in 150714
 build-arm64-pvops             7 capture-logs          broken blocked in 150714
 build-armhf                   7 capture-logs          broken blocked in 150714
 test-amd64-amd64-xl-shadow    2 hosts-allocate              broken like 150714
 test-amd64-amd64-xl-rtds      2 hosts-allocate              broken like 150714
 test-amd64-amd64-xl-xsm       5 capture-logs(5)             broken like 150714
 test-amd64-amd64-xl-qemuu-ws16-amd64  2 hosts-allocate      broken like 150714
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 capture-logs(5) broken like 150714
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken like 150714
 test-amd64-amd64-xl-xsm       4 host-install(4)             broken like 150714
 test-amd64-amd64-xl-xsm       3 syslog-server               broken like 150714
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 capture-logs(5) broken never pass
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 11 capture-logs(11) broken never pass
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 19 capture-logs(19) broken never pass
 test-amd64-amd64-xl-rtds     16 guest-localmigrate  fail in 150869 like 150551
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check fail in 150869 like 150635
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop  fail in 150869 like 150674
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop  fail in 150869 like 150674
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop  fail in 150869 like 150674
 test-armhf-armhf-xl-rtds 16 guest-start/debian.repeat fail in 150869 like 150714
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop   fail in 150869 like 150714
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop   fail in 150869 like 150714
 test-armhf-armhf-libvirt 14 saverestore-support-check fail in 150869 like 150714
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop   fail in 150869 like 150714
 test-amd64-i386-xl-pvshim    12 guest-start          fail in 150869 never pass
 test-amd64-i386-libvirt     13 migrate-support-check fail in 150869 never pass
 test-amd64-i386-libvirt-xsm 13 migrate-support-check fail in 150869 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 150869 never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl-xsm     13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl-xsm 14 saverestore-support-check fail in 150869 never pass
 test-arm64-arm64-xl-credit1 13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl-credit1 14 saverestore-support-check fail in 150869 never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check fail in 150869 never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check fail in 150869 never pass
 test-arm64-arm64-xl         13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl     14 saverestore-support-check fail in 150869 never pass
 test-arm64-arm64-xl-credit2 13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl-credit2 14 saverestore-support-check fail in 150869 never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-arndale 13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-arndale 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-credit1 13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-credit1 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl         13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl     14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-credit2 13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-credit2 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-rtds    13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-rtds 14 saverestore-support-check fail in 150869 never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop    fail in 150869 never pass
 test-arm64-arm64-xl-seattle 13 migrate-support-check fail in 150869 never pass
 test-arm64-arm64-xl-seattle 14 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-xl-vhd     12 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-xl-vhd 13 saverestore-support-check fail in 150869 never pass
 test-armhf-armhf-libvirt    13 migrate-support-check fail in 150869 never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check fail in 150869 never pass
 test-amd64-amd64-examine      4 memdisk-try-append           fail  like 150529
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150674
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 xen                  51ca66c37371b10b378513af126646de22eddb17
baseline version:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199

Last test of basis   150714  2020-06-05 01:52:44 Z    1 days
Testing same since   150869  2020-06-05 20:06:13 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wl@xen.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          broken  
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-xl-vhd                                      blocked 


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

broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job build-arm64-libvirt broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-step test-amd64-amd64-pair hosts-allocate
broken-step test-amd64-coresched-amd64-xl hosts-allocate
broken-step test-amd64-amd64-libvirt-pair hosts-allocate
broken-step test-amd64-amd64-xl-qcow2 hosts-allocate
broken-step test-amd64-amd64-libvirt-vhd hosts-allocate
broken-step test-amd64-amd64-xl-qemut-win7-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-shadow hosts-allocate
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm hosts-allocate
broken-step test-amd64-amd64-xl-pvhv2-intel hosts-allocate
broken-step test-amd64-i386-xl-xsm hosts-allocate
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm capture-logs(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 hosts-allocate
broken-step test-amd64-amd64-migrupgrade hosts-allocate
broken-step test-amd64-amd64-xl-multivcpu hosts-allocate
broken-step test-amd64-amd64-xl-rtds hosts-allocate
broken-step build-arm64-libvirt host-install(4)
broken-step test-amd64-amd64-xl-xsm capture-logs(5)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm capture-logs(5)
broken-step build-arm64-libvirt capture-logs
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm capture-logs(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm capture-logs(5)
broken-step test-amd64-amd64-i386-pvgrub capture-logs(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-i386-pvgrub host-install(4)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-amd64-pvgrub capture-logs(11)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm capture-logs(11)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm capture-logs(19)
broken-step test-amd64-amd64-xl-xsm host-install(4)
broken-step build-arm64-pvops capture-logs
broken-step test-amd64-amd64-amd64-pvgrub syslog-server
broken-step test-amd64-amd64-i386-pvgrub syslog-server
broken-step test-amd64-amd64-examine host-install
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm syslog-server
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm syslog-server
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm syslog-server
broken-step test-amd64-amd64-xl-xsm syslog-server
broken-step test-amd64-amd64-examine capture-logs
broken-step test-amd64-amd64-examine syslog-server
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm syslog-server
broken-step build-armhf capture-logs

Not pushing.

(No revision log; it would be 1599 lines long.)

