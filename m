Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5905611F86
	for <lists+xen-devel@lfdr.de>; Sat, 29 Oct 2022 05:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432251.685035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooc4r-0002rl-J7; Sat, 29 Oct 2022 03:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432251.685035; Sat, 29 Oct 2022 03:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooc4r-0002mV-DC; Sat, 29 Oct 2022 03:00:05 +0000
Received: by outflank-mailman (input) for mailman id 432251;
 Sat, 29 Oct 2022 03:00:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooc4q-0002fn-Am; Sat, 29 Oct 2022 03:00:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooc4q-0008Sq-7q; Sat, 29 Oct 2022 03:00:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooc4p-0000PK-SF; Sat, 29 Oct 2022 03:00:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ooc4p-00021r-Q3; Sat, 29 Oct 2022 03:00:03 +0000
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
	bh=xgGaI60cjiIiLJCgA2udFbzlrx28gvSM8HpfYlUCTlw=; b=4QfXIrNfTe1m2QbBe2gEH4EVTp
	eE4nByF8VkqJXdePRe4NCA4zZOppStr+qNYzRr9ISAyS9C13rnjoeucMzN0gYAzSylBhBo6mVVLF1
	wobFDI9R5eI2JvR2JlEB/lLUXifdzNWd38I4k6q9F0sad1mVIJ04GJIozrzLvOeF5LmM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174533-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 174533: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:build-armhf:<job status>:broken:regression
    linux-5.4:build-armhf:host-build-prep:fail:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start.2:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=fe18f1af38a7999e05a6564c80d63e8d9df5ee60
X-Osstest-Versions-That:
    linux=fd92cfed8bc6668d314acd1e6da708a80826f768
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Oct 2022 03:00:03 +0000

flight 174533 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174533/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken  in 174530
 build-armhf                  5 host-build-prep fail in 174530 REGR. vs. 174012

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-pvhv2-intel 20 guest-localmigrate/x10 fail in 174511 pass in 174533
 test-armhf-armhf-xl-multivcpu 14 guest-start     fail in 174511 pass in 174533
 test-armhf-armhf-libvirt-qcow2 13 guest-start    fail in 174511 pass in 174533
 test-armhf-armhf-xl-arndale  18 guest-start/debian.repeat  fail pass in 174511
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 174511
 test-armhf-armhf-libvirt-raw 13 guest-start                fail pass in 174511
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail pass in 174530
 test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install    fail pass in 174530

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt      1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)         blocked in 174530 n/a
 build-armhf-libvirt           1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl           1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-examine      1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)           blocked in 174530 n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)         blocked in 174530 n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)          blocked in 174530 n/a
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail blocked in 174012
 test-armhf-armhf-xl-credit1  19 guest-start.2           fail blocked in 174012
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail in 174511 like 174012
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 174511 like 174012
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 174511 like 174012
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 174511 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174012
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174012
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174012
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 174012
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174012
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174012
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174012
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174012
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174012
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174012
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174012
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174012
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                fe18f1af38a7999e05a6564c80d63e8d9df5ee60
baseline version:
 linux                fd92cfed8bc6668d314acd1e6da708a80826f768

Last test of basis   174012  2022-10-17 16:21:11 Z   11 days
Testing same since   174450  2022-10-26 11:42:18 Z    2 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Albert Briscoe <albertsbriscoe@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Coffin <alex.coffin@matician.com>
  Alexander Dahl <ada@thorsis.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Lyashkov <alexey.lyashkov@gmail.com>
  Allen Pais <apais@linux.microsoft.com>
  Alvin Šipraga <alsi@bang-olufsen.dk>
  Andreas Pape <apape@de.adit-jv.com>
  Andrew Bresticker <abrestic@rivosinc.com>
  Andrew Gaul <gaul@gaul.org>
  Andrew Gaul <gaul@google.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Perepechko <anserper@ya.ru>
  Andri Yngvason <andri@yngvason.is>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anssi Hannula <anssi.hannula@bitwise.fi>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvid Norlander <lkml@vorpal.se>
  Baokun Li <libaokun1@huawei.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bernard Metzler <bmt@zurich.ibm.com>
  Bitterblue Smith <rtl8821cerfe2@gmail.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Callum Osmotherly <callum.osmotherly@gmail.com>
  Carlos Llamas <cmllamas@google.com>
  Chao Qin <chao.qin@intel.com>
  Chao Yu <chao@kernel.org>
  Chen-Yu Tsai <wenst@chromium.org>
  Chi-hsien Lin <chi-hsien.lin@cypress.com>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Coly Li <colyli@suse.de>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Collins <collinsd@codeaurora.org>
  David Gow <davidgow@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Teigland <teigland@redhat.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eddie James <eajames@linux.ibm.com>
  Eric Dumazet <edumazet@google.com>
  Eugeniu Rosca <erosca@de.adit-jv.com>
  Fangrui Song <maskray@google.com>
  Fenglin Wu <quic_fenglinw@quicinc.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Frederic Barrat <fbarrat@linux.ibm.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Haibo Chen <haibo.chen@nxp.com>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hari Chandrakanthan <quic_haric@quicinc.com>
  Hawkins Jiawei <yin31149@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hillf Danton <hdanton@sina.com>
  hongao <hongao@uniontech.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hyunwoo Kim <imv4bel@gmail.com>
  Ian Nam <young.kwan.nam@xilinx.com>
  Ignat Korchagin <ignat@cloudflare.com>
  Ingo Molnar <mingo@kernel.org>
  Jack Wang <jinpu.wang@ionos.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jason Baron <jbaron@akamai.com>
  Jassi Brar <jaswinder.singh@linaro.org>
  Javier Martinez Canillas <javierm@redhat.com>
  Jean-Francois Le Fillatre <jflf_kernel@gmx.com>
  Jens Axboe <axboe@kernel.dk>
  Jerry Lee <jerrylee@qnap.com>
  Jerry Lee 李修賢 <jerrylee@qnap.com>
  Jes Sorensen <Jes.Sorensen@gmail.com>
  Jianglei Nie <niejianglei2021@163.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jim Cromie <jim.cromie@gmail.com>
  Jimmy Assarsson <extja@kvaser.com>
  Jinke Han <hanjinke.666@bytedance.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Junichi Uekawa <uekawa@chromium.org>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Keith Busch <kbusch@kernel.org>
  Kevin(Yudong) Yang <yyd@google.com>
  Khalid Masum <khalid.masum.92@gmail.com>
  Koba Ko <koba.ko@canonical.com>
  Kohei Tarumizu <tarumizu.kohei@fujitsu.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Lalith Rajendran <lalithkraj@google.com>
  Lam Thai <lamthai@arista.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Letu Ren <fantasquex@gmail.com>
  Liang He <windhl@126.com>
  Liang Yang <liang.yang@amlogic.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Jian <liujian56@huawei.com>
  Logan Gunthorpe <logang@deltatee.com>
  Lorenz Bauer <oss@lmb.io>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Lyude Paul <lyude@redhat.com>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Behún <kabel@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Liska <mliska@suse.cz>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxime Ripard <maxime@cerno.tech>
  Maya Matuszczyk <maccraft123mc@gmail.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Michal Luczaj <mhal@rbox.co>
  Michal Simek <michal.simek@amd.com>
  Mike Pattrick <mkp@redhat.com>
  Mingzhe Zou <mingzhe.zou@easystack.cn>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nam Cao <namcaov@gmail.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dufresne <nicolas.dufresne@collabora.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Ninad Naik <ninad.naik@intel.com>
  Noralf Trønnes <noralf@tronnes.org>
  Nuno Sá <nuno.sa@analog.com>
  Olga Kornievskaia <kolga@netapp.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  Paul Moore <paul@paul-moore.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Robinson <pbrobinson@gmail.com>
  Peter Rosin <peda@axentia.se>
  Peter Xu <peterx@redhat.com>
  Petr Mladek <pmladek@suse.com>
  Phil Sutter <phil@nwl.cc>
  Philipp Hortmann <philipp.g.hortmann@gmail.com>
  Qu Wenruo <wqu@suse.com>
  Quanyang Wang <quanyang.wang@windriver.com>
  Quentin Monnet <quentin@isovalent.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Reinette Chatre <reinette.chatre@intel.com>
  Rich Felker <dalias@libc.org>
  Richard Acayan <mailingradian@gmail.com>
  Richard Weinberger <richard@nod.at>
  Rik van Riel <riel@surriel.com>
  Rob Clark <robdclark@chromium.org>
  Robert Foss <robert.foss@linaro.org>
  Robin Guo <guoweibin@inspur.com>
  Robin Murphy <robin.murphy@arm.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Rustam Subkhankulov <subkhankulov@ispras.ru>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saranya Gopal <saranya.gopal@intel.com>
  Sasha Levin <sashal@kernel.org>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shawn Guo <shawnguo@kernel.org>
  Sherry Sun <sherry.sun@nxp.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Slade Watkins <srw@sladewatkins.net>
  Song Liu <song@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stanislaw Gruszka <stf_xl@wp.pl>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  sunghwan jung <onenowy@gmail.com>
  Sungwoo Kim <iam@sung-woo.kim>
  syzbot <syzbot+78c55c7bc6f66e53dce2@syzkaller.appspotmail.com>
  syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
  Tadeusz Struk<tadeusz.struk@linaro.org>
  Takashi Iwai <tiwai@suse.de>
  Tales Aparecida <tales.aparecida@gmail.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thara Gopinath <tgopinath@microsoft.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Varun Prakash <varun@chelsio.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vinod Koul <vkoul@kernel.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Waiman Long <longman@redhat.com>
  Wang Kefeng <wangkefeng.wang@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wen Gong <quic_wgong@quicinc.com>
  Wenchao Chen <wenchao.chen@unisoc.com>
  William Dean <williamsukatube@gmail.com>
  Wright Feng <wright.feng@cypress.com>
  Xiaoke Wang <xkernel.wang@foxmail.com>
  Xin Long <lucien.xin@gmail.com>
  Xu Qiang <xuqiang36@huawei.com>
  Yonghong Song <yhs@fb.com>
  Yuchung Cheng <ycheng@google.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zheyu Ma <zheyuma97@gmail.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
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
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
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
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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

broken-job build-armhf broken

Not pushing.

(No revision log; it would be 7597 lines long.)

