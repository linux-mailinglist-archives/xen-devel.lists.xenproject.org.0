Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026C6F93E9
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 22:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530977.826691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvOD5-0000r3-Bp; Sat, 06 May 2023 20:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530977.826691; Sat, 06 May 2023 20:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvOD5-0000oQ-8g; Sat, 06 May 2023 20:08:51 +0000
Received: by outflank-mailman (input) for mailman id 530977;
 Sat, 06 May 2023 20:08:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvOD4-0000oG-IR; Sat, 06 May 2023 20:08:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvOD4-0006mF-HX; Sat, 06 May 2023 20:08:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvOD4-0007vW-5y; Sat, 06 May 2023 20:08:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pvOD4-0005vL-5T; Sat, 06 May 2023 20:08:50 +0000
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
	bh=e4q7PLn1wtlnoOg3zz0Xc63GOAkt76WegN9PZoCrfnI=; b=pafL3zMv2MjWaBFAELP7ZSVngT
	NPXTWsNu5G/+Ekxe/08D6HVXWLxw4j49E9A6QjqeUwhbTU1Zm5q7DDJjABSv3YQrgOYCkhLo7yq83
	bSWgVcAsYXvkRQsmXmFyyJPGTl5f7vWG8y5Qn11dIbMgO2ZUeT7vpNwKrE3s6hZWWICQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180561-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180561: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=66494e532450c1205be93015740580c1e7b8877a
X-Osstest-Versions-That:
    ovmf=eabaeb0613c0b459db950ab655f99ada9389d0cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 May 2023 20:08:50 +0000

flight 180561 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180561/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 66494e532450c1205be93015740580c1e7b8877a
baseline version:
 ovmf                 eabaeb0613c0b459db950ab655f99ada9389d0cf

Last test of basis   180551  2023-05-06 04:10:42 Z    0 days
Testing same since   180561  2023-05-06 18:10:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   eabaeb0613..66494e5324  66494e532450c1205be93015740580c1e7b8877a -> xen-tested-master

