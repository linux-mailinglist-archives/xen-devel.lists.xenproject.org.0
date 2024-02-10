Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80585014B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Feb 2024 01:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678879.1056457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYbW3-0000i6-9K; Sat, 10 Feb 2024 00:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678879.1056457; Sat, 10 Feb 2024 00:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYbW3-0000gG-69; Sat, 10 Feb 2024 00:46:47 +0000
Received: by outflank-mailman (input) for mailman id 678879;
 Sat, 10 Feb 2024 00:46:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYbW1-0000g6-Aq; Sat, 10 Feb 2024 00:46:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYbW1-00084y-3C; Sat, 10 Feb 2024 00:46:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYbW0-0004mB-JY; Sat, 10 Feb 2024 00:46:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rYbW0-0005Vx-J1; Sat, 10 Feb 2024 00:46:44 +0000
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
	bh=I80YNzDUd2StXaA8rsKQfb0uUAipbdB9Kw55m18BVow=; b=F3gzu3z654MRFxBJoWepcI1cIK
	cCcSihIXiOoPY9awcYEybf4XHgVA1lFDqrXIAWSfvbt47pUy2/9I3MtPBJ7rtVp91KL1Qwqnbjz/a
	X/icNbPUQIF3NOLy6ARuFJJ9WK/lEIMF3Y2d+SsPjWFgGVE+uwCPaArDHfaltgsOl+E4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184639-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184639: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8801c75b4d77c2e6e06b3ddc8560e0db590f6342
X-Osstest-Versions-That:
    ovmf=dcf2e39dce00a5978f1c1a53a0fce04d0fdc9a3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Feb 2024 00:46:44 +0000

flight 184639 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184639/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8801c75b4d77c2e6e06b3ddc8560e0db590f6342
baseline version:
 ovmf                 dcf2e39dce00a5978f1c1a53a0fce04d0fdc9a3c

Last test of basis   184637  2024-02-09 18:41:14 Z    0 days
Testing same since   184639  2024-02-09 22:41:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Suqiang Ren <suqiangx.ren@intel.com>

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
   dcf2e39dce..8801c75b4d  8801c75b4d77c2e6e06b3ddc8560e0db590f6342 -> xen-tested-master

