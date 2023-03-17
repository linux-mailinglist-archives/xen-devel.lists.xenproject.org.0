Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7D6BDE18
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 02:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510860.789359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyjq-0007q5-KU; Fri, 17 Mar 2023 01:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510860.789359; Fri, 17 Mar 2023 01:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyjq-0007nU-HH; Fri, 17 Mar 2023 01:18:34 +0000
Received: by outflank-mailman (input) for mailman id 510860;
 Fri, 17 Mar 2023 01:18:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcyjp-0007nG-5A; Fri, 17 Mar 2023 01:18:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcyjp-0007Yk-3p; Fri, 17 Mar 2023 01:18:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcyjo-0006Vm-PR; Fri, 17 Mar 2023 01:18:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pcyjo-0004Pc-Oz; Fri, 17 Mar 2023 01:18:32 +0000
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
	bh=EOq53qaEENX9iHSNz5JgY4jgfhsm9ZT8+lTX0kGLwyk=; b=xF4MlgB/eYzkACx/uZa8lt0Ck+
	JKE3OnYrdYgT/DHihTVOZfrQNSYSPkYCgQuuT70jTxRxVHEj7igeesfl6Wrg3whgoG6/r8/964qQT
	gxNxRU88zTCtb09gHkYeBAPQEtDgxwg/4ygpWQPUVX/Qg6F60FBnKLw+GyZNl/cUkBPE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179698-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179698: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=16e0969ef775b898ac700f3261d76030b8ab9ef0
X-Osstest-Versions-That:
    ovmf=997c6967b00cdd797fe787567a28a7565aafd301
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Mar 2023 01:18:32 +0000

flight 179698 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179698/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 16e0969ef775b898ac700f3261d76030b8ab9ef0
baseline version:
 ovmf                 997c6967b00cdd797fe787567a28a7565aafd301

Last test of basis   179690  2023-03-16 16:12:11 Z    0 days
Testing same since   179698  2023-03-16 21:45:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   997c6967b0..16e0969ef7  16e0969ef775b898ac700f3261d76030b8ab9ef0 -> xen-tested-master

