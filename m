Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6C8BA55D
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 04:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716211.1118324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ids-0008K1-Ht; Fri, 03 May 2024 02:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716211.1118324; Fri, 03 May 2024 02:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ids-0008IS-DG; Fri, 03 May 2024 02:27:20 +0000
Received: by outflank-mailman (input) for mailman id 716211;
 Fri, 03 May 2024 02:27:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2idr-0008II-Oa; Fri, 03 May 2024 02:27:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2idp-00010W-W6; Fri, 03 May 2024 02:27:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s2idp-00023M-HM; Fri, 03 May 2024 02:27:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s2idp-0007J1-Gw; Fri, 03 May 2024 02:27:17 +0000
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
	bh=02WJRYHn0Kj0V9rI4BmR3u/h2gdAEI1O68vkfxPLfcg=; b=5YsrmCYkWXlsCXl2w0Ir6iLsjg
	fEHHNgRrO3eXjD6COzBCcvDkOc3891PyLIaTHqvc8VZdcj4QVOKGlUXterVtvTNjvqWs44tgMr0Vb
	0d90+kZHpIMZPP46lYrp5AZpLYEuBhqF2mDAMC8m+WIzoIyLUbSDwU9tHzkaKMetItfw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185904-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185904: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=248aa153f65866f46b5370ac2ef7dfaf3af72480
X-Osstest-Versions-That:
    ovmf=fecf55a66a1cf908c2f906bedb79fe2e8362d50f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 May 2024 02:27:17 +0000

flight 185904 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185904/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 248aa153f65866f46b5370ac2ef7dfaf3af72480
baseline version:
 ovmf                 fecf55a66a1cf908c2f906bedb79fe2e8362d50f

Last test of basis   185900  2024-05-02 13:14:46 Z    0 days
Testing same since   185904  2024-05-03 00:44:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Duggapu Chinni B <chinni.b.duggapu@intel.com>

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
   fecf55a66a..248aa153f6  248aa153f65866f46b5370ac2ef7dfaf3af72480 -> xen-tested-master

