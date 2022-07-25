Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE857F8EC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 07:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374383.606410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFqDi-00030b-BS; Mon, 25 Jul 2022 05:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374383.606410; Mon, 25 Jul 2022 05:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFqDi-0002xP-82; Mon, 25 Jul 2022 05:01:30 +0000
Received: by outflank-mailman (input) for mailman id 374383;
 Mon, 25 Jul 2022 05:01:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFqDh-0002xF-05; Mon, 25 Jul 2022 05:01:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFqDg-0004dz-TG; Mon, 25 Jul 2022 05:01:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFqDg-0001KY-GZ; Mon, 25 Jul 2022 05:01:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFqDg-0004ZN-Fo; Mon, 25 Jul 2022 05:01:28 +0000
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
	bh=Ap3IKGAoR5qRNsCAgXwTh9asl/UQV8USsJ/93Ey2Q5U=; b=FnwCqL3b9XMrGHlVqRs5YDv/nA
	hf90qNKZU5hTt4kTSmSrRDncjoR/N0sGYj38aHDCRi+Gb1BuW00waTFz+rQ4UkujZFYU9bUkY/kI1
	tt1c8o+Jk+6CV5T87ESTW6+PqCtB2ZrMU6r7A6ezAAxkRkVTL9boD88+3Q9hon3uGKtI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171849-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171849: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8a5782d704cfeb78aafdec1c03685107586f4ee6
X-Osstest-Versions-That:
    ovmf=fca5de51e1fd2f3c5ddbf5974d785f0f6b2f6c38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jul 2022 05:01:28 +0000

flight 171849 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171849/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8a5782d704cfeb78aafdec1c03685107586f4ee6
baseline version:
 ovmf                 fca5de51e1fd2f3c5ddbf5974d785f0f6b2f6c38

Last test of basis   171845  2022-07-24 17:11:43 Z    0 days
Testing same since   171849  2022-07-25 02:42:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   fca5de51e1..8a5782d704  8a5782d704cfeb78aafdec1c03685107586f4ee6 -> xen-tested-master

