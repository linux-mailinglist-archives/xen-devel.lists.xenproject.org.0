Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8449CC6B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260950.451295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjOI-0002n9-H4; Wed, 26 Jan 2022 14:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260950.451295; Wed, 26 Jan 2022 14:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjOI-0002kj-Dr; Wed, 26 Jan 2022 14:35:18 +0000
Received: by outflank-mailman (input) for mailman id 260950;
 Wed, 26 Jan 2022 14:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCjOH-0002kZ-MF; Wed, 26 Jan 2022 14:35:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCjOH-00047p-Hl; Wed, 26 Jan 2022 14:35:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCjOH-0003Hg-8q; Wed, 26 Jan 2022 14:35:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nCjOH-0000Br-8N; Wed, 26 Jan 2022 14:35:17 +0000
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
	bh=1z6E+XJjo9V3V5dODDJB5Bi2KOu63IoSD1dayAMjO9g=; b=J2g9OYOYUvKnMI48KPpZV0jxCw
	pveRh8qjrOrgaBp3mbs6XMlen7IjXg05+ZufEJYPtCKq0ysiAW+dJE6/LnBdk9Wqqg6VF0F82Il8J
	hq40IZgQuu2Yr6mWtxNyW0TQMbP4nOTozMbIE3KpCDOMg4tI/J3UAaoWzs/Z5k6iFeNk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167833-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.15-testing test] 167833: regressions - FAIL
X-Osstest-Failures:
    xen-4.15-testing:build-amd64-xsm:xen-build:fail:regression
    xen-4.15-testing:build-amd64:xen-build:fail:regression
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
    xen-4.15-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
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
    xen-4.15-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.15-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=bd20d6c87619a6b825478cd5ae0387f9fdaabea0
X-Osstest-Versions-That:
    xen=a763f8f158e81158bdf2470dbc3d98353f2322e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jan 2022 14:35:17 +0000

flight 167833 xen-4.15-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167833/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 167628
 build-amd64                   6 xen-build                fail REGR. vs. 167628

Tests which did not succeed, but are not blocking:
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
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167628
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167628
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167628
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  bd20d6c87619a6b825478cd5ae0387f9fdaabea0
baseline version:
 xen                  a763f8f158e81158bdf2470dbc3d98353f2322e2

Last test of basis   167628  2022-01-07 07:36:33 Z   19 days
Testing same since   167813  2022-01-25 13:06:39 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>

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
 test-armhf-armhf-xl-cubietruck                               pass    
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


Not pushing.

------------------------------------------------------------
commit bd20d6c87619a6b825478cd5ae0387f9fdaabea0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 25 13:46:28 2022 +0100

    x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling
    
    The logic was based on a mistaken understanding of how NMI blocking on vmexit
    works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
    Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
    and the guest's value will be clobbered before it is saved.
    
    Switch to using MSR load/save lists.  This causes the guest value to be saved
    atomically with respect to NMIs/MCEs/etc.
    
    First, update vmx_cpuid_policy_changed() to configure the load/save lists at
    the same time as configuring the intercepts.  This function is always used in
    remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
    function, rather than having multiple remote acquisitions of the same VMCS.
    
    Both of vmx_{add,del}_guest_msr() can fail.  The -ESRCH delete case is fine,
    but all others are fatal to the running of the VM, so handle them using
    domain_crash() - this path is only used during domain construction anyway.
    
    Second, update vmx_{get,set}_reg() to use the MSR load/save lists rather than
    vcpu_msrs, and update the vcpu_msrs comment to describe the new state
    location.
    
    Finally, adjust the entry/exit asm.
    
    Because the guest value is saved and loaded atomically, we do not need to
    manually load the guest value, nor do we need to enable SCF_use_shadow.  This
    lets us remove the use of DO_SPEC_CTRL_EXIT_TO_GUEST.  Additionally,
    SPEC_CTRL_ENTRY_FROM_PV gets removed too, because on an early entry failure,
    we're no longer in the guest MSR_SPEC_CTRL context needing to switch back to
    Xen's context.
    
    The only action remaining is to load Xen's MSR_SPEC_CTRL value on vmexit.  We
    could in principle use the host msr list, but is expected to complicated
    future work.  Delete DO_SPEC_CTRL_ENTRY_FROM_HVM entirely, and use a shorter
    code sequence to simply reload Xen's setting from the top-of-stack block.
    
    Adjust the comment at the top of spec_ctrl_asm.h in light of this bugfix.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 81f0eaadf84d273a6ff8df3660b874a02d0e7677
    master date: 2022-01-20 16:32:11 +0000

commit bffdcc0dc454838e1c75a1e9d98ab140d7aff421
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 25 13:46:14 2022 +0100

    x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
    
    These were written before Spectre/Meltdown went public, and there was large
    uncertainty in how the protections would evolve.  As it turns out, they're
    very specific to Intel hardware, and not very suitable for AMD.
    
    Drop the macros, opencoding the relevant subset of functionality, and leaving
    grep-fodder to locate the logic.  No change at all for VT-x.
    
    For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
    although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.
    
    This has a marginal improvement of removing an unconditional pile of long-nops
    from the vmentry/exit path.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 95b13fa43e0753b7514bef13abe28253e8614f62
    master date: 2022-01-20 16:32:11 +0000

commit 2e4507eb358b580378b0a7aaa6d357401abbca88
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 25 13:45:58 2022 +0100

    x86/msr: Split MSR_SPEC_CTRL handling
    
    In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
    MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
    
    Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
    The SVM path is currently unreachable because of the CPUID policy.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 6536688439dbca1d08fd6db5be29c39e3917fb2f
    master date: 2022-01-20 16:32:11 +0000

commit ff2ce108699b2e1c49bdadc0fecb8e77cf8b34ae
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 25 13:45:33 2022 +0100

    x86/guest: Introduce {get,set}_reg() infrastructure
    
    Various registers have per-guest-type or per-vendor locations or access
    requirements.  To support their use from common code, provide accessors which
    allow for per-guest-type behaviour.
    
    For now, just infrastructure handling default cases and expectations.
    Subsequent patches will start handling registers using this infrastructure.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 88d3ff7ab15da277a85b39735797293fb541c718
    master date: 2022-01-20 16:32:11 +0000

commit 7ca8706ad53d5967fd15fa94c2dd5ada8d42d812
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Tue Jan 25 13:45:09 2022 +0100

    libxl/PCI: Fix PV hotplug & stubdom coldplug
    
    commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
    reflected in the config" broken PCI hotplug (xl pci-attach) for PV
    domains when it moved libxl__create_pci_backend() later in the function.
    
    This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
    PCI devices are hotplugged to a running PV stubdom, and then the QEMU
    QMP device_add commands are made to QEMU inside the stubdom.
    
    A running PV domain calls libxl__wait_for_backend().  With the current
    placement of libxl__create_pci_backend(), the path does not exist and
    the call immediately fails:
    libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
    libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
    libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
    
    The wait is only relevant when:
    1) The domain is PV
    2) The domain is running
    3) The backend is already present
    
    This is because:
    
    1) xen-pcifront is only used for PV.  It does not load for HVM domains
       where QEMU is used.
    
    2) If the domain is not running (starting), then the frontend state will
       be Initialising.  xen-pciback waits for the frontend to transition to
       at Initialised before attempting to connect.  So a wait for a
       non-running domain is not applicable as the backend will not
       transition to Connected.
    
    3) For presence, num_devs is already used to determine if the backend
       needs to be created.  Re-use num_devs to determine if the backend
       wait is necessary.  The wait is necessary to avoid racing with
       another PCI attachment reconfiguring the front/back or changing to
       some other state like closing.  If we are creating the backend, then
       we don't have to worry about the state since it is being created.
    
    Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
    reflected in the config")
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    master commit: 73ee2795aaef2cb086ac078bffe1c6b33c0ea91b
    master date: 2022-01-13 14:33:16 +0100

commit ac71fdd9ec8a54240cc09827203197674353a722
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jan 25 13:44:55 2022 +0100

    x86/time: improve TSC / CPU freq calibration accuracy
    
    While the problem report was for extreme errors, even smaller ones would
    better be avoided: The calculated period to run calibration loops over
    can (and usually will) be shorter than the actual time elapsed between
    first and last platform timer and TSC reads. Adjust values returned from
    the init functions accordingly.
    
    On a Skylake system I've tested this on accuracy (using HPET) went from
    detecting in some cases more than 220kHz too high a value to about
    ±2kHz. On other systems (or on this system, but with PMTMR) the original
    error range was much smaller, with less (in some cases only very little)
    improvement.
    
    Reported-by: James Dingwall <james-xen@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: a5c9a80af34eefcd6e31d0ed2b083f452cd9076d
    master date: 2022-01-13 14:31:52 +0100

commit 793d5ca89fdd9e2cdcb05e88c6cd8446e475b15a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jan 25 13:44:42 2022 +0100

    x86/time: use relative counts in calibration loops
    
    Looping until reaching/exceeding a certain value is error prone: If the
    target value is close enough to the wrapping point, the loop may not
    terminate at all. Switch to using delta values, which then allows to
    fold the two loops each into just one.
    
    Fixes: 93340297802b ("x86/time: calibrate TSC against platform timer")
    Reported-by: Roger Pau Monné <roger.pau@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 467191641d2a2fd2e43b3ae7b80399f89d339980
    master date: 2022-01-13 14:30:18 +0100

commit 13e7fe4c938f92933c6aa89e416e3085b13a22c7
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jan 25 13:42:53 2022 +0100

    passthrough/x86: stop pirq iteration immediately in case of error
    
    pt_pirq_iterate() will iterate in batch over all the PIRQs. The outer
    loop will bail out if 'rc' is non-zero but the inner loop will continue.
    
    This means 'rc' will get clobbered and we may miss any errors (such as
    -ERESTART in the case of the callback pci_clean_dpci_irq()).
    
    This is CVE-2022-23035 / XSA-395.
    
    Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
    Fixes: f6dd295381f4 ("dpci: replace tasklet with softirq")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 9480a1a519cf016623f657dc544cb372a82b5708
    master date: 2022-01-25 13:27:02 +0100

commit 2700abffa5e42cf04dc1c6eba73faaba670c99df
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jan 25 13:42:21 2022 +0100

    xen/grant-table: Only decrement the refcounter when grant is fully unmapped
    
    The grant unmapping hypercall (GNTTABOP_unmap_grant_ref) is not a
    simple revert of the changes done by the grant mapping hypercall
    (GNTTABOP_map_grant_ref).
    
    Instead, it is possible to partially (or even not) clear some flags.
    This will leave the grant is mapped until a future call where all
    the flags would be cleared.
    
    XSA-380 introduced a refcounting that is meant to only be dropped
    when the grant is fully unmapped. Unfortunately, unmap_common() will
    decrement the refcount for every successful call.
    
    A consequence is a domain would be able to underflow the refcount
    and trigger a BUG().
    
    Looking at the code, it is not clear to me why a domain would
    want to partially clear some flags in the grant-table. But as
    this is part of the ABI, it is better to not change the behavior
    for now.
    
    Fix it by checking if the maptrack handle has been released before
    decrementing the refcounting.
    
    This is CVE-2022-23034 / XSA-394.
    
    Fixes: 9781b51efde2 ("gnttab: replace mapkind()")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 975a8fb45ca186b3476e5656c6ad5dad1122dbfd
    master date: 2022-01-25 13:25:49 +0100

commit 53220c4f9db70331284424ff5ff5f286dd3fbc16
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jan 25 13:41:59 2022 +0100

    xen/arm: p2m: Always clear the P2M entry when the mapping is removed
    
    Commit 2148a125b73b ("xen/arm: Track page accessed between batch of
    Set/Way operations") allowed an entry to be invalid from the CPU PoV
    (lpae_is_valid()) but valid for Xen (p2m_is_valid()). This is useful
    to track which page is accessed and only perform an action on them
    (e.g. clean & invalidate the cache after a set/way instruction).
    
    Unfortunately, __p2m_set_entry() is only zeroing the P2M entry when
    lpae_is_valid() returns true. This means the entry will not be zeroed
    if the entry was valid from Xen PoV but invalid from the CPU PoV for
    tracking purpose.
    
    As a consequence, this will allow a domain to continue to access the
    page after it was removed.
    
    Resolve the issue by always zeroing the entry if it the LPAE bit is
    set or the entry is about to be removed.
    
    This is CVE-2022-23033 / XSA-393.
    
    Reported-by: Dmytro Firsov <Dmytro_Firsov@epam.com>
    Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of Set/Way operations")
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    master commit: a428b913a002eb2b7425b48029c20a52eeee1b5a
    master date: 2022-01-25 13:25:01 +0100
(qemu changes not included)

