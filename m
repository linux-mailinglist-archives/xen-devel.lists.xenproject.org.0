Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBC6D0CF0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 19:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516837.801609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phwBC-0007vG-LB; Thu, 30 Mar 2023 17:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516837.801609; Thu, 30 Mar 2023 17:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phwBC-0007sN-HG; Thu, 30 Mar 2023 17:35:18 +0000
Received: by outflank-mailman (input) for mailman id 516837;
 Thu, 30 Mar 2023 17:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phwBB-0007sD-CU; Thu, 30 Mar 2023 17:35:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phwBB-0003m6-AY; Thu, 30 Mar 2023 17:35:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phwBA-0005dC-RR; Thu, 30 Mar 2023 17:35:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phwBA-00010K-Qw; Thu, 30 Mar 2023 17:35:16 +0000
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
	bh=izzzQ+waM7EynEV9KS+sabzq3D70C2VkviwaaMGJOfQ=; b=yq/Q7S0/BhpHNSpGG/n/7EVigQ
	F27tHpeo38VwoZ51kL9qEpOGZvKNVby/7fVcQ1wT3X58qrMmhXHQalHtDoHv/vi036TEKJ5TSkfdi
	CHVzmQe9aQaYrCw82MLvyDZgZ4QChEZbaCa4F4qCgX21MiGiYSk7j2CXgJl/RbwY78lY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180067-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180067: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6f0c65cdb073eb8ee8c1cb6fad5d0060ec86f3cc
X-Osstest-Versions-That:
    ovmf=53eb26b238541799134aa5846530485c915735da
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Mar 2023 17:35:16 +0000

flight 180067 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180067/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6f0c65cdb073eb8ee8c1cb6fad5d0060ec86f3cc
baseline version:
 ovmf                 53eb26b238541799134aa5846530485c915735da

Last test of basis   180064  2023-03-30 11:13:36 Z    0 days
Testing same since   180067  2023-03-30 14:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   53eb26b238..6f0c65cdb0  6f0c65cdb073eb8ee8c1cb6fad5d0060ec86f3cc -> xen-tested-master

