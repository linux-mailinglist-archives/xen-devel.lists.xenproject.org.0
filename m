Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126EF365905
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113609.216518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpb9-0007Sg-Mk; Tue, 20 Apr 2021 12:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113609.216518; Tue, 20 Apr 2021 12:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpb9-0007SE-Gz; Tue, 20 Apr 2021 12:35:23 +0000
Received: by outflank-mailman (input) for mailman id 113609;
 Tue, 20 Apr 2021 12:35:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYpb7-0007S6-Ad; Tue, 20 Apr 2021 12:35:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYpb7-0000jF-6M; Tue, 20 Apr 2021 12:35:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYpb6-0004lO-Si; Tue, 20 Apr 2021 12:35:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYpb6-0002nc-SE; Tue, 20 Apr 2021 12:35:20 +0000
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
	bh=O6qMETFo2APbB8l2xG4bAs4BfYr3qp76tjVG7GqNbJI=; b=Pm8WNISQiBCEe6XsWc1FsWRFsU
	1HuTA77DFU/KmC2ZN6cMzXJYBLUL14uQAKL4kIE3QjPQjzw9h/xfCrAQAPmAWF/2//1IvsEKwtREs
	OU47GIyGh6M91Wj57PKXlRjaeR2MKK4RmUO1PaGHBlq9NM+cwvh0hhLhnZswaj6mgUEo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161312-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161312: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0bbc20727598421c4e47d46b982246217df8c6bc
X-Osstest-Versions-That:
    ovmf=64138c95db5a7a3e4768d8a01ba71dc3475e6524
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Apr 2021 12:35:20 +0000

flight 161312 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161312/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0bbc20727598421c4e47d46b982246217df8c6bc
baseline version:
 ovmf                 64138c95db5a7a3e4768d8a01ba71dc3475e6524

Last test of basis   161301  2021-04-19 21:40:07 Z    0 days
Testing same since   161312  2021-04-20 04:56:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>
  Kun Qin <kuqin12@gmail.com>

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
   64138c95db..0bbc207275  0bbc20727598421c4e47d46b982246217df8c6bc -> xen-tested-master

