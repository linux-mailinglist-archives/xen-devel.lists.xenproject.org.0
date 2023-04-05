Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C174A6D8ADA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 01:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518666.805437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkC7t-0003yt-S5; Wed, 05 Apr 2023 23:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518666.805437; Wed, 05 Apr 2023 23:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkC7t-0003wo-OI; Wed, 05 Apr 2023 23:01:13 +0000
Received: by outflank-mailman (input) for mailman id 518666;
 Wed, 05 Apr 2023 23:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkC7r-0003we-Jg; Wed, 05 Apr 2023 23:01:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkC7r-0000GA-DC; Wed, 05 Apr 2023 23:01:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkC7q-0004Oj-Pg; Wed, 05 Apr 2023 23:01:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pkC7q-0005C9-PI; Wed, 05 Apr 2023 23:01:10 +0000
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
	bh=jc85nSYJ6tQ3khPKcmN4waFRELzzHGSFhiWPVYGOGMM=; b=xH9yNCrZfzHaprp1LSSPt9xDQk
	tkqYgdQ5wj7d1e72SQe5xRWolbhfOGSL/h4gfw7BburUOPBm+Z26gekPaceOXx9HhMJ9sj8OutXdR
	PGJfb57yWyFURwPH77U1ZxjXc5XDMxuGBPXZTC7GYWqACHpST0baX67pcb1PvB7JGgUo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180161-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180161: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2bb693894920e634153275bea60278a9f192a8ef
X-Osstest-Versions-That:
    ovmf=a56ee36c494cb1dfe795259b2cba706ef55b5212
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Apr 2023 23:01:10 +0000

flight 180161 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180161/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2bb693894920e634153275bea60278a9f192a8ef
baseline version:
 ovmf                 a56ee36c494cb1dfe795259b2cba706ef55b5212

Last test of basis   180156  2023-04-05 16:13:44 Z    0 days
Testing same since   180161  2023-04-05 20:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   a56ee36c49..2bb6938949  2bb693894920e634153275bea60278a9f192a8ef -> xen-tested-master

