Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6B362F43
	for <lists+xen-devel@lfdr.de>; Sat, 17 Apr 2021 12:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112062.214231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXiGE-0002RY-0g; Sat, 17 Apr 2021 10:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112062.214231; Sat, 17 Apr 2021 10:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXiGD-0002R6-Sd; Sat, 17 Apr 2021 10:33:09 +0000
Received: by outflank-mailman (input) for mailman id 112062;
 Sat, 17 Apr 2021 10:33:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXiGC-0002Qy-Pj; Sat, 17 Apr 2021 10:33:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXiGC-0001t4-Ds; Sat, 17 Apr 2021 10:33:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXiGC-00043W-65; Sat, 17 Apr 2021 10:33:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXiGC-0006sP-5X; Sat, 17 Apr 2021 10:33:08 +0000
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
	bh=8Lhq8zfKutVFMgO/4yYAwTELd6J4Y77+581rHNHjtmQ=; b=l5G2VWaMExcAeQzvPTigiwmdD9
	QTQ1Nv/jTAqKR0ljZHmP1ZJjIxcIAejuSRc7kTlTHKfEGor9btsUSpG7nlJMebLKB74tUx3BRPfvw
	zc6KvLOw6l+13qhw8fxbgcu/TSZXu224rbMlNY5am0T/c1JsgA9yTpxmaAF+2uqOc1sc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161219-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161219: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=8893fd89044e99e1894f8856d72893ea598d32d8
X-Osstest-Versions-That:
    xtf=90320d569b830666afc369992a507a61f0668534
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Apr 2021 10:33:08 +0000

flight 161219 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161219/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  8893fd89044e99e1894f8856d72893ea598d32d8
baseline version:
 xtf                  90320d569b830666afc369992a507a61f0668534

Last test of basis   161177  2021-04-15 17:41:37 Z    1 days
Testing same since   161219  2021-04-16 23:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   90320d5..8893fd8  8893fd89044e99e1894f8856d72893ea598d32d8 -> xen-tested-master

