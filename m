Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672EE416A98
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 05:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194824.347156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcAG-00048n-41; Fri, 24 Sep 2021 03:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194824.347156; Fri, 24 Sep 2021 03:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcAF-00045W-Ut; Fri, 24 Sep 2021 03:46:19 +0000
Received: by outflank-mailman (input) for mailman id 194824;
 Fri, 24 Sep 2021 03:46:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTcAE-00045L-Mp; Fri, 24 Sep 2021 03:46:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTcAE-0007UP-D6; Fri, 24 Sep 2021 03:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTcAD-0004uW-VY; Fri, 24 Sep 2021 03:46:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mTcAD-0006Qr-V3; Fri, 24 Sep 2021 03:46:17 +0000
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
	bh=spwDjb3wljFjes/H+y+aLWaimmSrThkqXKWq8zLkQLM=; b=YiSvksllC/3iPiKhW5I25dWeb7
	wMQ969MKYez5cl2rPCcJ81fGzKut6W/dXZITIoBt1MuO8ILkq5nCtelF1Q2quD14H9oHIRSNEEERt
	fQbcK/4a51LMMqi4XiIU5XSGIELZZ3OffzccG/jj/MOqd+r1fUW7XDlyXk1jupXJjRVA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165170-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165170: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7ea7f9c07757b9445c24b23acf4c2e8e60b30b7e
X-Osstest-Versions-That:
    ovmf=79019c7a42287e8591ec98487db0e849384a74e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Sep 2021 03:46:17 +0000

flight 165170 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165170/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7ea7f9c07757b9445c24b23acf4c2e8e60b30b7e
baseline version:
 ovmf                 79019c7a42287e8591ec98487db0e849384a74e1

Last test of basis   165155  2021-09-22 12:40:08 Z    1 days
Testing same since   165170  2021-09-23 18:41:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   79019c7a42..7ea7f9c077  7ea7f9c07757b9445c24b23acf4c2e8e60b30b7e -> xen-tested-master

