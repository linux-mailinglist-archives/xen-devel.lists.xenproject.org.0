Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C098A904EE0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739029.1145937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK2m-0002fu-Q8; Wed, 12 Jun 2024 09:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739029.1145937; Wed, 12 Jun 2024 09:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHK2m-0002eX-MV; Wed, 12 Jun 2024 09:13:24 +0000
Received: by outflank-mailman (input) for mailman id 739029;
 Wed, 12 Jun 2024 09:13:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHK2k-0002eJ-QD; Wed, 12 Jun 2024 09:13:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHK2k-0002Eb-Nw; Wed, 12 Jun 2024 09:13:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sHK2k-00037R-FC; Wed, 12 Jun 2024 09:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sHK2k-00026u-Eh; Wed, 12 Jun 2024 09:13:22 +0000
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
	bh=wjFo24sGLG7XqYxVJbBXGPrViQKhlFRORRtUQyVwVFQ=; b=k3Xu/nPjrbdmew8A9ESdaMOz8A
	JnLs/2wNkOLIy0k7MejM4H6b6dJFNhwji3W2ExK8tv9gIUfgMDHNiuimkLtvMJ/MSJHnGp/xPAVa4
	xEnqSWd+MtWLUPKwQ4wobICUHm+OKk7d8mdPXLfY/YVBefPH1c1eEkevQ6I9+FB55I4U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186318-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186318: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d3b32dca06b987d7214637f3952c2ce1ce69f308
X-Osstest-Versions-That:
    ovmf=0982da4f50279bfb2be479f97821b86feb87c336
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Jun 2024 09:13:22 +0000

flight 186318 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186318/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d3b32dca06b987d7214637f3952c2ce1ce69f308
baseline version:
 ovmf                 0982da4f50279bfb2be479f97821b86feb87c336

Last test of basis   186309  2024-06-11 09:43:10 Z    0 days
Testing same since   186318  2024-06-12 07:41:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   0982da4f50..d3b32dca06  d3b32dca06b987d7214637f3952c2ce1ce69f308 -> xen-tested-master

