Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A061E577
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 20:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438685.692783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orl3T-0000gp-5w; Sun, 06 Nov 2022 19:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438685.692783; Sun, 06 Nov 2022 19:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orl3T-0000e9-2g; Sun, 06 Nov 2022 19:11:39 +0000
Received: by outflank-mailman (input) for mailman id 438685;
 Sun, 06 Nov 2022 19:11:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orl3R-0000dz-BH; Sun, 06 Nov 2022 19:11:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orl3R-0006bx-70; Sun, 06 Nov 2022 19:11:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orl3Q-00044k-PP; Sun, 06 Nov 2022 19:11:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1orl3Q-0001nI-Ot; Sun, 06 Nov 2022 19:11:36 +0000
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
	bh=GqDvvUQsekaMKQEz/R9XAHTBvOCD26JQdxJNDOqqE10=; b=pHqyzsEdWNJO/TcKF765MgDe+g
	QH8Nj708f8oEumG0XGIefOA0IwHT65XtEEOfsiIM5OAtYSXFhg3i4vJ/0KbxkoiAL3+I9dWgyYi3/
	ivyLM14mfvGj74ls2rvsBeQVPzJEAS2bB+qQMLovHxSKQhc3wlN0+55gE1ylDhF8j8NA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174646-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 174646: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-5.4:build-arm64-pvops:kernel-build:fail:regression
    linux-5.4:test-amd64-i386-pair:xen-install/dst_host:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-xsm:xen-boot:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-pair:xen-install/src_host:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start.2:fail:heisenbug
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a0d9384967214783a92973c920092b7251c03e57
X-Osstest-Versions-That:
    linux=b70bfeb98635040588883503d2760e0f46231491
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Nov 2022 19:11:36 +0000

flight 174646 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174646/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 174540
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 174638 REGR. vs. 174540
 build-arm64-pvops             6 kernel-build   fail in 174642 REGR. vs. 174540

Tests which are failing intermittently (not blocking):
 test-amd64-i386-pair     11 xen-install/dst_host fail in 174638 pass in 174646
 test-amd64-i386-libvirt-xsm   8 xen-boot         fail in 174638 pass in 174646
 test-armhf-armhf-xl-rtds     14 guest-start      fail in 174638 pass in 174646
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail in 174642 pass in 174646
 test-amd64-i386-pair     10 xen-install/src_host fail in 174642 pass in 174646
 test-armhf-armhf-xl-credit2  14 guest-start      fail in 174642 pass in 174646
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail in 174642 pass in 174646
 test-armhf-armhf-libvirt-raw 13 guest-start      fail in 174642 pass in 174646
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 174638
 test-armhf-armhf-libvirt-qcow2 13 guest-start              fail pass in 174638
 test-armhf-armhf-xl-credit1  19 guest-start.2              fail pass in 174638
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install       fail pass in 174642
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat  fail pass in 174642
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 174642

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 174642 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 174642 n/a
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 174638 like 174540
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 174638 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 174638 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 174638 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174540
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174540
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174540
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174540
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174540
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174540
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174540
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174540
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174540
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 174540
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174540
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a0d9384967214783a92973c920092b7251c03e57
baseline version:
 linux                b70bfeb98635040588883503d2760e0f46231491

Last test of basis   174540  2022-10-29 12:41:57 Z    8 days
Failing since        174575  2022-11-01 18:42:39 Z    5 days    9 attempts
Testing same since   174608  2022-11-03 19:46:50 Z    2 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Darrick J. Wong" <darrick.wong@oracle.com>
  Aaron Conole <aconole@redhat.com>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anssi Hannula <anssi.hannula@bitwise.fi>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Brian Foster <bfoster@redhat.com>
  Chandan Babu R <chandan.babu@oracle.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Christian A. Ehrhardt <lk@c--e.de>
  Darrick J. Wong <darrick.wong@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David S. Miller <davem@davemloft.net>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Dongliang Mu <dzm91@hust.edu.cn>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hannu Hartikainen <hannu@hrtk.in>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Hyong Youb Kim <hyonkim@cisco.com>
  Hyunwoo Kim <imv4bel@gmail.com>
  Ilya Maximets <i.maximets@ovn.org>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Beulich <jbeulich@suse.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jeff Vanhoof <jdv1029@gmail.com>
  Jens Glathe <jens.glathe@oldschoolsolutions.biz>
  Jimmy Assarsson <extja@kvaser.com>
  Johan Hovold <johan+linaro@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Justin Chen <justinpopo6@gmail.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Leon Romanovsky <leonro@nvidia.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Capitulino <luizcap@amazon.com>
  M. Vefa Bicakci <m.v.b@runbox.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Ma <mahongwei@zeku.com>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Michal Jaron <michalx.jaron@intel.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Huckleberry <nhuck@google.com>
  Neal Cardwell <ncardwell@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Paolo Abeni <pabeni@redhat.com>
  Peter Zijlstra <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rik van Riel <riel@surriel.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sasha Levin <sashal@kernel.org>
  Shreeya Patel <shreeya.patel@collabora.com>
  Slawomir Laba <slawomirx.laba@intel.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasily Gorbik <gor@linux.ibm.com>
  Vineet Gupta <vgupta@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yongqin Liu <yongqin.liu@linaro.org>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

(No revision log; it would be 2244 lines long.)

