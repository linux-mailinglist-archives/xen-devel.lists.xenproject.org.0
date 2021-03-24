Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F1346E4B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 01:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100831.192343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOrVu-00008Q-6L; Wed, 24 Mar 2021 00:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100831.192343; Wed, 24 Mar 2021 00:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOrVu-00007t-1o; Wed, 24 Mar 2021 00:36:46 +0000
Received: by outflank-mailman (input) for mailman id 100831;
 Wed, 24 Mar 2021 00:36:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOrVr-00007l-Th; Wed, 24 Mar 2021 00:36:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOrVr-0002bW-Mg; Wed, 24 Mar 2021 00:36:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lOrVr-0002u4-Fk; Wed, 24 Mar 2021 00:36:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lOrVr-0005Du-FB; Wed, 24 Mar 2021 00:36:43 +0000
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
	bh=i7GGIuFxYUUNUq+dleF/y6vxIkY/UFGQCu1zgXaz2Fo=; b=bWXEGAggYH7F815uo6zXWlPs5y
	3J3pNc8mjvl/rfWE9WJnEJ/lB41fBbXFEc/UGIpuPCQ65NZrnUDz3FDPQGCYXp0/Ui9y2Jfp2aDpa
	IkAgwAWk7SEHPcF84PkcIoYr/cdK51MiGB/niJpxcN0Qjhm/29RMcWX+UJ96OtjDAysk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160352-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160352: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0ecdcb6142037dd1cdd08660a2349960bcf0270a
X-Osstest-Versions-That:
    ovmf=3d0df0f076e120c6faf3c1892fffa21b4f31ed84
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Mar 2021 00:36:43 +0000

flight 160352 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160352/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0ecdcb6142037dd1cdd08660a2349960bcf0270a
baseline version:
 ovmf                 3d0df0f076e120c6faf3c1892fffa21b4f31ed84

Last test of basis   160249  2021-03-22 01:39:50 Z    1 days
Testing same since   160352  2021-03-23 05:41:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu Wei <weix.c.liu@intel.com>

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
   3d0df0f076..0ecdcb6142  0ecdcb6142037dd1cdd08660a2349960bcf0270a -> xen-tested-master

