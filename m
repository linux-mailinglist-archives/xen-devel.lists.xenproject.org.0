Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E083C7987B1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 15:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597977.932441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qebMv-00056C-8O; Fri, 08 Sep 2023 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597977.932441; Fri, 08 Sep 2023 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qebMv-00053p-5A; Fri, 08 Sep 2023 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 597977;
 Fri, 08 Sep 2023 13:17:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qebMt-00053f-M4; Fri, 08 Sep 2023 13:17:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qebMt-0004Jl-HU; Fri, 08 Sep 2023 13:17:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qebMt-0006nF-8c; Fri, 08 Sep 2023 13:17:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qebMt-0000Ic-8F; Fri, 08 Sep 2023 13:17:51 +0000
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
	bh=ChjxZdjk1wHCo0gV6QXHZMIEd9l7jwSxji3ZpN+yjRs=; b=QkmJ4iZuVvus6nljAKmj2iQu1q
	Lo9tTeIJmf/DjJ7AGAqESLIfr8J+4z3QfoGv5Sp2sqPifd3GuyYbnnXEok0tt+F/r9Gvo5v2KpReS
	ZnHkSneixvQR9arRWw8IsTo9YzZSx9O6LQINdDG/NboTnjsWkBs6yVeeg7eGabra7v4o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182740-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182740: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff7ddc02b273f9159ef46fdb67d99062f8e598d9
X-Osstest-Versions-That:
    ovmf=2ce5ae43c2166984d20341993c4b9dbb337aad79
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Sep 2023 13:17:51 +0000

flight 182740 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182740/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff7ddc02b273f9159ef46fdb67d99062f8e598d9
baseline version:
 ovmf                 2ce5ae43c2166984d20341993c4b9dbb337aad79

Last test of basis   182732  2023-09-08 06:40:46 Z    0 days
Testing same since   182740  2023-09-08 10:15:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Jiewen Yao <Jiewen.yao@intel.com>
  Kun Qin <kun.qin@microsoft.com>
  Pierre Gondois <pierre.gondois@arm.com>

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
   2ce5ae43c2..ff7ddc02b2  ff7ddc02b273f9159ef46fdb67d99062f8e598d9 -> xen-tested-master

