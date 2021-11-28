Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E34602ED
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 03:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234129.406369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr9dJ-00011j-Vc; Sun, 28 Nov 2021 02:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234129.406369; Sun, 28 Nov 2021 02:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr9dJ-0000zj-PA; Sun, 28 Nov 2021 02:09:37 +0000
Received: by outflank-mailman (input) for mailman id 234129;
 Sun, 28 Nov 2021 02:09:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mr9dI-0000zZ-Ed; Sun, 28 Nov 2021 02:09:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mr9dI-0002gb-6R; Sun, 28 Nov 2021 02:09:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mr9dH-00080G-T7; Sun, 28 Nov 2021 02:09:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mr9dH-0001Kh-Np; Sun, 28 Nov 2021 02:09:35 +0000
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
	bh=fdAASn/CDOH9Lxsd0qgsAD33vOd2beFn/Sq5OygUP6o=; b=3RzPzRRDze4YQc/tZ3Lwyvu81U
	3ghMKHF5Cw5FAaXhqgcM7/miGc3ySwXdjm60P+G3Tx/HceItZDozqGnckFaG1h36HYmnVjyUKTzah
	pTRcw4lwtqVEfAshsLww+LEl525OJdHWNmbqRA8R8nmWtJj+lGECoPbf4scWHknQ3uMU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166943-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.16-testing baseline test] 166943: tolerable FAIL
X-Osstest-Failures:
    qemu-upstream-4.16-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.16-testing:build-amd64:xen-build:fail:nonblocking
    qemu-upstream-4.16-testing:build-amd64-xsm:xen-build:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=b6e539830bf45e2d7a6bd86ddfdf003088b173b0
X-Osstest-Versions-That:
    qemuu=b6e539830bf45e2d7a6bd86ddfdf003088b173b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Nov 2021 02:09:35 +0000

"Old" tested version had not actually been tested; therefore in this
flight we test it, rather than a new candidate.  The baseline, if
any, is the most recent actually tested revision.

flight 166943 qemu-upstream-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166943/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 build-amd64                   6 xen-build               fail baseline untested
 build-amd64-xsm               6 xen-build               fail baseline untested
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail baseline untested
 test-armhf-armhf-libvirt   16 saverestore-support-check fail baseline untested
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail baseline untested
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                b6e539830bf45e2d7a6bd86ddfdf003088b173b0
baseline version:
 qemuu                b6e539830bf45e2d7a6bd86ddfdf003088b173b0

Last test of basis   166943  2021-11-27 20:40:13 Z    0 days
Testing same since                          (not found)         0 attempts

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
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


Published tested tree is already up to date.


