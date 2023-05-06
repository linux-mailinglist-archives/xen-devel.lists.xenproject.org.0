Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE976F8F0C
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 08:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530812.826558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvBKV-0005uW-A9; Sat, 06 May 2023 06:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530812.826558; Sat, 06 May 2023 06:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvBKV-0005sC-5P; Sat, 06 May 2023 06:23:39 +0000
Received: by outflank-mailman (input) for mailman id 530812;
 Sat, 06 May 2023 06:23:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvBKU-0005s0-9V; Sat, 06 May 2023 06:23:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvBKT-0006pD-Cy; Sat, 06 May 2023 06:23:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvBKS-0001tB-Qs; Sat, 06 May 2023 06:23:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pvBKS-0006ss-QI; Sat, 06 May 2023 06:23:36 +0000
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
	bh=vbP5B3N524j7AcPgLpPl9qdVs/36ZP1Nla6Fb2xdiss=; b=KSPxPeNZZ8mnN+4ZM6YkYE2AFT
	P/FQxDwQPVd6ktgpSoL60Br9cRqGK0IU7UhVFn9pr1ltupBByy3yzlF0qL+/VTNuTutHCV+vDYYbB
	kJiCVbxCcsz3t5pyCHvFqwVJQtESqwH8mHW4ZY9239wXDu5Km9fTb1m8HT33WDB570vY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180551-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180551: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eabaeb0613c0b459db950ab655f99ada9389d0cf
X-Osstest-Versions-That:
    ovmf=b65c0eed6bc028388d790fe4e30a76770ebb46c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 May 2023 06:23:36 +0000

flight 180551 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180551/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eabaeb0613c0b459db950ab655f99ada9389d0cf
baseline version:
 ovmf                 b65c0eed6bc028388d790fe4e30a76770ebb46c4

Last test of basis   180545  2023-05-05 14:12:15 Z    0 days
Testing same since   180551  2023-05-06 04:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   b65c0eed6b..eabaeb0613  eabaeb0613c0b459db950ab655f99ada9389d0cf -> xen-tested-master

