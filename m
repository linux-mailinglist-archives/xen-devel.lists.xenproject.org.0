Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3618279F8B
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 10:17:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMRqv-0004Ln-74; Sun, 27 Sep 2020 08:16:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mno3=DE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMRqt-0004Li-Qs
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 08:16:11 +0000
X-Inumbo-ID: f7cf7609-d4ff-43f3-be8f-e656145bf425
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7cf7609-d4ff-43f3-be8f-e656145bf425;
 Sun, 27 Sep 2020 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=U4RwYuJvZXyTzqy3g8SO/TGdHDU6l542lF1eAaFWRS8=; b=mR70eZfVc5PcQmcY/w1x36dAkv
 gDsqTcZHiczQvcF9HolPt8U6FCQ1mYBskarCy2jl9anKc0q+GD9QSsV5Faf1F4PypNOfczpmUOV9n
 9frb1iBeu5YOG+Ypcx9Fya6jyyY6WWFFOI4T7r4BXV9diDCdbxrd9TC//7WYddmYYnwg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMRqn-0005uC-VB; Sun, 27 Sep 2020 08:16:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMRqn-0001f9-Ew; Sun, 27 Sep 2020 08:16:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMRqn-0000pb-EU; Sun, 27 Sep 2020 08:16:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154776-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.13-testing test] 154776: regressions - trouble:
 blocked/broken/fail/pass
X-Osstest-Failures: xen-4.13-testing:test-amd64-amd64-xl-shadow:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-rtds:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-intel:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
 xen-4.13-testing:build-i386:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
 xen-4.13-testing:build-i386-prev:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
 xen-4.13-testing:build-i386-pvops:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-credit1:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-amd:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-intel:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-intel:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-libvirt:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-livepatch:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job
 status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-migrupgrade:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-pair:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
 xen-4.13-testing:test-amd64-amd64-xl-xsm:<job status>:broken:regression
 xen-4.13-testing:test-amd64-coresched-amd64-xl:<job status>:broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-1:<job status>:broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-2:<job status>:broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-3:<job status>:broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-4:<job status>:broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-5:<job status>:broken:regression
 xen-4.13-testing:build-i386-prev:host-install(4):broken:regression
 xen-4.13-testing:build-i386-pvops:host-install(4):broken:regression
 xen-4.13-testing:build-i386:host-install(4):broken:regression
 xen-4.13-testing:test-xtf-amd64-amd64-4:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-5:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-4:xtf/test-pv64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-5:xtf/test-pv64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-2:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.13-testing:test-amd64-amd64-xl-xsm:guest-start:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-2:xtf/test-pv64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-3:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-1:xtf/test-hvm64-xsa-221:fail:regression
 xen-4.13-testing:test-amd64-i386-xl-xsm:guest-start:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-3:xtf/test-pv64-xsa-221:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-1:xtf/test-pv64-xsa-221:fail:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 xen-4.13-testing:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.13-testing:test-xtf-amd64-amd64-1:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-pygrub:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-pvshim:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt-pair:host-install/src_host(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt-pair:host-install/dst_host(5):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-amd:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-shadow:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(4):broken:heisenbug
 xen-4.13-testing:test-xtf-amd64-amd64-3:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-xtf-amd64-amd64-2:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-pair:host-install/src_host(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-pair:host-install/dst_host(5):broken:heisenbug
 xen-4.13-testing:test-xtf-amd64-amd64-4:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-intel:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-credit1:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-libvirt-vhd:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-livepatch:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-rtds:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-multivcpu:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-amd64-pvgrub:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-pvhv2-intel:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-migrupgrade:host-install/src_host(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-migrupgrade:host-install/dst_host(5):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-i386-pvgrub:host-install(4):broken:heisenbug
 xen-4.13-testing:test-xtf-amd64-amd64-5:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qcow2:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-coresched-amd64-xl:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-xl-credit2:host-install(4):broken:heisenbug
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-intel:host-install(4):broken:heisenbug
 xen-4.13-testing:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
 xen-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=88f5b414ac0f8008c1e2b26f93c3d980120941f7
X-Osstest-Versions-That: xen=c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Sep 2020 08:16:05 +0000
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

flight 154776 xen-4.13-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154776/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 build-i386                      <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 build-i386-prev                 <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-xtf-amd64-amd64-1          <job status>                 broken
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-xtf-amd64-amd64-3          <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-xtf-amd64-amd64-5          <job status>                 broken
 build-i386-prev               4 host-install(4)        broken REGR. vs. 154358
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 154358
 build-i386                    4 host-install(4)        broken REGR. vs. 154358
 test-xtf-amd64-amd64-4 68 xtf/test-hvm64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-5 68 xtf/test-hvm64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-4 106 xtf/test-pv64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-5 106 xtf/test-pv64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-2 68 xtf/test-hvm64-xsa-221 fail in 154667 REGR. vs. 154358
 test-amd64-amd64-xl-xsm      12 guest-start    fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-2 106 xtf/test-pv64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-3 68 xtf/test-hvm64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-1 68 xtf/test-hvm64-xsa-221 fail in 154667 REGR. vs. 154358
 test-amd64-i386-xl-xsm       12 guest-start    fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-3 106 xtf/test-pv64-xsa-221 fail in 154667 REGR. vs. 154358
 test-xtf-amd64-amd64-1 106 xtf/test-pv64-xsa-221 fail in 154667 REGR. vs. 154358
 test-amd64-amd64-libvirt-xsm 12 guest-start    fail in 154667 REGR. vs. 154358
 test-amd64-i386-libvirt-xsm  12 guest-start    fail in 154667 REGR. vs. 154358
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail in 154667 REGR. vs. 154358

Tests which are failing intermittently (not blocking):
 test-xtf-amd64-amd64-1        4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154667
 test-amd64-amd64-pygrub       4 host-install(4)          broken pass in 154667
 test-amd64-amd64-qemuu-freebsd12-amd64 4 host-install(4) broken pass in 154667
 test-amd64-amd64-xl-pvshim    4 host-install(4)          broken pass in 154667
 test-amd64-amd64-libvirt-pair 4 host-install/src_host(4) broken pass in 154667
 test-amd64-amd64-libvirt-pair 5 host-install/dst_host(5) broken pass in 154667
 test-amd64-amd64-dom0pvh-xl-amd  4 host-install(4)       broken pass in 154667
 test-amd64-amd64-qemuu-nested-amd  4 host-install(4)     broken pass in 154667
 test-amd64-amd64-xl-shadow    4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-pvhv2-amd  4 host-install(4)         broken pass in 154667
 test-xtf-amd64-amd64-3        4 host-install(4)          broken pass in 154667
 test-amd64-amd64-libvirt-xsm  4 host-install(4)          broken pass in 154667
 test-xtf-amd64-amd64-2        4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemut-win7-amd64  4 host-install(4)  broken pass in 154667
 test-amd64-amd64-xl-qemuu-ovmf-amd64  4 host-install(4)  broken pass in 154667
 test-amd64-amd64-xl-qemut-ws16-amd64  4 host-install(4)  broken pass in 154667
 test-amd64-amd64-pair         4 host-install/src_host(4) broken pass in 154667
 test-amd64-amd64-pair         5 host-install/dst_host(5) broken pass in 154667
 test-xtf-amd64-amd64-4        4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 4 host-install(4) broken pass in 154667
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 4 host-install(4) broken pass in 154667
 test-amd64-amd64-dom0pvh-xl-intel  4 host-install(4)     broken pass in 154667
 test-amd64-amd64-qemuu-freebsd11-amd64 4 host-install(4) broken pass in 154667
 test-amd64-amd64-xl-credit1   4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemut-debianhvm-amd64 4 host-install(4) broken pass in 154667
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 4 host-install(4) broken pass in 154667
 test-amd64-amd64-libvirt      4 host-install(4)          broken pass in 154667
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154667
 test-amd64-amd64-libvirt-vhd  4 host-install(4)          broken pass in 154667
 test-amd64-amd64-livepatch    4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemuu-ws16-amd64  4 host-install(4)  broken pass in 154667
 test-amd64-amd64-xl-rtds      4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-multivcpu  4 host-install(4)         broken pass in 154667
 test-amd64-amd64-xl-xsm       4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemuu-win7-amd64  4 host-install(4)  broken pass in 154667
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken pass in 154667
 test-amd64-amd64-amd64-pvgrub  4 host-install(4)         broken pass in 154667
 test-amd64-amd64-xl-pvhv2-intel  4 host-install(4)       broken pass in 154667
 test-amd64-amd64-migrupgrade  4 host-install/src_host(4) broken pass in 154667
 test-amd64-amd64-migrupgrade  5 host-install/dst_host(5) broken pass in 154667
 test-amd64-amd64-i386-pvgrub  4 host-install(4)          broken pass in 154667
 test-xtf-amd64-amd64-5        4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qcow2     4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl           4 host-install(4)          broken pass in 154667
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 4 host-install(4) broken pass in 154667
 test-amd64-coresched-amd64-xl  4 host-install(4)         broken pass in 154667
 test-amd64-amd64-xl-credit2   4 host-install(4)          broken pass in 154667
 test-amd64-amd64-qemuu-nested-intel  4 host-install(4)   broken pass in 154667
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat  fail pass in 154667

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-pvshim    12 guest-start          fail in 154667 never pass
 test-amd64-amd64-libvirt    13 migrate-support-check fail in 154667 never pass
 test-amd64-i386-libvirt     13 migrate-support-check fail in 154667 never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check fail in 154667 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop   fail in 154667 never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop    fail in 154667 never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop    fail in 154667 never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail in 154667 never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop    fail in 154667 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop   fail in 154667 never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop   fail in 154667 never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop    fail in 154667 never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop   fail in 154667 never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  88f5b414ac0f8008c1e2b26f93c3d980120941f7
baseline version:
 xen                  c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef

Last test of basis   154358  2020-09-15 09:40:09 Z   11 days
Failing since        154602  2020-09-22 02:37:01 Z    5 days    4 attempts
Testing same since   154625  2020-09-22 20:06:06 Z    4 days    3 attempts

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
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             pass    
 build-i386-prev                                              broken  
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       broken  
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 broken  
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

broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job build-i386-prev broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-xtf-amd64-amd64-5 broken
broken-step build-i386-prev host-install(4)
broken-step test-xtf-amd64-amd64-1 host-install(4)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-pygrub host-install(4)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(4)
broken-step test-amd64-amd64-xl-pvshim host-install(4)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(4)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(4)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(4)
broken-step test-amd64-amd64-xl-shadow host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(4)
broken-step test-xtf-amd64-amd64-3 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step test-amd64-amd64-libvirt-xsm host-install(4)
broken-step test-xtf-amd64-amd64-2 host-install(4)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(4)
broken-step build-i386 host-install(4)
broken-step test-amd64-amd64-pair host-install/src_host(4)
broken-step test-amd64-amd64-pair host-install/dst_host(5)
broken-step test-xtf-amd64-amd64-4 host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(4)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(4)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(4)
broken-step test-amd64-amd64-xl-credit1 host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(4)
broken-step test-amd64-amd64-libvirt host-install(4)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-libvirt-vhd host-install(4)
broken-step test-amd64-amd64-livepatch host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(4)
broken-step test-amd64-amd64-xl-rtds host-install(4)
broken-step test-amd64-amd64-xl-multivcpu host-install(4)
broken-step test-amd64-amd64-xl-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-amd64-pvgrub host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(4)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(4)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(5)
broken-step test-amd64-amd64-i386-pvgrub host-install(4)
broken-step test-xtf-amd64-amd64-5 host-install(4)
broken-step test-amd64-amd64-xl-qcow2 host-install(4)
broken-step test-amd64-amd64-xl host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(4)
broken-step test-amd64-coresched-amd64-xl host-install(4)
broken-step test-amd64-amd64-xl-credit2 host-install(4)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(4)

Not pushing.

(No revision log; it would be 564 lines long.)

