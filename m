Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BC41B6CB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198395.351869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVIJI-0001mW-FP; Tue, 28 Sep 2021 18:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198395.351869; Tue, 28 Sep 2021 18:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVIJI-0001kP-An; Tue, 28 Sep 2021 18:58:36 +0000
Received: by outflank-mailman (input) for mailman id 198395;
 Tue, 28 Sep 2021 18:58:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVIJH-0001kF-4X; Tue, 28 Sep 2021 18:58:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVIJG-0006gY-Rr; Tue, 28 Sep 2021 18:58:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVIJG-0007Vp-Gi; Tue, 28 Sep 2021 18:58:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVIJG-0006cb-GF; Tue, 28 Sep 2021 18:58:34 +0000
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
	bh=TndT9+KRAnnNMqSlHDSgldgYJE9AKAiwicstxOEFADU=; b=GIWbb44pAqzciu13vuJ3UUSDoD
	z6tICke9xqPLAXr1jtNDYjnjW34JMtE3UGyhjvquV3oNu3robeenB6/6nxM9dVQug41y92S05XaDh
	ksYNvcEGDYzen5IugHJAvLa+Iqw++PbIVJ7aSLeIs9RbZscE1hP8m3Cgon7VE8FD+zeA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165243-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165243: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9c3b9800e2019c93ab22da69e4a0b22d6fb059ec
X-Osstest-Versions-That:
    xen=890ceb9453171c85e881103e65dbb5cdcf81659e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Sep 2021 18:58:34 +0000

flight 165243 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165243/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 165233

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9c3b9800e2019c93ab22da69e4a0b22d6fb059ec
baseline version:
 xen                  890ceb9453171c85e881103e65dbb5cdcf81659e

Last test of basis   165233  2021-09-28 12:00:26 Z    0 days
Testing same since   165243  2021-09-28 17:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
commit 9c3b9800e2019c93ab22da69e4a0b22d6fb059ec
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Tue Sep 28 16:04:50 2021 +0200

    pci: fix handling of PCI bridges with subordinate bus number 0xff
    
    Bus number 0xff is valid according to the PCI spec. Using u8 typed sub_bus
    and assigning 0xff to it will result in the following loop getting stuck.
    
        for ( ; sec_bus <= sub_bus; sec_bus++ ) {...}
    
    Just change its type to unsigned int similarly to what is already done in
    dmar_scope_add_buses().
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 1578322ac6bc4d66800a5a3caf6685f556b64054
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Sep 28 16:03:38 2021 +0200

    x86/PVH: actually show Dom0's register state from debug key '0'
    
    vcpu_show_registers() didn't do anything for HVM so far. Note though
    that some extra hackery is needed for VMX - see the code comment.
    
    Note further that the show_guest_stack() invocation is left alone here:
    While strictly speaking guest_kernel_mode() should be predicated by a
    PV / !HVM check, show_guest_stack() itself will bail immediately for
    HVM.
    
    While there and despite not being PVH-specific, take the opportunity and
    filter offline vCPU-s: There's not really any register state associated
    with them, so avoid spamming the log with useless information while
    still leaving an indication of the fact.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

