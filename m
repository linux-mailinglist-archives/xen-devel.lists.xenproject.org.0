Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D01316500
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83545.155720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nXU-0000dO-17; Wed, 10 Feb 2021 11:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83545.155720; Wed, 10 Feb 2021 11:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nXT-0000cz-TZ; Wed, 10 Feb 2021 11:20:07 +0000
Received: by outflank-mailman (input) for mailman id 83545;
 Wed, 10 Feb 2021 11:20:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nXT-0000cr-3r; Wed, 10 Feb 2021 11:20:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nXS-0007si-V1; Wed, 10 Feb 2021 11:20:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nXS-0000Zk-Nj; Wed, 10 Feb 2021 11:20:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9nXS-0006hA-ND; Wed, 10 Feb 2021 11:20:06 +0000
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
	bh=71YP4xv8rXpBdzEhFKGa9CxxYvSHptc9ao32re4SfOk=; b=qGSGpZwRJsX8BAXCBnPhKCAVaX
	yi/ZllX0JKYgMJ7vtqz+zzCNK0roj5QZgBBWET1jQHKkvq7AeULBcGsISgI2CCxxQ517WP7/fHT4p
	e1mKTFaAWyZ4YkZ5OwwXs843AShutzs+T14vdy5Sl4sFGKA8doDFBeVhzhUTqIox8L5E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159156-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 159156: regressions - trouble: broken/fail/pass/preparing/running
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-pygrub:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:regression
    xen-unstable:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-unstable:test-amd64-coresched-i386-xl:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-shadow:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:host-install(5):running:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:xen-install:running:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-ping-check-xen:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:windows-install:running:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:syslog-server:running:regression
    xen-unstable:test-amd64-amd64-i386-pvgrub:guest-localmigrate/x10:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:syslog-server:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:syslog-server:running:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:syslog-server:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:syslog-server:running:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:syslog-server:running:regression
    xen-unstable:test-amd64-amd64-i386-pvgrub:syslog-server:running:regression
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f18309eb06efd1db5a2ab9903a1c246b6299951a
X-Osstest-Versions-That:
    xen=ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 11:20:06 +0000

flight 159156 xen-unstable running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159156/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-coresched-amd64-xl  5 host-install(5)       broken REGR. vs. 159036
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken REGR. vs. 159036
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)   broken REGR. vs. 159036
 test-amd64-amd64-xl-pvshim    5 host-install(5)        broken REGR. vs. 159036
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 159036
 test-amd64-amd64-pygrub       5 host-install(5)        broken REGR. vs. 159036
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken REGR. vs. 159036
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 159036
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 159036
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 159036
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-coresched-i386-xl  3 hosts-allocate               running
 test-amd64-i386-xl            3 hosts-allocate               running
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate      running
 test-amd64-i386-xl-shadow     3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemut-debianhvm-amd64  5 host-install(5)            running
 test-amd64-amd64-libvirt-xsm  7 xen-install                  running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 host-ping-check-xen    running
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install running
 test-amd64-i386-xl-qemut-win7-amd64 12 windows-install              running
 test-amd64-amd64-libvirt-xsm  4 syslog-server                running
 test-amd64-amd64-i386-pvgrub 19 guest-localmigrate/x10       running
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  4 syslog-server  running
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 20 guest-start/debianhvm.repeat running
 test-amd64-i386-xl-qemut-debianhvm-amd64  4 syslog-server              running
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  4 syslog-server          running
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm  4 syslog-server  running
 test-amd64-i386-xl-qemut-win7-amd64  4 syslog-server                running
 test-amd64-amd64-i386-pvgrub  4 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 159036
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 159036
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 159036
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 159036
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 159036
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 159036
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f18309eb06efd1db5a2ab9903a1c246b6299951a
baseline version:
 xen                  ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7

Last test of basis   159036  2021-02-05 08:46:54 Z    5 days
Failing since        159077  2021-02-06 11:11:30 Z    3 days    3 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Michał Leszczyński <michal.leszczynski@cert.pl>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           preparing
 test-amd64-coresched-i386-xl                                 preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         running 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 running 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-libvirt-xsm                                 running 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     running 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          preparing
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          running 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          preparing
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         running 
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
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 running 
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              preparing
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    preparing
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-coresched-amd64-xl broken
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)

Not pushing.

(No revision log; it would be 350 lines long.)

