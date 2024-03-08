Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A3B8763FB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 13:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690268.1076118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZ0D-0001cx-IE; Fri, 08 Mar 2024 12:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690268.1076118; Fri, 08 Mar 2024 12:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZ0D-0001ax-EK; Fri, 08 Mar 2024 12:07:05 +0000
Received: by outflank-mailman (input) for mailman id 690268;
 Fri, 08 Mar 2024 12:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riZ0C-0001an-Bv; Fri, 08 Mar 2024 12:07:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riZ0C-0007pJ-92; Fri, 08 Mar 2024 12:07:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riZ0B-0006hR-SV; Fri, 08 Mar 2024 12:07:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1riZ0B-00025V-Rx; Fri, 08 Mar 2024 12:07:03 +0000
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
	bh=vMHpJtl6OW1ECN5jtiaHiwldid4uSDDTfKFb+HAEKW4=; b=sPWXC2KCsw0NLit9arToPylbUm
	PU/3nwUI0DECoSY+Mq+StKj24oZkNZXPRi2c3E5ZKAQKqHjskHlHBNMHmAEFowDYIJvFLGmgbSwYV
	vWwFLreUKAVAUxVNUOHvbZHg9X/7S9FaoARrVZbkyWLP7lpy6au1PddXiFcp0qcYr1Bc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184943-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184943: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ccf91b518f22102d446f26320110d30ea0fc1fa9
X-Osstest-Versions-That:
    ovmf=e60529df58e43f4d1652f862c6652b61f21e0691
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Mar 2024 12:07:03 +0000

flight 184943 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184943/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ccf91b518f22102d446f26320110d30ea0fc1fa9
baseline version:
 ovmf                 e60529df58e43f4d1652f862c6652b61f21e0691

Last test of basis   184916  2024-03-06 03:43:04 Z    2 days
Testing same since   184943  2024-03-08 09:11:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Laszlo Ersek <lersek@redhat.com>

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
   e60529df58..ccf91b518f  ccf91b518f22102d446f26320110d30ea0fc1fa9 -> xen-tested-master

