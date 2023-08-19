Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB39078177D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 07:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586968.918328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXEWN-0003Io-VY; Sat, 19 Aug 2023 05:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586968.918328; Sat, 19 Aug 2023 05:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXEWN-0003Ge-SK; Sat, 19 Aug 2023 05:29:11 +0000
Received: by outflank-mailman (input) for mailman id 586968;
 Sat, 19 Aug 2023 05:29:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXEWM-0003GU-8b; Sat, 19 Aug 2023 05:29:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXEWM-0002zB-6z; Sat, 19 Aug 2023 05:29:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qXEWL-0006ho-TR; Sat, 19 Aug 2023 05:29:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qXEWL-0003oF-T7; Sat, 19 Aug 2023 05:29:09 +0000
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
	bh=ochIEo4bXuXjzSJthxZacZBeI83hraBQZZHMVT2E01Y=; b=gxz80p4c1JhN0VWjc2Lz6Onogz
	9x4LD/Ff2yEtTEwiTj782pmd5jPUQmaKhmDL5pcT4swBLILDjaW2o6Tc5zKqjdNBWIqM0pd01BJyP
	aplz5N9tDtJ0omr014+HmqIoIdf/iEomZDi1H3IrLce2N1rCxyV4Hss5aLBSEmZoTqeQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182393: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=00b51e0d78a547dd78119ec44fcc74a01b6f79c8
X-Osstest-Versions-That:
    ovmf=48089f3a7cdf308651234f5bf8d8a301f4b8acf9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Aug 2023 05:29:09 +0000

flight 182393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182393/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 00b51e0d78a547dd78119ec44fcc74a01b6f79c8
baseline version:
 ovmf                 48089f3a7cdf308651234f5bf8d8a301f4b8acf9

Last test of basis   182383  2023-08-18 12:42:20 Z    0 days
Testing same since   182393  2023-08-19 03:40:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   48089f3a7c..00b51e0d78  00b51e0d78a547dd78119ec44fcc74a01b6f79c8 -> xen-tested-master

