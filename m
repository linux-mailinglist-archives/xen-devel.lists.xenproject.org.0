Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25025FBFB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:23:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFI36-0008Pa-OW; Mon, 07 Sep 2020 14:23:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dHX=CQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFI35-0008PA-Cb
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:23:11 +0000
X-Inumbo-ID: df6f4cdc-48d1-4446-9b8f-ecd091123acd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df6f4cdc-48d1-4446-9b8f-ecd091123acd;
 Mon, 07 Sep 2020 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=TMjKvXIvYjS+6Xtxzn2CsU54gZpjXOx1CtUcL+h8O+c=; b=vym+6DXV3xd3uFzDMdV70GZ15l
 Hm9X5CmrfPVCqwlv6GFaAa02Aq+udQQmPXGpWT5HEDGD2cULBR/Vb3hch9zQeC4oiaD9wiGMB9YRl
 tTFDh8m2xu1+RgjH9YdxA1g0tgc6rDyUdIUA9ttKICh+IMJcOq5gJQbRT4tdY2evbGco=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFI2x-0001fE-5y; Mon, 07 Sep 2020 14:23:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFI2w-00009Q-U1; Mon, 07 Sep 2020 14:23:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFI2w-0002If-TV; Mon, 07 Sep 2020 14:23:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153854-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 153854: regressions - FAIL
X-Osstest-Failures: linux-linus:build-amd64:xen-build:fail:regression
 linux-linus:build-i386:xen-build:fail:regression
 linux-linus:build-amd64-xsm:xen-build:fail:regression
 linux-linus:build-i386-xsm:xen-build:fail:regression
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
 linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
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
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
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
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=f4d51dffc6c01a9e94650d95ce0104964f8ae822
X-Osstest-Versions-That: linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Sep 2020 14:23:02 +0000
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

flight 153854 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153854/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 152332
 build-i386                    6 xen-build                fail REGR. vs. 152332
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152332
 build-i386-xsm                6 xen-build                fail REGR. vs. 152332

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
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
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
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152332
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
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                f4d51dffc6c01a9e94650d95ce0104964f8ae822
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z   37 days
Failing since        152366  2020-08-01 20:49:34 Z   36 days   67 attempts
Testing same since   153854  2020-09-07 05:10:23 Z    0 days    1 attempts

------------------------------------------------------------
2325 people touched revisions under test,
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
 test-armhf-armhf-xl-rtds                                     fail    
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

(No revision log; it would be 309653 lines long.)

