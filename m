Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA36545CF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 19:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468597.727707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Pwi-0006K1-8D; Thu, 22 Dec 2022 18:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468597.727707; Thu, 22 Dec 2022 18:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Pwi-0006HB-4s; Thu, 22 Dec 2022 18:05:32 +0000
Received: by outflank-mailman (input) for mailman id 468597;
 Thu, 22 Dec 2022 18:05:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8Pwg-0006Gz-IL; Thu, 22 Dec 2022 18:05:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8Pwg-00042s-GG; Thu, 22 Dec 2022 18:05:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8Pwg-0005LZ-5R; Thu, 22 Dec 2022 18:05:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8Pwg-0006Li-4z; Thu, 22 Dec 2022 18:05:30 +0000
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
	bh=R9Gz7apoIPKFrX9s5+cnopuz0CZf8/4ENUWEhitNd4w=; b=uD9+emw8HuU3Z83PHZDPJZa0N7
	obnCWZPQYWhUL6fDXD3o7aJEfpls0KigUb80JTLV+rJKUSxXnwxCf3+jfIAitdiR+XogPrnwQdBIG
	PpApqtglMpLPM9w+fnBrkfGj+LIHwMs4wsbPp9tEjPwmARcA/IOaxkSWDkY2AuvdZuMM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175458-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175458: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=538ac013d6a673842d780c88b7b3c21730260e8e
X-Osstest-Versions-That:
    ovmf=ec87305f90d90096aac2a4d91e3f6556e2ecd6b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 18:05:30 +0000

flight 175458 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175458/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 538ac013d6a673842d780c88b7b3c21730260e8e
baseline version:
 ovmf                 ec87305f90d90096aac2a4d91e3f6556e2ecd6b9

Last test of basis   175452  2022-12-22 07:10:57 Z    0 days
Testing same since   175458  2022-12-22 13:44:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   ec87305f90..538ac013d6  538ac013d6a673842d780c88b7b3c21730260e8e -> xen-tested-master

