Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663816EA168
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 04:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524408.815314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppg5h-00059s-L9; Fri, 21 Apr 2023 02:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524408.815314; Fri, 21 Apr 2023 02:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppg5h-00058V-I5; Fri, 21 Apr 2023 02:01:37 +0000
Received: by outflank-mailman (input) for mailman id 524408;
 Fri, 21 Apr 2023 02:01:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppg5f-00058J-EG; Fri, 21 Apr 2023 02:01:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppg5f-00073O-7Y; Fri, 21 Apr 2023 02:01:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppg5e-0005eC-Pt; Fri, 21 Apr 2023 02:01:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppg5e-0007Do-PR; Fri, 21 Apr 2023 02:01:34 +0000
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
	bh=RBSdCcjUAwlzjkvlr33GAN+R88nZ/kmhjnWhQGocF3Y=; b=HMQaqsZAUTWZi6FAohj5mxZwzq
	jZ1U70wcsA28fSpl/2d2IklGzZmXhjev/4igCNDYcB15O9x7vuN4T+tVAUsFUjeCCxAZXtkc4P/5v
	suJOh0Pv46BjocY7xFtIw97m/cgk7pIIJ54cNQFISvtAEydi82tR8i4sJxI1KMG6+5Es=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180346-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180346: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3163f34a42a5dacaf63499e69bf0fefdc409d89e
X-Osstest-Versions-That:
    ovmf=9bf79303ae5cb4d0e14ed7a219107b53e2ecdcd0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Apr 2023 02:01:34 +0000

flight 180346 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180346/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3163f34a42a5dacaf63499e69bf0fefdc409d89e
baseline version:
 ovmf                 9bf79303ae5cb4d0e14ed7a219107b53e2ecdcd0

Last test of basis   180343  2023-04-20 21:12:04 Z    0 days
Testing same since   180346  2023-04-20 23:40:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   9bf79303ae..3163f34a42  3163f34a42a5dacaf63499e69bf0fefdc409d89e -> xen-tested-master

