Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B57D726A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 19:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623139.970667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvhmq-0008NM-Hz; Wed, 25 Oct 2023 17:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623139.970667; Wed, 25 Oct 2023 17:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvhmq-0008La-FG; Wed, 25 Oct 2023 17:35:20 +0000
Received: by outflank-mailman (input) for mailman id 623139;
 Wed, 25 Oct 2023 17:35:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvhmo-0008LO-DO; Wed, 25 Oct 2023 17:35:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvhmo-0008HS-6p; Wed, 25 Oct 2023 17:35:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvhmn-0006Ei-Ow; Wed, 25 Oct 2023 17:35:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvhmn-00065S-OV; Wed, 25 Oct 2023 17:35:17 +0000
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
	bh=ewQ9qYDuSJBzuMXwwHn94Nnvh+lOXzAz06K9jHaojFM=; b=sLj1xdhUdS8zM5KrZ2KZfQXjOo
	yJ5UECIvDc9aLdCJJc42UMOq2UO52kLK8bXB8qKcZH301Eqcg1wcWgV8GfabJKfBCK1YdIGW+e1ck
	6frtI7uRwWZLEgWkRcRW7nd/9mZurMRFC5dYpgK5y+/3Fqanz0CDe3rKzrzfzP6lIdn4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183526-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183526: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=884ef984541c3e346d39e423fea53cf25066ff5a
X-Osstest-Versions-That:
    ovmf=1f21e11168dd6a071a92e41ecdffc7cd6e5f3f02
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Oct 2023 17:35:17 +0000

flight 183526 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183526/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 884ef984541c3e346d39e423fea53cf25066ff5a
baseline version:
 ovmf                 1f21e11168dd6a071a92e41ecdffc7cd6e5f3f02

Last test of basis   183524  2023-10-25 10:14:26 Z    0 days
Testing same since   183526  2023-10-25 14:14:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   1f21e11168..884ef98454  884ef984541c3e346d39e423fea53cf25066ff5a -> xen-tested-master

