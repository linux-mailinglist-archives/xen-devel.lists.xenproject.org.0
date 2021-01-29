Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6B308EF7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 22:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78519.142851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ayL-0006dI-0Y; Fri, 29 Jan 2021 21:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78519.142851; Fri, 29 Jan 2021 21:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ayK-0006cs-R2; Fri, 29 Jan 2021 21:06:28 +0000
Received: by outflank-mailman (input) for mailman id 78519;
 Fri, 29 Jan 2021 21:06:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5ayJ-0006ck-DY; Fri, 29 Jan 2021 21:06:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5ayJ-0006SN-8C; Fri, 29 Jan 2021 21:06:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5ayI-0008Q1-Uw; Fri, 29 Jan 2021 21:06:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l5ayI-0004uV-UM; Fri, 29 Jan 2021 21:06:26 +0000
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
	bh=a27TYwZDK04OUCAKShWjRQodVBFjv8c4955FpO0W7xY=; b=z5no7AIgTooqg8XrKUsX9gzN+N
	LWV3GaiM1WX+md3h9Zn2iPiCv2QSbiO+z2NuDabrmX7vVe+lDJL/ZeQxtpoLJ1DKMRwnZzhcSLtmf
	OipuN/AdqjFy0MERJyzVxMpIOEBw0RV7zgpU3x0GDs2pyXcrnIqw7Y31JpVQpPXFvLI8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158765-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 158765: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-multivcpu:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:regression
    linux-5.4:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start:fail:regression
    linux-5.4:test-amd64-coresched-i386-xl:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl:guest-start:fail:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:redhat-install:fail:regression
    linux-5.4:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    linux-5.4:test-amd64-i386-freebsd10-amd64:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:regression
    linux-5.4:test-amd64-i386-freebsd10-i386:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    linux-5.4:test-amd64-i386-xl:guest-start:fail:regression
    linux-5.4:test-amd64-i386-libvirt:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-credit1:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-libvirt:guest-start:fail:regression
    linux-5.4:test-amd64-i386-xl-xsm:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-pair:guest-start/debian:fail:regression
    linux-5.4:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    linux-5.4:test-amd64-amd64-xl-credit2:guest-start:fail:regression
    linux-5.4:test-amd64-i386-pair:guest-start/debian:fail:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    linux-5.4:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:redhat-install:fail:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:regression
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-i386-xl-raw:debian-di-install:fail:regression
    linux-5.4:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:windows-install:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
    linux-5.4:test-amd64-i386-xl-shadow:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-5.4:test-armhf-armhf-xl:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-arndale:host-ping-check-xen:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
X-Osstest-Versions-This:
    linux=131f8d8a889a5ca66a835eea82bba043ac91a7cf
X-Osstest-Versions-That:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jan 2021 21:06:26 +0000

flight 158765 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158765/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 158387
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 158387
 test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 158387
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 158387
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 158387
 test-amd64-amd64-qemuu-freebsd12-amd64 13 guest-start    fail REGR. vs. 158387
 test-amd64-coresched-i386-xl 14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-qemuu-freebsd11-amd64 13 guest-start    fail REGR. vs. 158387
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-qemut-rhel6hvm-amd 12 redhat-install     fail REGR. vs. 158387
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-freebsd10-amd64 13 guest-start           fail REGR. vs. 158387
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install     fail REGR. vs. 158387
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 158387
 test-amd64-i386-freebsd10-i386 13 guest-start            fail REGR. vs. 158387
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-xl           14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-xl-xsm       14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 158387
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 158387
 test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-pair         25 guest-start/debian       fail REGR. vs. 158387
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 158387
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 158387
 test-amd64-i386-qemut-rhel6hvm-intel 12 redhat-install   fail REGR. vs. 158387
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 158387
 test-amd64-i386-qemuu-rhel6hvm-intel 12 redhat-install   fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 158387
 test-amd64-i386-xl-qemut-win7-amd64 12 windows-install   fail REGR. vs. 158387
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemut-win7-amd64 12 windows-install  fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-i386-pvgrub 12 debian-di-install        fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qcow2    12 debian-di-install        fail REGR. vs. 158387
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-amd64-pvgrub 12 debian-di-install       fail REGR. vs. 158387
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install  fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 158387
 test-amd64-amd64-xl-qemut-ws16-amd64 12 windows-install  fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-win7-amd64 12 windows-install   fail REGR. vs. 158387
 test-amd64-i386-xl-raw       12 debian-di-install        fail REGR. vs. 158387
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 158387
 test-amd64-i386-xl-qemut-ws16-amd64 12 windows-install   fail REGR. vs. 158387
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 158387
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 158387
 test-amd64-i386-xl-qemuu-ws16-amd64 12 windows-install   fail REGR. vs. 158387
 test-amd64-i386-xl-shadow    14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 158387
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 158387
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 158387
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-arndale  14 guest-start    fail in 158748 REGR. vs. 158387

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-arndale  10 host-ping-check-xen        fail pass in 158748

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 158387

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass

version targeted for testing:
 linux                131f8d8a889a5ca66a835eea82bba043ac91a7cf
baseline version:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b

Last test of basis   158387  2021-01-12 19:40:06 Z   17 days
Failing since        158473  2021-01-17 13:42:20 Z   12 days   20 attempts
Testing same since   158707  2021-01-27 15:40:55 Z    2 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Akilesh Kailash <akailash@google.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Maguire <alan.maguire@oracle.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Leibovich <alexl@marvell.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexandru Ardelean <alexandru.ardelean@analog.com>
  Alexey Minnekhanov <alexeymin@postmarketos.org>
  Anders Roxell <anders.roxell@linaro.org>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Lutomirski <luto@kernel.org>
  Anthony Iliopoulos <ailiop@suse.com>
  Ariel Marcovitch <ariel.marcovitch@gmail.com>
  Ariel Marcovitch <arielmarcovitch@gmail.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Aya Levin <ayal@nvidia.com>
  Ayush Sawal <ayush.sawal@chelsio.com>
  Baptiste Lepers <baptiste.lepers@gmail.com>
  Ben Skeggs <bskeggs@redhat.com>
  Billy Tsai <billy_tsai@aspeedtech.com>
  Borislav Petkov <bp@suse.de>
  Can Guo <cang@codeaurora.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Cezary Rojewski <cezary.rojewski@intel.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Colin Ian King <colin.king@canonical.com>
  Cong Wang <cong.wang@bytedance.com>
  Craig Tatlor <ctatlor97@gmail.com>
  Damien Le Moal <damien.lemoal@wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Dave Wysochanski <dwysocha@redhat.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Woodhouse <dwmw@amazon.co.uk>
  David Wu <david.wu@rock-chips.com>
  Dennis Li <Dennis.Li@amd.com>
  Dexuan Cui <decui@microsoft.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Enke Chen <enchen@paloaltonetworks.com>
  Eric Dumazet <edumazet@google.com>
  Eugene Korenevsky <ekorenevsky@astralinux.ru>
  Ewan D. Milne <emilne@redhat.com>
  Fabian Vogt <fvogt@suse.com>
  Felipe Balbi <balbi@kernel.org>
  Felix Fietkau <nbd@nbd.name>
  Fenghua Yu <fenghua.yu@intel.com>
  Filipe Laíns <lains@archlinux.org>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gopal Tiwari <gtiwari@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guido Günther <agx@sigxcpu.org>
  Guillaume Nault <gnault@redhat.com>
  Gustavo Pimentel <gustavo.pimentel@synopsys.com>
  Hamish Martin <hamish.martin@alliedtelesis.co.nz>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hao Wang <pkuwangh@gmail.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Hoang Le <hoang.h.le@dektech.com.au>
  Huazhong Tan <tanhuazhong@huawei.com>
  Ido Schimmel <idosch@nvidia.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ingo Molnar <mingo@kernel.org>
  Ion Agorria <ion@agorria.com>
  Israel Rukshin <israelr@nvidia.com>
  J. Bruce Fields <bfields@redhat.com>
  j.nixdorf@avm.de <j.nixdorf@avm.de>
  Jakub Kicinski <kuba@kernel.org>
  Jamie Iles <jamie@jamieiles.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  JC Kuo <jckuo@nvidia.com>
  Jean Delvare <jdelvare@suse.de>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jethro Beekman <jethro@fortanix.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Nixdorf <j.nixdorf@avm.de>
  John Millikin <john@john-millikin.com>
  Johnathan Smithinovic <johnathan.smithinovic@gmx.at>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonsoo Kim <iamjoonsoo.kim@lge.com>
  Josef Bacik <josef@toxicpanda.com>
  Jouni K. Seppänen <jks@iki.fi>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juerg Haefliger <juergh@canonical.com>
  Juergen Gross <jgross@suse.com>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Krzysztof Mazur <krzysiek@podlesie.net>
  Krzysztof Piotr Olędzki <ole@ans.pl>
  Lars-Peter Clausen <lars@metafoo.de>
  Lecopzer Chen <lecopzer.chen@mediatek.com>
  Lecopzer Chen <lecopzer@gmail.com>
  Leon Romanovsky <leonro@nvidia.com>
  Leon Schuermann <leon@is.currently.online>
  Linhua Xu <linhua.xu@unisoc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Longfang Liu <liulongfang@huawei.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Lozano <llozano@google.com>
  Lukas Wunner <lukas@wunner.de>
  Manish Chopra <manishc@marvell.com>
  Manoj Gupta <manojgupta@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcin Wojtas <mw@semihalf.com>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Mark Zhang <markzhang@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Martin Wilck <mwilck@suse.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathias Kresin <dev@kresin.me>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matteo Croce <mcroce@microsoft.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikko Perttunen <mperttunen@nvidia.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Mircea Cirjaliu <mcirjaliu@bitdefender.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Neal Cardwell <ncardwell@google.com>
  Necip Fazil Yildiran <fazilyildiran@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nilesh Javali <njavali@marvell.com>
  Oded Gabbay <ogabbay@kernel.org>
  Olaf Hering <olaf@aepfle.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Pan Bian <bianpan2016@163.com>
  Parav Pandit <parav@nvidia.com>
  Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
  Paul Cercueil <paul@crapouillou.net>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Peter Collingbourne <pcc@google.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Robinson <pbrobinson@gmail.com>
  Petr Machata <me@pmachata.org>
  Petr Machata <petrm@nvidia.com>
  Phil Oester <kernel@linuxace.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping Cheng <ping.cheng@wacom.com>
  Ping Cheng <pinglinux@gmail.com>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Qinglang Miao <miaoqinglang@huawei.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael Kitover <rkitover@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Villemoes <rasmus.villemoes@prevas.dk>
  Reinette Chatre <reinette.chatre@intel.com>
  Rich Felker <dalias@libc.org>
  Rob Clark <robdclark@chromium.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Rohit Maheshwari <rohitm@chelsio.com>
  Roman Guskov <rguskov@dh-electronics.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Ross Zwisler <zwisler@google.com>
  Ryan Chen <ryan_chen@aspeedtech.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sagar Shrikant Kadam <sagar.kadam@sifive.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sameer Pujar <spujar@nvidia.com>
  Samuel Holland <samuel@sholland.org>
  Sasha Levin <sashal@kernel.org>
  Sean Tranchetti <stranche@codeaurora.org>
  Seth Miller <miller.seth@gmail.com>
  Shawn Guo <shawn.guo@linaro.org>
  Shravya Kumbham <shravya.kumbham@xilinx.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stanislav Fomichev <sdf@google.com>
  Stefan Chulski <stefanc@marvell.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Su Yue <l@damenly.su>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Hebb <tommyhebb@gmail.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tom Rix <trix@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Pasternak <vadimp@nvidia.com>
  Valdis Kletnieks <valdis.kletnieks@vt.edu>
  Valdis Klētnieks <valdis.kletnieks@vt.edu>
  Vasily Averin <vvs@virtuozzo.com>
  Victor Zhao <Victor.Zhao@amd.com>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  Vineet Gupta <vgupta@synopsys.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Hui <john.wanghui@huawei.com>
  Wayne Lin <Wayne.Lin@amd.com>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  yangerkun <yangerkun@huawei.com>
  Yazen Ghannam <Yazen.Ghannam@amd.com>
  Yonglong Liu <liuyonglong@huawei.com>
  Youling Tang <tangyouling@loongson.cn>
  YueHaibing <yuehaibing@huawei.com>
  Yufeng Mo <moyufeng@huawei.com>
  zhengbin <zhengbin13@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 7622 lines long.)

