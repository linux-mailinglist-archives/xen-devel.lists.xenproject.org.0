Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE9899609
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701116.1095260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdVd-0007wf-9E; Fri, 05 Apr 2024 06:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701116.1095260; Fri, 05 Apr 2024 06:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdVd-0007v8-5Z; Fri, 05 Apr 2024 06:57:09 +0000
Received: by outflank-mailman (input) for mailman id 701116;
 Fri, 05 Apr 2024 06:57:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsdVb-0007uw-OB; Fri, 05 Apr 2024 06:57:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsdVb-0001KU-I1; Fri, 05 Apr 2024 06:57:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsdVb-00018h-8E; Fri, 05 Apr 2024 06:57:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rsdVb-0004SM-7o; Fri, 05 Apr 2024 06:57:07 +0000
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
	bh=jukx5Li72i8faZZdw0oZX4tM+tPuDLueKy6HyxjHgAc=; b=Gp0uHHUkCvzs03SBc95OTrBPxC
	yFXR46KGtCc4WmEfFDqlGornY1PEbOHBjMv7OfDSupqBBcs/JZL4X2VZZwMnnChCjyhK0XmXhAPWn
	54HYHD2QufbMTNfbzGsdWzFOhCAf3SAfRIa1DeLGjvqfgFK3qL3Avp44G8DlmeCLyiFs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185245-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185245: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8707f835ae355832965508b6be96765660fb1861
X-Osstest-Versions-That:
    ovmf=6fb3cc05dc8742ddbe7ea1038dd0111aed55e799
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Apr 2024 06:57:07 +0000

flight 185245 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185245/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8707f835ae355832965508b6be96765660fb1861
baseline version:
 ovmf                 6fb3cc05dc8742ddbe7ea1038dd0111aed55e799

Last test of basis   185239  2024-04-04 14:44:47 Z    0 days
Testing same since   185245  2024-04-05 05:11:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>

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
   6fb3cc05dc..8707f835ae  8707f835ae355832965508b6be96765660fb1861 -> xen-tested-master

