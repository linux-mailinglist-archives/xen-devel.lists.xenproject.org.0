Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8B90DE90
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 23:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743316.1150201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJgYV-0007d5-9r; Tue, 18 Jun 2024 21:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743316.1150201; Tue, 18 Jun 2024 21:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJgYV-0007aD-4o; Tue, 18 Jun 2024 21:39:55 +0000
Received: by outflank-mailman (input) for mailman id 743316;
 Tue, 18 Jun 2024 21:39:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJgYT-0007a3-Py; Tue, 18 Jun 2024 21:39:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJgYT-00033b-I3; Tue, 18 Jun 2024 21:39:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJgYT-0003Me-8k; Tue, 18 Jun 2024 21:39:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJgYT-0000bc-8F; Tue, 18 Jun 2024 21:39:53 +0000
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
	bh=orW34woupyhSLZynTNM1gAMSndXNrGnCY9MSTKLeSTQ=; b=BKXHReNrkp/y6bUOsKrmkc8lIs
	DRcAwLoxj8+JyScrSBzxkWiaXk1YzgNG1x2CSlpCMZ04qPYNZv/0l3owlnvO6YgLHf1yXql5h6bWP
	kpVFKSV3APf7j2Bugmk0DjVkkt2C8ROPQ+O6jGANG6ozr1Fq2a3quSPDznDNqiSKPssA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186399-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186399: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ffce430d2b65d508a1604dc986ba16db3583943d
X-Osstest-Versions-That:
    ovmf=bfda27ddc89502190c79f74fc20cb81458d58449
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 21:39:53 +0000

flight 186399 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186399/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ffce430d2b65d508a1604dc986ba16db3583943d
baseline version:
 ovmf                 bfda27ddc89502190c79f74fc20cb81458d58449

Last test of basis   186397  2024-06-18 15:12:52 Z    0 days
Testing same since   186399  2024-06-18 19:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <c.koehne@beckhoff.com>

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
   bfda27ddc8..ffce430d2b  ffce430d2b65d508a1604dc986ba16db3583943d -> xen-tested-master

