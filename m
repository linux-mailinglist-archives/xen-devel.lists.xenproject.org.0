Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE819341B2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 19:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760136.1169853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU8mv-0006Wm-QS; Wed, 17 Jul 2024 17:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760136.1169853; Wed, 17 Jul 2024 17:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU8mv-0006T1-NV; Wed, 17 Jul 2024 17:50:01 +0000
Received: by outflank-mailman (input) for mailman id 760136;
 Wed, 17 Jul 2024 17:50:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU8mu-0006Q6-6c; Wed, 17 Jul 2024 17:50:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU8mu-0006yP-4H; Wed, 17 Jul 2024 17:50:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU8mt-0006PR-DF; Wed, 17 Jul 2024 17:49:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sU8mt-00057Q-Ck; Wed, 17 Jul 2024 17:49:59 +0000
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
	bh=n51JFqD0oi+7Ny7rzkt1L0cbJWL/md7Ip566dzepXig=; b=4Gz3nBE6zSfaBmXBNTAsMxpvEo
	/dFnbCzj5cqGs7LYSmNxowzSRSxDGve2iIb8m+G5ZM5AL7cBA2y1QIOqMaaXn1H4kF/EOxPmoOZ7s
	JVnIrNnQdG2BwP+rXnhATxHAEyFpooI/SHuAhbFsBLk+JMOiBVuj+uVreCVMlJloaoDY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186843-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186843: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=23d3fc056d37039ffe1bd4461492a1e226c779e5
X-Osstest-Versions-That:
    ovmf=dd58d1227c102ad4a799002f16b3a8c796d7d7cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 17:49:59 +0000

flight 186843 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186843/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 23d3fc056d37039ffe1bd4461492a1e226c779e5
baseline version:
 ovmf                 dd58d1227c102ad4a799002f16b3a8c796d7d7cc

Last test of basis   186841  2024-07-17 13:11:10 Z    0 days
Testing same since   186843  2024-07-17 16:11:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  levi.yun <yeoreum.yun@arm.com>

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
   dd58d1227c..23d3fc056d  23d3fc056d37039ffe1bd4461492a1e226c779e5 -> xen-tested-master

