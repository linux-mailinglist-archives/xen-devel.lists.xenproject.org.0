Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5A2D91AF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 03:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51875.90754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kodSb-00008V-2g; Mon, 14 Dec 2020 02:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51875.90754; Mon, 14 Dec 2020 02:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kodSa-000082-Td; Mon, 14 Dec 2020 02:19:36 +0000
Received: by outflank-mailman (input) for mailman id 51875;
 Mon, 14 Dec 2020 02:19:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kodSZ-00007A-9B; Mon, 14 Dec 2020 02:19:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kodSY-0002rI-WF; Mon, 14 Dec 2020 02:19:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kodSY-0005EP-Id; Mon, 14 Dec 2020 02:19:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kodSY-00079J-I7; Mon, 14 Dec 2020 02:19:34 +0000
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
	bh=JAbM4zMrt/gcK/1TRRerFr3HRblZu+ec9lTJd4hqVP8=; b=p1K/Np5ylIy3QNcp0/o1BOYr/T
	4h1IX+5+otiiKIZPwpGfZeBX2PLfhe5ieBqFHjbg+tyi9pOzIy0WO6Af8IxTA7A0wSUhoye5NrfGH
	e2r1JpVr9F4qTR0tSwcxmD1T3zUEEUOcZ/48GsDJj5mI4xhgojG2EO0Ehk14ibHnu3qQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 157504: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:build-amd64:xen-build:fail:regression
    qemu-mainline:build-amd64-xsm:xen-build:fail:regression
    qemu-mainline:build-i386:xen-build:fail:regression
    qemu-mainline:build-i386-xsm:xen-build:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:xen-boot:fail:heisenbug
    qemu-mainline:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:build-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=17584289af1aaa72c932e7e47c25d583b329dc45
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Dec 2020 02:19:34 +0000

flight 157504 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157504/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 152631
 test-armhf-armhf-xl-vhd     17 guest-start/debian.repeat fail REGR. vs. 152631
 build-amd64                   6 xen-build      fail in 157487 REGR. vs. 152631
 build-amd64-xsm               6 xen-build      fail in 157487 REGR. vs. 152631
 build-i386                    6 xen-build      fail in 157487 REGR. vs. 152631
 build-i386-xsm                6 xen-build      fail in 157487 REGR. vs. 152631

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd       8 xen-boot         fail in 157487 pass in 157504
 test-armhf-armhf-libvirt     18 guest-start/debian.repeat  fail pass in 157487

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)    blocked in 157487 n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)   blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)   blocked in 157487 n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)      blocked in 157487 n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)          blocked in 157487 n/a
 test-amd64-i386-xl            1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-libvirt       1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)      blocked in 157487 n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)          blocked in 157487 n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)         blocked in 157487 n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-xl-raw        1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-libvirt      1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 157487 n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)        blocked in 157487 n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)          blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 157487 n/a
 test-amd64-i386-xl-shadow     1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 157487 n/a
 test-amd64-i386-xl-xsm        1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)    blocked in 157487 n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-pair          1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)   blocked in 157487 n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 157487 n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)          blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)    blocked in 157487 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-pygrub       1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)   blocked in 157487 n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)     blocked in 157487 n/a
 test-amd64-amd64-xl           1 build-check(1)           blocked in 157487 n/a
 test-amd64-coresched-i386-xl  1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)    blocked in 157487 n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)           blocked in 157487 n/a
 build-amd64-libvirt           1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)           blocked in 157487 n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)        blocked in 157487 n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)        blocked in 157487 n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)          blocked in 157487 n/a
 build-i386-libvirt            1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 157487 n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-pair         1 build-check(1)           blocked in 157487 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152631
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152631
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 152631
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 152631
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152631
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152631
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                17584289af1aaa72c932e7e47c25d583b329dc45
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  115 days
Failing since        152659  2020-08-21 14:07:39 Z  114 days  240 attempts
Testing same since   157474  2020-12-13 01:37:19 Z    1 days    3 attempts

------------------------------------------------------------
308 people touched revisions under test,
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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
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

(No revision log; it would be 75406 lines long.)

