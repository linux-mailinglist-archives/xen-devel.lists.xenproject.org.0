Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68090302214
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 07:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73879.132788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3vEW-0001C1-La; Mon, 25 Jan 2021 06:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73879.132788; Mon, 25 Jan 2021 06:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3vEW-0001Ba-Hc; Mon, 25 Jan 2021 06:20:16 +0000
Received: by outflank-mailman (input) for mailman id 73879;
 Mon, 25 Jan 2021 06:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3vEV-0001BS-3F; Mon, 25 Jan 2021 06:20:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3vEU-0005o0-2u; Mon, 25 Jan 2021 06:20:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l3vET-0008NF-Nx; Mon, 25 Jan 2021 06:20:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l3vET-0004Aw-NI; Mon, 25 Jan 2021 06:20:13 +0000
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
	bh=RLO9qpHiICfh4V5peUqaPIbpvIIBEp9gOld2d+DV78I=; b=5BWWzpLr2rn8WCzePftuYoSR1n
	yYXue7tPfX8CITusMIflovpkMqgBZGOhOSobIcCQc8elnoYaOmYoI3vW863Md6P3Ke4GLZJ0fEhgR
	zYZ+YSsQMTUDKJCTwrbPFCZS6e6ik69dyR0tzzwmg29v2YBhEOAM4A7cOxjdVlNgQNpg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158604-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 158604: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-coresched-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-raw:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-pvshim:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-shadow:xen-install:fail:regression
    linux-linus:test-amd64-i386-freebsd10-i386:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:xen-install:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    linux-linus:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-start:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-linus:test-amd64-i386-examine:xen-install:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:windows-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:windows-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-linus:test-arm64-arm64-xl-seattle:leak-check/basis(11):fail:nonblocking
    linux-linus:test-arm64-arm64-xl:leak-check/basis(11):fail:nonblocking
X-Osstest-Versions-This:
    linux=e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jan 2021 06:20:13 +0000

flight 158604 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158604/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-xsm        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
 test-amd64-i386-libvirt       7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-ws16-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-coresched-i386-xl  7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
 test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
 test-amd64-i386-xl            7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-libvirt-xsm   7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-raw        7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-xl-pvshim     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-xl-shadow     7 xen-install              fail REGR. vs. 152332
 test-amd64-i386-freebsd10-i386  7 xen-install            fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64  7 xen-install       fail REGR. vs. 152332
 test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 152332
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 152332
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 152332
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 152332
 test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 152332
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 152332
 test-amd64-i386-examine       6 xen-install              fail REGR. vs. 152332
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 152332
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 152332
 test-amd64-amd64-qemuu-freebsd11-amd64 13 guest-start    fail REGR. vs. 152332
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 152332
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 152332
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 152332
 test-amd64-amd64-amd64-pvgrub 12 debian-di-install       fail REGR. vs. 152332
 test-amd64-amd64-qemuu-freebsd12-amd64 13 guest-start    fail REGR. vs. 152332
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 152332
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-i386-pvgrub 12 debian-di-install        fail REGR. vs. 152332
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 152332
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 152332
 test-amd64-amd64-xl-qemut-win7-amd64 12 windows-install  fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 152332
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 152332
 test-amd64-amd64-xl-qcow2    12 debian-di-install        fail REGR. vs. 152332
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 152332
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 12 windows-install  fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install  fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 152332
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 152332
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 152332
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 152332
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 152332
 test-arm64-arm64-xl-credit1 10 host-ping-check-xen fail in 158594 REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm 10 host-ping-check-xen fail in 158594 REGR. vs. 152332

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-credit1   8 xen-boot                   fail pass in 158594
 test-arm64-arm64-libvirt-xsm  8 xen-boot                   fail pass in 158594
 test-arm64-arm64-xl           8 xen-boot                   fail pass in 158594
 test-arm64-arm64-xl-seattle   8 xen-boot                   fail pass in 158594

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle 11 leak-check/basis(11) fail in 158594 blocked in 152332
 test-arm64-arm64-xl   11 leak-check/basis(11) fail in 158594 blocked in 152332

version targeted for testing:
 linux                e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  177 days
Failing since        152366  2020-08-01 20:49:34 Z  176 days  316 attempts
Testing same since   158594  2021-01-23 23:41:52 Z    1 days    2 attempts

------------------------------------------------------------
4443 people touched revisions under test,
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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
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

(No revision log; it would be 1007891 lines long.)

