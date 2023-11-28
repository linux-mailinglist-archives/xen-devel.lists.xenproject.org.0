Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC87FCB05
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 00:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643610.1004000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r87rs-0004Av-6e; Tue, 28 Nov 2023 23:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643610.1004000; Tue, 28 Nov 2023 23:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r87rs-00049H-40; Tue, 28 Nov 2023 23:51:52 +0000
Received: by outflank-mailman (input) for mailman id 643610;
 Tue, 28 Nov 2023 23:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r87rq-000497-Og; Tue, 28 Nov 2023 23:51:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r87rq-0004Qj-Nt; Tue, 28 Nov 2023 23:51:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r87rq-0000Dy-FP; Tue, 28 Nov 2023 23:51:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r87rq-0008Sp-Eq; Tue, 28 Nov 2023 23:51:50 +0000
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
	bh=b9O8Ofojjrx0hxCO+buE2f/JQAV+fFovZuAcJyz+Qn4=; b=Ta4tXGaeNoCYUhleRVf+j9Dz3F
	KklEF/a9QVjKTBxYUa+Wf056giB+FrhwSi9l1H+t0SYAK0VPIac5nfdoQaioCT1UQ8V5TL0mvtbL3
	4hKCBXT1VSqv8/tJZdCtZBW7EHbdpGwXdmJPv2ChefUxCWCojbsNSnixGGV5OkfnGeIA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183914-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183914: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdf36b1e36805884a8dc115b1316ac09ce77feee
X-Osstest-Versions-That:
    ovmf=e1627f77201ac55d24e9d0e3380f9dbdc600843c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 23:51:50 +0000

flight 183914 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183914/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdf36b1e36805884a8dc115b1316ac09ce77feee
baseline version:
 ovmf                 e1627f77201ac55d24e9d0e3380f9dbdc600843c

Last test of basis   183909  2023-11-28 18:11:03 Z    0 days
Testing same since   183914  2023-11-28 21:42:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>
  Nhi Pham <nhi@os.amperecomputing.com>

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
   e1627f7720..cdf36b1e36  cdf36b1e36805884a8dc115b1316ac09ce77feee -> xen-tested-master

