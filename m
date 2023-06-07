Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4C725365
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 07:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544352.850075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6lnV-00063n-7t; Wed, 07 Jun 2023 05:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544352.850075; Wed, 07 Jun 2023 05:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6lnV-000615-4d; Wed, 07 Jun 2023 05:33:29 +0000
Received: by outflank-mailman (input) for mailman id 544352;
 Wed, 07 Jun 2023 05:33:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6lnT-00060v-Hy; Wed, 07 Jun 2023 05:33:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6lnT-0001IT-8R; Wed, 07 Jun 2023 05:33:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6lnS-00081K-Ts; Wed, 07 Jun 2023 05:33:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6lnS-0000nz-TW; Wed, 07 Jun 2023 05:33:26 +0000
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
	bh=URGf0J5e/cxDL8pqrI/EiWmzSTGm1WOODK8fjkQe7yA=; b=AlLxJUhb+JR+sN24Q/XFK0adX4
	FYnVUEAgDZlNjK1YfO+ZYZaG6itVGKSEZEth0+bRf6rOw0Q9rG7OMPGaFYkNKJrYY4oDbI/a/ho2L
	C9RDkJ9I4PyBfn+gZ95Pr1UH4+YCLMk+wKVKhLFYu7nLL8uwm7yLlf8YTGcc/fo5BWvM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181234-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181234: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=67fc78d026490ea4c375eeb19724abb40e7be8f2
X-Osstest-Versions-That:
    ovmf=ded0b489af09cde5afa05d74acdb12cd4b4f8394
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 05:33:26 +0000

flight 181234 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181234/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 67fc78d026490ea4c375eeb19724abb40e7be8f2
baseline version:
 ovmf                 ded0b489af09cde5afa05d74acdb12cd4b4f8394

Last test of basis   181225  2023-06-06 21:54:32 Z    0 days
Testing same since   181234  2023-06-07 03:42:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Neo Hsueh <Hong-Chih.Hsueh@amd.com>

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
   ded0b489af..67fc78d026  67fc78d026490ea4c375eeb19724abb40e7be8f2 -> xen-tested-master

