Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227079E5C7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601211.937166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNj8-0004Ai-Kk; Wed, 13 Sep 2023 11:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601211.937166; Wed, 13 Sep 2023 11:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNj8-00048Y-Hz; Wed, 13 Sep 2023 11:08:10 +0000
Received: by outflank-mailman (input) for mailman id 601211;
 Wed, 13 Sep 2023 11:08:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgNj7-00048O-MZ; Wed, 13 Sep 2023 11:08:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgNj7-0003nN-KV; Wed, 13 Sep 2023 11:08:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgNj7-0005so-9G; Wed, 13 Sep 2023 11:08:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qgNj7-0008RE-8s; Wed, 13 Sep 2023 11:08:09 +0000
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
	bh=dioXlvd0yIqTwalwoBfIq4rHxhHn9WjROxpBMra8wwg=; b=26tWFSPOTbgDWuBzNvl4/Hzr2N
	fOG8vEdGFbWqsWt6LcpP20we3xEiWukPCQx/ifKx2dtWKn8xmyxoKF1Td1hEG1fDEz0XV3gcyULif
	UPehoQNJmb+0Y3IMiE8vX/YRL8LlVtEOQbQpci8S9km28E7gkyb6B2T7CgUgwA8JXrDw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182993-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182993: trouble: blocked/broken/pass
X-Osstest-Failures:
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=cdfe4310dda2a30b0ca05c8ede6896edce37a656
X-Osstest-Versions-That:
    ovmf=b844b106e2a20c709ece1b2b89b2ae0e84a0e401
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Sep 2023 11:08:09 +0000

flight 182993 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182993/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 182988
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 182988
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 182988

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 cdfe4310dda2a30b0ca05c8ede6896edce37a656
baseline version:
 ovmf                 b844b106e2a20c709ece1b2b89b2ae0e84a0e401

Last test of basis   182988  2023-09-13 02:42:26 Z    0 days
Failing since        182990  2023-09-13 06:12:22 Z    0 days    2 attempts
Testing same since   182993  2023-09-13 08:10:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Liu <linus.liu@intel.com>
  Nickle Wang <nicklew@nvidia.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
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

broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit cdfe4310dda2a30b0ca05c8ede6896edce37a656
Author: Linus Liu <linus.liu@intel.com>
Date:   Tue Sep 12 09:41:59 2023 +0800

    Pyrite support - Secure erase is only available if encryption is supported.
    
    https://bugzilla.tianocore.org/show_bug.cgi?id=3004
    
    Cc: Qi Zhang    <qi1.zhang@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Jiewen Yao  <jiewen.yao@intel.com>
    Cc: Tina Chen   <tina.chen@intel.com>
    Cc: Xiao X Chen <xiao.x.chen@intel.com>
    Signed-off-by: Linus Liu <linus.liu@intel.com>
    Reviewed-by: Jiewen Yao  <jiewen.yao@intel.com>

commit 4a1afea6f7361fd65e9d4ba34eaac48ec8bb2867
Author: Nickle Wang <nicklew@nvidia.com>
Date:   Fri Jul 21 21:39:10 2023 +0800

    RedfishPkg/RedfishPlatformConfigDxe: fix can not set one-of option issue.
    
    StatementValue->Buffer is converted from ASCII to Unicode by caller
    already so we don't have to convert it again.
    
    Signed-off-by: Nickle Wang <nicklew@nvidia.com>
    Cc: Abner Chang <abner.chang@amd.com>
    Cc: Igor Kulchytskyy <igork@ami.com>
    Cc: Nick Ramirez <nramirez@nvidia.com>
    Reviewed-by: Igor Kulchytskyy <igork@ami.com>

