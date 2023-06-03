Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65389720DE6
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jun 2023 07:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543289.848151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5JWg-0005up-8k; Sat, 03 Jun 2023 05:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543289.848151; Sat, 03 Jun 2023 05:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5JWg-0005sE-5D; Sat, 03 Jun 2023 05:10:06 +0000
Received: by outflank-mailman (input) for mailman id 543289;
 Sat, 03 Jun 2023 05:10:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5JWe-0005im-KG; Sat, 03 Jun 2023 05:10:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5JWe-0000Gp-DM; Sat, 03 Jun 2023 05:10:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q5JWe-0003BF-2n; Sat, 03 Jun 2023 05:10:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q5JWe-0003r5-2J; Sat, 03 Jun 2023 05:10:04 +0000
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
	bh=K10inrCbnUE+RpZxxERPJgiUy0o2DHXFhw1vD73YMgs=; b=OS/tWKQ+axtbEYjGH4Xn9lxXUh
	ycl+WA4i1gTjWEawvyhl2p+bUIjc7BG1f68dVnjbn4e2tzEvL5iZ/XD+fYUHd1WtnY4qtmAq81VBm
	9cKGmFdDIqS5L2pXN8IoYBPw2Ma8xPPFRplUjTugTxOFslvtCS6EmI6YIQ/vzQ1SOelc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181127-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181127: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c1dd400a13d1a5e862809c55f6760ba3a944a609
X-Osstest-Versions-That:
    ovmf=8fbf857a0b42697c22ec03abda9a2101b2870812
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Jun 2023 05:10:04 +0000

flight 181127 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181127/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c1dd400a13d1a5e862809c55f6760ba3a944a609
baseline version:
 ovmf                 8fbf857a0b42697c22ec03abda9a2101b2870812

Last test of basis   181117  2023-06-02 16:44:01 Z    0 days
Testing same since   181127  2023-06-03 00:10:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Mikolaj Lisik <lisik@google.com>
  Mikolaj Lisik via groups.io <lisik=google.com@groups.io>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   8fbf857a0b..c1dd400a13  c1dd400a13d1a5e862809c55f6760ba3a944a609 -> xen-tested-master

