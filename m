Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939888001D9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 04:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645251.1007317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8toM-0005x2-7b; Fri, 01 Dec 2023 03:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645251.1007317; Fri, 01 Dec 2023 03:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8toM-0005vT-3q; Fri, 01 Dec 2023 03:03:26 +0000
Received: by outflank-mailman (input) for mailman id 645251;
 Fri, 01 Dec 2023 03:03:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8toL-0005vJ-B2; Fri, 01 Dec 2023 03:03:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8toL-0003ZU-7t; Fri, 01 Dec 2023 03:03:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8toK-0008K1-Qn; Fri, 01 Dec 2023 03:03:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8toK-00043r-Pl; Fri, 01 Dec 2023 03:03:24 +0000
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
	bh=bfsRTCQAITMeT7ISto6d/H7a/EZtNhfzAc7y4dczWEY=; b=ubghYgAH+8FLhqegs7mY9qUuUE
	iT3O7eKx2MCCikI+UMX75YyICY6he9thMJ0dS2FWRvIHN9AD9e09xvTcLSENwa5gddtmbkM4bC6kF
	ZWBXilUo9SoDph1o44NP961GYkAXXwPhytrdgaBquiV7fVZktdQ4t3SInwlTPY578A9w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183958-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183958: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=534021965f6f7c417610add53984f39d6945bbcf
X-Osstest-Versions-That:
    ovmf=26d484d0867b03ebd8a1ecdd9895f17e96732503
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Dec 2023 03:03:24 +0000

flight 183958 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183958/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 534021965f6f7c417610add53984f39d6945bbcf
baseline version:
 ovmf                 26d484d0867b03ebd8a1ecdd9895f17e96732503

Last test of basis   183956  2023-11-30 19:44:47 Z    0 days
Testing same since   183958  2023-12-01 01:15:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhi Jin <zhi.jin@intel.com>

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
   26d484d086..534021965f  534021965f6f7c417610add53984f39d6945bbcf -> xen-tested-master

