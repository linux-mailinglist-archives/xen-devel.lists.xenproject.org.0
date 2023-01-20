Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74D9675ADB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 18:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482027.747323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIuvs-0002pz-NQ; Fri, 20 Jan 2023 17:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482027.747323; Fri, 20 Jan 2023 17:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIuvs-0002nS-Js; Fri, 20 Jan 2023 17:12:04 +0000
Received: by outflank-mailman (input) for mailman id 482027;
 Fri, 20 Jan 2023 17:12:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIuvr-0002mz-5V; Fri, 20 Jan 2023 17:12:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIuvr-0003Nm-3B; Fri, 20 Jan 2023 17:12:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIuvq-0006yt-QQ; Fri, 20 Jan 2023 17:12:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIuvq-0000oq-Q1; Fri, 20 Jan 2023 17:12:02 +0000
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
	bh=BYQzHe/KJUriQlr3CawW/UOHH5sj/pjSxmHduOoIRwE=; b=6BPvnxFncxE/4TDbgzJCCnLlsB
	Y200NapPPbgCCilAWlJzXcmf6p2Y979nbdoX6GijHKZhA651AYK8Wv76bx4OoCECSF95S14BcL/lW
	7Kft6v6bmfDSnGULBvZP2wXKmXzwA2EF8myFPO7KowNtmee81SlPnRBUilNuVi972YqU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176000-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176000: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bf5678b5802685e07583e3c7ec56d883cbdd5da3
X-Osstest-Versions-That:
    ovmf=51411435d559c55eaf38c02baf5d76da78bb658d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Jan 2023 17:12:02 +0000

flight 176000 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176000/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bf5678b5802685e07583e3c7ec56d883cbdd5da3
baseline version:
 ovmf                 51411435d559c55eaf38c02baf5d76da78bb658d

Last test of basis   175981  2023-01-19 12:43:49 Z    1 days
Testing same since   176000  2023-01-20 14:10:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@Intel.com>
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
   51411435d5..bf5678b580  bf5678b5802685e07583e3c7ec56d883cbdd5da3 -> xen-tested-master

