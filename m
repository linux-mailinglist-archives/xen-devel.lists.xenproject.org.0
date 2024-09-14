Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF4978E12
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 07:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798557.1208761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spLc8-00045k-J6; Sat, 14 Sep 2024 05:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798557.1208761; Sat, 14 Sep 2024 05:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spLc8-00043P-FQ; Sat, 14 Sep 2024 05:46:32 +0000
Received: by outflank-mailman (input) for mailman id 798557;
 Sat, 14 Sep 2024 05:46:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spLc6-00043F-9g; Sat, 14 Sep 2024 05:46:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spLc6-00086b-7U; Sat, 14 Sep 2024 05:46:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spLc5-00008U-UB; Sat, 14 Sep 2024 05:46:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spLc5-0008Kf-Tl; Sat, 14 Sep 2024 05:46:29 +0000
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
	bh=0nm+sjs7XPfN86Jp5UTTETwATzI1iprZhboj4DOFnkQ=; b=ca6QUGVIb628knxwQmSokGvZ23
	yTn6W/GYbXlFO+Y3FJbeMbEA41cSQxIR2XwHhbij9kMeTwQwX7p8pACH8cTRpSbc71Z5kN59lrQIB
	2mopq3SWb7SROf5HOrkMuHIhSbdoAvIVsiKK+1Y8KtsmMqNLSJTjgkNmzwNtQ9fnoNLE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187703-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187703: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1f32b5a30e473d5e37881c3232f7226dd8311b44
X-Osstest-Versions-That:
    ovmf=121af960e2ac152be2c441837595a4c6e2a143f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 14 Sep 2024 05:46:29 +0000

flight 187703 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187703/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1f32b5a30e473d5e37881c3232f7226dd8311b44
baseline version:
 ovmf                 121af960e2ac152be2c441837595a4c6e2a143f5

Last test of basis   187699  2024-09-13 21:11:48 Z    0 days
Testing same since   187703  2024-09-14 03:44:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
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
   121af960e2..1f32b5a30e  1f32b5a30e473d5e37881c3232f7226dd8311b44 -> xen-tested-master

