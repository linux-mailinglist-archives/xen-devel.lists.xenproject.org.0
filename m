Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C467157A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480198.744462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3G8-0005vm-Tg; Wed, 18 Jan 2023 07:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480198.744462; Wed, 18 Jan 2023 07:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3G8-0005tg-Qr; Wed, 18 Jan 2023 07:53:24 +0000
Received: by outflank-mailman (input) for mailman id 480198;
 Wed, 18 Jan 2023 07:53:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI3G7-0005tW-So; Wed, 18 Jan 2023 07:53:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI3G7-0001QE-Oi; Wed, 18 Jan 2023 07:53:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pI3G7-00049M-FG; Wed, 18 Jan 2023 07:53:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pI3G7-0002hF-Ep; Wed, 18 Jan 2023 07:53:23 +0000
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
	bh=KCBFwF0KDlfqAYtZoNlKTy+/lE6ftfKq41idSTQUJhw=; b=sGtlj5BW66hpbgd3aX7pTxuQuX
	LdKmYcwcJ+yUfNxnTMxXulzN5zQXHwK6Nbz9hmUzZWdA0ADFEAqq409vxns29C66u4blV9+NtvMZb
	qHGCzJJ2G04QPml4bKamVfyFwMaK+FqSjvnO/cCXOm9UtgRUn8P3N3wdS7eBQAQhDX38=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175938-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-unstable test] 175938: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-upstream-unstable:test-armhf-armhf-libvirt:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-libvirt-qcow2:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-libvirt-qcow2:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-libvirt:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-cubietruck:host-install(5):broken:regression
    qemu-upstream-unstable:test-armhf-armhf-xl:host-install(5):broken:regression
    qemu-upstream-unstable:build-amd64:xen-build:fail:regression
    qemu-upstream-unstable:build-i386-xsm:xen-build:fail:regression
    qemu-upstream-unstable:build-amd64-xsm:xen-build:fail:regression
    qemu-upstream-unstable:build-i386:xen-build:fail:regression
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:host-install(5):broken:allowable
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:build-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=625eb5e96dc96aa7fddef59a08edae215527f19c
X-Osstest-Versions-That:
    qemuu=1cf02b05b27c48775a25699e61b93b814b9ae042
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Jan 2023 07:53:23 +0000

flight 175938 qemu-upstream-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175938/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt-qcow2    <job status>                 broken
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-vhd       5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-xl-multivcpu  5 host-install(5)       broken REGR. vs. 175283
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)      broken REGR. vs. 175283
 test-armhf-armhf-xl-credit2   5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-libvirt-raw  5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-xl-credit1   5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-libvirt      5 host-install(5)        broken REGR. vs. 175283
 test-armhf-armhf-xl-cubietruck  5 host-install(5)      broken REGR. vs. 175283
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 175283
 build-amd64                   6 xen-build                fail REGR. vs. 175283
 build-i386-xsm                6 xen-build                fail REGR. vs. 175283
 build-amd64-xsm               6 xen-build                fail REGR. vs. 175283
 build-i386                    6 xen-build                fail REGR. vs. 175283

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      5 host-install(5)        broken REGR. vs. 175283

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
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
 build-i386-libvirt            1 build-check(1)               blocked  n/a
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
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                625eb5e96dc96aa7fddef59a08edae215527f19c
baseline version:
 qemuu                1cf02b05b27c48775a25699e61b93b814b9ae042

Last test of basis   175283  2022-12-15 15:42:37 Z   33 days
Testing same since   175938  2023-01-17 15:37:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          broken  
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
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-armhf-armhf-libvirt-qcow2                               broken  
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      broken  
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

broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-libvirt-qcow2 broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-arndale broken
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-libvirt-qcow2 host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 625eb5e96dc96aa7fddef59a08edae215527f19c
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Fri Jan 6 15:21:10 2023 +0100

    configure: Expand test which disable -Wmissing-braces
    
    With "clang 6.0.0-1ubuntu2" on Ubuntu Bionic, the test with build
    fine, but clang still suggest braces around the zero initializer in a
    few places, where there is a subobject. Expand test to include a sub
    struct which doesn't build on clang 6.0.0-1ubuntu2, and give:
        config-temp/qemu-conf.c:7:8: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
        } x = {0};
               ^
               {}
    
    These are the error reported by clang on QEMU's code (v7.2.0):
    hw/pci-bridge/cxl_downstream.c:101:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
        dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
    
    hw/pci-bridge/cxl_root_port.c:62:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
        dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
    
    tests/qtest/virtio-net-test.c:322:34: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
        QOSGraphTestOptions opts = { 0 };
    
    Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Message-Id: <20230106142110.672-1-anthony.perard@citrix.com>

