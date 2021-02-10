Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F831652A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83561.155785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ne3-0001Ex-1v; Wed, 10 Feb 2021 11:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83561.155785; Wed, 10 Feb 2021 11:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ne2-0001EX-S0; Wed, 10 Feb 2021 11:26:54 +0000
Received: by outflank-mailman (input) for mailman id 83561;
 Wed, 10 Feb 2021 11:26:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9ne1-0001EK-MF; Wed, 10 Feb 2021 11:26:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9ne1-00081H-Ff; Wed, 10 Feb 2021 11:26:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9ne0-0000oj-Qj; Wed, 10 Feb 2021 11:26:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9ne0-0005aj-Py; Wed, 10 Feb 2021 11:26:52 +0000
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
	bh=sGQFsxpNppo5SAPKeda3IkwuCuHk2UPoplCs3Auictg=; b=RQyrpV9eRWE/R9oo2OUZlIjo5Z
	W9Fn8XKxIl8jNPJBBmBMdtddPMCobwMymeiDBEkpyuab1cKp7unfLaC33qol0WJ/o3bbDXsJKFFqF
	NyaSQZ0fAC1i/Rg5Wy2WGacDH+ljkdUsn49aKmx9KCbfmSADiXlMuibCgvwI47D0+MsA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159194-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.11-testing test] 159194: trouble: pass/preparing/queued
X-Osstest-Failures:
    xen-4.11-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    xen-4.11-testing:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-4.11-testing:build-armhf-libvirt:<none executed>:queued:regression
    xen-4.11-testing:build-i386-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:build-i386-prev:hosts-allocate:running:regression
    xen-4.11-testing:build-armhf:hosts-allocate:running:regression
    xen-4.11-testing:build-i386:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    xen-4.11-testing:build-i386-pvops:hosts-allocate:running:regression
    xen-4.11-testing:build-i386-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-i386-pvgrub:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    xen-4.11-testing:test-xtf-amd64-amd64-4:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-amd64-pvgrub:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    xen-4.11-testing:test-xtf-amd64-amd64-5:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    xen-4.11-testing:test-xtf-amd64-amd64-1:hosts-allocate:running:regression
    xen-4.11-testing:test-xtf-amd64-amd64-2:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-xtf-amd64-amd64-3:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-pair:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-livepatch:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-migrupgrade:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    xen-4.11-testing:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    xen-4.11-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1c7d984645f9ade9b47e862b5880734ad498fea8
X-Osstest-Versions-That:
    xen=310ab79875cb705cc2c7daddff412b5a4899f8c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:26:52 +0000

flight 159194 xen-4.11-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159194/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
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
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 build-armhf-libvirt             <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
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
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 build-i386-prev               2 hosts-allocate               running
 build-armhf                   2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-i386-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 test-xtf-amd64-amd64-4        3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 hosts-allocate running
 test-amd64-amd64-amd64-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-xtf-amd64-amd64-5        3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-xtf-amd64-amd64-1        3 hosts-allocate               running
 test-xtf-amd64-amd64-2        3 hosts-allocate               running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-xtf-amd64-amd64-3        3 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate   running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-livepatch    3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-amd64-migrupgrade  4 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1c7d984645f9ade9b47e862b5880734ad498fea8
baseline version:
 xen                  310ab79875cb705cc2c7daddff412b5a4899f8c9

Last test of basis   157566  2020-12-15 14:05:54 Z   56 days
Failing since        159016  2021-02-04 15:05:58 Z    5 days    6 attempts
Testing same since   159042  2021-02-05 12:13:30 Z    4 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               preparing
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  preparing
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          queued  
 test-amd64-i386-xl                                           queued  
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
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       queued  
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
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
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  queued  
 test-armhf-armhf-xl-cubietruck                               queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
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
 test-amd64-amd64-amd64-pvgrub                                preparing
 test-amd64-amd64-i386-pvgrub                                 preparing
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

broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
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
broken-job test-armhf-armhf-xl-vhd queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job build-armhf-libvirt queued
broken-job build-i386-libvirt queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
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
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued

Not pushing.

------------------------------------------------------------
commit 1c7d984645f9ade9b47e862b5880734ad498fea8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 08:54:03 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again, part 2)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f9090d990e201a5ca045976b8ddaab9fa6ee69dd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 15:41:12 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Reported-by: James Dingwall <james@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

