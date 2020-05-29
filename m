Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8991E7B13
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecin-0002o4-IZ; Fri, 29 May 2020 10:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8V9=7L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jecil-0002nl-Kd
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:58:39 +0000
X-Inumbo-ID: 5915dc05-a19b-11ea-a893-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5915dc05-a19b-11ea-a893-12813bfff9fa;
 Fri, 29 May 2020 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hl45pFbQ3P44WJMsszGWIcznPc3UF0jNLfslXg/Lpk=; b=Uqsqy8eN+H8xRvJbNtiP9wyZq
 EkVtI4fZrt8jgWoGYf88fLVIAU88MmLRBnGjMNXzrdbgMz4Yassg4oo06Mxz5M22FGfvyBFYH3DRx
 e3pmuAwfQ5HaA0nytSArVk7zQr4tPZMe4Cy1LwuejnHQO9XdXq/5HcJPR6v4hAQg6/Hbk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jecij-0001gc-P8; Fri, 29 May 2020 10:58:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jecig-0003eV-N8; Fri, 29 May 2020 10:58:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jecig-00008u-MU; Fri, 29 May 2020 10:58:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150469-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150469: regressions - trouble: blocked/fail
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
X-Osstest-Versions-That: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 May 2020 10:58:34 +0000
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

flight 150469 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150469/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 150438
 build-amd64                   6 xen-build                fail REGR. vs. 150438
 build-armhf                   6 xen-build                fail REGR. vs. 150438

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
baseline version:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199

Last test of basis   150438  2020-05-28 14:01:19 Z    0 days
Testing same since   150465  2020-05-29 09:02:14 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 10:20:32 2020 +0200

    tools: add xenfs tool
    
    Add the xenfs tool for accessing the hypervisor filesystem.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 86234eafb95295621aef6c618e4c22c10d8e4138
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 10:20:21 2020 +0200

    libs: add libxenhypfs
    
    Add the new library libxenhypfs for access to the hypervisor filesystem.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 5b5ccafb0c425b85a60fd4f241d5f6951d0e4928
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 10:15:50 2020 +0200

    xen: add basic hypervisor filesystem support
    
    Add the infrastructure for the hypervisor filesystem.
    
    This includes the hypercall interface and the base functions for
    entry creation, deletion and modification.
    
    In order not to have to repeat the same pattern multiple times in case
    adding a new node should BUG_ON() failure, the helpers for adding a
    node (hypfs_add_dir() and hypfs_add_leaf()) get a nofault parameter
    causing the BUG() in case of a failure.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 0e9dcd0159c671608e154da5b8b7e0edd2905067
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 10:15:35 2020 +0200

    docs: add feature document for Xen hypervisor sysfs-like support
    
    On the 2019 Xen developer summit there was agreement that the Xen
    hypervisor should gain support for a hierarchical name-value store
    similar to the Linux kernel's sysfs.
    
    In the beginning there should only be basic support: entries can be
    added from the hypervisor itself only, there is a simple hypercall
    interface to read the data.
    
    Add a feature document for setting the base of a discussion regarding
    the desired functionality and the entries to add.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit c48a9956e334a5dd99e846d04ad56185b07aab64
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 10:15:08 2020 +0200

    xen: add a generic way to include binary files as variables
    
    Add a new script xen/tools/binfile for including a binary file at build
    time being usable via a pointer and a size variable in the hypervisor.
    
    Make use of that generic tool in xsm.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wl@xen.org>
(qemu changes not included)

