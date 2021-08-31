Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B543FC5A6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 12:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175608.319858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL11C-0008JH-4K; Tue, 31 Aug 2021 10:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175608.319858; Tue, 31 Aug 2021 10:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL11B-0008H9-Te; Tue, 31 Aug 2021 10:29:25 +0000
Received: by outflank-mailman (input) for mailman id 175608;
 Tue, 31 Aug 2021 10:29:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mL11A-0008Gl-QN; Tue, 31 Aug 2021 10:29:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mL11A-0003Qz-Kj; Tue, 31 Aug 2021 10:29:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mL11A-0002ok-A0; Tue, 31 Aug 2021 10:29:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mL11A-0002qF-9V; Tue, 31 Aug 2021 10:29:24 +0000
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
	bh=tbxEBu4LYho21zJtZSH1vYLP2VsS+c+7lwfW6bAtk58=; b=GBxt48j/Zwy+IaAzETIYNnOD/w
	7kZnoGxqNnrNSpSsbXoW7Bt6W9gq1C/a/B3uhoWKL/bGWGSiA8NyDzW/PuycV5rs3dA8RWp18sd+u
	haAVW5GuPZtRLOPyIZlijkybghYqhxQGFtxj/Aj5xCzh15PGsK/ZAuAWXqpK+XWOWbjw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164678-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 164678: trouble: pass/preparing/queued/running
X-Osstest-Failures:
    xen-4.14-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-libvirt:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    xen-4.14-testing:build-armhf-libvirt:<none executed>:queued:regression
    xen-4.14-testing:build-i386-libvirt:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-pair:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-i386-xl:<none executed>:queued:regression
    xen-4.14-testing:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-intel:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    xen-4.14-testing:build-i386:hosts-allocate:running:regression
    xen-4.14-testing:build-i386-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-xtf-amd64-amd64-3:hosts-allocate:running:regression
    xen-4.14-testing:build-i386-prev:hosts-allocate:running:regression
    xen-4.14-testing:test-arm64-arm64-xl-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-xtf-amd64-amd64-2:hosts-allocate:running:regression
    xen-4.14-testing:test-xtf-amd64-amd64-5:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    xen-4.14-testing:test-xtf-amd64-amd64-1:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-livepatch:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-migrupgrade:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-pair:hosts-allocate:running:regression
    xen-4.14-testing:build-i386-pvops:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    xen-4.14-testing:test-xtf-amd64-amd64-4:hosts-allocate:running:regression
    xen-4.14-testing:test-arm64-arm64-xl-credit2:guest-start/debian.repeat:running:regression
    xen-4.14-testing:test-arm64-arm64-xl:syslog-server:running:regression
    xen-4.14-testing:test-arm64-arm64-xl:capture-logs(22):running:regression
    xen-4.14-testing:test-arm64-arm64-xl-credit2:syslog-server:running:regression
    xen-4.14-testing:build-armhf:syslog-server:running:regression
    xen-4.14-testing:build-armhf:xen-build:running:regression
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=74e93071826fe3aaab32e469280a3253a39147f6
X-Osstest-Versions-That:
    xen=49299c4813b7847d29df07bf790f5489060f2a9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Aug 2021 10:29:24 +0000

flight 164678 xen-4.14-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/164678/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-cubietruck    <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 build-armhf-libvirt             <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-livepatch       <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-intel  3 hosts-allocate               running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 test-xtf-amd64-amd64-3        3 hosts-allocate               running
 build-i386-prev               2 hosts-allocate               running
 test-arm64-arm64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-xtf-amd64-amd64-2        3 hosts-allocate               running
 test-xtf-amd64-amd64-5        3 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-xtf-amd64-amd64-1        3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate   running
 test-amd64-amd64-livepatch    3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-qemut-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-amd64-amd64-migrupgrade  4 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 hosts-allocate running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-xtf-amd64-amd64-4        3 hosts-allocate               running
 test-arm64-arm64-xl-credit2  18 guest-start/debian.repeat    running
 test-arm64-arm64-xl           4 syslog-server                running
 test-arm64-arm64-xl          22 capture-logs(22)             running
 test-arm64-arm64-xl-credit2   4 syslog-server                running
 build-armhf                   3 syslog-server                running
 build-armhf                   6 xen-build                    running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  74e93071826fe3aaab32e469280a3253a39147f6
baseline version:
 xen                  49299c4813b7847d29df07bf790f5489060f2a9c

Last test of basis   163750  2021-07-16 21:07:40 Z   45 days
Failing since        164261  2021-08-19 17:07:29 Z   11 days    8 attempts
Testing same since   164493  2021-08-25 22:08:55 Z    5 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               preparing
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  running 
 build-i386                                                   preparing
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          queued  
 build-i386-libvirt                                           queued  
 build-amd64-prev                                             pass    
 build-i386-prev                                              preparing
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             preparing
 test-xtf-amd64-amd64-1                                       preparing
 test-xtf-amd64-amd64-2                                       preparing
 test-xtf-amd64-amd64-3                                       preparing
 test-xtf-amd64-amd64-4                                       preparing
 test-xtf-amd64-amd64-5                                       preparing
 test-amd64-amd64-xl                                          preparing
 test-amd64-coresched-amd64-xl                                preparing
 test-arm64-arm64-xl                                          running 
 test-armhf-armhf-xl                                          queued  
 test-amd64-i386-xl                                           queued  
 test-amd64-coresched-i386-xl                                 queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           preparing
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        preparing
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-libvirt-xsm                                 preparing
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      preparing
 test-amd64-i386-xl-xsm                                       queued  
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-dom0pvh-xl-amd                              preparing
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemut-debianhvm-amd64                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       preparing
 test-amd64-amd64-qemuu-freebsd12-amd64                       preparing
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         preparing
 test-amd64-i386-xl-qemut-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         preparing
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         preparing
 test-amd64-i386-xl-qemut-ws16-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         preparing
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-armhf-armhf-xl-arndale                                  queued  
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  preparing
 test-arm64-arm64-xl-credit2                                  running 
 test-armhf-armhf-xl-credit2                                  queued  
 test-armhf-armhf-xl-cubietruck                               queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-dom0pvh-xl-intel                            preparing
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-livepatch                                   preparing
 test-amd64-i386-livepatch                                    queued  
 test-amd64-amd64-migrupgrade                                 preparing
 test-amd64-i386-migrupgrade                                  queued  
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                queued  
 test-amd64-amd64-pair                                        preparing
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                preparing
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-xl-pvshim                                   preparing
 test-amd64-i386-xl-pvshim                                    queued  
 test-amd64-amd64-pygrub                                      preparing
 test-amd64-amd64-xl-qcow2                                    preparing
 test-armhf-armhf-libvirt-raw                                 queued  
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     queued  
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 preparing
 test-armhf-armhf-xl-vhd                                      queued  


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

broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-cubietruck queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job build-armhf-libvirt queued
broken-job build-i386-libvirt queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-livepatch queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-armhf-armhf-xl-vhd queued

Not pushing.

(No revision log; it would be 607 lines long.)

