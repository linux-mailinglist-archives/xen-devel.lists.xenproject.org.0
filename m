Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C27FE42E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 00:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644322.1005146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8U3p-0003eY-QV; Wed, 29 Nov 2023 23:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644322.1005146; Wed, 29 Nov 2023 23:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8U3p-0003cs-NO; Wed, 29 Nov 2023 23:33:41 +0000
Received: by outflank-mailman (input) for mailman id 644322;
 Wed, 29 Nov 2023 23:33:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8U3o-0003ci-8u; Wed, 29 Nov 2023 23:33:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8U3n-0007Mr-Tn; Wed, 29 Nov 2023 23:33:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8U3n-0006rp-HZ; Wed, 29 Nov 2023 23:33:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8U3n-0000Ac-H1; Wed, 29 Nov 2023 23:33:39 +0000
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
	bh=DwZZR1ZifiyvxPBvHDwOrT/DrMqqqcoIXXUnP6gcU0Q=; b=ZIRggmHBx2CbxTVjXYU7f4Ws9V
	7KN9VrlQmVaT/kfQ9H4XXIiMdrzDBmTQ2xq2bjD48Apuky2IPqiU7rLLeJHJ/8+RPxP53Ftqm6/a3
	79kcyOG/t5JUsc5Q59NqRKoIdabPnIe2oN1CwKu/VjbZSWjbQJ+fSc4fSvV+XZRJmzyA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183942: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f99b5fb936a2a0239d5212948b7104d75d1558c
X-Osstest-Versions-That:
    ovmf=68d506e0d15c0c412142be68ed006c65b641560f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Nov 2023 23:33:39 +0000

flight 183942 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183942/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f99b5fb936a2a0239d5212948b7104d75d1558c
baseline version:
 ovmf                 68d506e0d15c0c412142be68ed006c65b641560f

Last test of basis   183932  2023-11-29 07:41:09 Z    0 days
Testing same since   183942  2023-11-29 21:12:45 Z    0 days    1 attempts

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
   68d506e0d1..4f99b5fb93  4f99b5fb936a2a0239d5212948b7104d75d1558c -> xen-tested-master

