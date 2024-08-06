Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718A948926
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 08:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772471.1182912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbDIt-0001hJ-Uy; Tue, 06 Aug 2024 06:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772471.1182912; Tue, 06 Aug 2024 06:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbDIt-0001fj-SE; Tue, 06 Aug 2024 06:04:15 +0000
Received: by outflank-mailman (input) for mailman id 772471;
 Tue, 06 Aug 2024 06:04:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbDIs-0001fZ-AN; Tue, 06 Aug 2024 06:04:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbDIs-0006LA-4b; Tue, 06 Aug 2024 06:04:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbDIr-0007xS-P8; Tue, 06 Aug 2024 06:04:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sbDIr-00023Y-Of; Tue, 06 Aug 2024 06:04:13 +0000
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
	bh=Y8Gnlraoel/tqtLH4UrUsDZLIeCusJteDeTlXknHp+k=; b=fdKWiDaZBPYI/xCBsyephHtwBW
	B6TVyrC3WFLMvm6wLaQ3v4+qvplUUZawPxdEWKBrRe186uNMhu8o0voKCsfc39/lUaiKZBPioiNUd
	/00Mxmc8/BtJtFqbG7wqlw01fcsrT55OV6n5sbC3BVQBoOWWLxJ96bDkrPXCrZICmuBc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187166-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187166: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=472be4d139b26c50949cf30eeb47640810e5ef2c
X-Osstest-Versions-That:
    ovmf=1b37b3659b5098f764dee5b893e4eb174949f40a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Aug 2024 06:04:13 +0000

flight 187166 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187166/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 472be4d139b26c50949cf30eeb47640810e5ef2c
baseline version:
 ovmf                 1b37b3659b5098f764dee5b893e4eb174949f40a

Last test of basis   187165  2024-08-06 01:16:31 Z    0 days
Testing same since   187166  2024-08-06 03:43:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  John Schock <joschock@microsoft.com>

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
   1b37b3659b..472be4d139  472be4d139b26c50949cf30eeb47640810e5ef2c -> xen-tested-master

