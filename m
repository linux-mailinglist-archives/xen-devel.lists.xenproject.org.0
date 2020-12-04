Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED72CED65
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44629.79979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Yx-0006AT-1k; Fri, 04 Dec 2020 11:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44629.79979; Fri, 04 Dec 2020 11:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Yw-0006A7-U1; Fri, 04 Dec 2020 11:47:46 +0000
Received: by outflank-mailman (input) for mailman id 44629;
 Fri, 04 Dec 2020 11:47:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl9Yv-00069y-4R; Fri, 04 Dec 2020 11:47:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl9Yv-0000J2-1w; Fri, 04 Dec 2020 11:47:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl9Yu-0000x8-Qf; Fri, 04 Dec 2020 11:47:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kl9Yu-0001aE-Q9; Fri, 04 Dec 2020 11:47:44 +0000
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
	bh=7Y3ovhtYrYFlXqK4yDQ6vI7wsedMpQ6vWGNKB46xuuU=; b=uSBSAFQWVN1sWFmZIsZD+kl56M
	XOlH+Zj49XbbsAmGhnCoQrtlA4coGahfdTahN5vyNdq38wCspO6SB9D3jKCX33dw97AzdmKHAfYXY
	t5G7GxMEBmGqjY2vk8jGiI4AIHqYsSW6qZRFi5LWJYNJ2dddxRR4HhoB37C0KvoggrWE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157194-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157194: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=31e8a47b62a4f3dc45d8f9bbf3529a188e867a87
X-Osstest-Versions-That:
    ovmf=6af76adbbfccd31f4f8753fb0ddbbd9f4372f572
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Dec 2020 11:47:44 +0000

flight 157194 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157194/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 31e8a47b62a4f3dc45d8f9bbf3529a188e867a87
baseline version:
 ovmf                 6af76adbbfccd31f4f8753fb0ddbbd9f4372f572

Last test of basis   157191  2020-12-04 01:39:45 Z    0 days
Testing same since   157194  2020-12-04 04:16:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Vitaly Cheptsov <cheptsov@ispras.ru>

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
   6af76adbbf..31e8a47b62  31e8a47b62a4f3dc45d8f9bbf3529a188e867a87 -> xen-tested-master

