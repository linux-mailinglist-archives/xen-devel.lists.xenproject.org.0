Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C31F48C8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 23:22:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jilh5-0004eA-B1; Tue, 09 Jun 2020 21:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKNw=7W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jilh3-0004dg-Lo
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 21:22:01 +0000
X-Inumbo-ID: 3d28f78a-aa97-11ea-b377-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d28f78a-aa97-11ea-b377-12813bfff9fa;
 Tue, 09 Jun 2020 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q0Bi1JONkNjSmwbKRyn6adAYheRY3RT3g9svKAcdL78=; b=FMDsX8dnpXsvYZzf4H0ssrDa4
 AQc8rOON/fJl4b52+Oz5r323K/SS3oYglxEVcd59iC9NH/jrjkue/PGXvquFBQ14nUe67ynZ1w9y7
 sT+XarCcWmehcITC7M8ipkZHHfU799BiaeE9bpK3/aRUlAwDYQroGlTPlYRmz5giXb7f4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jilgw-0001MV-FF; Tue, 09 Jun 2020 21:21:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jilgv-00031c-OJ; Tue, 09 Jun 2020 21:21:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jilgv-0004JU-Nf; Tue, 09 Jun 2020 21:21:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150953-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.11-testing test] 150953: regressions - FAIL
X-Osstest-Failures: xen-4.11-testing:build-arm64:xen-build:fail:regression
 xen-4.11-testing:build-armhf:xen-build:fail:regression
 xen-4.11-testing:build-i386:xen-build:fail:regression
 xen-4.11-testing:build-amd64-prev:xen-build:fail:regression
 xen-4.11-testing:build-i386-prev:xen-build:fail:regression
 xen-4.11-testing:build-amd64-xsm:xen-build:fail:regression
 xen-4.11-testing:build-arm64-xsm:xen-build:fail:regression
 xen-4.11-testing:build-i386-xsm:xen-build:fail:regression
 xen-4.11-testing:build-amd64:xen-build:fail:regression
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-4.11-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 xen-4.11-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.11-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.11-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.11-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=b8d476a9eaee8877cd5ba2c9eb6dbc5412626d13
X-Osstest-Versions-That: xen=7dd2ac39e40f0afe1cc6d879bfe65cbf19520cab
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jun 2020 21:21:53 +0000
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

flight 150953 xen-4.11-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150953/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 150040
 build-armhf                   6 xen-build                fail REGR. vs. 150040
 build-i386                    6 xen-build                fail REGR. vs. 150040
 build-amd64-prev              6 xen-build                fail REGR. vs. 150040
 build-i386-prev               6 xen-build                fail REGR. vs. 150040
 build-amd64-xsm               6 xen-build                fail REGR. vs. 150040
 build-arm64-xsm               6 xen-build                fail REGR. vs. 150040
 build-i386-xsm                6 xen-build                fail REGR. vs. 150040
 build-amd64                   6 xen-build                fail REGR. vs. 150040

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  b8d476a9eaee8877cd5ba2c9eb6dbc5412626d13
baseline version:
 xen                  7dd2ac39e40f0afe1cc6d879bfe65cbf19520cab

Last test of basis   150040  2020-05-05 16:06:51 Z   35 days
Testing same since   150942  2020-06-09 17:05:43 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Wei Liu <wl@xen.org>

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
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
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
commit b8d476a9eaee8877cd5ba2c9eb6dbc5412626d13
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: Mitigate the Special Register Buffer Data Sampling sidechannel
    
    See patch documentation and comments.
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 6a49b9a7920c82015381740905582b666160d955)

commit 1c751c4146b9e1d8dd9b61ee6a01caa1b07463cc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: CPUID/MSR definitions for Special Register Buffer Data Sampling
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit caab85ab58c0cdf74ab070a5de5c4df89f509ff3)
(qemu changes not included)

