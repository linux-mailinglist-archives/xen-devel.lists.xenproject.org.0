Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE0673802
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480986.745628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pITmp-0006qS-RA; Thu, 19 Jan 2023 12:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480986.745628; Thu, 19 Jan 2023 12:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pITmp-0006ni-Ne; Thu, 19 Jan 2023 12:12:55 +0000
Received: by outflank-mailman (input) for mailman id 480986;
 Thu, 19 Jan 2023 12:12:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pITmo-0006nY-47; Thu, 19 Jan 2023 12:12:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pITmo-00011m-0g; Thu, 19 Jan 2023 12:12:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pITmn-00062e-KW; Thu, 19 Jan 2023 12:12:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pITmn-0003q1-K9; Thu, 19 Jan 2023 12:12:53 +0000
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
	bh=GluQ8JXLhL0Ck5/UYzPj/JBnrxsIn0IPuxiuNVj2Grw=; b=uWSdfCb/9za0ZtRfw1D3eAch4A
	fapZiqA3nugZG0t9FvSg8f+/koUymlJDelA+H1dRTHnrzHRt6r78mtl2liZLOC9l8wUYMTkS3HVl0
	nEI7gaXV2kdIv0NBhWMtGtfz+dlxqrhZBE1NNlKlmc0DJM02ObbOc13mkDGES0cX8aZM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175971-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175971: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=18df11da8c14e48b6e4a90fb0b5befb1c243070a
X-Osstest-Versions-That:
    ovmf=426efcc37492da4ebd86799c2d4f5dfeac806848
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Jan 2023 12:12:53 +0000

flight 175971 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175971/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 18df11da8c14e48b6e4a90fb0b5befb1c243070a
baseline version:
 ovmf                 426efcc37492da4ebd86799c2d4f5dfeac806848

Last test of basis   175964  2023-01-19 02:42:12 Z    0 days
Testing same since   175971  2023-01-19 05:11:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>

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
   426efcc374..18df11da8c  18df11da8c14e48b6e4a90fb0b5befb1c243070a -> xen-tested-master

