Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9B7E721B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 20:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629817.982305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1AXT-0003l4-6E; Thu, 09 Nov 2023 19:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629817.982305; Thu, 09 Nov 2023 19:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1AXT-0003iP-3g; Thu, 09 Nov 2023 19:18:03 +0000
Received: by outflank-mailman (input) for mailman id 629817;
 Thu, 09 Nov 2023 19:18:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1AXR-0003iF-0R; Thu, 09 Nov 2023 19:18:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1AXQ-0005nx-M1; Thu, 09 Nov 2023 19:18:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1AXQ-0008VG-8c; Thu, 09 Nov 2023 19:18:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1AXQ-0000El-8A; Thu, 09 Nov 2023 19:18:00 +0000
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
	bh=BSUeOV2KartOyiOWxO1GBttrCL31QwjO1TMZawJUDb4=; b=jp+Od+MJAhb0DWhlmVXJ9cPsXL
	ZGrscMXonP7N/d2NZwHXv1LnChz+oNOky2nJcpruuZMuauy8RxMpUF/qZCtdnolPP6lALLmZu7Ujl
	6TtohsJAyvfT2+M7KHEGVnxbWysaXnrZ1NttxwmBs42ZuXZb3/00Huaul49P6GXdUVSY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183721: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8a41004643412b59f669876658bd02b8025bec71
X-Osstest-Versions-That:
    ovmf=616f0d503707c2e3fbdbc397ccb16a822f584b03
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Nov 2023 19:18:00 +0000

flight 183721 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183721/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8a41004643412b59f669876658bd02b8025bec71
baseline version:
 ovmf                 616f0d503707c2e3fbdbc397ccb16a822f584b03

Last test of basis   183720  2023-11-09 12:44:23 Z    0 days
Testing same since   183721  2023-11-09 17:42:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>

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
   616f0d5037..8a41004643  8a41004643412b59f669876658bd02b8025bec71 -> xen-tested-master

