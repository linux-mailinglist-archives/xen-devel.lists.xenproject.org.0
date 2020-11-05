Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CF2A7C69
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 11:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19706.44988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacw3-000300-Q0; Thu, 05 Nov 2020 10:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19706.44988; Thu, 05 Nov 2020 10:56:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacw3-0002zb-Mk; Thu, 05 Nov 2020 10:56:07 +0000
Received: by outflank-mailman (input) for mailman id 19706;
 Thu, 05 Nov 2020 10:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kacw2-0002yP-5l
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:56:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68c3332c-aac4-4b1c-9083-c5fa52fa723d;
 Thu, 05 Nov 2020 10:55:58 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kacvu-0005YX-1a; Thu, 05 Nov 2020 10:55:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kacvt-0003HJ-Og; Thu, 05 Nov 2020 10:55:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kacvt-0000iM-OC; Thu, 05 Nov 2020 10:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kacw2-0002yP-5l
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:56:06 +0000
X-Inumbo-ID: 68c3332c-aac4-4b1c-9083-c5fa52fa723d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 68c3332c-aac4-4b1c-9083-c5fa52fa723d;
	Thu, 05 Nov 2020 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=2BvZPZDvCmUFtR7XzZS7gVJCA9jYdXjbxjQhuATTKeA=; b=EcBEYTwUrGdNbFRsvuvSTfAw1T
	D0Rn5YC7wkZ4KR8DtQLcgVc6MCYyeS340hPpWCGTqx705/NbuXN3njq//x7rTwWbjZVlqU7UCbESY
	dCHcXMVxq8jwSubnkcxgcXRbCJ30Jp3uk/IsfYwxUpcp+MzI4fBMq1aJbMVFyCpIdhRo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kacvu-0005YX-1a; Thu, 05 Nov 2020 10:55:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kacvt-0003HJ-Og; Thu, 05 Nov 2020 10:55:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kacvt-0000iM-OC; Thu, 05 Nov 2020 10:55:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156406-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 156406: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-4.12-testing:build-arm64:xen-build:fail:regression
    xen-4.12-testing:build-amd64:xen-build:fail:regression
    xen-4.12-testing:build-amd64-prev:xen-build:fail:regression
    xen-4.12-testing:build-arm64-xsm:xen-build:fail:regression
    xen-4.12-testing:build-i386:xen-build:fail:regression
    xen-4.12-testing:build-amd64-xsm:xen-build:fail:regression
    xen-4.12-testing:build-armhf:xen-build:fail:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):starved:nonblocking
    xen-4.12-testing:build-i386-prev:hosts-allocate:starved:nonblocking
    xen-4.12-testing:build-i386-xsm:hosts-allocate:starved:nonblocking
    xen-4.12-testing:build-i386-pvops:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=4f9294d21c47415376215d68a0298e88582b8e7a
X-Osstest-Versions-That:
    xen=97b7b5567fba6918a656ad349051b5343b5dea2e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Nov 2020 10:55:57 +0000

flight 156406 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156406/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 156358
 build-amd64                   6 xen-build                fail REGR. vs. 156358
 build-amd64-prev              6 xen-build                fail REGR. vs. 156358
 build-arm64-xsm               6 xen-build                fail REGR. vs. 156358
 build-i386                    6 xen-build                fail REGR. vs. 156358
 build-amd64-xsm               6 xen-build                fail REGR. vs. 156358
 build-armhf                   6 xen-build                fail REGR. vs. 156358

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
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
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
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
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      starved n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               starved  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) starved n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               starved  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      starved n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) starved n/a
 build-i386-prev               2 hosts-allocate               starved  n/a
 build-i386-xsm                2 hosts-allocate               starved  n/a
 build-i386-pvops              2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  4f9294d21c47415376215d68a0298e88582b8e7a
baseline version:
 xen                  97b7b5567fba6918a656ad349051b5343b5dea2e

Last test of basis   156358  2020-11-02 08:38:03 Z    3 days
Testing same since   156398  2020-11-04 09:06:02 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <ian.jackson@eu.citrix.com>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               starved 
 build-amd64-xtf                                              pass    
 build-amd64                                                  fail    
 build-arm64                                                  fail    
 build-armhf                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             fail    
 build-i386-prev                                              starved 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             starved 
 test-xtf-amd64-amd64-1                                       blocked 
 test-xtf-amd64-amd64-2                                       blocked 
 test-xtf-amd64-amd64-3                                       blocked 
 test-xtf-amd64-amd64-4                                       blocked 
 test-xtf-amd64-amd64-5                                       blocked 
 test-amd64-amd64-xl                                          blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            starved 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         starved 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  starved 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  starved 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  starved 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       starved 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
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
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-xl-vhd                                      blocked 


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
commit 4f9294d21c47415376215d68a0298e88582b8e7a
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Wed Nov 4 09:36:36 2020 +0100

    SUPPORT.md: Desupport qemu trad except stub dm
    
    While investigating XSA-335 we discovered that many upstream security
    fixes were missing.  It is not practical to backport them.  There is
    no good reason to be running this very ancient version of qemu, except
    that it is the only way to run a stub dm which is currently supported
    by upstream.
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
    master commit: 8587160b3e2951b722d395a0346bb17c3c22152f
    master date: 2020-11-04 09:22:37 +0100
(qemu changes not included)

