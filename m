Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C580A5F1692
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 01:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414464.658758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oePFF-0005bL-Di; Fri, 30 Sep 2022 23:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414464.658758; Fri, 30 Sep 2022 23:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oePFF-0005ZW-Ai; Fri, 30 Sep 2022 23:16:37 +0000
Received: by outflank-mailman (input) for mailman id 414464;
 Fri, 30 Sep 2022 23:16:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oePFD-0005ZM-FR; Fri, 30 Sep 2022 23:16:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oePFD-00046F-Df; Fri, 30 Sep 2022 23:16:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oePFC-0005Z0-T1; Fri, 30 Sep 2022 23:16:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oePFC-0007dF-SZ; Fri, 30 Sep 2022 23:16:34 +0000
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
	bh=v9BgQgSMN4bp+gB1dFqg0ZqypuJU3SbqIs4UeiieeeA=; b=Fgae6w0LCJcaJkq4zKP2ZRNLd6
	Cos4oZj2OF9Njxt1WGvnNR2YN6+UR4FkGENnjnokTk1KGZdw5kaukuQwRMl0N1OU3WgAcaLttw9v1
	tWxLKHLstYJywV4ue82mlLRdQHDFdRhc+f+eHGSYwpDsrnKaMn8+9yhDpVW2AY08Edt4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173386-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173386: trouble: blocked/broken/pass
X-Osstest-Failures:
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
X-Osstest-Versions-That:
    ovmf=b7213bbd59833fb0786c83a28df5f8244602ab5e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Sep 2022 23:16:34 +0000

flight 173386 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173386/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 173356
 build-i386                    4 host-install(4)        broken REGR. vs. 173356
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 173356

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
baseline version:
 ovmf                 b7213bbd59833fb0786c83a28df5f8244602ab5e

Last test of basis   173356  2022-09-28 14:40:29 Z    2 days
Testing same since   173386  2022-09-30 12:10:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rodrigo Gonzalez Del Cueto <rodrigo.gonzalez.del.cueto@intel.com>

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
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
Author: Rodrigo Gonzalez Del Cueto <rodrigo.gonzalez.del.cueto@intel.com>
Date:   Thu Sep 22 15:35:36 2022 +0800

    SecurityPkg: Remove enforcement of final GoIdle transition for CRB commands
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4077
    
    Following the design described in the TCG specification,
    the driver implementation of the CRB protocol does not require
    enforcing completing the transition to goIdle at the end of a command
    sequence.
    
    Signed-off-by: Rodrigo Gonzalez Del Cueto <rodrigo.gonzalez.del.cueto@intel.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Reviewed-by: Jian J Wang <jian.j.wang@intel.com>

