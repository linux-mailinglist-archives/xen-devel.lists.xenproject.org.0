Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4675E57682C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 22:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368558.599908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCS0y-0003ou-QH; Fri, 15 Jul 2022 20:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368558.599908; Fri, 15 Jul 2022 20:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCS0y-0003m8-M1; Fri, 15 Jul 2022 20:34:20 +0000
Received: by outflank-mailman (input) for mailman id 368558;
 Fri, 15 Jul 2022 20:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCS0w-0003ly-PJ; Fri, 15 Jul 2022 20:34:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCS0w-00056T-Lh; Fri, 15 Jul 2022 20:34:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCS0w-0006z2-7p; Fri, 15 Jul 2022 20:34:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oCS0w-00007P-7N; Fri, 15 Jul 2022 20:34:18 +0000
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
	bh=oCI+LDB8NPljwIykIdWwPtWHKwKqYT/MK9O3xXpFE/c=; b=DT0HvJFYc3ZfM3V5errIZwewBT
	sLjx/HA8im4miHUiTh95ouo8zf2YQOCG3yZfOs1D/s3n1Dzh/ntlwO30cOIggheVWA6IduLXsuUqk
	6sxKgNz5yI5WyztPZU9cbERND5n4r9Yl8gOQ8RKHY7mo211PtjtQ/kQqcCSUAq0bXXh8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171645-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171645: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0d23c447d6f574cbe511414b70df14119099c70f
X-Osstest-Versions-That:
    ovmf=470206ba7f118aaa1153d66689cf3ee4d17051b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Jul 2022 20:34:18 +0000

flight 171645 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171645/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0d23c447d6f574cbe511414b70df14119099c70f
baseline version:
 ovmf                 470206ba7f118aaa1153d66689cf3ee4d17051b7

Last test of basis   171633  2022-07-14 18:41:54 Z    1 days
Testing same since   171645  2022-07-15 18:11:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jagadeesh Ujja <Jagadeesh.Ujja@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   470206ba7f..0d23c447d6  0d23c447d6f574cbe511414b70df14119099c70f -> xen-tested-master

