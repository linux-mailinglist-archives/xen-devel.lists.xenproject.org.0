Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69792740C96
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 11:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556384.868869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEROS-0000qu-B1; Wed, 28 Jun 2023 09:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556384.868869; Wed, 28 Jun 2023 09:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEROS-0000oR-8J; Wed, 28 Jun 2023 09:23:20 +0000
Received: by outflank-mailman (input) for mailman id 556384;
 Wed, 28 Jun 2023 09:23:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEROQ-0000o9-ED; Wed, 28 Jun 2023 09:23:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEROQ-0006MR-9F; Wed, 28 Jun 2023 09:23:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEROP-0002MR-P3; Wed, 28 Jun 2023 09:23:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEROP-0005yo-Oa; Wed, 28 Jun 2023 09:23:17 +0000
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
	bh=6gC99CcKzv75Gq7xwqqkqTKmLjolsjkqpvyeqjZcCyI=; b=t3uXplNNjSbIdvGFQ6M+tGxmB1
	26XlQnHpJGFH/gUwu4sXGW+rWhu2FtVWVFj15No9AGjrbpv90w8CDSBiiDa1ADDModX3ippGH1rie
	NIlS7WQ35rRzsEf9FnDPKdPIpoWJaOUmG7zOnf3fP9ijq2o2SNcbNIzw9ur/NcUKd7tc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181622-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181622: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4416bf3383485d2265b8e1baca7ed9c9c04eb40b
X-Osstest-Versions-That:
    ovmf=44a3d93af3fc3f3762d0e1f48137a370610dab2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 09:23:17 +0000

flight 181622 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181622/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4416bf3383485d2265b8e1baca7ed9c9c04eb40b
baseline version:
 ovmf                 44a3d93af3fc3f3762d0e1f48137a370610dab2b

Last test of basis   181620  2023-06-28 02:40:51 Z    0 days
Testing same since   181622  2023-06-28 07:43:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  devel@edk2.groups.io <devel@edk2.groups.io>
  Yi Li <yi1.li@intel.com>

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
   44a3d93af3..4416bf3383  4416bf3383485d2265b8e1baca7ed9c9c04eb40b -> xen-tested-master

