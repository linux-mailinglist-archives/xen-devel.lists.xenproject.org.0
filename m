Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50F82D8A6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667340.1038512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLb8-00020W-M9; Mon, 15 Jan 2024 11:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667340.1038512; Mon, 15 Jan 2024 11:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLb8-0001yV-J4; Mon, 15 Jan 2024 11:57:46 +0000
Received: by outflank-mailman (input) for mailman id 667340;
 Mon, 15 Jan 2024 11:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPLb6-0001ww-GW; Mon, 15 Jan 2024 11:57:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPLb6-0001gQ-Dy; Mon, 15 Jan 2024 11:57:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPLb6-0003YH-2Q; Mon, 15 Jan 2024 11:57:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPLb6-0006AT-1t; Mon, 15 Jan 2024 11:57:44 +0000
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
	bh=HM9zt32UxGZV+1sXOczYfxCxTQdep2YQ/tRA5P683nw=; b=Ln7DmG1gROGj891GjBkzsJFbPS
	KO/V95+YDhHTy0esVAxtB1jp1TItQGLplGPw6CksU00XYw4FYs1kq1EKk3MqJTccec3O/DuwmDG+C
	+GEYF01adUK1u7d4UbxS/sykgnVmsukJwQ2Yv/sHBAmg4RiNDlNDX0hLB9okvMKemQkI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184352-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184352: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d65b183f92446a3a2855c1c7dd4a7a1b760af381
X-Osstest-Versions-That:
    ovmf=6a01fb2ea5b3b142a98f3649b0947268f038f389
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 11:57:44 +0000

flight 184352 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184352/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d65b183f92446a3a2855c1c7dd4a7a1b760af381
baseline version:
 ovmf                 6a01fb2ea5b3b142a98f3649b0947268f038f389

Last test of basis   184350  2024-01-15 07:12:42 Z    0 days
Testing same since   184352  2024-01-15 09:42:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   6a01fb2ea5..d65b183f92  d65b183f92446a3a2855c1c7dd4a7a1b760af381 -> xen-tested-master

