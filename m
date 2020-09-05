Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39825E8DA
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 17:44:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEaLe-0006Ml-Ca; Sat, 05 Sep 2020 15:43:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5tp=CO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kEaLc-0006JX-J4
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 15:43:24 +0000
X-Inumbo-ID: ccf2d7b5-a29f-4ee6-8f9d-43a851a59b05
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccf2d7b5-a29f-4ee6-8f9d-43a851a59b05;
 Sat, 05 Sep 2020 15:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=Piz6/7sntW2LsIJDGI/3EeLQGsgMC3Fw6i195GhICLc=; b=foMVYR0TP5oevAsA2oqjOFhYhD
 LZON4DsCEJ5wukh3pU+pqlU4E7lR3EvnMyQ5taKG4UyU9gSxCWhrv4PCj+vT48g11xtLW2OCYhvr9
 oOt/TCaWhR647SSrcDAsW7uWtKZXUZbQ1fSmnK7Gvr6diM+fadDqSqZjyRJ8IrczeoSQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEaLQ-0003XL-Km; Sat, 05 Sep 2020 15:43:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEaLQ-0002VW-DA; Sat, 05 Sep 2020 15:43:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kEaLQ-0001no-Ch; Sat, 05 Sep 2020 15:43:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153750-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 153750: trouble: blocked/broken
X-Osstest-Failures: xen-unstable:build-amd64:<job status>:broken:regression
 xen-unstable:build-amd64-prev:<job status>:broken:regression
 xen-unstable:build-amd64-pvops:<job status>:broken:regression
 xen-unstable:build-amd64-xsm:<job status>:broken:regression
 xen-unstable:build-amd64-xtf:<job status>:broken:regression
 xen-unstable:build-arm64:<job status>:broken:regression
 xen-unstable:build-arm64-pvops:<job status>:broken:regression
 xen-unstable:build-arm64-xsm:<job status>:broken:regression
 xen-unstable:build-armhf:<job status>:broken:regression
 xen-unstable:build-armhf-pvops:<job status>:broken:regression
 xen-unstable:build-i386:<job status>:broken:regression
 xen-unstable:build-i386-prev:<job status>:broken:regression
 xen-unstable:build-i386-pvops:<job status>:broken:regression
 xen-unstable:build-i386-xsm:<job status>:broken:regression
 xen-unstable:build-amd64-prev:hosts-allocate:broken:regression
 xen-unstable:build-amd64-pvops:hosts-allocate:broken:regression
 xen-unstable:build-amd64:hosts-allocate:broken:regression
 xen-unstable:build-armhf-pvops:hosts-allocate:broken:regression
 xen-unstable:build-i386-pvops:hosts-allocate:broken:regression
 xen-unstable:build-arm64-xsm:hosts-allocate:broken:regression
 xen-unstable:build-armhf:hosts-allocate:broken:regression
 xen-unstable:build-i386-prev:hosts-allocate:broken:regression
 xen-unstable:build-amd64-xsm:hosts-allocate:broken:regression
 xen-unstable:build-amd64-xtf:hosts-allocate:broken:regression
 xen-unstable:build-i386:hosts-allocate:broken:regression
 xen-unstable:build-i386-xsm:hosts-allocate:broken:regression
 xen-unstable:build-arm64:hosts-allocate:broken:regression
 xen-unstable:build-arm64-pvops:hosts-allocate:broken:regression
 xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-unstable:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
 xen-unstable:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
 xen-unstable:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
 xen-unstable:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
 xen-unstable:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
 xen-unstable:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=82c3d15c903aa434473dfdb570096ae5db809b94
X-Osstest-Versions-That: xen=7a8d8bde9820387c3e168182b99fd9761c223fff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Sep 2020 15:43:12 +0000
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

flight 153750 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153750/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-prev                <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-amd64-xtf                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-prev              2 hosts-allocate         broken REGR. vs. 152877
 build-amd64-pvops             2 hosts-allocate         broken REGR. vs. 152877
 build-amd64                   2 hosts-allocate         broken REGR. vs. 152877
 build-armhf-pvops             2 hosts-allocate         broken REGR. vs. 152877
 build-i386-pvops              2 hosts-allocate         broken REGR. vs. 152877
 build-arm64-xsm               2 hosts-allocate         broken REGR. vs. 152877
 build-armhf                   2 hosts-allocate         broken REGR. vs. 152877
 build-i386-prev               2 hosts-allocate         broken REGR. vs. 152877
 build-amd64-xsm               2 hosts-allocate         broken REGR. vs. 152877
 build-amd64-xtf               2 hosts-allocate         broken REGR. vs. 152877
 build-i386                    2 hosts-allocate         broken REGR. vs. 152877
 build-i386-xsm                2 hosts-allocate         broken REGR. vs. 152877
 build-arm64                   2 hosts-allocate         broken REGR. vs. 152877
 build-arm64-pvops             2 hosts-allocate         broken REGR. vs. 152877

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
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
 xen                  82c3d15c903aa434473dfdb570096ae5db809b94
baseline version:
 xen                  7a8d8bde9820387c3e168182b99fd9761c223fff

Last test of basis   152877  2020-08-27 01:51:40 Z    9 days
Failing since        152896  2020-08-27 13:07:51 Z    9 days   27 attempts
Testing same since   153735  2020-09-05 01:37:44 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  George Dunlap <george.dunlap@citrix.com>
  Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michael Kurth <mku@amazon.de>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             broken  
 build-i386-prev                                              broken  
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
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
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      blocked 
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

broken-job build-amd64 broken
broken-job build-amd64-prev broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-amd64-xtf broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-prev broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-amd64-prev hosts-allocate
broken-step build-amd64-pvops hosts-allocate
broken-step build-amd64 hosts-allocate
broken-step build-armhf-pvops hosts-allocate
broken-step build-i386-pvops hosts-allocate
broken-step build-arm64-xsm hosts-allocate
broken-step build-armhf hosts-allocate
broken-step build-i386-prev hosts-allocate
broken-step build-amd64-xsm hosts-allocate
broken-step build-amd64-xtf hosts-allocate
broken-step build-i386 hosts-allocate
broken-step build-i386-xsm hosts-allocate
broken-step build-arm64 hosts-allocate
broken-step build-arm64-pvops hosts-allocate

Not pushing.

(No revision log; it would be 892 lines long.)

