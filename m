Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6E2A98F3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 16:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20936.47023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb48R-0004Jo-HC; Fri, 06 Nov 2020 15:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20936.47023; Fri, 06 Nov 2020 15:58:43 +0000
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
	id 1kb48R-0004JP-DZ; Fri, 06 Nov 2020 15:58:43 +0000
Received: by outflank-mailman (input) for mailman id 20936;
 Fri, 06 Nov 2020 15:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kb48Q-0004II-0U
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d9cc84-c811-47e3-b821-edc00ab1128f;
 Fri, 06 Nov 2020 15:58:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb48H-0006Yo-KR; Fri, 06 Nov 2020 15:58:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb48H-0006TC-7b; Fri, 06 Nov 2020 15:58:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kb48H-00072X-6s; Fri, 06 Nov 2020 15:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kb48Q-0004II-0U
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:58:42 +0000
X-Inumbo-ID: c1d9cc84-c811-47e3-b821-edc00ab1128f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1d9cc84-c811-47e3-b821-edc00ab1128f;
	Fri, 06 Nov 2020 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=bPFoJIqkx5/ZQ2y482xmKiiwLrSiPRglROYKNCJISSg=; b=29ykh+86RqMMwzdGbXrb/EKW5e
	Hz2f4wmYWOZNrj4n7l+GkuHw/VjP/GU25CO6TDD3Qmt8J45UHR68IkkAxebDdXMoLCVxdr+j4pcvZ
	4XPG1zzJJuA+0zJGwEAYEOqkvD2LFiIDJ+EnVl9MEWDgzjpwTI9i0yWmrFUxWlmNdk9A=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb48H-0006Yo-KR; Fri, 06 Nov 2020 15:58:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb48H-0006TC-7b; Fri, 06 Nov 2020 15:58:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb48H-00072X-6s; Fri, 06 Nov 2020 15:58:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156460-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 156460: regressions - FAIL
X-Osstest-Failures:
    xen-4.14-testing:build-i386:xen-build:fail:regression
    xen-4.14-testing:test-armhf-armhf-libvirt:host-ping-check-xen:fail:heisenbug
    xen-4.14-testing:test-armhf-armhf-xl-vhd:leak-check/check:fail:heisenbug
    xen-4.14-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=fc8fab1bb4d3a16914d8e7f6e288e946e68d5a41
X-Osstest-Versions-That:
    xen=5784d1e9424151adfdc836535489bd068c6c0700
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Nov 2020 15:58:33 +0000

flight 156460 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156460/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                    6 xen-build      fail in 156404 REGR. vs. 156394

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt  10 host-ping-check-xen fail in 156404 pass in 156460
 test-armhf-armhf-xl-vhd      20 leak-check/check           fail pass in 156404

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-libvirt       1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-pair          1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 156404 n/a
 test-amd64-coresched-i386-xl  1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-migrupgrade   1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 156404 n/a
 test-amd64-i386-xl-raw        1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)   blocked in 156404 n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)        blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)    blocked in 156404 n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)     blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)    blocked in 156404 n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 156404 n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)    blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 156404 n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-xl-shadow     1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)    blocked in 156404 n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)   blocked in 156404 n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)         blocked in 156404 n/a
 test-amd64-i386-xl            1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)     blocked in 156404 n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)    blocked in 156404 n/a
 test-amd64-i386-livepatch     1 build-check(1)           blocked in 156404 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 156404 n/a
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 156404 like 156394
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156394
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156394
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156394
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156394
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156394
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156394
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156394
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156394
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156394
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156394
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156394
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  fc8fab1bb4d3a16914d8e7f6e288e946e68d5a41
baseline version:
 xen                  5784d1e9424151adfdc836535489bd068c6c0700

Last test of basis   156394  2020-11-04 08:37:48 Z    2 days
Testing same since   156404  2020-11-04 22:36:21 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
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
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

------------------------------------------------------------
commit fc8fab1bb4d3a16914d8e7f6e288e946e68d5a41
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Nov 4 11:02:30 2020 +0100

    x86emul: fix PINSRW and adjust other {,V}PINSR*
    
    The use of simd_packed_int together with no further update to op_bytes
    has lead to wrong signaling of #GP(0) for PINSRW without a 16-byte
    aligned memory operand. Use simd_none instead and override it after
    general decoding with simd_other, like is done for the B/D/Q siblings.
    
    While benign, for consistency also use DstImplicit instead of DstReg
    in x86_decode_twobyte().
    
    PINSR{B,D,Q} also had a stray (redundant) get_fpu() invocation, which
    gets dropped.
    
    For further consistency also
    - use src.bytes instead of op_bytes in relevant memcpy() invocations,
    - avoid the pointless updating of op_bytes (all we care about later is
      that the value be less than 16).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 06f0598b41f23c9e4cf7d8c5a05b282de92f3a35
    master date: 2020-10-23 18:03:18 +0200

commit 898864c3736338548bc2f684b7e307326e0dd4a5
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Nov 4 11:01:27 2020 +0100

    pci: cleanup MSI interrupts before removing device from IOMMU
    
    Doing the MSI cleanup after removing the device from the IOMMU leads
    to the following panic on AMD hardware:
    
    Assertion 'table.ptr && (index < intremap_table_entries(table.ptr, iommu))' failed at iommu_intr.c:172
    ----[ Xen-4.13.1-10.0.3-d  x86_64  debug=y   Not tainted ]----
    CPU:    3
    RIP:    e008:[<ffff82d08026ae3c>] drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
    [...]
    Xen call trace:
       [<ffff82d08026ae3c>] R drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
       [<ffff82d08026af25>] F drivers/passthrough/amd/iommu_intr.c#update_intremap_entry_from_msi_msg+0xc0/0x342
       [<ffff82d08026ba65>] F amd_iommu_msi_msg_update_ire+0x98/0x129
       [<ffff82d08025dd36>] F iommu_update_ire_from_msi+0x1e/0x21
       [<ffff82d080286862>] F msi_free_irq+0x55/0x1a0
       [<ffff82d080286f25>] F pci_cleanup_msi+0x8c/0xb0
       [<ffff82d08025cf52>] F pci_remove_device+0x1af/0x2da
       [<ffff82d0802a42d1>] F do_physdev_op+0xd18/0x1187
       [<ffff82d080383925>] F pv_hypercall+0x1f5/0x567
       [<ffff82d08038a432>] F lstar_enter+0x112/0x120
    
    That's because the call to iommu_remove_device on AMD hardware will
    remove the per-device interrupt remapping table, and hence the call to
    pci_cleanup_msi done afterwards will find a null intremap table and
    crash.
    
    Reorder the calls so that MSI interrupts are torn down before removing
    the device from the IOMMU.
    
    Fixes: d7cfeb7c13ed ("AMD/IOMMU: don't blindly allocate interrupt remapping tables")
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 710f62cc826bb8c7ead99f9d6b6b269e39ff3e98
    master date: 2020-10-23 10:13:14 +0200

commit 9f954ae7fb1c7dc3b02e5ccac6978c3a8e86086e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Nov 4 11:01:02 2020 +0100

    build: use if_changed more consistently (and correctly) for prelink*.o
    
    Switch to $(call if_changed,ld) where possible; presumably not doing so
    in e321576f4047 ("xen/build: start using if_changed") right away was an
    oversight, as it did for Arm in (just) one case. It failed to add
    prelink.o to $(targets), though, causing - judging from the observed
    behavior on x86 - undue rebuilds of the final binary (because of
    prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
    because of .prelink.o.cmd not getting read) during "make install-xen".
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    master commit: dd2cfba88c3d0e144ffec07c6b5b86e54a9d98a9
    master date: 2020-09-22 10:19:38 +0200
(qemu changes not included)

