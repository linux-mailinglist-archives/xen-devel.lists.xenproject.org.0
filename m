Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268478E39C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 02:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593270.926237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbV5g-0006EW-75; Wed, 30 Aug 2023 23:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593270.926237; Wed, 30 Aug 2023 23:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbV5g-0006Bb-4L; Wed, 30 Aug 2023 23:59:16 +0000
Received: by outflank-mailman (input) for mailman id 593270;
 Wed, 30 Aug 2023 23:59:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbV5f-0006BR-39; Wed, 30 Aug 2023 23:59:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbV5e-0003Zv-U2; Wed, 30 Aug 2023 23:59:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbV5e-0006fV-JM; Wed, 30 Aug 2023 23:59:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbV5e-0005DQ-H9; Wed, 30 Aug 2023 23:59:14 +0000
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
	bh=v5axI8tuqbnSV1TMkeh0v6qrNhq0iynXr1QVcBE1aiQ=; b=I+UO/ec19kvUgn+BYiKk7HYnRZ
	maaZR6sFhAf0ck2bWIwSP2+vvfJrSy9PqCQHirQ1VAn5AVrL81pcdZuDpfUsd1IdaCwNwP1dmZwy2
	ddq9i0D4iHObqWCKW/hZe4hLmYdSjwR7acm5WD+qjgyKLBHltZsMBMlDgkdx4rfGCfVc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182573-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182573: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5753c3e38f3fde23eec9641cb3c433f443ff99e
X-Osstest-Versions-That:
    ovmf=0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 23:59:14 +0000

flight 182573 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182573/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5753c3e38f3fde23eec9641cb3c433f443ff99e
baseline version:
 ovmf                 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af

Last test of basis   182568  2023-08-30 13:13:53 Z    0 days
Testing same since   182573  2023-08-30 21:40:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   0c4d0b6c8a..c5753c3e38  c5753c3e38f3fde23eec9641cb3c433f443ff99e -> xen-tested-master

