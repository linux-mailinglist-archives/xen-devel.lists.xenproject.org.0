Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B40312F5F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82733.152928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943s-0001hA-5J; Mon, 08 Feb 2021 10:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82733.152928; Mon, 08 Feb 2021 10:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943s-0001gM-0x; Mon, 08 Feb 2021 10:46:32 +0000
Received: by outflank-mailman (input) for mailman id 82733;
 Mon, 08 Feb 2021 10:46:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943r-0001fj-0l; Mon, 08 Feb 2021 10:46:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943q-0001ce-RA; Mon, 08 Feb 2021 10:46:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943q-0006rN-Je; Mon, 08 Feb 2021 10:46:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943q-0008KZ-J8; Mon, 08 Feb 2021 10:46:30 +0000
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
	bh=d1yddNztOfIKtA7MRXWIn2EFZwS2x5ts+jHsn/EBsRs=; b=QewbHZyHi+ivtKta6ZGAx8T8v/
	y8Iolx6Q9MU0TvQ9ztZVayGEWaoba7DfPTdMo6xa66gaFcvxLDa5zUDq4EJBPZIc7fFUD51OUnnb5
	EWnKD0VMgbFFTRMuR3q6B9VAlgAtHSGC90Im+wzv6LgPi7WT6DaXd6IEJdpfOQG13dv8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159116-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 159116: trouble: blocked/broken/preparing/queued
X-Osstest-Failures:
    linux-linus:build-amd64-xsm:<job status>:broken:regression
    linux-linus:build-arm64:<job status>:broken:regression
    linux-linus:build-arm64-pvops:<job status>:broken:regression
    linux-linus:build-arm64-xsm:<job status>:broken:regression
    linux-linus:build-armhf:<job status>:broken:regression
    linux-linus:build-armhf-pvops:<job status>:broken:regression
    linux-linus:build-i386:<job status>:broken:regression
    linux-linus:build-i386-pvops:<job status>:broken:regression
    linux-linus:build-i386-xsm:<job status>:broken:regression
    linux-linus:build-i386-pvops:host-install(4):broken:regression
    linux-linus:build-arm64:host-install(4):broken:regression
    linux-linus:build-i386:host-install(4):broken:regression
    linux-linus:build-i386-xsm:host-install(4):broken:regression
    linux-linus:build-arm64-xsm:host-install(4):broken:regression
    linux-linus:build-arm64-pvops:host-install(4):broken:regression
    linux-linus:build-amd64-xsm:host-install(4):broken:regression
    linux-linus:build-armhf-pvops:host-install(4):broken:regression
    linux-linus:build-armhf:host-install(4):broken:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-raw:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-examine:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl-thunderx:<none executed>:queued:regression
    linux-linus:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-examine:<none executed>:queued:regression
    linux-linus:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    linux-linus:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    linux-linus:build-amd64-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:<none executed>:queued:regression
    linux-linus:build-arm64-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:build-i386-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-examine:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-pair:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-pygrub:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-xl:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-pair:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:build-amd64:hosts-allocate:running:regression
    linux-linus:build-amd64-pvops:hosts-allocate:running:regression
    linux-linus:build-arm64:syslog-server:running:regression
    linux-linus:build-i386:syslog-server:running:regression
    linux-linus:build-i386:capture-logs:running:regression
    linux-linus:build-arm64-xsm:syslog-server:running:regression
    linux-linus:build-arm64-xsm:capture-logs:running:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    linux=92bf22614b21a2706f4993b278017e437f7785b3
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:30 +0000

flight 159116 linux-linus running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159116/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 152332
 build-arm64                   4 host-install(4)        broken REGR. vs. 152332
 build-i386                    4 host-install(4)        broken REGR. vs. 152332
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 152332
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 152332
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 152332
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 152332
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 152332
 build-armhf                   4 host-install(4)        broken REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-arm64-arm64-examine        <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-amd64-i386-examine         <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              queued
 build-arm64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-examine        <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 build-amd64                   2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-arm64                   3 syslog-server                running
 build-i386                    3 syslog-server                running
 build-i386                    5 capture-logs                 running
 build-arm64-xsm               3 syslog-server                running
 build-arm64-xsm               5 capture-logs                 running

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
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
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a

version targeted for testing:
 linux                92bf22614b21a2706f4993b278017e437f7785b3
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  191 days
Failing since        152366  2020-08-01 20:49:34 Z  190 days  337 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
4560 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  preparing
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           queued  
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           queued  
 test-amd64-coresched-i386-xl                                 queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      queued  
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         queued  
 test-amd64-i386-xl-qemut-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         queued  
 test-amd64-i386-xl-qemut-ws16-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         queued  
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  queued  
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-amd64-examine                                     queued  
 test-arm64-arm64-examine                                     queued  
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-dom0pvh-xl-intel                            queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-xl-multivcpu                                queued  
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        queued  
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                queued  
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-amd64-pvgrub                                queued  
 test-amd64-amd64-i386-pvgrub                                 queued  
 test-amd64-amd64-xl-pvshim                                   queued  
 test-amd64-i386-xl-pvshim                                    queued  
 test-amd64-amd64-pygrub                                      queued  
 test-amd64-amd64-xl-qcow2                                    queued  
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 queued  
 test-amd64-amd64-libvirt-vhd                                 queued  
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

broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-arm64-arm64-examine queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-xl queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-amd64-i386-examine queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job build-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 queued
broken-job build-arm64 broken
broken-job build-arm64-libvirt queued
broken-job test-amd64-amd64-xl-qemut-win7-amd64 queued
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job build-i386-libvirt queued
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-examine queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-xl queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-step build-i386-pvops host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 1029128 lines long.)

