Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8A342417
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 19:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99360.188934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNJWl-0002q6-Tf; Fri, 19 Mar 2021 18:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99360.188934; Fri, 19 Mar 2021 18:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNJWl-0002ph-QY; Fri, 19 Mar 2021 18:07:15 +0000
Received: by outflank-mailman (input) for mailman id 99360;
 Fri, 19 Mar 2021 18:07:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNJWl-0002pY-3D; Fri, 19 Mar 2021 18:07:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNJWk-0000zf-HZ; Fri, 19 Mar 2021 18:07:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lNJWk-0003Z6-7V; Fri, 19 Mar 2021 18:07:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lNJWk-0004r7-6z; Fri, 19 Mar 2021 18:07:14 +0000
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
	bh=o6kD3XHb1ba8UrwRQHifXLcgYjiPoJhmjg5sdMFzAnM=; b=jhApg/LPyI0lymLhQwzQQLaVhg
	N2mpjXSmzIuCS0y+5JvzaSV/JlcCbWjlizAD9AUueRu7VyNnSEMu5ATtr1N+oy96egmtSkE9NpEdK
	5NmsgByOJFspN51UFKXQ58qKh45W2lm69E45pWhnwx9usa6a6FswUz7lXzgdOpmqosis=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160131-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160131: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eb07bfb09ef5483ad58ed0eba713f32fb0c909f9
X-Osstest-Versions-That:
    ovmf=9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Mar 2021 18:07:14 +0000

flight 160131 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160131/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9
baseline version:
 ovmf                 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1

Last test of basis   160123  2021-03-18 04:45:10 Z    1 days
Testing same since   160131  2021-03-18 17:39:48 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Brijesh Singh <brijesh.singh@amd.com>
  James Bottomley <jejb@linux.ibm.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Min Xu <min.m.xu@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   9fd7e88c23..eb07bfb09e  eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 -> xen-tested-master

