Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07F7344AF
	for <lists+xen-devel@lfdr.de>; Sun, 18 Jun 2023 04:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550703.859863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAiSh-0000cv-A3; Sun, 18 Jun 2023 02:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550703.859863; Sun, 18 Jun 2023 02:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAiSh-0000aU-5d; Sun, 18 Jun 2023 02:48:19 +0000
Received: by outflank-mailman (input) for mailman id 550703;
 Sun, 18 Jun 2023 02:48:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAiSg-0000aK-Cu; Sun, 18 Jun 2023 02:48:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAiSg-0006c0-4y; Sun, 18 Jun 2023 02:48:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAiSf-0007op-F0; Sun, 18 Jun 2023 02:48:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qAiSf-0005nX-D6; Sun, 18 Jun 2023 02:48:17 +0000
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
	bh=vbVlrsDxN0JddnjZeZ5uHOk8dYZnb2teQej+ggdsTu4=; b=pf5Rf9z4mfOKgGLH92OP8X8nLI
	/rR88xOu4Zq3+mAox1F0R39XgGtmI9rUtu781NarhpNcYf/OFGlRVkqQIRU/7DNi4v+I3+K/KpGeY
	hw7lWsmd5kUWtbsjAysSA+kFdm9enodR5lM5mBETq7JEMbIFq3K7ZyLGh1cgAik6JaEY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181482-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 181482: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:build-i386-pvops:kernel-build:fail:regression
    linux-5.4:build-armhf-pvops:kernel-build:fail:regression
    linux-5.4:test-amd64-amd64-xl-rtds:xen-boot:fail:heisenbug
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine-bios:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-examine-uefi:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=61a2f83e4762ee0c766f86944e612305f5888bcb
X-Osstest-Versions-That:
    linux=f568a20f058fa1e37069cff4aac4187c1650a0e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Jun 2023 02:48:17 +0000

flight 181482 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181482/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-pvops              6 kernel-build   fail in 181474 REGR. vs. 181363
 build-armhf-pvops             6 kernel-build   fail in 181474 REGR. vs. 181363

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-rtds      8 xen-boot         fail in 181474 pass in 181482
 test-amd64-amd64-qemuu-freebsd12-amd64 21 guest-start/freebsd.repeat fail in 181474 pass in 181482
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 181474

Tests which did not succeed, but are not blocking:
 test-amd64-i386-freebsd10-i386  1 build-check(1)         blocked in 181474 n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)     blocked in 181474 n/a
 test-armhf-armhf-examine      1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 181474 n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 181474 n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-pair          1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)    blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 181474 n/a
 test-amd64-i386-xl-xsm        1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)    blocked in 181474 n/a
 test-amd64-coresched-i386-xl  1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-examine-bios  1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)         blocked in 181474 n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-shadow     1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)   blocked in 181474 n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 181474 n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)    blocked in 181474 n/a
 test-amd64-i386-xl-vhd        1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-libvirt       1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)        blocked in 181474 n/a
 test-amd64-i386-xl            1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)   blocked in 181474 n/a
 test-armhf-armhf-xl           1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)    blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)    blocked in 181474 n/a
 test-amd64-i386-examine       1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)     blocked in 181474 n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-libvirt      1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-examine-uefi  1 build-check(1)           blocked in 181474 n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 181474 n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)          blocked in 181474 n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 1 build-check(1) blocked in 181474 n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 181474 n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)           blocked in 181474 n/a
 test-armhf-armhf-xl-credit2  14 guest-start                  fail  like 181354
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181363
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181363
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181363
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181363
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 181363
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat    fail  like 181363
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181363
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 181363
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181363
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181363
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                61a2f83e4762ee0c766f86944e612305f5888bcb
baseline version:
 linux                f568a20f058fa1e37069cff4aac4187c1650a0e9

Last test of basis   181363  2023-06-10 15:39:59 Z    7 days
Testing same since   181425  2023-06-14 10:50:49 Z    3 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ai Chao <aichao@kylinos.cn>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Hutchings <ben@decadent.org.uk>
  Chia-I Wu <olvaffe@gmail.com>
  Chris Paterson (CIP) <chris.paterson2@renesas.com>
  David Jander <david@protonic.nl>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Hangyu Hua <hbh25y@gmail.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ismael Ferreras Morezuelas <swyterzone@gmail.com>
  JaimeLiao <jaimeliao.tw@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Martin Hundebøll <martin@geanix.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Chan <michael.chan@broadcom.com>
  Min Li <lm0963hack@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Qingfang DENG <qingfang.deng@siflower.com.cn>
  Randy Dunlap <rdunlap@infradead.org>
  RenHai <kean0048@gmail.com>
  Rishabh Bhatnagar <risbhat@amazon.com>
  Ruihan Li <lrh2000@pku.edu.cn>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Somnath Kotur <somnath.kotur@broadcom.com>
  Stefan Ghinea <stefan.ghinea@windriver.com>
  Stephan Gerhold <stephan@gerhold.net>
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sungwoo Kim <iam@sung-woo.kim>
  Sven Eckelmann <sven@narfation.org>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Tijs Van Buggenhout <tijs.van.buggenhout@axsguard.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vladislav Efanov <VEfanov@ispras.ru>
  Wolfram Sang <wsa@kernel.org>
  Xiubo Li <xiubli@redhat.com>
  Ying Hsu <yinghsu@chromium.org>
  YouChing Lin <ycllin@mxic.com.tw>
  Zixuan Fu <r33s3n6@gmail.com>

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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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


Not pushing.

(No revision log; it would be 1380 lines long.)

