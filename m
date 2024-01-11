Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380B82B434
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 18:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666455.1037106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNyzK-0004WE-Oj; Thu, 11 Jan 2024 17:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666455.1037106; Thu, 11 Jan 2024 17:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNyzK-0004TW-LL; Thu, 11 Jan 2024 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 666455;
 Thu, 11 Jan 2024 17:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNyzJ-0004TM-95; Thu, 11 Jan 2024 17:37:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNyzI-0002zu-Vm; Thu, 11 Jan 2024 17:37:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNyzI-0005PY-GL; Thu, 11 Jan 2024 17:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNyzI-0001IT-Fs; Thu, 11 Jan 2024 17:37:04 +0000
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
	bh=waXcL35882ZXEnz9MmFJ/AuX/cvh8coXZosmE2BQ3M4=; b=FIh8UdIUEonFH/kuZf91MLnRAi
	6ixAyz3V8jMSG7iUHHmsZRnv91/kC7F9aS9HpD3vdl4u9r4DyGCfGX9IPCN334u+mbTQ2nbwEamuD
	vnJJxHL91aJnHN58XPTIJLTMLDiVU6VfjipeOMskW5VBY8+QCJ2xUNAkRwIS3SA3pegM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184322-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184322: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0765ee6cd36aef02236ae431a7097624d17762d9
X-Osstest-Versions-That:
    ovmf=ebf378a1ada6d128dbf32aec76b3911895747bbb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jan 2024 17:37:04 +0000

flight 184322 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184322/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0765ee6cd36aef02236ae431a7097624d17762d9
baseline version:
 ovmf                 ebf378a1ada6d128dbf32aec76b3911895747bbb

Last test of basis   184320  2024-01-11 12:12:48 Z    0 days
Testing same since   184322  2024-01-11 15:41:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yang Wang <wangyang@bosc.ac.cn>
  王洋 <wangyang@bosc.ac.cn>

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
   ebf378a1ad..0765ee6cd3  0765ee6cd36aef02236ae431a7097624d17762d9 -> xen-tested-master

