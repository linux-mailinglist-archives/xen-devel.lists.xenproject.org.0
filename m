Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C824082EECA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 13:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667745.1039311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPiMU-0007hu-QB; Tue, 16 Jan 2024 12:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667745.1039311; Tue, 16 Jan 2024 12:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPiMU-0007gK-NS; Tue, 16 Jan 2024 12:16:10 +0000
Received: by outflank-mailman (input) for mailman id 667745;
 Tue, 16 Jan 2024 12:16:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPiMS-0007g6-Ty; Tue, 16 Jan 2024 12:16:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPiMS-00004r-Ob; Tue, 16 Jan 2024 12:16:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPiMS-0005xa-E7; Tue, 16 Jan 2024 12:16:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPiMS-0003Jd-Dd; Tue, 16 Jan 2024 12:16:08 +0000
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
	bh=zey7QD2fUGKYWNF3IJZQur3zNf/EAnjbKfzHEwJ8SD8=; b=VyG96ZI6Uwm467c7dCIMZt7RmA
	6lL1oRwOct4wWd6Z4TS+6Hi8oghp5Pkagsu1C/lqEEHRj1r9sOeG9Pi2X9l0a+0d4wZJDY8NArcLP
	t7+YskmhLCGni9o9PsE/Vdi2YtfmIhKo/E9BynDyC8hiAwawIsfpGFzF/0vYox/7EaMk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184371-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184371: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9971b99461e930008e3d35bc0a4a310b6afa57f6
X-Osstest-Versions-That:
    ovmf=a4b8944e27f497b0f4dbfb6aa412decab2874b58
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jan 2024 12:16:08 +0000

flight 184371 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184371/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9971b99461e930008e3d35bc0a4a310b6afa57f6
baseline version:
 ovmf                 a4b8944e27f497b0f4dbfb6aa412decab2874b58

Last test of basis   184369  2024-01-16 07:14:43 Z    0 days
Testing same since   184371  2024-01-16 09:42:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Doug Flick [MSFT] <doug.edk2@gmail.com>
  Douglas Flick [MSFT] <doug.edk2@gmail.com>

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
   a4b8944e27..9971b99461  9971b99461e930008e3d35bc0a4a310b6afa57f6 -> xen-tested-master

