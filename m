Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA93164C1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83532.155678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nRP-0007qZ-AD; Wed, 10 Feb 2021 11:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83532.155678; Wed, 10 Feb 2021 11:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nRP-0007q0-3t; Wed, 10 Feb 2021 11:13:51 +0000
Received: by outflank-mailman (input) for mailman id 83532;
 Wed, 10 Feb 2021 11:13:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nRN-0007ps-LW; Wed, 10 Feb 2021 11:13:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nRN-0007m5-D0; Wed, 10 Feb 2021 11:13:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nRN-0000P4-2u; Wed, 10 Feb 2021 11:13:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nRN-0004mP-2N; Wed, 10 Feb 2021 11:13:49 +0000
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
	bh=0RRfQJgw24Y8ouSDjWlnjOUxONylNpgHzcOb0RghHtI=; b=d0T3xPTYwq3uH1e2w9PgRSjBXN
	MY5TkYrjikCYgoRpbSzUiR66t1kgybrZNoTtJo36kDWYLTdfzk4lKVpHN6X/rWJBof1/bCtiBVF3x
	QKFUi4PjpgCQnHKSMzhJTZckXMmG4u3JUXX5aaYqcsI6R+V4jV17wU61dubev0z6+TvY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159181-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 159181: regressions - trouble: fail/pass/preparing/queued/running
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-xl-credit1:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:host-ping-check-xen:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-raw:<none executed>:queued:regression
    linux-linus:test-amd64-i386-examine:<none executed>:queued:regression
    linux-linus:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    linux-linus:build-i386-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    linux-linus:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-pair:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-linus:build-i386-pvops:hosts-allocate:running:regression
    linux-linus:build-i386:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-examine:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-libvirt-vhd:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-pair:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    linux-linus:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-credit2:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:hosts-allocate:running:regression
    linux-linus:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    linux-linus:test-armhf-armhf-libvirt-raw:host-install(5):running:regression
    linux-linus:test-armhf-armhf-libvirt:guest-start:running:regression
    linux-linus:test-armhf-armhf-libvirt-raw:syslog-server:running:regression
    linux-linus:test-armhf-armhf-libvirt:syslog-server:running:regression
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
X-Osstest-Versions-This:
    linux=e0756cfc7d7cd08c98a53b6009c091a3f6a50be6
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:13:49 +0000

flight 159181 linux-linus running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159181/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-credit1  10 host-ping-check-xen      fail REGR. vs. 152332
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 152332
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 152332
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-seattle  10 host-ping-check-xen      fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2  10 host-ping-check-xen      fail REGR. vs. 152332
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 152332
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-examine         <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 build-i386-pvops              2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 test-amd64-amd64-examine      2 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate   running
 test-amd64-amd64-amd64-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-i386-pvgrub  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-intel  3 hosts-allocate               running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-vhd  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 3 hosts-allocate running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-credit2   3 hosts-allocate               running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running
 test-armhf-armhf-libvirt-raw  5 host-install(5)              running
 test-armhf-armhf-libvirt     14 guest-start                  running
 test-armhf-armhf-libvirt-raw  4 syslog-server                running
 test-armhf-armhf-libvirt      4 syslog-server                running

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 152332

version targeted for testing:
 linux                e0756cfc7d7cd08c98a53b6009c091a3f6a50be6
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  193 days
Failing since        152366  2020-08-01 20:49:34 Z  192 days  338 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
4560 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   preparing
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           queued  
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             preparing
 test-amd64-amd64-xl                                          preparing
 test-amd64-coresched-amd64-xl                                preparing
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  preparing
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-amd64-examine                                     running 
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-dom0pvh-xl-intel                            preparing
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     running 
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-libvirt-raw                                 running 
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 preparing
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

broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-examine queued
broken-job test-amd64-coresched-i386-xl queued
broken-job build-i386-libvirt queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued

Not pushing.

(No revision log; it would be 1029181 lines long.)

