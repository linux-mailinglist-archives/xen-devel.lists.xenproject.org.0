Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B75F1B13
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 11:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414498.658802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeYZO-0004qp-Pf; Sat, 01 Oct 2022 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414498.658802; Sat, 01 Oct 2022 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeYZO-0004nk-L6; Sat, 01 Oct 2022 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 414498;
 Sat, 01 Oct 2022 09:14:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeYZM-0004na-MT; Sat, 01 Oct 2022 09:14:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeYZM-0002Ng-IK; Sat, 01 Oct 2022 09:14:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeYZL-0002h1-VZ; Sat, 01 Oct 2022 09:14:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeYZL-0005aW-V7; Sat, 01 Oct 2022 09:13:59 +0000
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
	bh=0mJbRHBHG0w4flfRsgVnt47eTAa8yE78116zteN8fxs=; b=6gMTUs8H83HcXdLiPW0EPYO356
	t9V+oKwA6b3NEtPbOtbvYILeWolo8JGtrOIaiDA3ueYpcSeARfF7ht6Yd7ZIjthwKUQ4+j2YZryYe
	zuVXk6Ih53xW0J3Zf4mo7Q5uMWbz77Mw7SAM2bbrCMlkJAhGNko3OfwoRlH830VweFGI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173389-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 173389: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:build-i386:<job status>:broken:regression
    xen-unstable:build-i386-prev:<job status>:broken:regression
    xen-unstable:build-i386-pvops:<job status>:broken:regression
    xen-unstable:build-i386-xsm:<job status>:broken:regression
    xen-unstable:build-i386-pvops:host-install(4):broken:regression
    xen-unstable:build-i386-prev:host-install(4):broken:regression
    xen-unstable:build-i386-xsm:host-install(4):broken:regression
    xen-unstable:build-i386:host-install(4):broken:regression
    xen-unstable:test-amd64-i386-examine-bios:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-examine-uefi:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1666086b00442b23e4fd70f4971e3bcf1a16b124
X-Osstest-Versions-That:
    xen=211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Oct 2022 09:13:59 +0000

flight 173389 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173389/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 173379
 build-i386-prev               4 host-install(4)        broken REGR. vs. 173379
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 173379
 build-i386                    4 host-install(4)        broken REGR. vs. 173379

Tests which did not succeed, but are not blocking:
 test-amd64-i386-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine-uefi  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173379
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173379
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173379
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173379
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173379
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173379
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173379
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173379
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  1666086b00442b23e4fd70f4971e3bcf1a16b124
baseline version:
 xen                  211d8419ef8d8a237ff914fd8304b8fefc3ff2cc

Last test of basis   173379  2022-09-30 01:52:22 Z    1 days
Failing since        173385  2022-09-30 11:39:55 Z    0 days    2 attempts
Testing same since   173389  2022-09-30 22:09:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Dmytro Semenets <dmytro_semenets@epam.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Nathan Studer <nathan.studer@dornerworks.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
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
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 blocked 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       blocked 


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

broken-job build-i386 broken
broken-job build-i386-prev broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386-pvops host-install(4)
broken-step build-i386-prev host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)

Not pushing.

------------------------------------------------------------
commit 1666086b00442b23e4fd70f4971e3bcf1a16b124
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 30 15:16:22 2022 +0200

    x86/NUMA: improve memnode_shift calculation for multi node system
    
    SRAT may describe individual nodes using multiple ranges. When they're
    adjacent (with or without a gap in between), only the start of the first
    such range actually needs accounting for. Furthermore the very first
    range doesn't need considering of its start address at all, as it's fine
    to associate all lower addresses (with no memory) with that same node.
    For this to work, the array of ranges needs to be sorted by address -
    adjust logic accordingly in acpi_numa_memory_affinity_init().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 38e1276db4c5457cd6e7811b4e168aa85c8a0b06
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 30 09:56:27 2022 +0200

    Arm/vGIC: adjust gicv3_its_deny_access() to fit other gic*_iomem_deny_access(
    
    While an oversight in 9982fe275ba4 ("arm/vgic: drop const attribute
    from gic_iomem_deny_access()"), the issue really became apparent only
    when iomem_deny_access() was switched to have a non-const first
    parameter.
    
    Fixes: c4e5cc2ccc5b ("x86/ept: limit calls to memory_type_changed()")
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Tested-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit b1f4b45d02cac2bf704c2fcc61c70c3567cfaa5b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Sep 30 09:55:34 2022 +0200

    x86/NUMA: correct off-by-1 in node map size calculation
    
    extract_lsb_from_nodes() accumulates "memtop" from all PDXes one past
    the covered ranges. Hence the maximum address which can validly by used
    to index the node map is one below this value, and we may currently set
    up a node map with an unused (and never initialized) trailing entry. In
    boundary cases this may also mean we dynamically allocate a page when
    the static (64-entry) map would suffice.
    
    While there also correct the comment ahead of the function, for it to
    match the actual code: Linux commit 54413927f022 ("x86-64:
    x86_64-make-the-numa-hash-function-nodemap-allocation fix fix") removed
    the ORing in of the end address before we actually cloned their code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Wei Chen <Wei.Chen@arm.com>

commit defa4e51d20a143bdd4395a075bf0933bb38a9a4
Author: Tamas K Lengyel <tamas.lengyel@intel.com>
Date:   Fri Sep 30 09:53:49 2022 +0200

    x86/vpmu: Fix race-condition in vpmu_load
    
    The vPMU code-bases attempts to perform an optimization on saving/reloading the
    PMU context by keeping track of what vCPU ran on each pCPU. When a pCPU is
    getting scheduled, checks if the previous vCPU isn't the current one. If so,
    attempts a call to vpmu_save_force. Unfortunately if the previous vCPU is
    already getting scheduled to run on another pCPU its state will be already
    runnable, which results in an ASSERT failure.
    
    Fix this by always performing a pmu context save in vpmu_save when called from
    vpmu_switch_from, and do a vpmu_load when called from vpmu_switch_to.
    
    While this presents a minimal overhead in case the same vCPU is getting
    rescheduled on the same pCPU, the ASSERT failure is avoided and the code is a
    lot easier to reason about.
    
    Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Thu Sep 29 10:51:31 2022 +0100

    automation: Information about running containers for a different arch
    
    Adding pointer to 'qemu-user-static'.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit a210e94af38a957fcc99db01d2cfcc3039859445
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Mon Sep 19 20:37:37 2022 +0200

    xen/arm: domain_build: Always print the static shared memory region
    
    At the moment, the information about allocating static shared memory
    region is only printed during the debug build. This information can also
    be helpful for the end user (which may not be the same as the person
    building the package), so switch to printk(). Also drop XENLOG_INFO to be
    consistent with other printk() used to print the domain information.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit b726541d94bd0a80b5864d17a2cd2e6d73a3fe0a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:47:45 2022 +0200

    x86: wire up VCPUOP_register_vcpu_time_memory_area for 32-bit guests
    
    Forever sinced its introduction VCPUOP_register_vcpu_time_memory_area
    was available only to native domains. Linux, for example, would attempt
    to use it irrespective of guest bitness (including in its so called
    PVHVM mode) as long as it finds XEN_PVCLOCK_TSC_STABLE_BIT set (which we
    set only for clocksource=tsc, which in turn needs engaging via command
    line option).
    
    Fixes: a5d39947cb89 ("Allow guests to register secondary vcpu_time_info")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 9214da34a3cb017ff0417900250bd6d18ca89e15
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:46:50 2022 +0200

    x86: re-connect VCPUOP_send_nmi for 32-bit guests
    
    With the "inversion" of VCPUOP handling, processing arch-specific ones
    first, the forwarding of this sub-op from the (common) compat handler to
    (common) non-compat one did no longer have the intended effect. It now
    needs forwarding between the arch-specific handlers.
    
    Fixes: 8a96c0ea7999 ("xen: move do_vcpu_op() to arch specific code")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit c4e5cc2ccc5b8274d02f7855c4769839989bb349
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Sep 29 14:44:10 2022 +0200

    x86/ept: limit calls to memory_type_changed()
    
    memory_type_changed() is currently only implemented for Intel EPT, and
    results in the invalidation of EMT attributes on all the entries in
    the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
    when the guest tries to access any gfns for the first time, which
    results in the recalculation of the EMT for the accessed page.  The
    vmexit and the recalculations are expensive, and as such should be
    avoided when possible.
    
    Remove the call to memory_type_changed() from
    XEN_DOMCTL_memory_mapping: there are no modifications of the
    iomem_caps ranges anymore that could alter the return of
    cache_flush_permitted() from that domctl.
    
    Encapsulate calls to memory_type_changed() resulting from changes to
    the domain iomem_caps or ioport_caps ranges in the helpers themselves
    (io{ports,mem}_{permit,deny}_access()), and add a note in
    epte_get_entry_emt() to remind that changes to the logic there likely
    need to be propagaed to the IO capabilities helpers.
    
    Note changes to the IO ports or memory ranges are not very common
    during guest runtime, but Citrix Hypervisor has an use case for them
    related to device passthrough.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 9982fe275ba4ee1a749b6dde5602a5a79e42b543
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Sep 29 14:41:13 2022 +0200

    arm/vgic: drop const attribute from gic_iomem_deny_access()
    
    While correct from a code point of view, the usage of the const
    attribute for the domain parameter of gic_iomem_deny_access() is at
    least partially bogus.  Contents of the domain structure (the iomem
    rangeset) is modified by the function.  Such modifications succeed
    because right now the iomem rangeset is allocated separately from
    struct domain, and hence is not subject to the constness of struct
    domain.
    
    Amend this by dropping the const attribute from the function
    parameter.
    
    This is required by further changes that will convert
    iomem_{permit,deny}_access into a function.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 0db195c1a9947240b354abbefd2afac6c73ad6a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:39:52 2022 +0200

    x86/NUMA: correct memnode_shift calculation for single node system
    
    SRAT may describe even a single node system (including such with
    multiple nodes, but only one having any memory) using multiple ranges.
    Hence simply counting the number of ranges (note that function
    parameters are mis-named) is not an indication of the number of nodes in
    use. Since we only care about knowing whether we're on a single node
    system, accounting for this is easy: Increment the local variable only
    when adjacent ranges are for different nodes. That way the count may
    still end up larger than the number of nodes in use, but it won't be
    larger than 1 when only a single node has any memory.
    
    To compensate populate_memnodemap() now needs to be prepared to find
    the correct node ID already in place for a range. (This could of course
    also happen when there's more than one node with memory, while at least
    one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
    would also know to recognize this case.)
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit e1de23b7c1bfa02447a79733e64184b3635e0587
Author: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Date:   Thu Sep 29 14:38:22 2022 +0200

    MAINTAINERS: ARINC 653 scheduler maintainer updates
    
    Add Nathan Studer as co-maintainer.
    
    I am departing DornerWorks. I will still be working with Xen in my next
    role, and I still have an interest in co-maintaining the ARINC 653
    scheduler, so change to my personal email address.
    
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
    Acked-by: Nathan Studer <nathan.studer@dornerworks.com>

commit 3ab6ea992b0e5e1a332bdbc8ae56d72f1b66fcbd
Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date:   Thu Sep 29 14:38:02 2022 +0200

    tools: remove xenstore entries on vchan server closure
    
    vchan server creates XenStore entries to advertise its event channel and
    ring, but those are not removed after the server quits.
    Add additional cleanup step, so those are removed, so clients do not try
    to connect to a non-existing server.
    
    Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
    Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

