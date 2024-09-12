Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8E97611B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 08:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797014.1206768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sod7B-0001dw-D3; Thu, 12 Sep 2024 06:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797014.1206768; Thu, 12 Sep 2024 06:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sod7B-0001cH-9f; Thu, 12 Sep 2024 06:15:37 +0000
Received: by outflank-mailman (input) for mailman id 797014;
 Thu, 12 Sep 2024 06:15:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sod7A-0001c5-6j; Thu, 12 Sep 2024 06:15:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sod7A-0005HK-56; Thu, 12 Sep 2024 06:15:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sod79-0003Cs-N8; Thu, 12 Sep 2024 06:15:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sod79-0008Na-MQ; Thu, 12 Sep 2024 06:15:35 +0000
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
	bh=teb9awMnUXlx/lPmKFz25u0vAm6HKLYiAe2Vh13pdYA=; b=eWlo492wqsTDsGaIAuPBLGo9Uy
	pJhMEQrNz6jghbKtrSDMuw6D5yHuMAwSZdYw2Vits2qItciSjq375Eby3A0IxZP16gbD7fnh8DidD
	0pIYqiU529ep3oUTI1w+9wWtB5+s0qDFoKujYUC3Vnp5CnGDu0P1DPUs2Ck+tjDIDiBQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187668-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187668: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bacee5113e813520b92babf0fc6f5914cdfc9fab
X-Osstest-Versions-That:
    ovmf=e41e728c1640d5f3c5c24c31e088bf34f2fde197
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 06:15:35 +0000

flight 187668 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187668/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bacee5113e813520b92babf0fc6f5914cdfc9fab
baseline version:
 ovmf                 e41e728c1640d5f3c5c24c31e088bf34f2fde197

Last test of basis   187665  2024-09-11 23:43:17 Z    0 days
Testing same since   187668  2024-09-12 04:43:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   e41e728c16..bacee5113e  bacee5113e813520b92babf0fc6f5914cdfc9fab -> xen-tested-master

