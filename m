Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5E9458B1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770219.1181169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmgZ-0003BM-Ft; Fri, 02 Aug 2024 07:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770219.1181169; Fri, 02 Aug 2024 07:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmgZ-00038x-DC; Fri, 02 Aug 2024 07:26:47 +0000
Received: by outflank-mailman (input) for mailman id 770219;
 Fri, 02 Aug 2024 07:26:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZmgY-00038n-NW; Fri, 02 Aug 2024 07:26:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZmgY-00079r-Ik; Fri, 02 Aug 2024 07:26:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZmgY-00074c-6D; Fri, 02 Aug 2024 07:26:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZmgY-0001j6-5n; Fri, 02 Aug 2024 07:26:46 +0000
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
	bh=OwyzZFW2Paq2UVE7OyM/LqC+iv2FKS9XXAjPtr3Kk9M=; b=UF7Wxk5toLysmqYU1a7aCHDPcz
	TJN5oRZOjCaUejMyz6o8OiiX2Nw1U/wvhJN1TVao26cvUIYycshb8idxWXQ9etTemakZZOAi0XPF+
	yeNLr52OOWLvMRDsTAmWOOxORRHkhYbVT4SpZYp82qJxncYDfM7CUIHuhvviGeTgq90I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187117: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=87d3a6272ca8637787813256c1a2435e89e326e2
X-Osstest-Versions-That:
    ovmf=bbee1cc852fa8676ed0b530b1c67c92f32f4f740
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Aug 2024 07:26:46 +0000

flight 187117 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187117/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 87d3a6272ca8637787813256c1a2435e89e326e2
baseline version:
 ovmf                 bbee1cc852fa8676ed0b530b1c67c92f32f4f740

Last test of basis   187114  2024-08-01 21:42:13 Z    0 days
Testing same since   187117  2024-08-02 05:43:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   bbee1cc852..87d3a6272c  87d3a6272ca8637787813256c1a2435e89e326e2 -> xen-tested-master

