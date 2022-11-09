Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9686236BF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 23:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441156.695486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ostnF-000481-39; Wed, 09 Nov 2022 22:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441156.695486; Wed, 09 Nov 2022 22:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ostnE-00045l-WA; Wed, 09 Nov 2022 22:43:36 +0000
Received: by outflank-mailman (input) for mailman id 441156;
 Wed, 09 Nov 2022 22:43:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ostnD-00045b-5j; Wed, 09 Nov 2022 22:43:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ostnD-000240-3u; Wed, 09 Nov 2022 22:43:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ostnC-0000w6-MZ; Wed, 09 Nov 2022 22:43:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ostnC-0006To-La; Wed, 09 Nov 2022 22:43:34 +0000
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
	bh=BoPoaESqNG3upmpwUNkgPNqrLIOaxlyuifCMoSjZAmc=; b=oHYCVWVR9Cfafg6rLcvmplryNG
	HJqmkrBFWbbEQ7Q2bdq/ihpcUtxnTrZeuoUrETrXYNJPYamy+pRkZg55rFieRWr3D9IEhROtUPd+t
	t+yr/+5bwfbeU/xjG4LvQNY30G14UtBel8c9JLvgpUJILXTvsqDSfPAcEKR/irxVOUx4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174692-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174692: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b0fd3097193d9c6825979e57e78e6278163bfd8e
X-Osstest-Versions-That:
    ovmf=0be81a4d83810cdb018d293bc264f489e7664043
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Nov 2022 22:43:34 +0000

flight 174692 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174692/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b0fd3097193d9c6825979e57e78e6278163bfd8e
baseline version:
 ovmf                 0be81a4d83810cdb018d293bc264f489e7664043

Last test of basis   174681  2022-11-08 20:43:50 Z    1 days
Testing same since   174692  2022-11-09 15:13:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   0be81a4d83..b0fd309719  b0fd3097193d9c6825979e57e78e6278163bfd8e -> xen-tested-master

