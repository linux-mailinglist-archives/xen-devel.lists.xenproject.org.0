Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B354D86A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 04:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350379.576710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1fKd-0003VH-3N; Thu, 16 Jun 2022 02:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350379.576710; Thu, 16 Jun 2022 02:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1fKd-0003T1-0H; Thu, 16 Jun 2022 02:34:03 +0000
Received: by outflank-mailman (input) for mailman id 350379;
 Thu, 16 Jun 2022 02:34:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1fKb-0003Sr-HD; Thu, 16 Jun 2022 02:34:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1fKb-0007Fw-9t; Thu, 16 Jun 2022 02:34:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1fKa-0003Et-Rz; Thu, 16 Jun 2022 02:34:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o1fKa-0008Hd-RZ; Thu, 16 Jun 2022 02:34:00 +0000
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
	bh=pJHRx1Ib9npVe+MMdv+bADf53YTiycUY9/gkRP/v48s=; b=yFMf5c0hdKUfJkVmkFqmRGcloI
	XckwyB985okoyeNjuWcei0Gshzn8YPquFRldHFTCV5apm0yrBbZeEe1ieLWUJ5itK9dlXP6jB5e1N
	WRziiQaC7Vtj2zObF2DcmHYEFp+OtDQKS1G+u5CAG8KHkDJ8Um9rS76toU3hm/mWhyDU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171181-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 171181: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:build-amd64:xen-build:fail:regression
    xen-unstable:build-i386:xen-build:fail:regression
    xen-unstable:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-examine-bios:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-examine-uefi:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-unstable:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-unstable:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-unstable:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-unstable:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8c1d9760b1d847d983529eae2b360b38648841b5
X-Osstest-Versions-That:
    xen=c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jun 2022 02:34:00 +0000

flight 171181 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171181/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 171174
 build-i386                    6 xen-build                fail REGR. vs. 171174

Tests which did not succeed, but are not blocking:
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine-uefi  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171174
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171174
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171174
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  8c1d9760b1d847d983529eae2b360b38648841b5
baseline version:
 xen                  c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b

Last test of basis   171174  2022-06-15 01:53:26 Z    1 days
Testing same since   171181  2022-06-15 14:38:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       blocked 
 test-xtf-amd64-amd64-2                                       blocked 
 test-xtf-amd64-amd64-3                                       blocked 
 test-xtf-amd64-amd64-4                                       blocked 
 test-xtf-amd64-amd64-5                                       blocked 
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
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
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-i386-examine-bios                                 blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   blocked 
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                blocked 
 test-amd64-i386-examine-uefi                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       blocked 


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

------------------------------------------------------------
commit 8c1d9760b1d847d983529eae2b360b38648841b5
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jun 15 10:24:06 2022 +0200

    build: remove auto.conf prerequisite from compat/xlat.h target
    
    Now that the command line generating "xlat.h" is check on rebuild, the
    header will be regenerated whenever the list of xlat headers changes
    due to change in ".config". We don't need to force a regeneration for
    every changes in ".config".
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 95b0d7bbddfbd797f37f7a09f0586c4bbd22291b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jun 15 10:23:16 2022 +0200

    build: fix exporting for make 3.82
    
    GNU make 3.82 apparently has a quirk where exporting an undefined
    variable prevents its value from subsequently being updated. This
    situation can arise due to our adding of -rR to MAKEFLAGS, which takes
    effect also on make simply re-invoking itself. Once these flags are in
    effect, CC (in particular) is empty (undefined), and would be defined
    only via Config.mk including StdGNU.mk or alike. With the quirk, CC
    remains empty, yet with an empty CC the compiler minimum version check
    fails, breaking the build.
    
    Move the exporting of the various tool stack component variables past
    where they gain their (final) values.
    
    See also be63d9d47f57 ("build: tweak variable exporting for make 3.82").
    
    Fixes: 15a0578ca4b0 ("build: shuffle main Makefile")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit e8e6e42279a5723239c5c40ba4c7f579a979465d
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Jun 15 10:22:38 2022 +0200

    tools/xenstore: simplify loop handling connection I/O
    
    The loop handling input and output of connections of xenstored is
    open coding list_for_each_entry_safe() in an incredibly complicated
    way.
    
    Use list_for_each_entry_safe() instead, making it much more clear how
    the code is working.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit e2d2b9fd7a2b349a1a9a75b482981cfd2d2407a8
Author: Jane Malalane <jane.malalane@citrix.com>
Date:   Wed Jun 15 10:21:08 2022 +0200

    x86/hvm: widen condition for is_hvm_pv_evtchn_domain() and report fix in CPUID
    
    Have is_hvm_pv_evtchn_domain() return true for vector callbacks for
    evtchn delivery set up on a per-vCPU basis via
    HVMOP_set_evtchn_upcall_vector.
    
    Assume that if vCPU0 uses HVMOP_set_evtchn_upcall_vector, all
    remaining vCPUs will too and thus remove is_hvm_pv_evtchn_vcpu() and
    replace sole caller with is_hvm_pv_evtchn_domain().
    
    is_hvm_pv_evtchn_domain() returning true is a condition for setting up
    physical IRQ to event channel mappings. Therefore, also add a CPUID
    bit so that guests know whether the check in is_hvm_pv_evtchn_domain()
    will fail when using HVMOP_set_evtchn_upcall_vector. This matters for
    guests that route PIRQs over event channels since
    is_hvm_pv_evtchn_domain() is a condition in physdev_map_pirq().
    
    The naming of the CPUID bit is quite generic about upcall support
    being available. That's done so that the define name doesn't become
    overly long.
    
    A guest that doesn't care about physical interrupts routed over event
    channels can just test for the availability of the hypercall directly
    (HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.
    
    Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 80ad8db8a4d9bb24952f0aea788ce6f47566fa76
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jun 15 10:19:32 2022 +0200

    IOMMU/x86: work around bogus gcc12 warning in hvm_gsi_eoi()
    
    As per [1] the expansion of the pirq_dpci() macro causes a -Waddress
    controlled warning (enabled implicitly in our builds, if not by default)
    tying the middle part of the involved conditional expression to the
    surrounding boolean context. Work around this by introducing a local
    inline function in the affected source file.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    
    [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967

commit 162dea4e768b835114c736cfd3fa1fc3742d39c5
Author: Stefano Stabellini <sstabellini@kernel.org>
Date:   Fri Jun 10 14:27:55 2022 -0700

    add more MISRA C rules to docs/misra/rules.rst
    
    Add the new MISRA C rules agreed by the MISRA C working group to
    docs/misra/rules.rst.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

