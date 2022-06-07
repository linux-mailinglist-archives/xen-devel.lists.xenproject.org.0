Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DFD53F597
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 07:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342829.567920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyRwR-0004tw-IK; Tue, 07 Jun 2022 05:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342829.567920; Tue, 07 Jun 2022 05:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyRwR-0004qW-E0; Tue, 07 Jun 2022 05:39:47 +0000
Received: by outflank-mailman (input) for mailman id 342829;
 Tue, 07 Jun 2022 05:39:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyRwP-0004qM-Rn; Tue, 07 Jun 2022 05:39:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyRwP-0004us-NQ; Tue, 07 Jun 2022 05:39:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyRwP-0006wE-C4; Tue, 07 Jun 2022 05:39:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nyRwP-0000hR-Ba; Tue, 07 Jun 2022 05:39:45 +0000
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
	bh=ZJCjgbX2Vy4lrwJpGf5QmdRmNUKnFirtTYIt9EWyf5Y=; b=ZAXCGxCi+YL6RVl/DuL0XcH7O5
	4Pmd86ZMD23GX63bgBDJaBNL1kKOIjTN+/PUJEH1FkkNRZIslDmsuj8BBoC8Oxao7uL+xOSqmJlLT
	40fJLWEfRoHKjM9BTVAotd6tndOfygnYNOf1oFouKwFiFsLlv6WRscz/naqzFLQzPC1M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170846-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 170846: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-examine-uefi:xen-install:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:build-amd64:xen-build:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine-bios:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    linux-5.4:build-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine-uefi:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=35c6471fd2c181f6e5e0b292dc759b49dbd95d6a
X-Osstest-Versions-That:
    linux=04b092e4a01a3488e762897e2d29f85eda2c6a60
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Jun 2022 05:39:45 +0000

flight 170846 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170846/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-examine-uefi  6 xen-install              fail REGR. vs. 170736
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 170736
 build-amd64                   6 xen-build      fail in 170843 REGR. vs. 170736

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2  14 guest-start      fail in 170843 pass in 170846
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 170843
 test-armhf-armhf-xl-arndale  18 guest-start/debian.repeat  fail pass in 170843
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat  fail pass in 170843

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-examine      1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)        blocked in 170843 n/a
 test-amd64-coresched-i386-xl  1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-examine-bios  1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)        blocked in 170843 n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)    blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-pair         1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)      blocked in 170843 n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)          blocked in 170843 n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)     blocked in 170843 n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)        blocked in 170843 n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-examine       1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)   blocked in 170843 n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)   blocked in 170843 n/a
 test-amd64-i386-xl-vhd        1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)          blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-examine-bios  1 build-check(1)          blocked in 170843 n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)    blocked in 170843 n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)    blocked in 170843 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)   blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)    blocked in 170843 n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)      blocked in 170843 n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-pygrub       1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-pair          1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 170843 n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)          blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)    blocked in 170843 n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 170843 n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)          blocked in 170843 n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)   blocked in 170843 n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)   blocked in 170843 n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-xl            1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl           1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)         blocked in 170843 n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)    blocked in 170843 n/a
 test-amd64-amd64-libvirt      1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)   blocked in 170843 n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)     blocked in 170843 n/a
 test-amd64-i386-xl-shadow     1 build-check(1)           blocked in 170843 n/a
 build-amd64-libvirt           1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 170843 n/a
 test-amd64-i386-examine-uefi  1 build-check(1)           blocked in 170843 n/a
 test-amd64-i386-libvirt       1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)   blocked in 170843 n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)           blocked in 170843 n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)          blocked in 170843 n/a
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 170843 like 170724
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 170843 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 170843 never pass
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170724
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170736
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 170736
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170736
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170736
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170736
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170736
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170736
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 170736
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 170736
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 170736
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170736
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170736
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170736
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                35c6471fd2c181f6e5e0b292dc759b49dbd95d6a
baseline version:
 linux                04b092e4a01a3488e762897e2d29f85eda2c6a60

Last test of basis   170736  2022-05-25 18:40:38 Z   12 days
Testing same since   170843  2022-06-06 06:44:17 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akira Yokosawa <akiyks@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Lutomirski <luto@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ariadne Conill <ariadne@dereferenced.org>
  Aristeu Rozanski <aris@redhat.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Christian Brauner <brauner@kernel.org>
  Chuck Lever <chuck.lever@oracle.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Thompson <daniel.thompson@linaro.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Denis Efremov (Oracle) <efremov@linux.com>
  Dmitry Mastykin <dmastykin@astralinux.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hulk Robot <hulkrobot@huawei.com>
  IotaHydrae <writeforever@foxmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Corbet <corbet@lwn.net>
  Kees Cook <keescook@chromium.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Jian <liujian56@huawei.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luca Coelho <luciano.coelho@intel.com>
  Marek Maslanka <mm@semihalf.com>
  Marek Maślanka <mm@semihalf.com>
  Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
  Mark-PK Tsai <mark-pk.tsai@mediatek.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Milan Broz <gmazyland@gmail.com>
  Minchan Kim <minchan@kernel.org>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Noah Meyerhans <nmeyerha@amazon.com>
  Noah Meyerhans <noahm@debian.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Piyush Malgujar <pmalgujar@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sarthak Kukreti <sarthakkukreti@google.com>
  Sasha Levin <sashal@kernel.org>
  Song Liu <song@kernel.org>
  Song Liu <songliubraving@fb.com>
  Stefan Ghinea <stefan.ghinea@windriver.com>
  Stefan Mahnke-Hartmann <stefan.mahnke-hartmann@infineon.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sultan Alsawaf <sultan@kerneltoast.com>
  Szymon Balcerak <sbalcerak@marvell.com>
  Thomas Bartschies <thomas.bartschies@cvk.de>
  Thomas Gleixner <tglx@linutronix.de>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vegard Nossum <vegard.nossum@oracle.com>
  Veronika Kabatova <vkabatov@redhat.com>
  Vitaly Chikunov <vt@altlinux.org>
  Willy Tarreau <w@1wt.eu>
  Wolfram Sang <wsa@kernel.org>
  Xiu Jianfeng <xiujianfeng@huawei.com>

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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

(No revision log; it would be 1081 lines long.)

