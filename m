Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3ED872E9C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 07:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688961.1073798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhkWJ-0001C6-EO; Wed, 06 Mar 2024 06:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688961.1073798; Wed, 06 Mar 2024 06:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhkWJ-00018u-B4; Wed, 06 Mar 2024 06:12:51 +0000
Received: by outflank-mailman (input) for mailman id 688961;
 Wed, 06 Mar 2024 06:12:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhkWI-00018i-Fn; Wed, 06 Mar 2024 06:12:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhkWI-0006W2-D2; Wed, 06 Mar 2024 06:12:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhkWI-0003H8-3q; Wed, 06 Mar 2024 06:12:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rhkWI-0005Xz-3O; Wed, 06 Mar 2024 06:12:50 +0000
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
	bh=AwUgQTmiMu6LHATA021wliZQfKa6GIyTtC5pOeHnKsA=; b=2AOAYoPM5qL61gB0fYfy74v682
	UmxTYOqPyEwFJM0wR+iv+30UbStJayrqbJLu7c7yKm3iPdWo/qehndmx4yc606eqCr3DNkvdTLlW8
	AWJHWaHRvGGLxCMt70fXTtxZCKZnFThcJTsmcgjENshfOsCOy67fstKB1Rsa5un+N0TY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184916-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184916: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e60529df58e43f4d1652f862c6652b61f21e0691
X-Osstest-Versions-That:
    ovmf=2a0d4a2641a706d6b964dea0c95b1e0362194f57
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Mar 2024 06:12:50 +0000

flight 184916 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184916/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e60529df58e43f4d1652f862c6652b61f21e0691
baseline version:
 ovmf                 2a0d4a2641a706d6b964dea0c95b1e0362194f57

Last test of basis   184908  2024-03-05 09:12:54 Z    0 days
Testing same since   184916  2024-03-06 03:43:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dhaval <dhaval@rivosinc.com>
  Dhaval Sharma <dhaval@rivosinc.com>

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
   2a0d4a2641..e60529df58  e60529df58e43f4d1652f862c6652b61f21e0691 -> xen-tested-master

