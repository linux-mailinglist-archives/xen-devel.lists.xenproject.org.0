Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A8807B47
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 23:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649447.1014010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB0Gi-0004T8-0n; Wed, 06 Dec 2023 22:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649447.1014010; Wed, 06 Dec 2023 22:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB0Gh-0004Qb-UD; Wed, 06 Dec 2023 22:21:23 +0000
Received: by outflank-mailman (input) for mailman id 649447;
 Wed, 06 Dec 2023 22:21:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB0Gg-0004QR-63; Wed, 06 Dec 2023 22:21:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB0Gf-0003Gp-OA; Wed, 06 Dec 2023 22:21:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB0Gf-00070O-ET; Wed, 06 Dec 2023 22:21:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rB0Gf-0004nx-Dt; Wed, 06 Dec 2023 22:21:21 +0000
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
	bh=Q05H6IX7OsAXXyoEbowLbiSYGQpfyi+263kyZWJYAP4=; b=SBfxCrNR127zjhKevBpbvl5PTj
	VTuV1mQcukTH4aPp7lngHOp6m0k5vx8cBcCYNKLJociJn3lcFzOk1SzaE6zCT0ghpLh7semmdiuPK
	Dg8xBxIUfr2+n7TF4GXRdZ3/Ct5cjFKPxl3diPkEcj1WO/vI8GVLJKYNtcMJOI45dank=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184014-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184014: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b59ab98049f20f826ff5302a498a435cbb3b3753
X-Osstest-Versions-That:
    ovmf=7e18c9a788e543ab71cdc0485989cf5d00cdccc2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Dec 2023 22:21:21 +0000

flight 184014 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184014/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b59ab98049f20f826ff5302a498a435cbb3b3753
baseline version:
 ovmf                 7e18c9a788e543ab71cdc0485989cf5d00cdccc2

Last test of basis   184004  2023-12-06 05:41:03 Z    0 days
Testing same since   184014  2023-12-06 17:11:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jake Garver <jake@nvidia.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   7e18c9a788..b59ab98049  b59ab98049f20f826ff5302a498a435cbb3b3753 -> xen-tested-master

