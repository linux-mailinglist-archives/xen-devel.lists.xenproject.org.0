Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C81E817B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegjZ-0005Vr-Ki; Fri, 29 May 2020 15:15:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8V9=7L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jegjY-0005Vm-Ku
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:15:44 +0000
X-Inumbo-ID: 43f7f00e-a1bf-11ea-a8d7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43f7f00e-a1bf-11ea-a8d7-12813bfff9fa;
 Fri, 29 May 2020 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqJUOWekooLGXjl/U07AAEWFuOE+8xFrYmWELYmNq4U=; b=EIFxklwrsBL3TWNQEZEtnGhM4
 o1cOUibVBqFtmlP0ByEAgXwRUfPFsg4OQN7ehrelryCfNdghAS+G+XgsGMmNPCbO3HmXs7BiCLedq
 1ekZjwPnPpfiHaadlc/eospUZD1fEDEU0bPRvFmiXhSibV+jwGn8ejlgjKLIopKOfk+U0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jegjX-0007kq-M2; Fri, 29 May 2020 15:15:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jegjX-0007VM-Bf; Fri, 29 May 2020 15:15:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jegjX-00018Q-B2; Fri, 29 May 2020 15:15:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150488-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150488: regressions - trouble: blocked/fail
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=9b9a83e43598b231111487378d6037fa8fa473d5
X-Osstest-Versions-That: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 May 2020 15:15:43 +0000
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

flight 150488 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150488/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 150438
 build-amd64                   6 xen-build                fail REGR. vs. 150438
 build-armhf                   6 xen-build                fail REGR. vs. 150438

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  9b9a83e43598b231111487378d6037fa8fa473d5
baseline version:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199

Last test of basis   150438  2020-05-28 14:01:19 Z    1 days
Failing since        150465  2020-05-29 09:02:14 Z    0 days    5 attempts
Testing same since   150472  2020-05-29 11:01:58 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
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
commit 9b9a83e43598b231111487378d6037fa8fa473d5
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:22:50 2020 +0200

    SUPPORT.md: add hypervisor file system
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 7f8d2dc29ea5a51f88ec253be93970768ec9fac2
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:22:42 2020 +0200

    CHANGELOG: add hypervisor file system support
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 02e9a9cf20950e78c816987415ed920d72444f94
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:20:31 2020 +0200

    xen: remove XEN_SYSCTL_set_parameter support
    
    The functionality of XEN_SYSCTL_set_parameter is available via hypfs
    now, so it can be removed.
    
    This allows to remove the kernel_param structure for runtime parameters
    by putting the now only used structure element into the hypfs node
    structure of the runtime parameters.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a2486890689713116351e5bbfb8f104c797479cc
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:20:16 2020 +0200

    tools/libxc: remove xc_set_parameters()
    
    There is no user of xc_set_parameters() left, so remove it.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 2ea4b9829cf95b59f75f0c70543f2368d702305e
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:20:08 2020 +0200

    tools/libxl: use libxenhypfs for setting xen runtime parameters
    
    Instead of xc_set_parameters() use xenhypfs_write() for setting
    parameters of the hypervisor.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit a659d7cab9afcba337cb60225738fd85ff7aa3da
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:18:36 2020 +0200

    xen: add runtime parameter access support to hypfs
    
    Add support to read and modify values of hypervisor runtime parameters
    via the hypervisor file system.
    
    As runtime parameters can be modified via a sysctl, too, this path has
    to take the hypfs rw_lock as writer.
    
    For custom runtime parameters the connection between the parameter
    value and the file system is done via an init function which will set
    the initial value (if needed) and the leaf properties.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 58263ed7713e8132c2bc00bc870399ea31bf2231
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:15:54 2020 +0200

    xen: add /buildinfo/config entry to hypervisor filesystem
    
    Add the /buildinfo/config entry to the hypervisor filesystem. This
    entry contains the .config file used to build the hypervisor.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b5d4711d2b17753498a3f587585f11bf9ca5af85
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:14:51 2020 +0200

    xen: provide version information in hypfs
    
    Provide version and compile information in /buildinfo/ node of the
    Xen hypervisor file system. As this information is accessible by dom0
    only no additional security problem arises.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 048f82ccd1b3dda511af25a7a8524c8ba5ca2786
Author: Juergen Gross <jgross@suse.com>
Date:   Fri May 29 12:14:24 2020 +0200

    xen/hypfs: make struct hypfs_entry_leaf initializers work with gcc 4.1
    
    gcc 4.1 has problems with static initializers for anonymous unions.
    Fix this by naming the union in struct hypfs_entry_leaf.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Jan Beulich <jbeulich@suse.com>

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

