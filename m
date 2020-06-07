Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE121F0B58
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jun 2020 15:19:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhvBZ-0001HL-Sa; Sun, 07 Jun 2020 13:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wL1b=7U=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhvBZ-0001HG-34
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 13:18:01 +0000
X-Inumbo-ID: 4b17525e-a8c1-11ea-96fb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b17525e-a8c1-11ea-96fb-bc764e2007e4;
 Sun, 07 Jun 2020 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLXpslScYEiKYuRcr31HnqTkI3lqeto6q7Vja8oHUvQ=; b=xyqB9z2ZYmkYM250h1CHyX0+d
 kCJ+J9cSip2iQ4U81xobsAvFuusqUeHTh5E0CYYCKo3QFitoBFMyP+aS6zj+ekcj4Gh/TIO7N9u+z
 1XQKIf4FoT0PdQJ327Ywc8YL46yur43g7fRt7aZ/nieXQyaOi5qykmD9Q6QTd6jJ3fr+Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhvBQ-0005oS-Fj; Sun, 07 Jun 2020 13:17:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhvBQ-00021K-66; Sun, 07 Jun 2020 13:17:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhvBQ-0004kr-5R; Sun, 07 Jun 2020 13:17:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150902-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150902: regressions - trouble:
 blocked/broken/fail/pass
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-libvirt:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-shadow:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-credit1:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-pygrub:<job status>:broken:regression
 qemu-mainline:build-i386:xen-build:fail:regression
 qemu-mainline:build-i386-pvops:kernel-build:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-shadow:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-libvirt-vhd:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-libvirt:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qcow2:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-rtds:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-credit1:host-install(4):broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl:host-install(4):broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-credit1:syslog-server:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl:syslog-server:broken:heisenbug
 qemu-mainline:test-amd64-amd64-pygrub:syslog-server:broken:heisenbug
 qemu-mainline:test-amd64-amd64-i386-pvgrub:syslog-server:broken:heisenbug
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
 qemu-mainline:test-armhf-armhf-xl-vhd:leak-check/check:fail:heisenbug
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-localmigrate/x10:fail:heisenbug
 qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:debian-install:fail:heisenbug
 qemu-mainline:test-amd64-amd64-pygrub:debian-di-install:fail:heisenbug
 qemu-mainline:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:heisenbug
 qemu-mainline:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start.2:fail:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
 qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 qemu-mainline:test-amd64-amd64-xl-credit1:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl:capture-logs(5):broken:nonblocking
 qemu-mainline:test-amd64-amd64-pygrub:capture-logs(11):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-pvshim:capture-logs(21):broken:nonblocking
 qemu-mainline:test-amd64-amd64-i386-pvgrub:capture-logs(11):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:capture-logs(20):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:capture-logs(11):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:capture-logs(19):broken:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:capture-logs(17):broken:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=175198ad91d8bac540159705873b4ffe4fb94eab
X-Osstest-Versions-That: qemuu=66234fee9c2d37bfbc523aa8d0ae5300a14cc10e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Jun 2020 13:17:52 +0000
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

flight 150902 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150902/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 build-i386                    6 xen-build                fail REGR. vs. 150694
 build-i386-pvops              6 kernel-build   fail in 150899 REGR. vs. 150694

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 2 hosts-allocate broken pass in 150899
 test-amd64-amd64-xl-shadow    2 hosts-allocate           broken pass in 150899
 test-amd64-amd64-libvirt-vhd  2 hosts-allocate           broken pass in 150899
 test-amd64-amd64-libvirt      2 hosts-allocate           broken pass in 150899
 test-amd64-amd64-xl-qemuu-ws16-amd64  2 hosts-allocate   broken pass in 150899
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 2 hosts-allocate broken pass in 150899
 test-amd64-amd64-xl-qcow2     2 hosts-allocate           broken pass in 150899
 test-amd64-amd64-xl-qemuu-ovmf-amd64  2 hosts-allocate   broken pass in 150899
 test-amd64-amd64-xl-rtds      2 hosts-allocate           broken pass in 150899
 test-amd64-amd64-qemuu-nested-amd  2 hosts-allocate      broken pass in 150899
 test-amd64-amd64-xl-credit1   4 host-install(4)          broken pass in 150899
 test-amd64-amd64-xl           4 host-install(4)          broken pass in 150899
 test-amd64-amd64-xl-credit1   3 syslog-server            broken pass in 150899
 test-amd64-amd64-xl           3 syslog-server            broken pass in 150899
 test-amd64-amd64-pygrub       3 syslog-server            broken pass in 150899
 test-amd64-amd64-i386-pvgrub  3 syslog-server            broken pass in 150899
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail in 150895 pass in 150902
 test-armhf-armhf-xl-vhd      18 leak-check/check fail in 150899 pass in 150902
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 16 guest-localmigrate/x10 fail pass in 150895
 test-amd64-amd64-xl-pvhv2-amd 10 debian-install            fail pass in 150899
 test-amd64-amd64-pygrub      10 debian-di-install          fail pass in 150899
 test-amd64-amd64-i386-pvgrub 10 debian-di-install          fail pass in 150899
 test-amd64-amd64-xl-pvshim   20 guest-start/debian.repeat  fail pass in 150899
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 19 guest-start.2 fail pass in 150899
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 18 guest-start/debianhvm.repeat fail pass in 150899

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-xsm        1 build-check(1)           blocked in 150899 n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 150899 n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-credit1   5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-xl           5 capture-logs(5)       broken blocked in 150694
 test-amd64-amd64-pygrub      11 capture-logs(11)      broken blocked in 150694
 test-amd64-amd64-xl-pvshim   21 capture-logs(21)      broken blocked in 150694
 test-amd64-amd64-i386-pvgrub 11 capture-logs(11)      broken blocked in 150694
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 capture-logs(20) broken blocked in 150694
 test-amd64-amd64-xl-pvhv2-amd 11 capture-logs(11)            broken never pass
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 19 capture-logs(19) broken never pass
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 17 capture-logs(17) broken never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop   fail in 150895 like 150694
 test-armhf-armhf-xl-rtds 16 guest-start/debian.repeat fail in 150895 like 150694
 test-amd64-i386-xl-pvshim    12 guest-start          fail in 150895 never pass
 test-amd64-i386-libvirt-xsm 13 migrate-support-check fail in 150895 never pass
 test-amd64-i386-libvirt     13 migrate-support-check fail in 150895 never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 150895 never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop    fail in 150895 never pass
 test-amd64-amd64-xl-rtds  18 guest-localmigrate/x10 fail in 150899 like 150694
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop  fail in 150899 like 150694
 test-amd64-amd64-libvirt    13 migrate-support-check fail in 150899 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 150899 never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail in 150899 never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check fail in 150899 never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150694
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150694
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150694
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                175198ad91d8bac540159705873b4ffe4fb94eab
baseline version:
 qemuu                66234fee9c2d37bfbc523aa8d0ae5300a14cc10e

Last test of basis   150694  2020-06-04 11:44:20 Z    3 days
Failing since        150831  2020-06-05 13:06:20 Z    2 days    5 attempts
Testing same since   150872  2020-06-05 22:39:31 Z    1 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Bulekov <alxndr@bu.edu>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jared Rossi <jrossi@linux.ibm.com>
  Kevin Wolf <kwolf@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 broken  
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

broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-pygrub broken
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm hosts-allocate
broken-step test-amd64-amd64-xl-shadow hosts-allocate
broken-step test-amd64-amd64-libvirt-vhd hosts-allocate
broken-step test-amd64-amd64-libvirt hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow hosts-allocate
broken-step test-amd64-amd64-xl-qcow2 hosts-allocate
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 hosts-allocate
broken-step test-amd64-amd64-xl-rtds hosts-allocate
broken-step test-amd64-amd64-xl-credit1 capture-logs(5)
broken-step test-amd64-amd64-qemuu-nested-amd hosts-allocate
broken-step test-amd64-amd64-xl capture-logs(5)
broken-step test-amd64-amd64-xl-credit1 host-install(4)
broken-step test-amd64-amd64-xl host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-amd capture-logs(11)
broken-step test-amd64-amd64-pygrub capture-logs(11)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm capture-logs(19)
broken-step test-amd64-amd64-xl-pvshim capture-logs(21)
broken-step test-amd64-amd64-i386-pvgrub capture-logs(11)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm capture-logs(17)
broken-step test-amd64-amd64-xl-credit1 syslog-server
broken-step test-amd64-amd64-xl syslog-server
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 capture-logs(20)
broken-step test-amd64-amd64-pygrub syslog-server
broken-step test-amd64-amd64-i386-pvgrub syslog-server

Not pushing.

(No revision log; it would be 447 lines long.)

