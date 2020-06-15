Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D463A1F8C76
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 05:31:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkfpJ-0003Eo-Oj; Mon, 15 Jun 2020 03:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTSQ=74=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jkfpH-0003E5-Rj
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 03:30:23 +0000
X-Inumbo-ID: 87a82be2-aeb8-11ea-b7b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87a82be2-aeb8-11ea-b7b3-12813bfff9fa;
 Mon, 15 Jun 2020 03:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7h5bok6Rsz5HrMajUk87U2CjzZdWI0awuanh23CRYK4=; b=6TK1x2gMWv2U3GXnuwUhWehLl
 kYNNktSQpKXE2qjE4wIlK95wrRHW7DsVRdCg2YtqVXPOMb+2M42fEpoJsFca4o11hZD7pHet9e9SO
 GCCb00ovxc1Z15OQ15b5tI/luGXXd/TaxIEwxmZhsLKsEzUahU2Nz6Y5L+NGXX/McqRns=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkfp9-0005fE-IN; Mon, 15 Jun 2020 03:30:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkfp9-0002MM-4h; Mon, 15 Jun 2020 03:30:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jkfp9-000654-3T; Mon, 15 Jun 2020 03:30:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151096-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.9-testing test] 151096: regressions - trouble:
 blocked/fail/pass/starved
X-Osstest-Failures: xen-4.9-testing:build-i386-xsm:xen-build:fail:regression
 xen-4.9-testing:build-amd64-prev:xen-build:fail:regression
 xen-4.9-testing:build-i386-prev:xen-build:fail:regression
 xen-4.9-testing:build-amd64-xsm:xen-build:fail:regression
 xen-4.9-testing:build-arm64-libvirt:libvirt-build:fail:regression
 xen-4.9-testing:build-amd64:xen-build:fail:regression
 xen-4.9-testing:build-i386:xen-build:fail:regression
 xen-4.9-testing:build-armhf-libvirt:libvirt-build:fail:regression
 xen-4.9-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
 xen-4.9-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 xen-4.9-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:guest-start:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=6e477c2ea4d5c26a7a7b2f850166aa79edc5225c
X-Osstest-Versions-That: xen=93cc305d1f3e7c6949a8f4116446624fa2dbfdf4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jun 2020 03:30:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151096 xen-4.9-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151096/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 150120
 build-amd64-prev              6 xen-build                fail REGR. vs. 150120
 build-i386-prev               6 xen-build                fail REGR. vs. 150120
 build-amd64-xsm               6 xen-build                fail REGR. vs. 150120
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 150120
 build-amd64                   6 xen-build                fail REGR. vs. 150120
 build-i386                    6 xen-build                fail REGR. vs. 150120
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 150120

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-armhf-armhf-xl-rtds     12 guest-start                  fail  like 150120
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  6e477c2ea4d5c26a7a7b2f850166aa79edc5225c
baseline version:
 xen                  93cc305d1f3e7c6949a8f4116446624fa2dbfdf4

Last test of basis   150120  2020-05-10 02:18:09 Z   36 days
Failing since        150940  2020-06-09 17:05:20 Z    5 days    8 attempts
Testing same since   151070  2020-06-13 06:57:26 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Christopher Clark <christopher.clark6@baesystems.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  John Thomson <git@johnthomson.fastmail.com.au>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Wei Liu <wei.liu2@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64-xtf                                              pass    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             fail    
 build-i386-prev                                              fail    
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
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
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
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
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-xl-vhd                                      pass    


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
commit 6e477c2ea4d5c26a7a7b2f850166aa79edc5225c
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Mon Jun 12 16:04:17 2017 +0100

    ipxe: update to newer commit
    
    To get 5f85cbb9ee1c00cec81a848a9e871ad5d1e7f53f to placate gcc 7.
    
    The only patch we have applies cleanly.
    
    Reported-by: Zhongze Liu <blackskygg@gmail.com>
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    (cherry picked from commit 461b2165346de236fff2d00d1c318062f1daab08)

commit 6a1c431890599c701117bf9822898f60a18444a3
Author: John Thomson <git@johnthomson.fastmail.com.au>
Date:   Tue May 15 11:48:43 2018 +1000

    tools/ocaml/libs/xc fix gcc-8 format-truncation warning
    
     CC       xenctrl_stubs.o
    xenctrl_stubs.c: In function 'failwith_xc':
    xenctrl_stubs.c:65:17: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
          "%d: %s: %s", error->code,
                     ^
    xenctrl_stubs.c:64:4: note: 'snprintf' output 6 or more bytes (assuming 1029) into a destination of size 1028
        snprintf(error_str, sizeof(error_str),
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          "%d: %s: %s", error->code,
          ~~~~~~~~~~~~~~~~~~~~~~~~~~
          xc_error_code_to_desc(error->code),
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          error->message);
          ~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors
    make[8]: *** [/build/xen-git/src/xen/tools/ocaml/libs/xc/../../Makefile.rules:37: xenctrl_stubs.o] Error 1
    m
    
    Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Release-acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 2adc90908fbb1e614c477e29f2d45eda94570795)

commit 41f597f5167c2e78a3c70d219710c8805d7fec8e
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:50 2018 +0200

    tools/misc: fix hypothetical buffer overflow in xen-lowmemd
    
    gcc-8 complains:
    
        xen-lowmemd.c: In function 'handle_low_mem':
        xen-lowmemd.c:80:55: error: '%s' directive output may be truncated writing up to 511 bytes into a region of size 489 [-Werror=format-truncation=]
                 snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
                                                               ^~               ~~~~
        xen-lowmemd.c:80:9: note: 'snprintf' output between 36 and 547 bytes into a destination of size 512
                 snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    In practice it wouldn't happen, because 'data' contains string
    representation of 64-bit unsigned number (20 characters at most).
    But place a limit to mute gcc warning.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 27751d89248c8c5eef6d8b56eb8f7d2084145080)

commit 1eae17268887bacbc598ef6e3290059dbeb4fd8f
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:52 2018 +0200

    tools/blktap2: fix possible '\0' truncation
    
    gcc-8 complains:
    
        tapdisk-vbd.c: In function 'tapdisk_vbd_resume_ring':
        tapdisk-vbd.c:1671:53: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
           snprintf(params.name, sizeof(params.name) - 1, "%s", message);
                                                             ^
        tapdisk-vbd.c:1671:3: note: 'snprintf' output between 1 and 256 bytes into a destination of size 255
           snprintf(params.name, sizeof(params.name) - 1, "%s", message);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    The "- 1" in buffer size should be actually applied to message, to leave
    place for terminating '\0', not the other way around (truncate '\0' even
    if it would fit).
    
        In function 'tapdisk_control_open_image',
            inlined from 'tapdisk_control_handle_request' at tapdisk-control.c:660:10:
        tapdisk-control.c:465:2: error: 'strncpy' specified bound 256 equals destination size [-Werror=stringop-truncation]
          strncpy(params.name, vbd->name, BLKTAP2_MAX_MESSAGE_LEN);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
        In function 'tapdisk_control_create_socket',
            inlined from 'tapdisk_control_open' at tapdisk-control.c:836:9:
        tapdisk-control.c:793:2: error: 'strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
          strncpy(saddr.sun_path, td_control.path, sizeof(saddr.sun_path));
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
        block-qcow.c: In function 'qcow_create':
        block-qcow.c:1216:5: error: 'strncpy' specified bound 4096 equals destination size [-Werror=stringop-truncation]
             strncpy(backing_filename, backing_file,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              sizeof(backing_filename));
              ~~~~~~~~~~~~~~~~~~~~~~~~~
    
    I those cases, reduce size of copied string and make sure final '\0' is
    added.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 850e89b3ef1a7be6b71fa7ae22333c884e08431a)

commit f1e75e5c7054d8cd7bdfe30c6a95af35cc24fbb2
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:54 2018 +0200

    tools/gdbsx: fix -Wstringop-truncation warning
    
    gcc-8 complains:
    
        gx_main.c: In function 'prepare_stop_reply':
        gx_main.c:385:9: error: 'strncpy' output truncated before terminating nul copying 6 bytes from a string of the same length [-Werror=stringop-truncation]
                 strncpy(buf, "watch:", 6);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
    
    Since terminating '\0' isn't needed here at all, switch to memcpy.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 7f601f7c341c80d554615556d60e3b8ed1e5ad4f)

commit f034ab45c15aef9c784dbcdc5c893e268d4a094c
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:53 2018 +0200

    tools/xenpmd: fix possible '\0' truncation
    
    gcc-8 complains:
        xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->oem_info, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:201:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->battery_type, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:195:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->serial_number, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:189:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->model_number, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Copy 31 chars, then make sure terminating '\0' is present. Those fields
    are passed to strlen and as '%s' for snprintf later.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 938c8f53b1f80175c6f7a1399efdb984abb0cb8b)

commit 9737f89b076ae4d05e6f974a7c21aced4459966e
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:49 2018 +0200

    tools/libxc: fix strncpy size
    
    gcc-8 warns about possible truncation of trailing '\0'.
    Final character is overridden by '\0' anyway, so don't bother to copy
    it.
    
    This fixes compile failure:
    
        xc_pm.c: In function 'xc_set_cpufreq_gov':
        xc_pm.c:308:5: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
             strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        cc1: all warnings being treated as errors
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit fa7789ef18bd2e716997937af71b2e4b5b00a159)

commit 1dd64783024c5c9e600c3d33393b795c68a46f65
Author: Christopher Clark <christopher.w.clark@gmail.com>
Date:   Wed Jul 18 15:22:17 2018 -0700

    tools/xentop : replace use of deprecated vwprintw
    
    gcc-8.1 complains:
    
    | xentop.c: In function 'print':
    | xentop.c:304:4: error: 'vwprintw' is deprecated [-Werror=deprecated-declarations]
    |     vwprintw(stdscr, (curses_str_t)fmt, args);
    |     ^~~~~~~~
    
    vw_printw (note the underscore) is a non-deprecated alternative.
    
    Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    (cherry picked from commit 2b50cdbc444c637575580dcfa6c9525a84d5cc62)

commit 80d78acf9e60ae6a88d6cb6f3535eaf67c81f61c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jun 10 18:57:00 2020 +0100

    x86/spec-ctrl: Allow the RDRAND/RDSEED features to be hidden
    
    RDRAND/RDSEED can be hidden using cpuid= to mitigate SRBDS if microcode
    isn't available.
    
    Extend libxl's table of named parameters to include RDRAND/RDSEED, and
    have the compiler construct it in .rodata, rather than on the stack at runtime
    each time it is called.
    
    This is part of XSA-320 / CVE-2020-0543.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    (cherry picked from commit 7028534d8482d25860c4d1aa8e45f0b911abfc5a)

commit ad0c1a0023077ee03d325a6f84bb654150539f49
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: Mitigate the Special Register Buffer Data Sampling sidechannel
    
    See patch documentation and comments.
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 6a49b9a7920c82015381740905582b666160d955)

commit 04af886e1bc87bb321339417c5588d12f506003c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: CPUID/MSR definitions for Special Register Buffer Data Sampling
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit caab85ab58c0cdf74ab070a5de5c4df89f509ff3)
(qemu changes not included)

