Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFD6B3952
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 09:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508441.783106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYX5-0000rj-Bw; Fri, 10 Mar 2023 08:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508441.783106; Fri, 10 Mar 2023 08:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYX5-0000or-8C; Fri, 10 Mar 2023 08:55:23 +0000
Received: by outflank-mailman (input) for mailman id 508441;
 Fri, 10 Mar 2023 08:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYX3-0000of-Me; Fri, 10 Mar 2023 08:55:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYX3-00057a-Hl; Fri, 10 Mar 2023 08:55:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYX3-0006B3-0c; Fri, 10 Mar 2023 08:55:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1paYX3-00042V-07; Fri, 10 Mar 2023 08:55:21 +0000
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
	bh=DPVYO3V/WbVCXbdU5J1IG8OoXV3nwz91gE56uPXhW/g=; b=prOFxxnTi8NcFEUAXnwRFe2JC5
	KBm5oHUHwvHlJuxJ1hIKkaO9jo/6h8ZkeHERXsS23PSFoN4y8jh8fVrZOtXBN+9WMlr7VSbP+h3Ak
	RfVsJGeAzPsGN3MOdt9xln/G6GGtP9n0OPBqRGY8boD9O7487Y6EARR5xjy0oNkTGcn8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179524-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 179524: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-localmigrate/x10:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:guest-stop:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:guest-stop:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-stop:fail:regression
    linux-linus:test-arm64-arm64-xl:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-saverestore.2:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-saverestore.2:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-stop:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-localmigrate:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-shadow:guest-localmigrate:fail:heisenbug
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-credit1:guest-start:fail:heisenbug
    linux-linus:test-arm64-arm64-xl:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit2:guest-saverestore.2:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-credit2:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-saverestore:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-saverestore.2:fail:heisenbug
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-xsm:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit2:guest-start:fail:heisenbug
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=6a98c9cae232800c319ed69e1063480d31430887
X-Osstest-Versions-That:
    linux=3f0b0903fde584a7398f82fc00bf4f8138610b87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Mar 2023 08:55:21 +0000

flight 179524 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179524/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 178042
 test-amd64-amd64-xl-credit1  20 guest-localmigrate/x10   fail REGR. vs. 178042
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-shadow   20 guest-localmigrate/x10   fail REGR. vs. 178042
 test-amd64-amd64-freebsd11-amd64 19 guest-localmigrate/x10 fail REGR. vs. 178042
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 178042
 test-amd64-coresched-amd64-xl 17 guest-saverestore       fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail REGR. vs. 178042
 test-arm64-arm64-xl-credit2  17 guest-stop               fail REGR. vs. 178042
 test-arm64-arm64-xl-credit1  17 guest-stop               fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 13 guest-stop fail REGR. vs. 178042
 test-arm64-arm64-xl         18 guest-start/debian.repeat fail REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 178042
 test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-raw 12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 178042
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 178042
 test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-freebsd12-amd64 16 guest-saverestore fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-pvshim 18 guest-localmigrate fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-intel 19 guest-saverestore.2 fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-amd 17 guest-saverestore fail in 179511 REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-amd 17 guest-saverestore fail in 179511 REGR. vs. 178042
 test-amd64-amd64-libvirt-xsm 18 guest-saverestore.2 fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail in 179511 REGR. vs. 178042
 test-arm64-arm64-libvirt-xsm 17 guest-stop     fail in 179511 REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup fail in 179511 REGR. vs. 178042
 test-arm64-arm64-xl-xsm 18 guest-start/debian.repeat fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail in 179511 REGR. vs. 178042
 test-amd64-amd64-xl-xsm  18 guest-localmigrate fail in 179516 REGR. vs. 178042
 test-amd64-amd64-libvirt-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail in 179516 REGR. vs. 178042
 test-arm64-arm64-xl-thunderx 18 guest-start/debian.repeat fail in 179516 REGR. vs. 178042
 test-amd64-amd64-xl-multivcpu 18 guest-localmigrate fail in 179516 REGR. vs. 178042

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-credit1 18 guest-localmigrate fail in 179511 pass in 179524
 test-amd64-amd64-xl-shadow 18 guest-localmigrate fail in 179511 pass in 179524
 test-amd64-amd64-freebsd11-amd64 13 guest-start  fail in 179511 pass in 179524
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail in 179511 pass in 179524
 test-amd64-coresched-amd64-xl 14 guest-start     fail in 179511 pass in 179524
 test-arm64-arm64-xl-credit1  14 guest-start      fail in 179511 pass in 179524
 test-arm64-arm64-xl          14 guest-start      fail in 179511 pass in 179524
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail in 179511 pass in 179524
 test-amd64-amd64-xl-credit2 19 guest-saverestore.2 fail in 179516 pass in 179511
 test-amd64-amd64-xl-shadow   14 guest-start      fail in 179516 pass in 179524
 test-amd64-amd64-libvirt-xsm 14 guest-start      fail in 179516 pass in 179524
 test-arm64-arm64-xl-credit2  14 guest-start      fail in 179516 pass in 179524
 test-amd64-amd64-xl-rtds     14 guest-start      fail in 179516 pass in 179524
 test-amd64-amd64-freebsd12-amd64 13 guest-start            fail pass in 179511
 test-amd64-amd64-xl-pvshim   14 guest-start                fail pass in 179511
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start             fail pass in 179511
 test-amd64-amd64-libvirt-xsm 17 guest-saverestore          fail pass in 179511
 test-amd64-amd64-xl-rtds     17 guest-saverestore          fail pass in 179511
 test-arm64-arm64-xl-xsm      14 guest-start                fail pass in 179511
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 17 guest-saverestore.2 fail pass in 179511
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install    fail pass in 179511
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start             fail pass in 179511
 test-amd64-amd64-xl-xsm      14 guest-start                fail pass in 179516
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start               fail pass in 179516
 test-amd64-amd64-libvirt-pair 25 guest-start/debian        fail pass in 179516
 test-amd64-amd64-xl-credit2  14 guest-start                fail pass in 179516
 test-arm64-arm64-libvirt-xsm 14 guest-start                fail pass in 179516
 test-arm64-arm64-xl-thunderx 14 guest-start                fail pass in 179516
 test-amd64-amd64-xl-multivcpu 14 guest-start               fail pass in 179516

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds 22 guest-start/debian.repeat fail in 179511 REGR. vs. 178042

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 179511 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 179511 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 179511 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 179511 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 179516 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 179516 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                6a98c9cae232800c319ed69e1063480d31430887
baseline version:
 linux                3f0b0903fde584a7398f82fc00bf4f8138610b87

Last test of basis   178042  2023-02-21 17:44:43 Z   16 days
Failing since        178093  2023-02-22 05:02:47 Z   16 days   33 attempts
Testing same since   179511  2023-03-08 21:41:25 Z    1 days    3 attempts

------------------------------------------------------------
2050 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          starved 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      starved 


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

(No revision log; it would be 237811 lines long.)

