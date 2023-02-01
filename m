Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC468690E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 15:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488313.756341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNEV1-0001zn-DN; Wed, 01 Feb 2023 14:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488313.756341; Wed, 01 Feb 2023 14:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNEV1-0001xq-AI; Wed, 01 Feb 2023 14:54:11 +0000
Received: by outflank-mailman (input) for mailman id 488313;
 Wed, 01 Feb 2023 14:54:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNEV0-0001xg-BT; Wed, 01 Feb 2023 14:54:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNEV0-0002Rc-6L; Wed, 01 Feb 2023 14:54:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNEUz-0008Cz-QQ; Wed, 01 Feb 2023 14:54:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNEUz-0004Rs-Py; Wed, 01 Feb 2023 14:54:09 +0000
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
	bh=eCBTHJEnLpdSiuvizkj+qa0kj93lJWJNvCa+i2maTYA=; b=iSEqwuJEutuFF7DqIWuuwYRoUP
	AgpdIrFVSUJFV0onMexep+d4rX7rJt80DgUYFxl18Om1TV1ADpuB7m6BShAKVaVwY1MVHJ7Bik4Wj
	7uisGtCKRGLIXXFt8QOMlThqKcxgMBuamvUyctFlIc6AYH2svD5sVq6GxxLtbhwTiGjI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176313-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 176313: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:build-armhf:syslog-server:running:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-armhf:capture-logs:broken:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=78e93e6e57c218eead498a664785f414bcb12460
X-Osstest-Versions-That:
    xen=10b80ee5588e8928b266dea02a5e99d098bd227a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Feb 2023 14:54:09 +0000

flight 176313 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176313/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 176151
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 build-armhf                   5 capture-logs          broken blocked in 176151
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  78e93e6e57c218eead498a664785f414bcb12460
baseline version:
 xen                  10b80ee5588e8928b266dea02a5e99d098bd227a

Last test of basis   176151  2023-01-26 14:00:29 Z    6 days
Testing same since   176283  2023-01-30 21:02:20 Z    1 days   17 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
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

broken-job build-armhf broken
broken-step build-armhf capture-logs
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 78e93e6e57c218eead498a664785f414bcb12460
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Wed Jan 25 11:21:31 2023 +0000

    xen/arm: Probe the load/entry point address of an uImage correctly
    
    Currently, kernel_uimage_probe() does not read the load/entry point address
    set in the uImge header. Thus, info->zimage.start is 0 (default value). This
    causes, kernel_zimage_place() to treat the binary (contained within uImage)
    as position independent executable. Thus, it loads it at an incorrect
    address.
    
    The correct approach would be to read "uimage.load" and set
    info->zimage.start. This will ensure that the binary is loaded at the
    correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
    address).
    
    If user provides load address (ie "uimage.load") as 0x0, then the image is
    treated as position independent executable. Xen can load such an image at
    any address it considers appropriate. A position independent executable
    cannot have a fixed entry point address.
    
    This behavior is applicable for both arm32 and arm64 platforms.
    
    Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
    point address set in the uImage header. With this commit, Xen will use them.
    This makes the behavior of Xen consistent with uboot for uimage headers.
    
    Users who want to use Xen with statically partitioned domains, can provide
    non zero load address and entry address for the dom0/domU kernel. It is
    required that the load and entry address provided must be within the memory
    region allocated by Xen.
    
    A deviation from uboot behaviour is that we consider load address == 0x0,
    to denote that the image supports position independent execution. This
    is to make the behavior consistent across uImage and zImage.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    [stefano: minor doc improvement]
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

