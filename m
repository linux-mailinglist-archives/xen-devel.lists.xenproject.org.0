Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EC675FC3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 22:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482179.747563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzIb-0000hz-26; Fri, 20 Jan 2023 21:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482179.747563; Fri, 20 Jan 2023 21:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzIa-0000ea-UB; Fri, 20 Jan 2023 21:51:48 +0000
Received: by outflank-mailman (input) for mailman id 482179;
 Fri, 20 Jan 2023 21:51:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIzIZ-0000eO-Jw; Fri, 20 Jan 2023 21:51:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIzIZ-0002Ld-IA; Fri, 20 Jan 2023 21:51:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIzIZ-00076d-30; Fri, 20 Jan 2023 21:51:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIzIZ-0004lu-2c; Fri, 20 Jan 2023 21:51:47 +0000
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
	bh=JV5yVRlVfd3FUZsztYq/vHCaQHBq3KfrsuBBDq096yI=; b=kH4X+ZNYFJXeMjxkU3yVsVI9Qy
	/uAdVW6FTSB0Lc6fp2NnTeGASGtRfpATXvuPqF8/FUlVIKRlRNQFFk2/dTRFPYB/0zJIXLtOksLCy
	QaT2FVDy1FIH5eyJGqdG9Vvxvs+Uqa95SQFHiowN3tyYQjO1jCa2rIShjoeevtScWv8c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176004: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7afef31b2b17d1a8d5248eb562352c6d3505ea14
X-Osstest-Versions-That:
    ovmf=bf5678b5802685e07583e3c7ec56d883cbdd5da3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Jan 2023 21:51:47 +0000

flight 176004 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176004/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7afef31b2b17d1a8d5248eb562352c6d3505ea14
baseline version:
 ovmf                 bf5678b5802685e07583e3c7ec56d883cbdd5da3

Last test of basis   176000  2023-01-20 14:10:45 Z    0 days
Testing same since   176004  2023-01-20 17:41:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  devel@edk2.groups.io <devel@edk2.groups.io>
  Jan Engelhardt <jengelh@inai.de>
  Tomas Pilar <quic_tpilar@quicinc.com>
  Tomas Pilar <tomas@quicinc.com>

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
   bf5678b580..7afef31b2b  7afef31b2b17d1a8d5248eb562352c6d3505ea14 -> xen-tested-master

