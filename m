Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374E54FA37
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 17:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351486.578137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Dre-0003zH-Gb; Fri, 17 Jun 2022 15:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351486.578137; Fri, 17 Jun 2022 15:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Dre-0003wi-BS; Fri, 17 Jun 2022 15:26:26 +0000
Received: by outflank-mailman (input) for mailman id 351486;
 Fri, 17 Jun 2022 15:26:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o2Drd-0003wY-1A; Fri, 17 Jun 2022 15:26:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o2Drc-0005Y2-Ur; Fri, 17 Jun 2022 15:26:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o2Drc-0006em-KP; Fri, 17 Jun 2022 15:26:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o2Drc-000308-Ju; Fri, 17 Jun 2022 15:26:24 +0000
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
	bh=jnTVvFcskdsEkxb6P8VCYB52CQ2g+ebA9eRIOGUt99s=; b=eN8efO7/k3Pa0qAIgxVz4eklFM
	Yxq3huwi4aaCziRVfSEf047RIYfRa+hwyTCYCSoOAeTPfCHaUPFWq1wkpSUuxAQQ0Ub8EraJDZvNs
	By8cfGq/lHLZ8O7GgETburRy+qA1Xxttg6GiW/kFHUr/0CGIIE48GUbbm7t7VBSnMO4g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171243-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171243: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cc2db6ebfb6d9d85ba4c7b35fba1fa37fffc0bc2
X-Osstest-Versions-That:
    ovmf=92ab049719afe96913c0452bcf12946e0af0f0d5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Jun 2022 15:26:24 +0000

flight 171243 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171243/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cc2db6ebfb6d9d85ba4c7b35fba1fa37fffc0bc2
baseline version:
 ovmf                 92ab049719afe96913c0452bcf12946e0af0f0d5

Last test of basis   171202  2022-06-16 12:43:16 Z    1 days
Testing same since   171243  2022-06-17 09:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   92ab049719..cc2db6ebfb  cc2db6ebfb6d9d85ba4c7b35fba1fa37fffc0bc2 -> xen-tested-master

