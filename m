Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5573369F00
	for <lists+xen-devel@lfdr.de>; Sat, 24 Apr 2021 08:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116697.222653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laBVo-0001pr-0E; Sat, 24 Apr 2021 06:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116697.222653; Sat, 24 Apr 2021 06:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laBVn-0001pS-Sx; Sat, 24 Apr 2021 06:11:27 +0000
Received: by outflank-mailman (input) for mailman id 116697;
 Sat, 24 Apr 2021 06:11:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1laBVm-0001pK-QJ; Sat, 24 Apr 2021 06:11:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1laBVm-0004Vy-MO; Sat, 24 Apr 2021 06:11:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1laBVm-0003mK-D5; Sat, 24 Apr 2021 06:11:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1laBVm-0001ch-Ca; Sat, 24 Apr 2021 06:11:26 +0000
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
	bh=eF4ggTGDA0aXU2vNGU5FgrNVBQYirlybO0tT+1AJZwo=; b=ikQ1wPvTy9QwXyjC1Gt6sUCiWG
	7Ls+XZLfSCuGMXCFuBpd95pte/2SgsqqAv18Pin++eMqDZNk5+Z0zNv/zAorS399MZ/2fO57vx5pm
	K2dljG3R6LEVhv8IE+GZyrCyZHMPjIdyCdeJ3V8dhDD4qdZ5aD4h5up+BC83wHXD6m+k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161417-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161417: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294
X-Osstest-Versions-That:
    ovmf=61680cac5e435053be89a4fc6b945466f2c7bac6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Apr 2021 06:11:26 +0000

flight 161417 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161417/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294
baseline version:
 ovmf                 61680cac5e435053be89a4fc6b945466f2c7bac6

Last test of basis   161406  2021-04-23 11:41:04 Z    0 days
Testing same since   161417  2021-04-23 22:13:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   61680cac5e..f2f4c6be2d  f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294 -> xen-tested-master

