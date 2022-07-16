Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B6576BEE
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 06:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368634.600027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCZsK-0003wn-8T; Sat, 16 Jul 2022 04:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368634.600027; Sat, 16 Jul 2022 04:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCZsK-0003uw-4z; Sat, 16 Jul 2022 04:57:56 +0000
Received: by outflank-mailman (input) for mailman id 368634;
 Sat, 16 Jul 2022 04:57:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCZsI-0003um-6r; Sat, 16 Jul 2022 04:57:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCZsH-0004fl-K7; Sat, 16 Jul 2022 04:57:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCZsH-0005K6-5O; Sat, 16 Jul 2022 04:57:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oCZsH-0002xH-4y; Sat, 16 Jul 2022 04:57:53 +0000
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
	bh=EGx8WG0dr2R6/xEY0x1ER8yau7izDenQ/uwNnMqlzSs=; b=jGOCgeWV1uSNh6fN7bav6HBG5t
	9qqszqtO9lBo1wldnbafMMe8D++mCQEXggO320/XB6dE1bbatb9INBVJRpeuUXDIXBZ1d4Gx6uykz
	D2o2LapbYdsFsWOp8BrpuJsiw7IxYRftGyed1F2LCYNdmEjLZPENIhRp8fFMF0FtRStE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171647-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171647: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=07c8e5e59b117f2414d7c928d3f86c85574f1fc3
X-Osstest-Versions-That:
    ovmf=0d23c447d6f574cbe511414b70df14119099c70f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 16 Jul 2022 04:57:53 +0000

flight 171647 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171647/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 07c8e5e59b117f2414d7c928d3f86c85574f1fc3
baseline version:
 ovmf                 0d23c447d6f574cbe511414b70df14119099c70f

Last test of basis   171645  2022-07-15 18:11:45 Z    0 days
Testing same since   171647  2022-07-16 03:10:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sean Rhodes <sean@starlabs.systems>

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
   0d23c447d6..07c8e5e59b  07c8e5e59b117f2414d7c928d3f86c85574f1fc3 -> xen-tested-master

