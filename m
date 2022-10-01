Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F75F1A43
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 08:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414486.658790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeVjZ-0003uO-KH; Sat, 01 Oct 2022 06:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414486.658790; Sat, 01 Oct 2022 06:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeVjZ-0003rF-HP; Sat, 01 Oct 2022 06:12:21 +0000
Received: by outflank-mailman (input) for mailman id 414486;
 Sat, 01 Oct 2022 06:12:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeVjX-0003r5-Io; Sat, 01 Oct 2022 06:12:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeVjX-0007VO-0b; Sat, 01 Oct 2022 06:12:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeVjW-00055f-Gr; Sat, 01 Oct 2022 06:12:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeVjW-00081C-GQ; Sat, 01 Oct 2022 06:12:18 +0000
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
	bh=V8qS6Bc0iaIXVSe+pRBoquJ6dng5Z5KbAnSVAOZ0tA8=; b=GLNLY/v/C2Y6fVklrP8FgqBgwO
	Ga8CV9cTv3WO/Cy8QEvmJzoS33Jw9PGH9cLtH68jm4iMkVqqSQjdXHDLL/KNp6zkDCYCngy4JmkQ+
	o1UqT71nBUkA5fvSF2PIezYwUN7cmDfBIsWRDe4Ua5velLI0Ea+qbr3yPgY1n8P6h7B4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173390-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173390: trouble: blocked/broken/pass
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
Date: Sat, 01 Oct 2022 06:12:18 +0000

flight 173390 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173390/

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
Testing same since   173386  2022-09-30 12:10:28 Z    0 days    2 attempts

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

