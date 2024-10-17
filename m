Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93BC9A20B5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 13:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820523.1234020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1OOy-0001vx-Vv; Thu, 17 Oct 2024 11:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820523.1234020; Thu, 17 Oct 2024 11:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1OOy-0001ts-Sw; Thu, 17 Oct 2024 11:10:44 +0000
Received: by outflank-mailman (input) for mailman id 820523;
 Thu, 17 Oct 2024 11:10:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1OOx-0001ti-UB; Thu, 17 Oct 2024 11:10:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1OOx-0000mw-T6; Thu, 17 Oct 2024 11:10:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1OOx-000603-LR; Thu, 17 Oct 2024 11:10:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1OOx-0005o6-Kq; Thu, 17 Oct 2024 11:10:43 +0000
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
	bh=EA5/BfT8Zqth7bglvoWx6DmDonG6x/ecgA02J8LhBR8=; b=q1+FGiyiY7a1kiHdROOTeit9vs
	5R/73/X0eUFh7BZL49e+P0B0eFdlVf1LIYH4zIhQJ+w9onTtv8w9NGji+ZLQZRwS90FqrUEyKwntX
	IJaMdWn9gBs1vDxJmoGlPrttEStn0VaWh7kmTE5IATdUJTqGZIgY7cLt6eJrrsIZHj4c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188156-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188156: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:build-i386-pvops:kernel-build:fail:regression
X-Osstest-Versions-This:
    ovmf=79598f34fa024ad2491b46b95c3189c5a7f159d2
X-Osstest-Versions-That:
    ovmf=e19cc32bce466fb1c175f7d44708c2ebb45802a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Oct 2024 11:10:43 +0000

flight 188156 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188156/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 188152
 build-i386-pvops              6 kernel-build             fail REGR. vs. 188152

version targeted for testing:
 ovmf                 79598f34fa024ad2491b46b95c3189c5a7f159d2
baseline version:
 ovmf                 e19cc32bce466fb1c175f7d44708c2ebb45802a7

Last test of basis   188152  2024-10-17 07:11:33 Z    0 days
Testing same since   188156  2024-10-17 09:14:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>
  Kun Qin <kuqin@microsoft.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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
commit 79598f34fa024ad2491b46b95c3189c5a7f159d2
Author: Kun Qin <kuqin12@gmail.com>
Date:   Wed Aug 10 22:56:34 2022 -0700

    MdeModulePkg: PeiMain: Updated dispatcher for delayed dispatch
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    This change adds a check for PEI dispatcher to continue dispatching when
    there are still pending delayed dispatch requests, to be compatible with
    newly integrated Delayed Dispatcher PPI interface.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    
    Co-authored-by: John Schock <joschock@microsoft.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

commit d64d1e195ceb003c824786bfd817227c7ae81f06
Author: Kun Qin <kuqin@microsoft.com>
Date:   Thu Sep 19 14:11:37 2024 -0700

    MdeModulePkg: PeiMain: Introduce implementation of delayed dispatch
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    This change adds the implementation that fits the needs and description
    of PI spec defined Delayed Dispatch PPI in Pei Core.
    
    The PPI would allow minimal delay for registered callbacks. As well as
    allowing other functions to wait for GUIDed delayed dispatch callbacks.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    
    Co-authored-by: Mike Turner <mikeyt@pobox.com>
    Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

commit b3f36e151d8b014cac5c6a833e2270c14d998739
Author: Kun Qin <kuqin@microsoft.com>
Date:   Thu Sep 19 14:09:03 2024 -0700

    MdePkg: Update Delayed Dispatch PPI as per PI 1.8 A Spec
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
    
    PI spec defined the `Register` function input argument `Delay` as output.
    However, this parameter should be used to define the minmal time delay
    the callback should fire. Thus it should be an input parameter.
    
    This change fixed the argument type.
    
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    
    Co-authored-by: Mike Turner <mikeyt@pobox.com>
    Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
    Signed-off-by: Kun Qin <kuqin12@gmail.com>

