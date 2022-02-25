Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73BD4C4FD3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 21:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279594.477350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNhPE-0002oW-Ts; Fri, 25 Feb 2022 20:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279594.477350; Fri, 25 Feb 2022 20:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNhPE-0002lz-QM; Fri, 25 Feb 2022 20:41:36 +0000
Received: by outflank-mailman (input) for mailman id 279594;
 Fri, 25 Feb 2022 20:41:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNhPD-0002lp-6V; Fri, 25 Feb 2022 20:41:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNhPD-00022I-4X; Fri, 25 Feb 2022 20:41:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNhPC-0001E5-M3; Fri, 25 Feb 2022 20:41:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nNhPC-0006aK-Ld; Fri, 25 Feb 2022 20:41:34 +0000
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
	bh=GpW5mJCNNbsnxZCoUNucgcY1MVxiBbiu/zssEkHyfgM=; b=vI8jH5WGfj6mJQXV4THlyZyMQM
	aROhYRbLvzMssO3efIWUrHR0mq0D5PQofEvsmvQzTtdUMs2OjrTxTobFkGSSb20h0TWMe9MVXErO1
	TbY1ffnDISzG9g69ljgsHQNR1nRzcVvij5phxZr0H9QogDfKvDjbUQVI+0UlpR5TzDXA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168232: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8
X-Osstest-Versions-That:
    ovmf=b24306f15daa2ff8510b06702114724b33895d3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Feb 2022 20:41:34 +0000

flight 168232 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8
baseline version:
 ovmf                 b24306f15daa2ff8510b06702114724b33895d3c

Last test of basis   168185  2022-02-21 15:43:05 Z    4 days
Testing same since   168232  2022-02-25 16:10:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   b24306f15d..54cddc3ad4  54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 -> xen-tested-master

