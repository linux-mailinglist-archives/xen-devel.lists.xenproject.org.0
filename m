Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D153479666
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 22:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248918.429344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myKxY-0003FL-CI; Fri, 17 Dec 2021 21:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248918.429344; Fri, 17 Dec 2021 21:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myKxY-0003Cc-9D; Fri, 17 Dec 2021 21:40:12 +0000
Received: by outflank-mailman (input) for mailman id 248918;
 Fri, 17 Dec 2021 21:40:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myKxX-0003CS-FT; Fri, 17 Dec 2021 21:40:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myKxX-0004VV-9s; Fri, 17 Dec 2021 21:40:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myKxW-0006Kw-V9; Fri, 17 Dec 2021 21:40:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1myKxW-0006GP-Ug; Fri, 17 Dec 2021 21:40:10 +0000
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
	bh=384vxr4878ntAZfzG1r5FZS+y52Jp6WM+U+1U3AchNA=; b=XKCeKbmUXnF8QfU/18JPH17Cgu
	4Pkevt4LKU3t/TjrFigGPM+SFC++o9W1ms5lH9ozaJvEfGIeILDZ1g8HzdS9YkEZ3rmAMUdkVJ4rY
	btU0ucLMqsUD7DmhU49UKKybOL55B7yPMlRZfbflwafywKAn97st6xJkYFbsh65DabFk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167465-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167465: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ee1f8262b83dd88b30091e6e81221ff299796099
X-Osstest-Versions-That:
    ovmf=ab5ab2f60348138a4b7b1c95ad6f5d0954fb96f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Dec 2021 21:40:10 +0000

flight 167465 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167465/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ee1f8262b83dd88b30091e6e81221ff299796099
baseline version:
 ovmf                 ab5ab2f60348138a4b7b1c95ad6f5d0954fb96f1

Last test of basis   167463  2021-12-17 15:10:34 Z    0 days
Testing same since   167465  2021-12-17 17:41:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Leif Lindholm <leif@nuviainc.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Shivanshu Goyal <shivanshu3@gmail.com>
  Stefan Berger <stefanb@linux.ibm.com>

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
   ab5ab2f603..ee1f8262b8  ee1f8262b83dd88b30091e6e81221ff299796099 -> xen-tested-master

