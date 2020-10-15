Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2A28F356
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 15:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7378.19258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3Qa-0007o1-GN; Thu, 15 Oct 2020 13:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7378.19258; Thu, 15 Oct 2020 13:36:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3Qa-0007nb-CV; Thu, 15 Oct 2020 13:36:20 +0000
Received: by outflank-mailman (input) for mailman id 7378;
 Thu, 15 Oct 2020 13:36:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kT3QY-0007nW-MQ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:36:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cf2745e-ef59-4b97-8303-58daa586badd;
 Thu, 15 Oct 2020 13:36:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT3QV-00056r-KK; Thu, 15 Oct 2020 13:36:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT3QV-0002si-9M; Thu, 15 Oct 2020 13:36:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kT3QV-0002ZY-8u; Thu, 15 Oct 2020 13:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kT3QY-0007nW-MQ
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:36:18 +0000
X-Inumbo-ID: 4cf2745e-ef59-4b97-8303-58daa586badd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4cf2745e-ef59-4b97-8303-58daa586badd;
	Thu, 15 Oct 2020 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=77SdlHpMdodDk5fPOQUN99/yazcZY9MvnwmejtjT22E=; b=ydKv45Zh3opm8Ipwk9amJ8kS/s
	xmdTXlTp/PBoducB3fPjRobO8nYAlMveGTngDAWtRng6soVwMY3A/0xRGr4jnwZ8EtZvIVRqVOo3/
	Kd9nKnmS/5yJj+/k7KgqUd16KPLKNpKVl5uV1Ngcgzmw4WXCDeyey3wHe48miMhTcm3Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT3QV-00056r-KK; Thu, 15 Oct 2020 13:36:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT3QV-0002si-9M; Thu, 15 Oct 2020 13:36:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT3QV-0002ZY-8u; Thu, 15 Oct 2020 13:36:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155842-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155842: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a8a85f03c826bea045e345fa405f187049d63584
X-Osstest-Versions-That:
    xen=f776e5fb3ee699745f6442ec8c47d0fa647e0575
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 13:36:15 +0000

flight 155842 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155842/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 155828

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a8a85f03c826bea045e345fa405f187049d63584
baseline version:
 xen                  f776e5fb3ee699745f6442ec8c47d0fa647e0575

Last test of basis   155828  2020-10-15 03:00:27 Z    0 days
Testing same since   155842  2020-10-15 11:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen Yu <yu.c.chen@intel.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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

------------------------------------------------------------
commit a8a85f03c826bea045e345fa405f187049d63584
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 15 12:30:01 2020 +0200

    EFI: further "need_to_free" adjustments
    
    When processing "chain" directives, the previously loaded config file
    gets freed. This needs to be recorded accordingly such that no error
    path would try to free the same block of memory a 2nd time.
    
    Furthermore, neither .addr nor .size being zero has any meaning towards
    the need to free an allocated chunk anymore. Drop (from read_file()) and
    replace (in Arm's efi_arch_use_config_file(), to sensibly retain the
    comment) respective assignments.
    
    Fixes: 04be2c3a0678 ("efi/boot.c: add file.need_to_free")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 44ac57af81ff8097e228895738b911ca819bda19
Author: Chen Yu <yu.c.chen@intel.com>
Date:   Thu Oct 15 12:29:11 2020 +0200

    x86/mwait-idle: customize IceLake server support
    
    On ICX platform, the C1E auto-promotion is enabled by default.
    As a result, the CPU might fall into C1E more offen than previous
    platforms. So disable C1E auto-promotion and expose C1E as a separate
    idle state.
    
    Beside C1 and C1E, the exit latency of C6 was measured
    by a dedicated tool. However the exit latency(41us) exposed
    by _CST is much smaller than the one we measured(128us). This
    is probably due to the _CST uses the exit latency when woken
    up from PC0+C6, rather than PC6+C6 when C6 was measured. Choose
    the latter as we need the longest latency in theory.
    
    Signed-off-by: Chen Yu <yu.c.chen@intel.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    [Linux commit a472ad2bcea479ba068880125d7273fc95c14b70]
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

