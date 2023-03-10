Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD276B3913
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 09:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508425.783086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYMp-0006uO-5D; Fri, 10 Mar 2023 08:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508425.783086; Fri, 10 Mar 2023 08:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYMp-0006tA-0h; Fri, 10 Mar 2023 08:44:47 +0000
Received: by outflank-mailman (input) for mailman id 508425;
 Fri, 10 Mar 2023 08:44:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYMo-0006t0-1F; Fri, 10 Mar 2023 08:44:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYMn-0004un-Hh; Fri, 10 Mar 2023 08:44:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paYMn-0005pX-6j; Fri, 10 Mar 2023 08:44:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1paYMn-000829-6E; Fri, 10 Mar 2023 08:44:45 +0000
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
	bh=I19wOnUK+IyV3AcqvLnhCwlIRf7YA048JiI38Fd4OZE=; b=QQZQkLcPI51ZEgrjfsUSFLZ/go
	8s3W2dB2NWbXhHT6cPmykCTPaiVcaBPhEGbaerEzvL+De2gxmGheIJdF+qs4h4OFK+/5paZbs+KtT
	j629vlkmFnJyYjbnFsf3a3preF7k70zjysT1kgn9h1Z3bHOByhdYawXhtYpsWF5C3VCI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179530-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179530: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ca4041b0dbb310109d9cb047ed428a0082df395
X-Osstest-Versions-That:
    ovmf=8820767fb3bad09eeedecc3030d75c9e0cd4cab7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Mar 2023 08:44:45 +0000

flight 179530 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179530/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ca4041b0dbb310109d9cb047ed428a0082df395
baseline version:
 ovmf                 8820767fb3bad09eeedecc3030d75c9e0cd4cab7

Last test of basis   179527  2023-03-10 02:10:45 Z    0 days
Testing same since   179530  2023-03-10 06:12:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   8820767fb3..4ca4041b0d  4ca4041b0dbb310109d9cb047ed428a0082df395 -> xen-tested-master

