Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AA63F00D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450640.708019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iE7-0005kU-Sj; Thu, 01 Dec 2022 11:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450640.708019; Thu, 01 Dec 2022 11:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iE7-0005ic-OL; Thu, 01 Dec 2022 11:59:39 +0000
Received: by outflank-mailman (input) for mailman id 450640;
 Thu, 01 Dec 2022 11:59:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0iE6-0005dl-PQ; Thu, 01 Dec 2022 11:59:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0iE6-0007fl-NG; Thu, 01 Dec 2022 11:59:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0iE6-0001sK-2L; Thu, 01 Dec 2022 11:59:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p0iE6-0001lP-1t; Thu, 01 Dec 2022 11:59:38 +0000
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
	bh=MCnWhg/Q0ImF2Y56OF7v2il8kzU6B0MQHK3Y/uZexrA=; b=4EC3HEf65zQMd4r2mO6V5PHtHI
	pQBKcZpM5q9N0j7YrB1N7sr0/cRM6ArWjMm4PI88nc8ppIrYdJZLDp0EyoU4KF7cVTwiJapa6YSN8
	X+wUcQfhFt6C+YRGpSkDDa9I0uw7jigU3KtGjd1o0lNFb0t0UZSKCRI4603PtimqmaJ4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175003-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175003: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a8a78ef194f4a6aaf4c178d1c545a372c94e88bb
X-Osstest-Versions-That:
    ovmf=beb0f8d483dfbec2fd3a2db425e0c1871b0d29eb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Dec 2022 11:59:38 +0000

flight 175003 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175003/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a8a78ef194f4a6aaf4c178d1c545a372c94e88bb
baseline version:
 ovmf                 beb0f8d483dfbec2fd3a2db425e0c1871b0d29eb

Last test of basis   175001  2022-12-01 03:10:25 Z    0 days
Testing same since   175003  2022-12-01 09:44:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gang Chen <gang.c.chen@intel.com>

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
   beb0f8d483..a8a78ef194  a8a78ef194f4a6aaf4c178d1c545a372c94e88bb -> xen-tested-master

