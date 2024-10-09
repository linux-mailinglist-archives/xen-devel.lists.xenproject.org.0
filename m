Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D0996E64
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814663.1228273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXtZ-0006qP-KV; Wed, 09 Oct 2024 14:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814663.1228273; Wed, 09 Oct 2024 14:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXtZ-0006nl-He; Wed, 09 Oct 2024 14:42:33 +0000
Received: by outflank-mailman (input) for mailman id 814663;
 Wed, 09 Oct 2024 14:42:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syXtY-0006nb-Rr; Wed, 09 Oct 2024 14:42:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syXtY-000359-Q8; Wed, 09 Oct 2024 14:42:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syXtY-0000DR-3x; Wed, 09 Oct 2024 14:42:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syXtY-0004aa-3S; Wed, 09 Oct 2024 14:42:32 +0000
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
	bh=JEPC0anYygbYIuv6TDtGXlwQfH7hzPZeGBljT3suDNA=; b=RFOJqm2K+ID3NecSS7JvVxDheI
	TDu9e5i+7X49Msh2rmD2Sl1fKyd3pwz3pkuY3pyl0WuwjSjMh9TNI+yiDcH5bi2uz+m/TmPyoPTDP
	yrjbV+GpcIptenr++JdqUFCn+RV37NotEeq3TRrykBAcl/enw5FF7AOYL5KtbE2ICSkc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188031-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188031: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7bac0a940e905941487c3a2f2f5fb6ee43ff040a
X-Osstest-Versions-That:
    ovmf=fd619ec4608564fe6cf5ba8f9ae986206355861e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 14:42:32 +0000

flight 188031 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188031/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7bac0a940e905941487c3a2f2f5fb6ee43ff040a
baseline version:
 ovmf                 fd619ec4608564fe6cf5ba8f9ae986206355861e

Last test of basis   188023  2024-10-09 06:15:04 Z    0 days
Testing same since   188031  2024-10-09 11:13:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   fd619ec460..7bac0a940e  7bac0a940e905941487c3a2f2f5fb6ee43ff040a -> xen-tested-master

