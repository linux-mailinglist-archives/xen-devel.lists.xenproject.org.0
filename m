Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE28BFAFE
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 12:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718661.1121144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4eYd-0001M5-C0; Wed, 08 May 2024 10:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718661.1121144; Wed, 08 May 2024 10:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4eYd-0001KX-8r; Wed, 08 May 2024 10:29:55 +0000
Received: by outflank-mailman (input) for mailman id 718661;
 Wed, 08 May 2024 10:29:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4eYc-0001KL-1b; Wed, 08 May 2024 10:29:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4eYb-0005e1-Ub; Wed, 08 May 2024 10:29:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4eYb-0007J7-LC; Wed, 08 May 2024 10:29:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s4eYb-00025Y-Kj; Wed, 08 May 2024 10:29:53 +0000
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
	bh=w9tJC/nvo2KCot4gEpkFduiMvQSzr/PeHQdu2HZVUn0=; b=GxBmqH4OdjNPCnmK4wqe33E1F3
	GgJiOXhek/HtApuypmjo8pdCtyaWPB9UwYIKemaL19QrKeUjO3e5rJwW/ktj6hGdDcogAEzc7/1sF
	f7Iaqwfzj2pnypONv3qNKernStNbXgq6O91LqzHmC9IzNxElligYDBWPwEgmaAnYICsw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185945-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185945: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5cbfb93abea4410be396b5230da4ad2f6c972788
X-Osstest-Versions-That:
    ovmf=952b5cf94c8727b65e04d3d507c0134743be2a66
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 May 2024 10:29:53 +0000

flight 185945 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185945/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5cbfb93abea4410be396b5230da4ad2f6c972788
baseline version:
 ovmf                 952b5cf94c8727b65e04d3d507c0134743be2a66

Last test of basis   185944  2024-05-08 05:11:09 Z    0 days
Testing same since   185945  2024-05-08 08:44:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   952b5cf94c..5cbfb93abe  5cbfb93abea4410be396b5230da4ad2f6c972788 -> xen-tested-master

