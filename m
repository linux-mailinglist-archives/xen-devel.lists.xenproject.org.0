Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C6C466B69
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 22:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237009.411027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mstIk-0005vw-Ag; Thu, 02 Dec 2021 21:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237009.411027; Thu, 02 Dec 2021 21:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mstIk-0005tL-69; Thu, 02 Dec 2021 21:07:34 +0000
Received: by outflank-mailman (input) for mailman id 237009;
 Thu, 02 Dec 2021 21:07:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mstIi-0005tA-6m; Thu, 02 Dec 2021 21:07:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mstIh-0001gd-VO; Thu, 02 Dec 2021 21:07:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mstIh-00052t-Kc; Thu, 02 Dec 2021 21:07:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mstIh-0002ry-K3; Thu, 02 Dec 2021 21:07:31 +0000
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
	bh=hgZXMbp8O98bm1YQkxJ398tBYwPUOXMNaz5iPYMf3UI=; b=BNeRTROMhgx32v4n1nHtOLQHHS
	MBERf0UZ3jrqTrBMefEzKf2NqNku77RLSBaoewLT4oGpCEpdeMxnY22cKU2AaWVE/tUBAu5JyrKox
	LXiS9yunFHNC+nB/97GJ0ic+7Amxj6PAdiV+4nvfblnkxsRqm5mcuVogiTjvcSrZlQgs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166999-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 166999: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:regression
    xen-unstable:test-amd64-coresched-amd64-xl:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:regression
    xen-unstable:test-arm64-arm64-xl-seattle:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl:guest-start/debian.repeat:fail:regression
    xen-unstable:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:regression
    xen-unstable:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    xen-unstable:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start.2:fail:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-stop.audited:fail:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:guest-destroy:fail:regression
    xen-unstable:test-amd64-i386-xl:guest-destroy:fail:regression
    xen-unstable:test-amd64-amd64-xl:guest-start:fail:heisenbug
    xen-unstable:test-amd64-i386-xl:guest-start:fail:heisenbug
    xen-unstable:test-amd64-i386-pair:guest-start/debian:fail:heisenbug
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-shadow:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:guest-start:fail:heisenbug
    xen-unstable:test-arm64-arm64-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-libvirt-raw:debian-di-install:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-libvirt-xsm:guest-start:fail:heisenbug
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-xl:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-pygrub:guest-start.2:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:heisenbug
    xen-unstable:test-amd64-coresched-i386-xl:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-shadow:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-xl-thunderx:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl:guest-start:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-cubietruck:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e7f147bf4ac725492962a501da72f5ab6be682db
X-Osstest-Versions-That:
    xen=5449ba84e99849ee2339fd79f9717e10113d702d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Dec 2021 21:07:31 +0000

flight 166999 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166999/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm      22 guest-start/debian.repeat fail REGR. vs. 166912
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail REGR. vs. 166912
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166912
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166912
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166912
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166912
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup        fail REGR. vs. 166941
 test-amd64-coresched-amd64-xl 22 guest-start/debian.repeat fail REGR. vs. 166941
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail REGR. vs. 166941
 test-arm64-arm64-xl-seattle 18 guest-start/debian.repeat fail REGR. vs. 166941
 test-amd64-amd64-xl         22 guest-start/debian.repeat fail REGR. vs. 166941
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166941
 test-arm64-arm64-libvirt-xsm 18 guest-start/debian.repeat fail REGR. vs. 166941
 test-arm64-arm64-xl-xsm     18 guest-start/debian.repeat fail REGR. vs. 166941
 test-amd64-amd64-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166941
 test-amd64-i386-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166941
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail REGR. vs. 166941
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 166941
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166941
 test-amd64-i386-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166941
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 21 guest-start.2 fail in 166966 REGR. vs. 166912
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail in 166966 REGR. vs. 166941
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 23 guest-stop.audited fail in 166966 REGR. vs. 166941
 test-amd64-i386-libvirt-xsm  22 guest-destroy  fail in 166975 REGR. vs. 166912
 test-amd64-i386-xl           24 guest-destroy  fail in 166975 REGR. vs. 166941

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl          14 guest-start      fail in 166966 pass in 166999
 test-amd64-i386-xl           14 guest-start      fail in 166966 pass in 166999
 test-amd64-i386-pair       25 guest-start/debian fail in 166966 pass in 166999
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install fail in 166966 pass in 166999
 test-amd64-amd64-xl-pvshim 22 guest-start/debian.repeat fail in 166966 pass in 166999
 test-amd64-amd64-xl-shadow 22 guest-start/debian.repeat fail in 166966 pass in 166999
 test-amd64-amd64-xl-multivcpu 22 guest-start/debian.repeat fail in 166966 pass in 166999
 test-armhf-armhf-libvirt     14 guest-start      fail in 166966 pass in 166999
 test-arm64-arm64-xl-vhd 17 guest-start/debian.repeat fail in 166966 pass in 166999
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 166966 pass in 166999
 test-arm64-arm64-libvirt-raw 12 debian-di-install fail in 166966 pass in 166999
 test-armhf-armhf-xl-vhd 17 guest-start/debian.repeat fail in 166966 pass in 166999
 test-arm64-arm64-libvirt-xsm 14 guest-start      fail in 166975 pass in 166999
 test-amd64-amd64-dom0pvh-xl-amd 22 guest-start/debian.repeat fail in 166975 pass in 166999
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail in 166975 pass in 166999
 test-arm64-arm64-xl 18 guest-start/debian.repeat fail in 166975 pass in 166999
 test-amd64-i386-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail in 166975 pass in 166999
 test-amd64-amd64-pygrub      22 guest-start.2    fail in 166975 pass in 166999
 test-armhf-armhf-libvirt 18 guest-start/debian.repeat fail in 166975 pass in 166999
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start           fail pass in 166966
 test-amd64-coresched-i386-xl 22 guest-start/debian.repeat  fail pass in 166966
 test-amd64-amd64-xl-credit2  22 guest-start/debian.repeat  fail pass in 166966
 test-amd64-amd64-libvirt     20 guest-start/debian.repeat  fail pass in 166966
 test-amd64-i386-xl-shadow    22 guest-start/debian.repeat  fail pass in 166966
 test-arm64-arm64-xl-thunderx 18 guest-start/debian.repeat  fail pass in 166966
 test-armhf-armhf-xl          14 guest-start                fail pass in 166966
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail pass in 166966
 test-amd64-amd64-xl-xsm      22 guest-start/debian.repeat  fail pass in 166975
 test-amd64-i386-xl           22 guest-start/debian.repeat  fail pass in 166975
 test-amd64-i386-libvirt-xsm  20 guest-start/debian.repeat  fail pass in 166975
 test-amd64-amd64-libvirt-xsm 20 guest-start/debian.repeat  fail pass in 166975
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail pass in 166975
 test-amd64-i386-libvirt      20 guest-start/debian.repeat  fail pass in 166975
 test-arm64-arm64-xl-credit2  18 guest-start/debian.repeat  fail pass in 166975
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail pass in 166975
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail pass in 166975
 test-amd64-i386-xl-vhd       21 guest-start/debian.repeat  fail pass in 166975
 test-armhf-armhf-xl-arndale  18 guest-start/debian.repeat  fail pass in 166975
 test-armhf-armhf-libvirt-raw 17 guest-start/debian.repeat  fail pass in 166975
 test-armhf-armhf-xl-cubietruck 18 guest-start/debian.repeat fail pass in 166975

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds   22 guest-start/debian.repeat fail blocked in 166941
 test-armhf-armhf-xl         15 migrate-support-check fail in 166966 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 166966 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166941
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166941
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166941
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 166941
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166941
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 166941
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166941
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166941
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166941
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166941
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166941
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  e7f147bf4ac725492962a501da72f5ab6be682db
baseline version:
 xen                  5449ba84e99849ee2339fd79f9717e10113d702d

Last test of basis   166941  2021-11-27 16:15:54 Z    5 days
Failing since        166960  2021-11-30 12:35:41 Z    2 days    4 attempts
Testing same since   166966  2021-12-01 05:46:26 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

(No revision log; it would be 396 lines long.)

