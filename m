Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D20466F5B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 02:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237093.411178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msxkX-0008EQ-JL; Fri, 03 Dec 2021 01:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237093.411178; Fri, 03 Dec 2021 01:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msxkX-0008Ce-F0; Fri, 03 Dec 2021 01:52:33 +0000
Received: by outflank-mailman (input) for mailman id 237093;
 Fri, 03 Dec 2021 01:52:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msxkW-0008CU-0g; Fri, 03 Dec 2021 01:52:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msxkV-00008I-QK; Fri, 03 Dec 2021 01:52:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msxkV-0008Ox-FD; Fri, 03 Dec 2021 01:52:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msxkV-0002n4-Eh; Fri, 03 Dec 2021 01:52:31 +0000
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
	bh=tzKQwwjBmD5haKCCDgxjyaEMMpoiOrnCOJkrz9PK+h4=; b=zAqLt60INhr0G+R7Kpl3A9js96
	ZVS7Z0CwWnRXy1xI1cLnCJFPPDifAbFNqubQLRW+hNAoWuHHTPESl35/ND3BHJWQ4iulm4yRWuaNU
	XOw6/bojd2DjDiBpBZzIh+9Fk3nF5r3+kD8X2mSDaQeuyW2G7ZhtwHkMyAUObRcMj8mQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167007-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 167007: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-arm64-arm64-xl-seattle:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-destroy:fail:regression
    qemu-mainline:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-xl-thunderx:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-shadow:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-destroy:fail:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:guest-start.2:fail:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:heisenbug
    qemu-mainline:test-armhf-armhf-libvirt-raw:xen-boot:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-destroy:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-thunderx:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-coresched-i386-xl:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-coresched-i386-xl:guest-start.2:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-arndale:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-cubietruck:guest-start.2:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-armhf-armhf-libvirt-raw:guest-start.2:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:allowable
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=682aa69b1f4dd5f2905a94066fa4c853adc33251
X-Osstest-Versions-That:
    qemuu=50456a6794fbb8dc94a31eb9534e91c586da7add
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Dec 2021 01:52:31 +0000

flight 167007 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167007/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-seattle 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-libvirt     20 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-libvirt-xsm  22 guest-destroy            fail REGR. vs. 166954
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-arm64-arm64-xl-thunderx 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-shadow   22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl          22 guest-start/debian.repeat fail REGR. vs. 166954
 test-arm64-arm64-libvirt-xsm 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-libvirt-xsm 22 guest-destroy  fail in 166968 REGR. vs. 166954
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail in 166968 REGR. vs. 166954
 test-amd64-amd64-dom0pvh-xl-intel 23 guest-start.2 fail in 166978 REGR. vs. 166954
 test-armhf-armhf-xl-arndale 18 guest-start/debian.repeat fail in 166978 REGR. vs. 166954

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail in 166968 pass in 166978
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 166968 pass in 166978
 test-arm64-arm64-xl-xsm 18 guest-start/debian.repeat fail in 166968 pass in 166978
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup fail in 166968 pass in 167007
 test-armhf-armhf-libvirt-raw  8 xen-boot         fail in 166968 pass in 167007
 test-amd64-amd64-xl-pvshim 22 guest-start/debian.repeat fail in 166968 pass in 167007
 test-armhf-armhf-xl          14 guest-start      fail in 166968 pass in 167007
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail in 166968 pass in 167007
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 22 guest-destroy fail in 166968 pass in 167007
 test-arm64-arm64-xl-thunderx 14 guest-start      fail in 166978 pass in 167007
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-coresched-i386-xl 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-amd64-dom0pvh-xl-amd 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-i386-libvirt-xsm 20 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-amd64-xl-xsm 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-arm64-arm64-xl 18 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-i386-xl-xsm 22 guest-start/debian.repeat fail in 166978 pass in 167007
 test-armhf-armhf-xl-multivcpu 14 guest-start     fail in 166978 pass in 167007
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail in 166978 pass in 167007
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail in 166978 pass in 167007
 test-armhf-armhf-xl-credit2   8 xen-boot         fail in 166978 pass in 167007
 test-arm64-arm64-xl-credit2 18 guest-start/debian.repeat fail in 166978 pass in 167007
 test-armhf-armhf-xl-vhd 17 guest-start/debian.repeat fail in 166978 pass in 167007
 test-amd64-coresched-i386-xl 23 guest-start.2              fail pass in 166968
 test-amd64-amd64-xl          22 guest-start/debian.repeat  fail pass in 166968
 test-amd64-amd64-libvirt-xsm 20 guest-start/debian.repeat  fail pass in 166968
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail pass in 166968
 test-armhf-armhf-xl-credit2  14 guest-start                fail pass in 166968
 test-armhf-armhf-xl-rtds     14 guest-start                fail pass in 166968
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start             fail pass in 166978
 test-amd64-i386-libvirt-pair 25 guest-start/debian         fail pass in 166978
 test-armhf-armhf-xl-arndale  14 guest-start                fail pass in 166978
 test-amd64-amd64-xl-credit1  22 guest-start/debian.repeat  fail pass in 166978
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail pass in 166978
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat  fail pass in 166978
 test-amd64-i386-libvirt-raw  19 guest-start/debian.repeat  fail pass in 166978
 test-arm64-arm64-xl-xsm      14 guest-start                fail pass in 166978
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 166978
 test-armhf-armhf-xl-cubietruck 19 guest-start.2            fail pass in 166978
 test-amd64-i386-xl-vhd       21 guest-start/debian.repeat  fail pass in 166978
 test-armhf-armhf-libvirt     18 guest-start/debian.repeat  fail pass in 166978
 test-armhf-armhf-libvirt-raw 18 guest-start.2              fail pass in 166978

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds    22 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 166968 REGR. vs. 166954

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 166968 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 166968 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 166968 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 166968 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 166978 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 166978 never pass
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 166978 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 166978 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166954
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166954
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166954
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166954
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166954
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166954
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166954
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166954
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                682aa69b1f4dd5f2905a94066fa4c853adc33251
baseline version:
 qemuu                50456a6794fbb8dc94a31eb9534e91c586da7add

Last test of basis   166954  2021-11-30 08:39:11 Z    2 days
Testing same since   166968  2021-12-01 06:37:45 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eduardo Habkost <ehabkost@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>

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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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
commit 682aa69b1f4dd5f2905a94066fa4c853adc33251
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Dec 1 07:20:06 2021 +0100

    Update version for v6.2.0-rc3 release
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 24c4cd1311a45fa8ecfcde2f7b7afe84eb17dfac
Author: Eduardo Habkost <ehabkost@redhat.com>
Date:   Tue Nov 30 15:47:22 2021 -0500

    MAINTAINERS: Change my email address
    
    The ehabkost@redhat.com email address will stop working on
    2021-12-01, change it to my personal email address.
    
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Message-Id: <20211129163053.2506734-1-ehabkost@redhat.com>
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Message-Id: <20211130204722.2732997-2-ehabkost@redhat.com>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

