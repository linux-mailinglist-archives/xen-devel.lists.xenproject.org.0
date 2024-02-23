Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8359861541
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 16:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684875.1065064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXBM-0003me-1s; Fri, 23 Feb 2024 15:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684875.1065064; Fri, 23 Feb 2024 15:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXBL-0003kM-Up; Fri, 23 Feb 2024 15:09:47 +0000
Received: by outflank-mailman (input) for mailman id 684875;
 Fri, 23 Feb 2024 15:09:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdXBK-0003kC-IW; Fri, 23 Feb 2024 15:09:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdXBK-0004RK-B8; Fri, 23 Feb 2024 15:09:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdXBK-000247-25; Fri, 23 Feb 2024 15:09:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rdXBK-0007qM-1d; Fri, 23 Feb 2024 15:09:46 +0000
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
	bh=0Q8LwGneS4af054MEmDQVuymhYmqAg9qorqzY6vVAi0=; b=PhW7+q/dhWHFMHzDCOZIy8W0rZ
	LQ2O2HITibKAc+yKR82ti1qxv/08de8oDQ4CGs98iOibcN+4l1+nChVSBVOh9L4yMvFEnM/NjeSA0
	hzF/HYHkSy4e06KNfACBd9hpbTo2MTDw2dA7gs+6l8bTK1TNFRrJgO+AqiAluSgPMIXc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184736-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184736: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=11ad164bcea6b0ed3628d595090f84892c367086
X-Osstest-Versions-That:
    ovmf=8ccd63d14da5678a4b95df0aa954a2378355af9b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Feb 2024 15:09:46 +0000

flight 184736 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184736/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 11ad164bcea6b0ed3628d595090f84892c367086
baseline version:
 ovmf                 8ccd63d14da5678a4b95df0aa954a2378355af9b

Last test of basis   184724  2024-02-22 03:43:20 Z    1 days
Testing same since   184736  2024-02-23 13:13:11 Z    0 days    1 attempts

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
   8ccd63d14d..11ad164bce  11ad164bcea6b0ed3628d595090f84892c367086 -> xen-tested-master

