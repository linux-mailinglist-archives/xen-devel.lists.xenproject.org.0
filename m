Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8DE78A660
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 09:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591379.923766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaWYa-0007JF-27; Mon, 28 Aug 2023 07:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591379.923766; Mon, 28 Aug 2023 07:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaWYZ-0007HW-VK; Mon, 28 Aug 2023 07:21:03 +0000
Received: by outflank-mailman (input) for mailman id 591379;
 Mon, 28 Aug 2023 07:21:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaWYY-0007HL-1A; Mon, 28 Aug 2023 07:21:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaWYX-0001ep-Nk; Mon, 28 Aug 2023 07:21:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaWYX-0006wY-8I; Mon, 28 Aug 2023 07:21:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qaWYX-0005n0-7k; Mon, 28 Aug 2023 07:21:01 +0000
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
	bh=dMPDTWA3/W1uShJYK2683nUo5o9ub/7lqNH70BO++Gc=; b=Ovte5LRDC9SdDiuqIkKjl81Xj8
	LFYdw8Cx+4xqKtX4X/7WeGcthwk/EhGi+RwBkcqWj2iDi+AbVuqLFpjZI8+P+8KCrTZi7UR3xiwpA
	XFAhGwi3ycLMxJIy1fjjjoxv9jOnl/Tm94KNW3KGaMVVGyojbKwAB0tDQq+I7/1kbVpY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182534-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182534: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64:xen-build:fail:regression
    ovmf:build-amd64-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=92006e5804a4adff05556a97a951fd7766a1d79f
X-Osstest-Versions-That:
    ovmf=819cfc6b42a68790a23509e4fcc58ceb70e1965e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Aug 2023 07:21:01 +0000

flight 182534 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182534/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 182513

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 92006e5804a4adff05556a97a951fd7766a1d79f
baseline version:
 ovmf                 819cfc6b42a68790a23509e4fcc58ceb70e1965e

Last test of basis   182513  2023-08-25 01:57:27 Z    3 days
Testing same since   182534  2023-08-28 06:40:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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
commit 92006e5804a4adff05556a97a951fd7766a1d79f
Author: KasimX Liu <kasimx.liu@intel.com>
Date:   Fri Aug 25 12:02:50 2023 +0800

    UefiPayloadPkg:Enhance the build processing for Universalpayload
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4532
    
    To Copy the PrebuildUplBinary to Build folder then add/replace Fvs.
    
    Cc: Guo Dong <guo.dong@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Reviewed-by: James Lu <james.lu@intel.com>
    Reviewed-by: Gua Guo <gua.guo@intel.com>
    Signed-off-by: KasimX Liu <kasimx.liu@intel.com>

