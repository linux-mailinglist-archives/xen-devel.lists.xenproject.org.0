Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEA1EE257
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 12:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgn14-0007wX-Iv; Thu, 04 Jun 2020 10:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmD4=7R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jgn12-0007wE-QG
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:22:28 +0000
X-Inumbo-ID: 499b0590-a64d-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 499b0590-a64d-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DxLH4QoqVxRkhb/OQhVpTEbheGWTLzOWUKw++pDpK3E=; b=bDQV+S4bqdk9WxXJtxRkq97Vh
 oKH9z0tckU8KEkoQp6n9L9DINHig3GJb0bzUtqvWAB1vOiI0XPkSu15yusYxMxPiVYpQ9Mbvrsb7G
 Ywio20nwCYRJx26G8/7GBW3UPt+N9wk6+7tic8t8lDqxdFdd3ZhOilN9tvgtNPJqfWDG0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgn10-0001YW-2G; Thu, 04 Jun 2020 10:22:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgn0z-0002v6-GV; Thu, 04 Jun 2020 10:22:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jgn0z-00024O-Fy; Thu, 04 Jun 2020 10:22:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150680-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150680: regressions - trouble:
 blocked/broken/fail/pass
X-Osstest-Failures: linux-linus:build-armhf:<job status>:broken:regression
 linux-linus:build-armhf:hosts-allocate:broken:regression
 linux-linus:build-amd64-libvirt:libvirt-build:fail:regression
 linux-linus:build-i386-xsm:xen-build:fail:regression
 linux-linus:build-arm64-libvirt:libvirt-build:fail:regression
 linux-linus:build-amd64-pvops:kernel-build:fail:regression
 linux-linus:build-armhf-pvops:kernel-build:fail:regression
 linux-linus:build-i386-pvops:kernel-build:fail:regression
 linux-linus:build-arm64-pvops:kernel-build:fail:regression
 linux-linus:build-i386:xen-build:fail:regression
 linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-credit1:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-rtds:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-arndale:build-check(1):running:regression
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):running:regression
 linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-credit2:build-check(1):running:regression
 linux-linus:test-armhf-armhf-examine:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl-credit2:build-check(1):running:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-vhd:build-check(1):running:regression
 linux-linus:build-armhf-libvirt:build-check(1):running:regression
 linux-linus:test-amd64-amd64-libvirt:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl:build-check(1):running:regression
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl-credit1:build-check(1):running:regression
 linux-linus:test-armhf-armhf-libvirt:build-check(1):running:regression
 linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):running:regression
 linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl-xsm:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl:build-check(1):running:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):running:regression
 linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):running:regression
 linux-linus:test-arm64-arm64-examine:build-check(1):running:regression
 linux-linus:test-amd64-i386-xl-xsm:build-check(1):running:regression
 linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):running:regression
 linux-linus:test-arm64-arm64-xl-seattle:build-check(1):running:regression
 linux-linus:build-amd64-libvirt:syslog-server:running:regression
 linux-linus:build-i386-xsm:syslog-server:running:regression
 linux-linus:build-arm64-libvirt:syslog-server:running:regression
 linux-linus:build-armhf-pvops:syslog-server:running:regression
 linux-linus:build-i386-pvops:syslog-server:running:regression
 linux-linus:build-arm64-pvops:syslog-server:running:regression
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 linux-linus:build-armhf:capture-logs:broken:nonblocking
 linux-linus:build-i386-xsm:capture-logs:broken:nonblocking
 linux-linus:build-arm64-libvirt:capture-logs:broken:nonblocking
 linux-linus:build-amd64-libvirt:capture-logs:broken:nonblocking
 linux-linus:build-i386-pvops:capture-logs:broken:nonblocking
 linux-linus:build-arm64-pvops:capture-logs:broken:nonblocking
 linux-linus:build-armhf-pvops:capture-logs:broken:nonblocking
X-Osstest-Versions-This: linux=6929f71e46bdddbf1c4d67c2728648176c67c555
X-Osstest-Versions-That: linux=f6aee505c71bbb035dde146caf5a6abbf3ccbe47
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jun 2020 10:22:25 +0000
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

flight 150680 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150680/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   2 hosts-allocate         broken REGR. vs. 150663
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 150663
 build-i386-xsm                6 xen-build                fail REGR. vs. 150663
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 150663
 build-amd64-pvops             6 kernel-build             fail REGR. vs. 150663
 build-armhf-pvops             6 kernel-build             fail REGR. vs. 150663
 build-i386-pvops              6 kernel-build             fail REGR. vs. 150663
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 150663
 build-i386                    6 xen-build                fail REGR. vs. 150663
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               running
 test-armhf-armhf-xl-credit1   1 build-check(1)               running
 test-armhf-armhf-xl-rtds      1 build-check(1)               running
 test-armhf-armhf-xl-arndale   1 build-check(1)               running
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm  1 build-check(1) running
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               running
 test-armhf-armhf-xl-credit2   1 build-check(1)               running
 test-armhf-armhf-examine      1 build-check(1)               running
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               running
 test-arm64-arm64-xl-thunderx  1 build-check(1)               running
 test-arm64-arm64-xl-credit2   1 build-check(1)               running
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)          running
 test-armhf-armhf-xl-vhd       1 build-check(1)               running
 build-armhf-libvirt           1 build-check(1)               running
 test-amd64-amd64-libvirt      1 build-check(1)               running
 test-arm64-arm64-xl           1 build-check(1)               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  1 build-check(1)   running
 test-arm64-arm64-xl-credit1   1 build-check(1)               running
 test-armhf-armhf-libvirt      1 build-check(1)               running
 test-armhf-armhf-libvirt-raw  1 build-check(1)               running
 test-amd64-amd64-libvirt-pair  1 build-check(1)               running
 test-arm64-arm64-xl-xsm       1 build-check(1)               running
 test-armhf-armhf-xl           1 build-check(1)               running
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)          running
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               running
 test-arm64-arm64-examine      1 build-check(1)               running
 test-amd64-i386-xl-xsm        1 build-check(1)               running
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               running
 test-arm64-arm64-xl-seattle   1 build-check(1)               running
 build-amd64-libvirt           3 syslog-server                running
 build-i386-xsm                3 syslog-server                running
 build-arm64-libvirt           3 syslog-server                running
 build-armhf-pvops             3 syslog-server                running
 build-i386-pvops              3 syslog-server                running
 build-arm64-pvops             3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 build-armhf                   3 capture-logs          broken blocked in 150663
 build-i386-xsm                7 capture-logs          broken blocked in 150663
 build-arm64-libvirt           7 capture-logs          broken blocked in 150663
 build-amd64-libvirt           7 capture-logs          broken blocked in 150663
 build-i386-pvops              7 capture-logs          broken blocked in 150663
 build-arm64-pvops             7 capture-logs          broken blocked in 150663
 build-armhf-pvops             7 capture-logs          broken blocked in 150663

version targeted for testing:
 linux                6929f71e46bdddbf1c4d67c2728648176c67c555
baseline version:
 linux                f6aee505c71bbb035dde146caf5a6abbf3ccbe47

Last test of basis   150663  2020-06-03 18:38:46 Z    0 days
Testing same since   150680  2020-06-04 06:12:40 Z    0 days    1 attempts

------------------------------------------------------------
690 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   fail    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            fail    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            fail    
 build-i386-pvops                                             fail    
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
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
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

broken-job build-armhf broken
broken-step build-armhf capture-logs
broken-step build-armhf hosts-allocate
broken-step build-i386-xsm capture-logs
broken-step build-arm64-libvirt capture-logs
broken-step build-amd64-libvirt capture-logs
broken-step build-i386-pvops capture-logs
broken-step build-arm64-pvops capture-logs
broken-step build-armhf-pvops capture-logs

Not pushing.

(No revision log; it would be 79962 lines long.)

