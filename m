Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A55FC028
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 07:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420699.665640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiURq-0003za-31; Wed, 12 Oct 2022 05:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420699.665640; Wed, 12 Oct 2022 05:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiURp-0003wV-VQ; Wed, 12 Oct 2022 05:38:29 +0000
Received: by outflank-mailman (input) for mailman id 420699;
 Wed, 12 Oct 2022 05:38:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiURo-0003w5-1h; Wed, 12 Oct 2022 05:38:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiURn-0005Cm-UC; Wed, 12 Oct 2022 05:38:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oiURn-0007De-Ie; Wed, 12 Oct 2022 05:38:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oiURn-0006Zj-IB; Wed, 12 Oct 2022 05:38:27 +0000
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
	bh=Knr+Jd/Tbnj8QilpArDQgdBcBMv27ZWuJgnpqwViK8k=; b=t4t8op7uFcN+CHRRk8RrDo3FJ2
	V82rhpdNJX4F7sPdJztM9kRKYktFocIFG1GGVZz5s0rBDYKvq/wSgmJVQQwB4Gry/MD4Y+BQAZPHb
	tVFlCDEOY4TQz+WhSpSW2ZAW5HjbH4QqpVYRtJO2C+OXYUL6gCGxW126zaba8CUI8BKo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173522-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.15-testing test] 173522: regressions - FAIL
X-Osstest-Failures:
    xen-4.15-testing:build-arm64:xen-build:fail:regression
    xen-4.15-testing:build-arm64-xsm:xen-build:fail:regression
    xen-4.15-testing:build-amd64-xsm:xen-build:fail:regression
    xen-4.15-testing:build-amd64:xen-build:fail:regression
    xen-4.15-testing:build-i386-xsm:xen-build:fail:regression
    xen-4.15-testing:build-i386:xen-build:fail:regression
    xen-4.15-testing:build-armhf:xen-build:fail:regression
    xen-4.15-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.15-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=9690bb261d5fa09cb281e1fa124d93db7b84fda5
X-Osstest-Versions-That:
    xen=9acedc3c58c31930737edbe212f2ccf437a0b757
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Oct 2022 05:38:27 +0000

flight 173522 xen-4.15-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173522/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 172547
 build-arm64-xsm               6 xen-build                fail REGR. vs. 172547
 build-amd64-xsm               6 xen-build                fail REGR. vs. 172547
 build-amd64                   6 xen-build                fail REGR. vs. 172547
 build-i386-xsm                6 xen-build                fail REGR. vs. 172547
 build-i386                    6 xen-build                fail REGR. vs. 172547
 build-armhf                   6 xen-build                fail REGR. vs. 172547

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
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
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
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  9690bb261d5fa09cb281e1fa124d93db7b84fda5
baseline version:
 xen                  9acedc3c58c31930737edbe212f2ccf437a0b757

Last test of basis   172547  2022-08-15 14:06:45 Z   57 days
Testing same since   173494  2022-10-11 13:38:08 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tim Deegan <tim@xen.org>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64-xtf                                              pass    
 build-amd64                                                  fail    
 build-arm64                                                  fail    
 build-armhf                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             pass    
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
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   blocked 
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      blocked 
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

(No revision log; it would be 689 lines long.)

