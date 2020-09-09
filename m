Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94602636FD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 22:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG6Hw-0007gK-5d; Wed, 09 Sep 2020 20:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kG6Hu-0007gE-6u
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 20:01:50 +0000
X-Inumbo-ID: 1bf6c9d0-86f1-4d34-bd20-e4982ca0c3b7
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bf6c9d0-86f1-4d34-bd20-e4982ca0c3b7;
 Wed, 09 Sep 2020 20:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=48avOpXHEJsbHG0vjvVIRsKOW4FpaWphGAE8wIHodgc=; b=wxpY4z4U0J2TfAaBgOqCSrIrD9
 nKzfhoCpQEja7MHKz4YODaC3kEhwB9KMXmk98mDDPNfhh7sbHtGOlKOWPvqwyO7RRJDoHC8Wzpiv4
 vzMh6SoT8AWedv8m5dcqDyes6NP0Uev/U6BTPbuLHR7IA4X09OyyZv7oI62gKf06CBGs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG6Hq-0001BG-SG; Wed, 09 Sep 2020 20:01:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG6Hq-0008Gq-Kf; Wed, 09 Sep 2020 20:01:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kG6Hq-0004ic-KB; Wed, 09 Sep 2020 20:01:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154015-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 154015: regressions - FAIL
X-Osstest-Failures: linux-linus:build-i386-xsm:xen-build:fail:regression
 linux-linus:build-amd64-xsm:xen-build:fail:regression
 linux-linus:build-amd64:xen-build:fail:regression
 linux-linus:build-i386:xen-build:fail:regression
 linux-linus:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-linus:build-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
X-Osstest-Versions-That: linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 20:01:46 +0000
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

flight 154015 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154015/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 152332
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152332
 build-amd64                   6 xen-build                fail REGR. vs. 152332
 build-i386                    6 xen-build                fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152332
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 152332
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z   40 days
Failing since        152366  2020-08-01 20:49:34 Z   38 days   73 attempts
Testing same since   153984  2020-09-09 00:09:59 Z    0 days    2 attempts

------------------------------------------------------------
2328 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                pass    
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
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
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

(No revision log; it would be 310215 lines long.)

