Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BE2945BAB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 12:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770904.1181498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZp4g-0005y6-8h; Fri, 02 Aug 2024 09:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770904.1181498; Fri, 02 Aug 2024 09:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZp4g-0005vq-5u; Fri, 02 Aug 2024 09:59:50 +0000
Received: by outflank-mailman (input) for mailman id 770904;
 Fri, 02 Aug 2024 09:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZp4e-0005vg-NA; Fri, 02 Aug 2024 09:59:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZp4e-0002FC-ID; Fri, 02 Aug 2024 09:59:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZp4e-0003Au-7X; Fri, 02 Aug 2024 09:59:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZp4e-0008By-77; Fri, 02 Aug 2024 09:59:48 +0000
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
	bh=AH35vD+dUUth1qGcc2OIcB8RCxD7KrA2SGmufcn3amg=; b=kU9pRB8TsbeaB2QEDHHNqSE2RC
	SK/y5/wzmgWFETa5pnFprivFQTYfF9kZRi8deOrL6/8o76oQFVCKMxf3SiZSJacEctjCYBl793jo6
	Ri+V1nfMON2HH3I4sVHqtcQv9ckdSmvl6I8VLsaPn1qaCIOkCBVI8VHg/+LdYG8Ep+C8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187120-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187120: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f5de749cb2247a4ead21523f2d9deb389291636
X-Osstest-Versions-That:
    ovmf=87d3a6272ca8637787813256c1a2435e89e326e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Aug 2024 09:59:48 +0000

flight 187120 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187120/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f5de749cb2247a4ead21523f2d9deb389291636
baseline version:
 ovmf                 87d3a6272ca8637787813256c1a2435e89e326e2

Last test of basis   187117  2024-08-02 05:43:32 Z    0 days
Testing same since   187120  2024-08-02 08:11:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   87d3a6272c..4f5de749cb  4f5de749cb2247a4ead21523f2d9deb389291636 -> xen-tested-master

