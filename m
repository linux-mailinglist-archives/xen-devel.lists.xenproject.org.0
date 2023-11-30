Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311587FE9A6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 08:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644429.1005416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8bOY-0006oH-Dl; Thu, 30 Nov 2023 07:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644429.1005416; Thu, 30 Nov 2023 07:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8bOY-0006nR-Au; Thu, 30 Nov 2023 07:23:34 +0000
Received: by outflank-mailman (input) for mailman id 644429;
 Thu, 30 Nov 2023 07:23:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8bOX-0006nH-6o; Thu, 30 Nov 2023 07:23:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8bOW-0007UD-Vp; Thu, 30 Nov 2023 07:23:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8bOW-0003Br-Nb; Thu, 30 Nov 2023 07:23:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8bOW-0002OJ-NB; Thu, 30 Nov 2023 07:23:32 +0000
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
	bh=hhRTyEvnpxms8JAIz8sn7O3sVR1mzIW+f+o9QU2uCBw=; b=sXlBTbalPzO9Fh8US0f4g5uMTg
	NVy7p4xAPVoA0qSv1JWxIF6ZcVxh5wDkv3lVwpi2Ip9xqc7zds7hWFcq64Un3X7Dw+BTFFwxP+NTc
	pWj8JvVxL2/5YhtLpwlF+0eVeA0WQ9bv4T36o0ULREulMeu2xzoXN7GG8qg6GfVBo9vE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183945-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183945: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=59b6b5059b90883abfcbd906c411e8f59ac1aa0d
X-Osstest-Versions-That:
    ovmf=4f99b5fb936a2a0239d5212948b7104d75d1558c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Nov 2023 07:23:32 +0000

flight 183945 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183945/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 59b6b5059b90883abfcbd906c411e8f59ac1aa0d
baseline version:
 ovmf                 4f99b5fb936a2a0239d5212948b7104d75d1558c

Last test of basis   183942  2023-11-29 21:12:45 Z    0 days
Testing same since   183945  2023-11-30 05:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashish Singhal <ashishsingha@nvidia.com>

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
   4f99b5fb93..59b6b5059b  59b6b5059b90883abfcbd906c411e8f59ac1aa0d -> xen-tested-master

