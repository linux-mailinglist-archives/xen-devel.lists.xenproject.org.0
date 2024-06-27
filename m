Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F9C91B27F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 01:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750371.1158542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMyBe-0003ad-C9; Thu, 27 Jun 2024 23:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750371.1158542; Thu, 27 Jun 2024 23:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMyBe-0003ZN-8k; Thu, 27 Jun 2024 23:05:54 +0000
Received: by outflank-mailman (input) for mailman id 750371;
 Thu, 27 Jun 2024 23:05:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMyBd-0003ZD-Jr; Thu, 27 Jun 2024 23:05:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMyBd-0004UL-IL; Thu, 27 Jun 2024 23:05:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMyBd-0008BK-1Q; Thu, 27 Jun 2024 23:05:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMyBd-00047W-10; Thu, 27 Jun 2024 23:05:53 +0000
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
	bh=b3r8fxvn+Yir1ahquVSlnIDDGexDs3DBpFdgH39Z9N8=; b=qU700F4ygPuDRlzuOPrUqUIjdW
	T1UGqfWIulwL4oOhaHfgEVid/OFM23FmcWUUQjfk1U43Rtv8BOnMFjBb3orAqsA3GI8sVr5E0lOHg
	YAzQkRRseDZ/t4qAdfAgCVF96lf5QwATNIdrqbhVpJ7FPiK8WEu4CEnIvmIMe+mzQGvU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186539-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186539: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a5f147b2a31c093cc83a3f10cdda529c6b59799b
X-Osstest-Versions-That:
    ovmf=6862b9d538d96363635677198899e1669e591259
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Jun 2024 23:05:53 +0000

flight 186539 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186539/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a5f147b2a31c093cc83a3f10cdda529c6b59799b
baseline version:
 ovmf                 6862b9d538d96363635677198899e1669e591259

Last test of basis   186536  2024-06-27 15:41:23 Z    0 days
Testing same since   186539  2024-06-27 21:14:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
  dependabot[bot] <support@github.com>

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
   6862b9d538..a5f147b2a3  a5f147b2a31c093cc83a3f10cdda529c6b59799b -> xen-tested-master

