Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B252813A05
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 19:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654725.1021986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDqVQ-0006Ms-Cc; Thu, 14 Dec 2023 18:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654725.1021986; Thu, 14 Dec 2023 18:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDqVQ-0006K7-9X; Thu, 14 Dec 2023 18:32:20 +0000
Received: by outflank-mailman (input) for mailman id 654725;
 Thu, 14 Dec 2023 18:32:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDqVO-0006Jx-Nc; Thu, 14 Dec 2023 18:32:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDqVO-0001hT-Ah; Thu, 14 Dec 2023 18:32:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDqVO-0007xd-2T; Thu, 14 Dec 2023 18:32:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDqVO-0004rK-1w; Thu, 14 Dec 2023 18:32:18 +0000
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
	bh=QyrLVoyFKLUm5oVIiLz9sMXcfl4Y4FSBOj+GEmyAKng=; b=P0jU26XOJF4ER45lQ2fDpAJSeQ
	D+dfDAeMVj8gRRg6BSVTmiU8Vd0cKNObjJPPG5HuJXIEbN+nXcLNlerTdgOnvYgJKpwI6H0AsSfIl
	veDkI70kjvMta+/ghZb/I7KHBVm37FjZo0y839ZBAaGJN7npr17wBcrCIVO7bIwuzLBM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184138-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184138: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7f5e75895bd6bbfbde191fb8458d324033f76c57
X-Osstest-Versions-That:
    ovmf=59a952d9ab007fda9f7a66418782c8257d3c917f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Dec 2023 18:32:18 +0000

flight 184138 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184138/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f5e75895bd6bbfbde191fb8458d324033f76c57
baseline version:
 ovmf                 59a952d9ab007fda9f7a66418782c8257d3c917f

Last test of basis   184136  2023-12-14 14:42:44 Z    0 days
Testing same since   184138  2023-12-14 16:44:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   59a952d9ab..7f5e75895b  7f5e75895bd6bbfbde191fb8458d324033f76c57 -> xen-tested-master

