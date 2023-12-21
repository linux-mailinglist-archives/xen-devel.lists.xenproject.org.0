Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCC81B6B3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 13:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658874.1028302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIdN-0002Ih-92; Thu, 21 Dec 2023 12:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658874.1028302; Thu, 21 Dec 2023 12:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIdN-0002Fx-5M; Thu, 21 Dec 2023 12:58:41 +0000
Received: by outflank-mailman (input) for mailman id 658874;
 Thu, 21 Dec 2023 12:58:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGIdK-0002Fm-Ui; Thu, 21 Dec 2023 12:58:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGIdK-0008R2-JJ; Thu, 21 Dec 2023 12:58:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rGIdK-0000nZ-8V; Thu, 21 Dec 2023 12:58:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rGIdK-0004Jw-86; Thu, 21 Dec 2023 12:58:38 +0000
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
	bh=Bqf+3T/4qG5qc8HkUkG+VQfBAlM8wmLqshRp77x76ek=; b=VztJSIOgvNFM8SzES0QOgppIAn
	KdwK1Izh/DthEJPTRgFWL5Oqc0sbE+pgxBr0Icutcp0nZFW7NqsTepo34Jh5jtkU6CP2XuwJuJaEH
	nAATQARPYNY3/Yn5AaQBrMzFsc7VqC0qb/rdOoSfBln6BZyiyefj5WeiNckpd2HyA4Zc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184202-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184202: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5d533bbc27732a421e3bf35c5af77782b8a85e6f
X-Osstest-Versions-That:
    ovmf=9f0061a03b61d282fbc0ba5be22155d06a5e64a1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Dec 2023 12:58:38 +0000

flight 184202 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184202/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5d533bbc27732a421e3bf35c5af77782b8a85e6f
baseline version:
 ovmf                 9f0061a03b61d282fbc0ba5be22155d06a5e64a1

Last test of basis   184198  2023-12-21 01:57:56 Z    0 days
Testing same since   184202  2023-12-21 10:12:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jake Garver <jake@nvidia.com>

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
   9f0061a03b..5d533bbc27  5d533bbc27732a421e3bf35c5af77782b8a85e6f -> xen-tested-master

