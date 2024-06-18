Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85090C520
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742875.1149760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUiN-0002fq-A9; Tue, 18 Jun 2024 09:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742875.1149760; Tue, 18 Jun 2024 09:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUiN-0002dc-6U; Tue, 18 Jun 2024 09:01:19 +0000
Received: by outflank-mailman (input) for mailman id 742875;
 Tue, 18 Jun 2024 09:01:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJUiL-0002dS-Q8; Tue, 18 Jun 2024 09:01:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJUiL-00050f-Ou; Tue, 18 Jun 2024 09:01:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJUiL-0002Fl-HT; Tue, 18 Jun 2024 09:01:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJUiL-0001TF-Gw; Tue, 18 Jun 2024 09:01:17 +0000
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
	bh=AGE+PRkppbK2F4u7+oFDD3iffPb/U5gUv8mULAg8Zmc=; b=q8Sp0osSs+b4J8Rlmoge3Qc9AE
	E9oPwJ1vofWnlUtPSpEHRqv+o8DEs24EAVmTIyckuzBJ5hGmKb4RvxcLFbREyaBf605ILqnq65qJ7
	CY+uXHvXTfrt7H71NbjcTF9ia1F1vx8u6KYY+S7dLQFyxWS8wDLNaktlIiHUsh06zQMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186392-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186392: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=176b9d41f8f71c7572dab615a8d5259dd2cbc02a
X-Osstest-Versions-That:
    ovmf=537a81ae81622d65052184b281e8b2754d0b5313
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 09:01:17 +0000

flight 186392 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186392/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 176b9d41f8f71c7572dab615a8d5259dd2cbc02a
baseline version:
 ovmf                 537a81ae81622d65052184b281e8b2754d0b5313

Last test of basis   186391  2024-06-18 06:13:04 Z    0 days
Testing same since   186392  2024-06-18 07:42:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhihao Li <zhihao.li@intel.com>

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
   537a81ae81..176b9d41f8  176b9d41f8f71c7572dab615a8d5259dd2cbc02a -> xen-tested-master

