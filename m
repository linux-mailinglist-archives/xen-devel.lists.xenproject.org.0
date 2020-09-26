Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731B279C3A
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 21:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMG53-00063s-H0; Sat, 26 Sep 2020 19:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vXn=DD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMG51-00063n-Ij
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 19:41:59 +0000
X-Inumbo-ID: 72719ef6-fffe-4107-a0e9-be0fbd19bd59
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72719ef6-fffe-4107-a0e9-be0fbd19bd59;
 Sat, 26 Sep 2020 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=rAM8VGgs8tmlnqacXQJZU7EYnnLjsq6zbezrINWGcnE=; b=wpSic649Ic+/UjR5FcCnmBj+TP
 uGWKORwj+HWiHO21B2cVsxgPEidVFuby+PmmNP7e/z59D9gs3cfF+i5N79IXGhUEDFojFJFQtPZdw
 GLumf3etIpNasEnLUPOj/MSN25MiLpFKCnJkj2iWZo6APds5sOdxThaaEJ9o0vRscHyY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMG4w-00072D-Oi; Sat, 26 Sep 2020 19:41:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMG4w-000236-DI; Sat, 26 Sep 2020 19:41:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMG4w-0008Fr-Cm; Sat, 26 Sep 2020 19:41:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154758-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 154758: regressions - trouble:
 broken/fail/pass
X-Osstest-Failures: xen-4.12-testing:test-amd64-i386-xl-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-freebsd10-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-libvirt:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-credit1:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-livepatch:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-raw:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-freebsd10-i386:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-libvirt:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-libvirt-pair:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-migrupgrade:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-pair:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-pvshim:<job status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 xen-4.12-testing:test-amd64-amd64-xl-xsm:guest-start:fail:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-i386-xl-xsm:guest-start:fail:regression
 xen-4.12-testing:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 xen-4.12-testing:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-pvshim:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-freebsd10-i386:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-libvirt-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/src_host(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-libvirt-pair:host-install/dst_host(5):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qcow2:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-libvirt-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-credit2:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-libvirt:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-livepatch:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-pair:host-install/src_host(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-credit1:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-libvirt-vhd:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-raw:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-pair:host-install/dst_host(5):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-pygrub:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-libvirt:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-i386-pvgrub:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-freebsd10-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/src_host(4):broken:heisenbug
 xen-4.12-testing:test-amd64-i386-migrupgrade:host-install/dst_host(5):broken:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-2:xtf/test-hvm64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-4:xtf/test-hvm64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-1:xtf/test-hvm64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-3:xtf/test-hvm64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-2:xtf/test-pv64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-4:xtf/test-pv64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-1:xtf/test-pv64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-3:xtf/test-pv64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-5:xtf/test-hvm64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-xtf-amd64-amd64-5:xtf/test-pv64-xsa-221:fail:heisenbug
 xen-4.12-testing:test-arm64-arm64-xl-seattle:xen-boot:fail:heisenbug
 xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=0186e76a62f7409804c2e4785d5a11e7f82a7c52
X-Osstest-Versions-That: xen=0446e3db13671032b05d19f6117d902f5c5c76fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Sep 2020 19:41:54 +0000
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

flight 154758 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154758/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm          <job status>                 broken
 test-amd64-i386-freebsd10-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-i386-xl-raw          <job status>                 broken
 test-amd64-i386-freebsd10-i386    <job status>                 broken
 test-amd64-i386-libvirt         <job status>                 broken
 test-amd64-i386-libvirt-pair    <job status>                 broken
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <job status>       broken
 test-amd64-i386-libvirt-xsm     <job status>                 broken
 test-amd64-i386-migrupgrade     <job status>                 broken
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>                 broken
 test-amd64-i386-xl              <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>                broken
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>    broken
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-xsm      12 guest-start              fail REGR. vs. 154601
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 154601
 test-amd64-i386-xl-xsm       12 guest-start    fail in 154663 REGR. vs. 154601
 test-amd64-amd64-libvirt-xsm 12 guest-start    fail in 154663 REGR. vs. 154601
 test-amd64-i386-libvirt-xsm  12 guest-start    fail in 154663 REGR. vs. 154601
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail in 154663 REGR. vs. 154601

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-amd64-pvgrub  4 host-install(4)         broken pass in 154663
 test-amd64-i386-xl-qemut-debianhvm-amd64 4 host-install(4) broken pass in 154663
 test-amd64-i386-qemuu-rhel6hvm-intel  4 host-install(4)  broken pass in 154663
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 4 host-install(4) broken pass in 154663
 test-amd64-i386-xl-pvshim     4 host-install(4)          broken pass in 154663
 test-amd64-amd64-qemuu-nested-intel  4 host-install(4)   broken pass in 154663
 test-amd64-i386-xl-xsm        4 host-install(4)          broken pass in 154663
 test-amd64-amd64-qemuu-freebsd11-amd64 4 host-install(4) broken pass in 154663
 test-amd64-i386-freebsd10-i386  4 host-install(4)        broken pass in 154663
 test-amd64-amd64-xl-pvhv2-amd  4 host-install(4)         broken pass in 154663
 test-amd64-i386-qemuu-rhel6hvm-amd  4 host-install(4)    broken pass in 154663
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 4 host-install(4) broken pass in 154663
 test-amd64-amd64-xl-qemut-win7-amd64  4 host-install(4)  broken pass in 154663
 test-amd64-i386-libvirt-xsm   4 host-install(4)          broken pass in 154663
 test-amd64-i386-qemut-rhel6hvm-amd  4 host-install(4)    broken pass in 154663
 test-amd64-i386-xl            4 host-install(4)          broken pass in 154663
 test-amd64-i386-libvirt-pair  4 host-install/src_host(4) broken pass in 154663
 test-amd64-i386-xl-qemut-win7-amd64  4 host-install(4)   broken pass in 154663
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken pass in 154663
 test-amd64-i386-libvirt-pair  5 host-install/dst_host(5) broken pass in 154663
 test-amd64-amd64-xl-qcow2     4 host-install(4)          broken pass in 154663
 test-amd64-i386-xl-qemuu-debianhvm-amd64 4 host-install(4) broken pass in 154663
 test-amd64-amd64-libvirt-xsm  4 host-install(4)          broken pass in 154663
 test-amd64-i386-xl-qemuu-ovmf-amd64  4 host-install(4)   broken pass in 154663
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 4 host-install(4) broken pass in 154663
 test-amd64-amd64-xl-pvhv2-intel  4 host-install(4)       broken pass in 154663
 test-amd64-amd64-xl-credit2   4 host-install(4)          broken pass in 154663
 test-amd64-amd64-libvirt      4 host-install(4)          broken pass in 154663
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154663
 test-amd64-amd64-livepatch    4 host-install(4)          broken pass in 154663
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154663
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154663
 test-amd64-i386-pair          4 host-install/src_host(4) broken pass in 154663
 test-amd64-amd64-xl-credit1   4 host-install(4)          broken pass in 154663
 test-amd64-amd64-libvirt-vhd  4 host-install(4)          broken pass in 154663
 test-amd64-i386-xl-raw        4 host-install(4)          broken pass in 154663
 test-amd64-i386-pair          5 host-install/dst_host(5) broken pass in 154663
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 4 host-install(4) broken pass in 154663
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4) broken pass in 154663
 test-amd64-i386-xl-qemuu-win7-amd64  4 host-install(4)   broken pass in 154663
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 4 host-install(4) broken pass in 154663
 test-amd64-amd64-pygrub       4 host-install(4)          broken pass in 154663
 test-amd64-i386-libvirt       4 host-install(4)          broken pass in 154663
 test-amd64-i386-xl-qemuu-ws16-amd64  4 host-install(4)   broken pass in 154663
 test-amd64-amd64-i386-pvgrub  4 host-install(4)          broken pass in 154663
 test-amd64-i386-freebsd10-amd64  4 host-install(4)       broken pass in 154663
 test-amd64-amd64-qemuu-nested-amd  4 host-install(4)     broken pass in 154663
 test-amd64-i386-xl-qemut-ws16-amd64  4 host-install(4)   broken pass in 154663
 test-amd64-amd64-xl-qemuu-win7-amd64  4 host-install(4)  broken pass in 154663
 test-amd64-i386-migrupgrade   4 host-install/src_host(4) broken pass in 154663
 test-amd64-i386-migrupgrade   5 host-install/dst_host(5) broken pass in 154663
 test-xtf-amd64-amd64-2 68 xtf/test-hvm64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-4 68 xtf/test-hvm64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-1 68 xtf/test-hvm64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-3 68 xtf/test-hvm64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-2 106 xtf/test-pv64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-4 106 xtf/test-pv64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-1 106 xtf/test-pv64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-3 106 xtf/test-pv64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-5 68 xtf/test-hvm64-xsa-221 fail in 154663 pass in 154758
 test-xtf-amd64-amd64-5 106 xtf/test-pv64-xsa-221 fail in 154663 pass in 154758
 test-arm64-arm64-xl-seattle   7 xen-boot         fail in 154663 pass in 154758

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qcow2 17 guest-localmigrate/x10 fail in 154663 like 154601
 test-amd64-i386-xl-pvshim    12 guest-start          fail in 154663 never pass
 test-amd64-amd64-libvirt    13 migrate-support-check fail in 154663 never pass
 test-amd64-i386-libvirt     13 migrate-support-check fail in 154663 never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check fail in 154663 never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop    fail in 154663 never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop    fail in 154663 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop   fail in 154663 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop   fail in 154663 never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop    fail in 154663 never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop    fail in 154663 never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail in 154663 never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0186e76a62f7409804c2e4785d5a11e7f82a7c52
baseline version:
 xen                  0446e3db13671032b05d19f6117d902f5c5c76fa

Last test of basis   154601  2020-09-22 02:37:00 Z    4 days
Testing same since   154622  2020-09-22 16:36:57 Z    4 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Don Slutz <don.slutz@gmail.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  broken  
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       broken  
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     broken  
 test-amd64-i386-freebsd10-amd64                              broken  
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          broken  
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          broken  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          broken  
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         broken  
 test-amd64-i386-freebsd10-i386                               broken  
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      broken  
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  broken  
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 broken  
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       broken  
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
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

broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-i386-xl-raw broken
broken-job test-amd64-i386-freebsd10-i386 broken
broken-job test-amd64-i386-libvirt broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-i386-migrupgrade broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-qemut-rhel6hvm-amd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemut-win7-amd64 broken
broken-job test-amd64-i386-xl-qemut-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemuu-win7-amd64 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-step test-amd64-amd64-amd64-pvgrub host-install(4)
broken-step test-amd64-i386-xl-qemut-debianhvm-amd64 host-install(4)
broken-step test-amd64-i386-qemuu-rhel6hvm-intel host-install(4)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow host-install(4)
broken-step test-amd64-i386-xl-pvshim host-install(4)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(4)
broken-step test-amd64-i386-xl-xsm host-install(4)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(4)
broken-step test-amd64-i386-freebsd10-i386 host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(4)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(4)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(4)
broken-step test-amd64-i386-libvirt-xsm host-install(4)
broken-step test-amd64-i386-qemut-rhel6hvm-amd host-install(4)
broken-step test-amd64-i386-xl host-install(4)
broken-step test-amd64-i386-libvirt-pair host-install/src_host(4)
broken-step test-amd64-i386-xl-qemut-win7-amd64 host-install(4)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-i386-libvirt-pair host-install/dst_host(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(4)
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64 host-install(4)
broken-step test-amd64-amd64-libvirt-xsm host-install(4)
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 host-install(4)
broken-step test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(4)
broken-step test-amd64-amd64-xl-credit2 host-install(4)
broken-step test-amd64-amd64-libvirt host-install(4)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-amd64-livepatch host-install(4)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-i386-pair host-install/src_host(4)
broken-step test-amd64-amd64-xl-credit1 host-install(4)
broken-step test-amd64-amd64-libvirt-vhd host-install(4)
broken-step test-amd64-i386-xl-raw host-install(4)
broken-step test-amd64-i386-pair host-install/dst_host(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(4)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(4)
broken-step test-amd64-i386-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(4)
broken-step test-amd64-amd64-pygrub host-install(4)
broken-step test-amd64-i386-libvirt host-install(4)
broken-step test-amd64-i386-xl-qemuu-ws16-amd64 host-install(4)
broken-step test-amd64-amd64-i386-pvgrub host-install(4)
broken-step test-amd64-i386-freebsd10-amd64 host-install(4)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(4)
broken-step test-amd64-i386-xl-qemut-ws16-amd64 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(4)
broken-step test-amd64-i386-migrupgrade host-install/src_host(4)
broken-step test-amd64-i386-migrupgrade host-install/dst_host(5)

Not pushing.

(No revision log; it would be 473 lines long.)

