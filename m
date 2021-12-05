Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA2468B95
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 16:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238448.413214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtt24-0006Hf-Q6; Sun, 05 Dec 2021 15:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238448.413214; Sun, 05 Dec 2021 15:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtt24-0006Fj-MI; Sun, 05 Dec 2021 15:02:28 +0000
Received: by outflank-mailman (input) for mailman id 238448;
 Sun, 05 Dec 2021 15:02:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtt22-0006FZ-Ub; Sun, 05 Dec 2021 15:02:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtt22-000433-NA; Sun, 05 Dec 2021 15:02:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtt22-0001J3-Fx; Sun, 05 Dec 2021 15:02:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mtt22-0004l9-FS; Sun, 05 Dec 2021 15:02:26 +0000
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
	bh=/4uMfGAONgRrdRx+FBZYvo2raQddufFtmhTW7Bvu+uI=; b=fvPTD2p0M5vGnw+CIxRWERj50V
	FsROauiJ5uukgA8h5cFIaghy+YFrl5IOpue37tOw269iImYHu1LC08KgPhgUeev6/UQDfTVCtDOKK
	zhs45jC7cH9dvUtMzIGqMBvxicc9VGw+bwriDxA4sfMGrCyrIIPpSYBMTUZsNNC4HO+0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 167117: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-pvshim:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-coresched-i386-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-shadow:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-credit2:guest-start.2:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt:guest-destroy:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-seattle:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-coresched-amd64-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-shadow:guest-start.2:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-shadow:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-thunderx:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-examine:memdisk-try-append:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:xen-boot:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=57899c4e26bf5a02b9b405267a1812f26b9ccce5
X-Osstest-Versions-That:
    linux=9334f48f567334f54101223012ec9d3b4628bed8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Dec 2021 15:02:26 +0000

flight 167117 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167117/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 167023 pass in 167071
 test-amd64-amd64-xl-pvshim   14 guest-start      fail in 167023 pass in 167117
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup fail in 167023 pass in 167117
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-arm64-arm64-xl-xsm      14 guest-start      fail in 167023 pass in 167117
 test-amd64-amd64-libvirt-xsm 20 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-coresched-i386-xl 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-i386-xl-shadow 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-amd64-xl 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-amd64-xl-xsm 22 guest-start/debian.repeat fail in 167023 pass in 167117
 test-arm64-arm64-xl-credit2  19 guest-start.2    fail in 167023 pass in 167117
 test-armhf-armhf-libvirt     20 guest-destroy    fail in 167023 pass in 167117
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail in 167023 pass in 167117
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 167023 pass in 167117
 test-armhf-armhf-xl 18 guest-start/debian.repeat fail in 167023 pass in 167117
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail in 167023 pass in 167117
 test-armhf-armhf-xl-arndale 18 guest-start/debian.repeat fail in 167023 pass in 167117
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start   fail in 167071 pass in 167117
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install fail in 167071 pass in 167117
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl-seattle 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-multivcpu 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-coresched-amd64-xl 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-libvirt-xsm 20 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-dom0pvh-xl-amd 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-rtds 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl  22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-libvirt 20 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-pvshim 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-xsm 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-shadow    23 guest-start.2    fail in 167071 pass in 167117
 test-amd64-i386-libvirt 20 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-shadow 22 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl-xsm 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl-thunderx 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-arm64-arm64-xl-credit2 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-arm64-arm64-libvirt-xsm 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-examine    4 memdisk-try-append fail in 167071 pass in 167117
 test-armhf-armhf-libvirt 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-libvirt-raw 19 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-i386-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail in 167071 pass in 167117
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat  fail pass in 167023
 test-armhf-armhf-xl-vhd       8 xen-boot                   fail pass in 167071
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 167071

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 167071 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 167071 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166839
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166839
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166839
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 166839
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166839
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166839
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166839
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166839
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 166839
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166839
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166839
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166839
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                57899c4e26bf5a02b9b405267a1812f26b9ccce5
baseline version:
 linux                9334f48f567334f54101223012ec9d3b4628bed8

Last test of basis   166839  2021-11-26 10:11:13 Z    9 days
Testing same since   166970  2021-12-01 08:40:40 Z    4 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>
  Andrew Morton <akpm@linux-foundation.org>
  Baoquan He <bhe@redhat.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Chuanqi Liu <legend050709@qq.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniele Palmas <dnlplm@gmail.com>
  Danielle Ratson <danieller@nvidia.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Diana Wang <na.wang@corigine.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dylan Hung <dylan_hung@aspeedtech.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Grzegorz Jaszczyk <jaz@semihalf.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Huang Pei <huangpei@loongson.cn>
  Hulk Robot <hulkrobot@huawei.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jason Gerecke <killertofu@gmail.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Joshua Dickens <joshua.dickens@wacom.com>
  Juergen Gross <jgross@suse.com>
  Julian Anastasov <ja@ssi.bg>
  Julian Sikorski <belegdol@gmail.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kumar Thangavel <kumarthangavel.hcl@gmail.com>
  Kumar Thangavel <thangavel.k@hcl.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Manfred Spraul <manfred@colorfullife.com>
  Marek Behún <kabel@kernel.org>
  Marek Behún <marek.behun@nic.cz>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxime Ripard <maxime@cerno.tech>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Christie <michael.christie@oracle.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Mingjie Zhang <superzmj@fibocom.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolay Aleksandrov <nikolay@nvidia.com>
  Nitesh B Venkatesh <nitesh.b.venkatesh@intel.com>
  Noralf Trønnes <noralf@tronnes.org>
  Oleksandr Natalenko <oleksandr@natalenko.name>
  Ondrej Jirman <megous@megous.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Peng Fan <peng.fan@nxp.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Remi Pommarel <repk@triplefau.lt>
  Richard Cochran <richardcochran@gmail.com>
  Rob Herring <robh@kernel.org>
  Roger Pau Monné <roger.pau@citrix.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sam Ravnborg <sam@ravnborg.org>
  Samuel Mendoza-Jonas <sam@mendozajonas.com>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <horms@verge.net.au>
  Simon Horman <simon.horman@corigine.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Takashi Iwai <tiwai@suse.de>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
  Tobias Brunner <tobias@strongswan.org>
  Todd Kjos <tkjos@google.com>
  Tomasz Maciej Nowak <tmn505@gmail.com>
  Tony Lu <tonylu@linux.alibaba.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Varun Prakash <varun@chelsio.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Weichao Guo <guoweichao@oppo.com>
  yangxingwu <xingwu.yang@gmail.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   9334f48f5673..57899c4e26bf  57899c4e26bf5a02b9b405267a1812f26b9ccce5 -> tested/linux-5.4

