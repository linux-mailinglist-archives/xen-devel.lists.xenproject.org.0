Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BBB8C1DF4
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 08:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719515.1122299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5JY0-0007TU-Bh; Fri, 10 May 2024 06:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719515.1122299; Fri, 10 May 2024 06:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5JY0-0007Qf-7x; Fri, 10 May 2024 06:16:00 +0000
Received: by outflank-mailman (input) for mailman id 719515;
 Fri, 10 May 2024 06:15:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5JXy-0007QS-C1; Fri, 10 May 2024 06:15:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5JXy-00068z-79; Fri, 10 May 2024 06:15:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5JXx-0001ga-TQ; Fri, 10 May 2024 06:15:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s5JXx-0001WV-T0; Fri, 10 May 2024 06:15:57 +0000
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
	bh=Gi8zRcE570U/c1bOTb/5k9KWiA72FRj4xEyYIz3Z+Zs=; b=adA6oxKEUJKaFjbsGi/V0XiRMt
	cljuv5QJSnZJEomuNUdvSFGVfH8icHmnJqmBzMbStWAvA0foiedLhYAJDCnP4HXt/trqE+U75EkTR
	meW9Q7MeM95Zm5CX3tJrj7zEGpry6gKjg6cdCPCMYLRwlE6MVzDF8zyfRwTaN63NkTOk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185967-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185967: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4b6ee06a090d956f80b4a92fb9bf03098a372f39
X-Osstest-Versions-That:
    ovmf=3c0b84420f098c5a88281a6be370c2766184c99b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 May 2024 06:15:57 +0000

flight 185967 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185967/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4b6ee06a090d956f80b4a92fb9bf03098a372f39
baseline version:
 ovmf                 3c0b84420f098c5a88281a6be370c2766184c99b

Last test of basis   185963  2024-05-10 01:11:14 Z    0 days
Testing same since   185967  2024-05-10 04:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hongbin1 Zhang <hongbin1.zhang@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   3c0b84420f..4b6ee06a09  4b6ee06a090d956f80b4a92fb9bf03098a372f39 -> xen-tested-master

