Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C78784FAA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 06:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588897.920523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYfXc-0007Jo-54; Wed, 23 Aug 2023 04:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588897.920523; Wed, 23 Aug 2023 04:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYfXc-0007HE-2F; Wed, 23 Aug 2023 04:32:24 +0000
Received: by outflank-mailman (input) for mailman id 588897;
 Wed, 23 Aug 2023 04:32:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qYfXa-0007Gl-FJ; Wed, 23 Aug 2023 04:32:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qYfXa-0003si-7z; Wed, 23 Aug 2023 04:32:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qYfXZ-0000Lg-Ki; Wed, 23 Aug 2023 04:32:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qYfXZ-0002zf-KK; Wed, 23 Aug 2023 04:32:21 +0000
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
	bh=/bPuyYH9XRy9rMZa312FhgqpmRP6y1cCQFzJLzuY/tw=; b=HoTOIZOAPUG4S135AZfbiFJ7+j
	R6fFzmfszV5sQLd/w7sEYIzuqAicJXGCeFKd7nABzap1xyx5+hV2oCrCP7JZjuPuelXDeCHsop/w6
	GfuqCn5KaSPtU+UgcV4jMKAYnsbxG98ueGaOnB0Eu/6VOzDPsjGFy7p+aRtsC3M6VIoM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182423-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 182423: regressions - FAIL
X-Osstest-Failures:
    xen-4.17-testing:build-amd64-xsm:xen-build:fail:regression
    xen-4.17-testing:build-amd64-prev:xen-build:fail:regression
    xen-4.17-testing:build-amd64:xen-build:fail:regression
    xen-4.17-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=052a8d24bc670ab6503e21dfd2fb8bccfc22aa73
X-Osstest-Versions-That:
    xen=8d84be5b557b27e9cc53e48285aebad28a48468c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Aug 2023 04:32:21 +0000

flight 182423 xen-4.17-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182423/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 182410
 build-amd64-prev              6 xen-build                fail REGR. vs. 182410
 build-amd64                   6 xen-build                fail REGR. vs. 182410

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182410
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182410
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182410
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  052a8d24bc670ab6503e21dfd2fb8bccfc22aa73
baseline version:
 xen                  8d84be5b557b27e9cc53e48285aebad28a48468c

Last test of basis   182410  2023-08-21 14:09:52 Z    1 days
Testing same since   182423  2023-08-22 17:10:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             fail    
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
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
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
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
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


Not pushing.

------------------------------------------------------------
commit 052a8d24bc670ab6503e21dfd2fb8bccfc22aa73
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Aug 8 14:53:42 2023 +0100

    tools/vchan: Fix -Wsingle-bit-bitfield-constant-conversion
    
    Gitlab reports:
    
      node.c:158:17: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
    
            ctrl->blocking = 1;
                           ^ ~
      1 error generated.
      make[4]: *** [/builds/xen-project/people/andyhhp/xen/tools/vchan/../../tools/Rules.mk:188: node.o] Error 1
    
    In Xen 4.18, this was fixed with c/s 99ab02f63ea8 ("tools: convert bitfields
    to unsigned type") but this is an ABI change which can't be backported.
    
    Swich 1 for -1 to provide a minimally invasive way to fix the build.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f00d56309533427981f09ef2614f1bae4bcab62e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 17 11:16:32 2023 +0000

    CI: Resync FreeBSD config with staging
    
    CI: Update FreeBSD to 13.1
    
    Also print the compiler version before starting.  It's not easy to find
    otherwise, and does change from time to time.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    (cherry picked from commit 5e7667ea2dd33e0e5e0f3a96db37fdb4ecd98fba)
    
    CI: Update FreeBSD to 13.2
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    (cherry picked from commit f872a624cbf92de9944483eea7674ef80ced1380)
    
    CI: Update FreeBSD to 12.4
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    (cherry picked from commit a73560896ce3c513460f26bd1c205060d6ec4f8a)

commit e418a77295e6b512d212b57123c11e4d4fb23e8c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Aug 18 11:05:00 2023 +0100

    rombios: Remove the use of egrep
    
    As the Alpine 3.18 container notes:
    
      egrep: warning: egrep is obsolescent; using grep -E
    
    Adjust it.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 5ddac3c2852ecc120acab86fc403153a2097c5dc)

commit 24487fec3bbebbc1fd3f00d16bca7fb0f56a5f30
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Aug 18 10:47:46 2023 +0100

    rombios: Avoid using K&R function syntax
    
    Clang-15 complains:
    
      tcgbios.c:598:25: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      void tcpa_calling_int19h()
                              ^
                               void
    
    C2x formally removes K&R syntax.  The declarations for these functions in
    32bitprotos.h are already ANSI compatible.  Update the definitions to match.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit a562afa5679d4a7ceb9cb9222fec1fea9a61f738)

commit ae1045c42954772e48862162d0e95fbc9393c91e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 17 21:32:53 2023 +0100

    rombios: Work around GCC issue 99578
    
    GCC 12 objects to pointers derived from a constant:
    
      util.c: In function 'find_rsdp':
      util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
        429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
      cc1: all warnings being treated as errors
    
    This is a GCC bug, but work around it rather than turning array-bounds
    checking off generally.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit e35138a2ffbe1fe71edaaaaae71063dc545a8416)

commit 37f1d68fa34220600f1e4ec82af5da70127757e5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 18 15:04:28 2023 +0200

    x86emul: rework wrapping of libc functions in test and fuzzing harnesses
    
    Our present approach is working fully behind the compiler's back. This
    was found to not work with LTO. Employ ld's --wrap= option instead. Note
    that while this makes the build work at least with new enough gcc (it
    doesn't with gcc7, for example, due to tool chain side issues afaict),
    according to my testing things still won't work when building the
    fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
    getting invoked, this does not happen with gcc13. Yet without using that
    assembler wrapper the resulting binary will look uninstrumented to
    afl-fuzz.
    
    While checking the resulting binaries I noticed that we've gained uses
    of snprintf() and strstr(), which only just so happen to not cause any
    problems. Add a wrappers for them as well.
    
    Since we don't have any actual uses of v{,sn}printf(), no definitions of
    their wrappers appear (just yet). But I think we want
    __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
    which means we need delarations of the latter.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    (cherry picked from commit 6fba45ca3be1c5d46cddb1eaf371d9e69550b244)

commit 476d2624ec3cf3e60709580ff1df208bb8f616e2
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Jul 31 15:02:34 2023 +0200

    Config.mk: evaluate XEN_COMPILE_ARCH and XEN_OS immediately
    
    With GNU make 4.4, the number of execution of the command present in
    these $(shell ) increased greatly. This is probably because as of make
    4.4, exported variable are also added to the environment of $(shell )
    construct.
    
    So to avoid having these command been run more than necessary, we
    will replace ?= by an equivalent but with immediate expansion.
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit a07414d989cf52e5e84192b78023bee1589bbda4)

commit a1f68fb56710c507f9c1ec8e8d784f5b1e4088f1
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Jul 31 15:02:18 2023 +0200

    build: evaluate XEN_BUILD_* and XEN_DOMAIN immediately
    
    With GNU make 4.4, the number of execution of the command present in
    these $(shell ) increased greatly. This is probably because as of make
    4.4, exported variable are also added to the environment of $(shell )
    construct.
    
    Also, `make -d` shows a lot of these:
        Makefile:15: not recursively expanding XEN_BUILD_DATE to export to shell function
        Makefile:16: not recursively expanding XEN_BUILD_TIME to export to shell function
        Makefile:17: not recursively expanding XEN_BUILD_HOST to export to shell function
        Makefile:14: not recursively expanding XEN_DOMAIN to export to shell function
    
    So to avoid having these command been run more than necessary, we
    will replace ?= by an equivalent but with immediate expansion.
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 0c594c1b57ee2ecec5f70826c53a2cf02a9c2acb)

commit 36e84ea02e1e8dce8f3a4e9351ab1c72dec3c11e
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 5 08:29:49 2023 +0200

    build: remove TARGET_ARCH, a duplicate of SRCARCH
    
    The same command is used to generate the value of both $(TARGET_ARCH)
    and $(SRCARCH), as $(ARCH) is an alias for $(XEN_TARGET_ARCH).
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit ac27b3beb9b7b423d5563768de890c7594c21b4e)

commit 56076ef445073458c39c481f9b70c3b4ff848839
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 5 08:27:51 2023 +0200

    build: remove TARGET_SUBARCH, a duplicate of ARCH
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit a6ab7dd061338c33faef629cbe52ed1608571d84)

commit 1c3927f8f6743538a35aa45a91a2d4adbde9f277
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 5 08:25:03 2023 +0200

    build: define ARCH and SRCARCH later
    
    Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
    immediate evaluation variable type.
    
    ARCH and SRCARCH depend on value defined in Config.mk and aren't used
    for e.g. TARGET_SUBARCH or TARGET_ARCH, and not before they're needed in
    a sub-make or a rule.
    
    This will help reduce the number of times the shell rune is been
    run.
    
    With GNU make 4.4, the number of execution of the command present in
    these $(shell ) increased greatly. This is probably because as of make
    4.4, exported variable are also added to the environment of $(shell )
    construct.
    
    Also, `make -d` shows a lot of these:
        Makefile:39: not recursively expanding SRCARCH to export to shell function
        Makefile:38: not recursively expanding ARCH to export to shell function
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 58e0a3f3b2c430f8640ef9df67ac857b0008ebc8)
(qemu changes not included)

