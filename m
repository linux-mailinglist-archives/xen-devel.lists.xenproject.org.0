Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C948F83C57A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671586.1045003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT15J-0002lU-Ub; Thu, 25 Jan 2024 14:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671586.1045003; Thu, 25 Jan 2024 14:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT15J-0002iL-RD; Thu, 25 Jan 2024 14:52:05 +0000
Received: by outflank-mailman (input) for mailman id 671586;
 Thu, 25 Jan 2024 14:52:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT15I-0002iB-5x; Thu, 25 Jan 2024 14:52:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT15I-0005Nh-0B; Thu, 25 Jan 2024 14:52:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT15H-0007vm-Gc; Thu, 25 Jan 2024 14:52:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rT15H-00066P-G8; Thu, 25 Jan 2024 14:52:03 +0000
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
	bh=RMXI+99TWCgyioGGTe+SQZZ5tRp+Cv6+XwvH1nuK9KA=; b=p1ZGk+HP76ZZGS8yAHxvvG/laX
	LB/WtdXdpGQN5IVqxvDg0yhTiWY/FYijEV6l/vAyZWX14XPbiJC5Xq8Tt85h/f2EL1p5I0lV+/20x
	gLogC1wdMjhADWqm9m5FyxOx5VxwQh0VBLBAnOdNLmoQsYtoQkI3OKpbbc2FG3n6uP9s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184462-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184462: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=049695a0b1e2a9cbb7c2088a918f285bbb950999
X-Osstest-Versions-That:
    ovmf=ff52277e3796c50511e544219dde0b21edf5c53e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jan 2024 14:52:03 +0000

flight 184462 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184462/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 049695a0b1e2a9cbb7c2088a918f285bbb950999
baseline version:
 ovmf                 ff52277e3796c50511e544219dde0b21edf5c53e

Last test of basis   184453  2024-01-24 16:14:24 Z    0 days
Testing same since   184462  2024-01-25 10:11:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   ff52277e37..049695a0b1  049695a0b1e2a9cbb7c2088a918f285bbb950999 -> xen-tested-master

