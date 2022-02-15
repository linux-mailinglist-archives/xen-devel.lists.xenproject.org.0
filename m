Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1AF4B68FC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272904.467905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJurV-00029e-PE; Tue, 15 Feb 2022 10:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272904.467905; Tue, 15 Feb 2022 10:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJurV-00027K-MA; Tue, 15 Feb 2022 10:15:09 +0000
Received: by outflank-mailman (input) for mailman id 272904;
 Tue, 15 Feb 2022 10:15:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJurT-00025Y-HH; Tue, 15 Feb 2022 10:15:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJurT-0006VO-Ez; Tue, 15 Feb 2022 10:15:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nJurT-0006la-3b; Tue, 15 Feb 2022 10:15:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nJurT-0006ba-3B; Tue, 15 Feb 2022 10:15:07 +0000
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
	bh=xeKMV1vCVCCmM84bzkMS6dW9oZWc2+QVAsgQLCt5tRk=; b=XtWE+HYEWaDm0RFijCcVRFCvgh
	oLwnMGCCXCnTB9osffOYDt79b6o0dFPRUMQ+BJ4EvZhgCaWU+rOEApUui55S1N8tMt17O/8sni3jc
	Wky6pIUPPcS6Iu4qDyn/byue9Vk5xZBC+GB2tT91f1Zh808+0QNvnSCuNRrUxUE48wRA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168115-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168115: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1193aa2dfbbd11fa7191d000a0cc166d03a249d2
X-Osstest-Versions-That:
    ovmf=c9b7c6e0cc7da76b74bcdd8c90cef956d5ae971c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Feb 2022 10:15:07 +0000

flight 168115 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168115/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1193aa2dfbbd11fa7191d000a0cc166d03a249d2
baseline version:
 ovmf                 c9b7c6e0cc7da76b74bcdd8c90cef956d5ae971c

Last test of basis   168074  2022-02-10 02:10:25 Z    5 days
Testing same since   168115  2022-02-15 02:41:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   c9b7c6e0cc..1193aa2dfb  1193aa2dfbbd11fa7191d000a0cc166d03a249d2 -> xen-tested-master

