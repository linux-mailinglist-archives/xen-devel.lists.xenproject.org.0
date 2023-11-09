Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0AF7E73CC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 22:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629828.982316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1CrC-0003Ro-RE; Thu, 09 Nov 2023 21:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629828.982316; Thu, 09 Nov 2023 21:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1CrC-0003PW-Ni; Thu, 09 Nov 2023 21:46:34 +0000
Received: by outflank-mailman (input) for mailman id 629828;
 Thu, 09 Nov 2023 21:46:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1CrA-0003PL-JB; Thu, 09 Nov 2023 21:46:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1CrA-00015C-Al; Thu, 09 Nov 2023 21:46:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1Cr9-0003U3-RI; Thu, 09 Nov 2023 21:46:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1Cr9-0007o3-Qr; Thu, 09 Nov 2023 21:46:31 +0000
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
	bh=RcgZDDGAgw80J9fmhf+K8TAFZ+A8ASw04kzlU/ZZDcs=; b=NLdFtF3Ijv4C3cBJFBDEZ35sP4
	xT9op/MajOOOHwHOYV4QXoAkt6RAm5DzPVw/CQgHwJecFlXh1rFnSPfiqnAJk3zuuDbjvS/QGlN1z
	vJPlU2N4GQF3YneFMGIXjKdf9ozQAsjtpdlU0rT4NgP6mAPFd2kQFZEai+5JFGTfooto=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183722-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183722: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e077ccff6d0f2e8c3fc44b3e2ab71aff66927c3b
X-Osstest-Versions-That:
    ovmf=8a41004643412b59f669876658bd02b8025bec71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Nov 2023 21:46:31 +0000

flight 183722 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183722/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e077ccff6d0f2e8c3fc44b3e2ab71aff66927c3b
baseline version:
 ovmf                 8a41004643412b59f669876658bd02b8025bec71

Last test of basis   183721  2023-11-09 17:42:40 Z    0 days
Testing same since   183722  2023-11-09 19:41:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yeping Song <quic_yepings@quicinc.com>

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
   8a41004643..e077ccff6d  e077ccff6d0f2e8c3fc44b3e2ab71aff66927c3b -> xen-tested-master

