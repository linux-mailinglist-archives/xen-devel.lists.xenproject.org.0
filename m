Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E578F548
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 00:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594138.927357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbppn-0003m0-Q9; Thu, 31 Aug 2023 22:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594138.927357; Thu, 31 Aug 2023 22:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbppn-0003kH-Mx; Thu, 31 Aug 2023 22:08:15 +0000
Received: by outflank-mailman (input) for mailman id 594138;
 Thu, 31 Aug 2023 22:08:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbppm-0003k7-LK; Thu, 31 Aug 2023 22:08:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbppm-0004Ll-CW; Thu, 31 Aug 2023 22:08:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbppl-0007gW-Tu; Thu, 31 Aug 2023 22:08:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbppl-0000iO-TP; Thu, 31 Aug 2023 22:08:13 +0000
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
	bh=PSktcP7IZ8v6fgU3sXXWuhoQ2embf6mP319yl4fzkqI=; b=jxkpcEROO6yGV+QW6azqiHBw8U
	+snm4lFLB0nOie51xlXY7z87YFb4HpzAgVE9agKtWYmvMtnnSITG6QSjVWzICZTmICDVjRORF9rml
	Up+zcOCvOF8Q6WqnVob+8g8eq89UUyWLjNpG9OBokHGOsQrHr97JEUr8tnx2JLeAFfl0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182586-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182586: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=beafabdae49c873adecdb7511dbebe9d4ff5c8f0
X-Osstest-Versions-That:
    ovmf=4c8144dd665619731b6c3c19f4f1ae664b69fa4b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Aug 2023 22:08:13 +0000

flight 182586 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182586/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 beafabdae49c873adecdb7511dbebe9d4ff5c8f0
baseline version:
 ovmf                 4c8144dd665619731b6c3c19f4f1ae664b69fa4b

Last test of basis   182582  2023-08-31 13:42:21 Z    0 days
Testing same since   182586  2023-08-31 19:42:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   4c8144dd66..beafabdae4  beafabdae49c873adecdb7511dbebe9d4ff5c8f0 -> xen-tested-master

