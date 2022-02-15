Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0B4B7006
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273378.468543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0OK-0001pb-NZ; Tue, 15 Feb 2022 16:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273378.468543; Tue, 15 Feb 2022 16:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0OK-0001nJ-KL; Tue, 15 Feb 2022 16:09:24 +0000
Received: by outflank-mailman (input) for mailman id 273378;
 Tue, 15 Feb 2022 16:09:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nK0OJ-0001mt-5D; Tue, 15 Feb 2022 16:09:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nK0OJ-0005Bn-2d; Tue, 15 Feb 2022 16:09:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nK0OI-0007Li-Gm; Tue, 15 Feb 2022 16:09:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nK0OI-0003dg-Fu; Tue, 15 Feb 2022 16:09:22 +0000
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
	bh=AC3Ze8mf98BvSZkva9eN0UymUnZ3yBmmMzEaHGRMyV0=; b=42859O3LFNUutvMnOzEMBqRLQF
	fHkGVctt/hejMGBbPM4238NuYMWdSnvpDUGfIPFXwRyV4rIFSXraT1yKxrUWNdYua4uN42+TgQ4t0
	bTuWHm9VQjOUJLVYzd6bCrchiHbTuA5h/bU22NTIIWTFhSiVRI4q/ZIvmPQ25tR1SJyI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168119-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168119: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=85589ddbf6f8c6dc75f73aa32e484e3cfd439e7a
X-Osstest-Versions-That:
    ovmf=1193aa2dfbbd11fa7191d000a0cc166d03a249d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Feb 2022 16:09:22 +0000

flight 168119 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168119/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 85589ddbf6f8c6dc75f73aa32e484e3cfd439e7a
baseline version:
 ovmf                 1193aa2dfbbd11fa7191d000a0cc166d03a249d2

Last test of basis   168115  2022-02-15 02:41:41 Z    0 days
Testing same since   168119  2022-02-15 10:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <quic_rcran@quicinc.com>

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
   1193aa2dfb..85589ddbf6  85589ddbf6f8c6dc75f73aa32e484e3cfd439e7a -> xen-tested-master

