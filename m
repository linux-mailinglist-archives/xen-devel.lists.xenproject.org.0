Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3108447CF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 20:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674158.1048930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVFyy-0007yG-H0; Wed, 31 Jan 2024 19:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674158.1048930; Wed, 31 Jan 2024 19:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVFyy-0007wZ-DE; Wed, 31 Jan 2024 19:10:48 +0000
Received: by outflank-mailman (input) for mailman id 674158;
 Wed, 31 Jan 2024 19:10:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVFyx-0007tD-7R; Wed, 31 Jan 2024 19:10:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVFyw-0005EJ-Uw; Wed, 31 Jan 2024 19:10:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVFyw-0002XZ-H6; Wed, 31 Jan 2024 19:10:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rVFyw-0006Bg-GV; Wed, 31 Jan 2024 19:10:46 +0000
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
	bh=vs70z+xHza0bVDoq9JJ75yFSkiG4y3T3D/TsHsBjAxw=; b=t2rYARS7wQMJ6MYAslecoNX/uQ
	nIMPtYnEU5/5Y9TP9jTajXxlUlhZhLwVLxbrQ9VkEvC/5ab4YsJEKUrI4LIt2R/FOBDqqCpDu+lDK
	nDPHcZM4W1uwG0M4NQiWFKGYFAptUv9eE+bvVap0qeAJ6fXe86d40MvO94qNPXsQWgWg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184542-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184542: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=97c3f5b8d27230acfc20f479adea64c348750612
X-Osstest-Versions-That:
    ovmf=40a45b5a2be3bf886ff481d4b538d20624d02589
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jan 2024 19:10:46 +0000

flight 184542 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184542/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 97c3f5b8d27230acfc20f479adea64c348750612
baseline version:
 ovmf                 40a45b5a2be3bf886ff481d4b538d20624d02589

Last test of basis   184540  2024-01-31 11:12:46 Z    0 days
Testing same since   184542  2024-01-31 13:12:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Min Xu <min.m.xu@intel.com>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   40a45b5a2b..97c3f5b8d2  97c3f5b8d27230acfc20f479adea64c348750612 -> xen-tested-master

