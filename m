Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859D9317D5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 17:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759031.1168570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNtF-0003K9-KV; Mon, 15 Jul 2024 15:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759031.1168570; Mon, 15 Jul 2024 15:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNtF-0003Hr-Hu; Mon, 15 Jul 2024 15:45:25 +0000
Received: by outflank-mailman (input) for mailman id 759031;
 Mon, 15 Jul 2024 15:45:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTNtD-0003Hh-V1; Mon, 15 Jul 2024 15:45:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTNtD-0000NM-Ss; Mon, 15 Jul 2024 15:45:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTNtD-0005rw-Ee; Mon, 15 Jul 2024 15:45:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTNtD-00088R-E2; Mon, 15 Jul 2024 15:45:23 +0000
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
	bh=L21Fkud9AvooM/ZfnMTZhHB7m5s0fqJ4lN8pWvs1iGg=; b=K/tIcymxt1dN4dDyx9basl6Ub0
	GaJzQn1H6HTMhLnHStzZVb9OB4guIB9QUhj+ERFc1pxrtpVvFwhMallIxQ33c2efbsXcRd8B3d2hS
	9y6y//6/KHDTtX3a2E9tETP/lYcuCriRM4gqqnt/poFiof1UAmMPjWzjfei4Ej4uknWs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186808-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186808: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5366def8d01d141163a727aeaef61318180deb98
X-Osstest-Versions-That:
    ovmf=8bb9145ad1a5db068f63e3e19b4a532226351b2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jul 2024 15:45:23 +0000

flight 186808 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186808/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5366def8d01d141163a727aeaef61318180deb98
baseline version:
 ovmf                 8bb9145ad1a5db068f63e3e19b4a532226351b2b

Last test of basis   186805  2024-07-15 08:41:18 Z    0 days
Testing same since   186808  2024-07-15 13:43:04 Z    0 days    1 attempts

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
   8bb9145ad1..5366def8d0  5366def8d01d141163a727aeaef61318180deb98 -> xen-tested-master

