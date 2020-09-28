Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0927AD32
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrf8-0001Bw-BN; Mon, 28 Sep 2020 11:49:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rPw=DF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMrf6-0001B9-BP
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:49:44 +0000
X-Inumbo-ID: 0b8425ec-56bd-460e-8b6d-276105578985
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b8425ec-56bd-460e-8b6d-276105578985;
 Mon, 28 Sep 2020 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=ldAQ4xfCQDZRLqKFxzrLSN6PFXEeIsKMh8fDV3veJMo=; b=L4wlXFBVcnCjaqj9oyWIJS0AwS
 AUFtPmWamSmiW0R0V9eYtV53h89Omn9pQxxh4V5qhJPvmVZtnTNkKObY10p8bxEUARtjO8EEHenWI
 zezVU6CF6HJzCIXwjYL2rzZpl8zA9IJhUzJ8jtxoJU1KcVjlZU/AhUv0Zud2SPxIyWTc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrf3-0001UG-2A; Mon, 28 Sep 2020 11:49:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrf2-0003w6-Pp; Mon, 28 Sep 2020 11:49:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMrf2-00041S-PM; Mon, 28 Sep 2020 11:49:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154994-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.13-testing test] 154994: trouble:
 blocked/broken/preparing/queued/running
X-Osstest-Failures: xen-4.13-testing:build-amd64:<job status>:broken:regression
 xen-4.13-testing:build-amd64-prev:<job status>:broken:regression
 xen-4.13-testing:build-amd64-pvops:<job status>:broken:regression
 xen-4.13-testing:build-armhf:<job status>:broken:regression
 xen-4.13-testing:build-armhf-pvops:<job status>:broken:regression
 xen-4.13-testing:build-i386:<job status>:broken:regression
 xen-4.13-testing:build-i386-prev:<job status>:broken:regression
 xen-4.13-testing:build-i386-pvops:<job status>:broken:regression
 xen-4.13-testing:build-i386-xsm:<job status>:broken:regression
 xen-4.13-testing:build-i386-xsm:host-install(4):broken:regression
 xen-4.13-testing:build-i386:host-install(4):broken:regression
 xen-4.13-testing:build-amd64-prev:host-install(4):broken:regression
 xen-4.13-testing:build-i386-prev:host-install(4):broken:regression
 xen-4.13-testing:build-i386-pvops:host-install(4):broken:regression
 xen-4.13-testing:build-amd64:host-install(4):broken:regression
 xen-4.13-testing:build-amd64-pvops:host-install(4):broken:regression
 xen-4.13-testing:build-armhf-pvops:host-install(4):broken:regression
 xen-4.13-testing:build-armhf:host-install(4):broken:regression
 xen-4.13-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-libvirt-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl:<none executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl-thunderx:<none
 executed>:queued:regression
 xen-4.13-testing:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:build-arm64-libvirt:<none executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-migrupgrade:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none
 executed>:queued:regression
 xen-4.13-testing:test-xtf-amd64-amd64-1:<none executed>:queued:regression
 xen-4.13-testing:test-xtf-amd64-amd64-2:<none executed>:queued:regression
 xen-4.13-testing:test-xtf-amd64-amd64-3:<none executed>:queued:regression
 xen-4.13-testing:test-xtf-amd64-amd64-4:<none executed>:queued:regression
 xen-4.13-testing:test-xtf-amd64-amd64-5:<none executed>:queued:regression
 xen-4.13-testing:build-amd64-xsm:hosts-allocate:running:regression
 xen-4.13-testing:build-arm64:hosts-allocate:running:regression
 xen-4.13-testing:build-arm64-pvops:hosts-allocate:running:regression
 xen-4.13-testing:build-arm64-xsm:hosts-allocate:running:regression
 xen-4.13-testing:build-amd64-prev:syslog-server:running:regression
 xen-4.13-testing:build-amd64-prev:capture-logs:running:regression
 xen-4.13-testing:build-amd64-xtf:host-install(4):running:regression
 xen-4.13-testing:build-amd64-xtf:syslog-server:running:regression
 xen-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.13-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=88f5b414ac0f8008c1e2b26f93c3d980120941f7
X-Osstest-Versions-That: xen=c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Sep 2020 11:49:40 +0000
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

flight 154994 xen-4.13-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/154994/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-prev                <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 154358
 build-i386                    4 host-install(4)        broken REGR. vs. 154358
 build-amd64-prev              4 host-install(4)        broken REGR. vs. 154358
 build-i386-prev               4 host-install(4)        broken REGR. vs. 154358
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 154358
 build-amd64                   4 host-install(4)        broken REGR. vs. 154358
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 154358
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 154358
 build-armhf                   4 host-install(4)        broken REGR. vs. 154358
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 build-arm64-libvirt             <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-migrupgrade    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-xtf-amd64-amd64-1          <none executed>              queued
 test-xtf-amd64-amd64-2          <none executed>              queued
 test-xtf-amd64-amd64-3          <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 build-amd64-xsm               2 hosts-allocate               running
 build-arm64                   2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-amd64-prev              3 syslog-server                running
 build-amd64-prev              5 capture-logs                 running
 build-amd64-xtf               4 host-install(4)              running
 build-amd64-xtf               3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  88f5b414ac0f8008c1e2b26f93c3d980120941f7
baseline version:
 xen                  c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef

Last test of basis   154358  2020-09-15 09:40:09 Z   13 days
Failing since        154602  2020-09-22 02:37:01 Z    6 days    5 attempts
Testing same since   154625  2020-09-22 20:06:06 Z    5 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Don Slutz <don.slutz@gmail.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Chen <wei.chen@arm.com>

jobs:
 build-amd64-xsm                                              preparing
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              running 
 build-amd64                                                  broken  
 build-arm64                                                  preparing
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             broken  
 build-i386-prev                                              broken  
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      queued  
 test-amd64-i386-xl-xsm                                       queued  
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
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  queued  
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
 test-amd64-amd64-migrupgrade                                 queued  
 test-amd64-i386-migrupgrade                                  queued  
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
 test-arm64-arm64-xl-seattle                                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 queued  
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

broken-job test-amd64-i386-xl-xsm queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-xl queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job build-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-amd64-prev broken
broken-job build-amd64-pvops broken
broken-job build-arm64-libvirt queued
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-prev broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-migrupgrade queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-xtf-amd64-amd64-1 queued
broken-job test-xtf-amd64-amd64-2 queued
broken-job test-xtf-amd64-amd64-3 queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-xtf-amd64-amd64-5 queued
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-amd64-prev host-install(4)
broken-step build-i386-prev host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 564 lines long.)

