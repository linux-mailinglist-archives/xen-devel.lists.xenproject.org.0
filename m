Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC825F4AC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 10:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFCEo-0007Pm-9D; Mon, 07 Sep 2020 08:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dHX=CQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFCEm-0007Ph-E4
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 08:10:52 +0000
X-Inumbo-ID: 9412a090-54cc-4e7e-b89e-9dee51e994f0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9412a090-54cc-4e7e-b89e-9dee51e994f0;
 Mon, 07 Sep 2020 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=H4uEHHRZE51fOhZC4sbBPkkHCyxJBvdhR7zyVtX+Z0U=; b=wQ+bgiURqHrIPmpCO1owWbW8mQ
 FjL0sBNngpK/3z7SsFtY0FQl86Yh1Ai3WsNit7MK6NDREnwivHVKQH+DG78AauPRxnH2nZpnG0o/H
 qiMllKZjf6dqVEVpwceEhaVCS4lqttlgshzl3XifZyxKUKWZP4PtkRJ0Anh4cEt0OT8I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFCEh-00025r-QQ; Mon, 07 Sep 2020 08:10:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFCEh-0005n4-DQ; Mon, 07 Sep 2020 08:10:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFCEh-0006pX-Cy; Mon, 07 Sep 2020 08:10:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153827-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 153827: regressions - FAIL
X-Osstest-Failures: linux-5.4:build-i386:xen-build:fail:regression
 linux-5.4:build-i386-xsm:xen-build:fail:regression
 linux-5.4:build-amd64:xen-build:fail:regression
 linux-5.4:build-amd64-xsm:xen-build:fail:regression
 linux-5.4:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-5.4:build-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:build-i386-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=e32f4fa1b24d825b2560ca9cfbfd9df44a4310b4
X-Osstest-Versions-That: linux=6576d69aac94cd8409636dfa86e0df39facdf0d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Sep 2020 08:10:47 +0000
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

flight 153827 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153827/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                    6 xen-build                fail REGR. vs. 152853
 build-i386-xsm                6 xen-build                fail REGR. vs. 152853
 build-amd64                   6 xen-build                fail REGR. vs. 152853
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152853

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
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                e32f4fa1b24d825b2560ca9cfbfd9df44a4310b4
baseline version:
 linux                6576d69aac94cd8409636dfa86e0df39facdf0d2

Last test of basis   152853  2020-08-26 09:09:53 Z   11 days
Failing since        153616  2020-09-03 09:42:00 Z    3 days   11 attempts
Testing same since   153752  2020-09-05 11:09:23 Z    1 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Sahu <absahu@codeaurora.org>
  Aditya Pakki <pakki001@umn.edu>
  Adrian Hunter <adrian.hunter@intel.com>
  Alaa Hleihel <alaa@mellanox.com>
  Alain Volmat <alain.volmat@st.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Tsoy <alexander@tsoy.me>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alim Akhtar <alim.akhtar@samsung.com>
  Alistair Popple <alistair@popple.id.au>
  Alvin Šipraga <alsi@bang-olufsen.dk>
  Amelie Delaunay <amelie.delaunay@st.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Grodzovsky <andrey.grodzovsky@amd.com>
  Andrey Konovalov <andreyknvl@google.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Andy Teng <andy.teng@mediatek.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Anthony Koo <Anthony.Koo@amd.com>
  Antonio Borneo <antonio.borneo@st.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Ashok Raj <ashok.raj@intel.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Avri Altman <avri.altman@wdc.com>
  Barry Song <song.bao.hua@hisilicon.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bean Huo <beanhuo@micron.com>
  Ben Skeggs <bskeggs@redhat.com>
  Benjamin Tissoires <benjamin.tissoires@gmail.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bodo Stroesser <bstroesser@ts.fujitsu.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Brice Goglin <brice.goglin@gmail.com>
  Brooke Basile <brookebasile@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Changming Liu <charley.ashbringer@gmail.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chao Yu <yuchao0@huawei.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Coly Li <colyli@suse.de>
  Cong Wang <xiyou.wangcong@gmail.com>
  Cyril Roelandt <tipecaml@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Meyerholt <dxm523@gmail.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Chinner <dchinner@redhat.com>
  David Ahern <dsahern@kernel.org>
  David Brazdil <dbrazdil@google.com>
  David Francis <David.Francis@amd.com>
  David Hildenbrand <david@redhat.com>
  David Laight <david.laight@aculab.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Denis Efremov <efremov@linux.com>
  Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Ding Hui <dinghui@sangfor.com.cn>
  Ding Xiang <dingxiang@cmss.chinamobile.com>
  Dmitry Monakhov <dmtrmonakhov@yandex-team.ru>
  Eryk Brol <eryk.brol@amd.com>
  Evan Green <evgreen@chromium.org>
  Evan Quan <evan.quan@amd.com>
  Evgeny Novikov <novikov@ispras.ru>
  Felipe Balbi <balbi@kernel.org>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Frank van der Linden <fllinden@amazon.com>
  George Kennedy <george.kennedy@oracle.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hector Martin <marcan@marcan.st>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Holger Assmann <h.assmann@pengutronix.de>
  Hou Pu <houpu@bytedance.com>
  Ikjoon Jang <ikjn@chromium.org>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jaegeuk Kim <jaegeuk@kernel.org>
  James Morse <james.morse@arm.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jason Baron <jbaron@akamai.com>
  Javed Hasan <jhasan@marvell.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@ozlabs.org>
  Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
  JiangYu <lnsyyj@hotmail.com>
  Jiansong Chen <Jiansong.Chen@amd.com>
  Jing Xiangfeng <jingxiangfeng@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Joerg Roedel <jroedel@suse.de>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Juergen Gross <jgross@suse.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kaige Li <likaige@loongson.cn>
  Kalle Valo <kvalo@codeaurora.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Keith Busch <kbusch@kernel.org>
  Kim Phillips <kim.phillips@amd.com>
  Lee Jones <lee.jones@linaro.org>
  Li Guifu <bluce.liguifu@huawei.com>
  Li Jun <jun.li@nxp.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lucas Stach <l.stach@pengutronix.de>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Czerner <lczerner@redhat.com>
  Lukas Wunner <lukas@wunner.de>
  Lukasz Luba <lukasz.luba@arm.com>
  Mahesh Bandewar <maheshb@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
  Martijn Coenen <maco@android.com>
  Martin George <marting@netapp.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Maennich <maennich@google.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Mika Kuoppala <mika.kuoppala@linux.intel.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Pozulp <pozulp.kernel@gmail.com>
  Mikita Lipski <mikita.lipski@amd.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Necip Fazil Yildiran <necip@google.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Nikolay Borisov <nborisov@suse.com>
  Nilesh Javali <njavali@marvell.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Natalenko <oleksandr@natalenko.name>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paul Cercueil <paul@crapouillou.net>
  Peilin Ye <yepeilin.cs@gmail.com>
  Peng Fan <fanpeng@loongson.cn>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Qais Yousef <qais.yousef@arm.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  qiuguorui1 <qiuguorui1@huawei.com>
  Qiushi Wu <wu000273@umn.edu>
  Qu Wenruo <wqu@suse.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Reto Schneider <code@reto-schneider.ch>
  Richard Cochran <richardcochran@gmail.com>
  Rob Clark <robdclark@chromium.org>
  Robin Murphy <robin.murphy@arm.com>
  Roman Shaposhnik <roman@zededa.com>
  Sachin Sant <sachinp@linux.vnet.ibm.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
  Sam Ravnborg <sam@ravnborg.org>
  Sasha Levin <sashal@kernel.org>
  Saurav Kashyap <skashyap@marvell.com>
  Sean Young <sean@mess.org>
  Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
  Sham Muthayyan <smuthayy@codeaurora.org>
  Shawn Guo <shawnguo@kernel.org>
  Shay Agroskin <shayagr@amazon.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sowjanya Komatineni <skomatineni@nvidia.com>
  Stanimir Varbanov <svarbanov@mm-sol.com>
  Stanley Chu <stanley.chu@mediatek.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stylon Wang <stylon.wang@amd.com>
  Sumera Priyadarsini <sylphrenadin@gmail.com>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Takashi Iwai <tiwai@suse.de>
  Tamseel Shams <m.shams@samsung.com>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Tobias Schramm <t.schramm@manjaro.org>
  Tom Rix <trix@redhat.com>
  Tony Luck <tony.luck@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Ursula Braun <ubraun@linux.ibm.com>
  Utkarsh H Patel <utkarsh.h.patel@intel.com>
  Valmer Huhn <valmer.huhn@concurrent-rt.com>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xianting Tian <xianting_tian@126.com>
  Xin Yin <yinxin_1989@aliyun.com>
  Xiubo Li <xiubli@redhat.com>
  Yangbo Lu <yangbo.lu@nxp.com>
  Yangtao Li <tiny.windzz@gmail.com>
  Ying Xue <ying.xue@windriver.com>
  Yufen Yu <yuyufen@huawei.com>
  Yunfeng Ye <yeyunfeng@huawei.com>
  Zhang Shengju <zhangshengju@cmss.chinamobile.com>
  zhangyi (F) <yi.zhang@huawei.com>
  Zhi Chen <zhichen@codeaurora.org>

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

(No revision log; it would be 6520 lines long.)

