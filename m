Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF149543D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 19:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259158.447133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAcEr-00054L-UX; Thu, 20 Jan 2022 18:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259158.447133; Thu, 20 Jan 2022 18:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAcEr-000526-Qx; Thu, 20 Jan 2022 18:32:49 +0000
Received: by outflank-mailman (input) for mailman id 259158;
 Thu, 20 Jan 2022 18:32:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAcEq-00051w-MN; Thu, 20 Jan 2022 18:32:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAcEq-0006xQ-JM; Thu, 20 Jan 2022 18:32:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAcEq-0004i5-AL; Thu, 20 Jan 2022 18:32:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nAcEq-0001FT-9v; Thu, 20 Jan 2022 18:32:48 +0000
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
	bh=xrjHfx+xXDJeCA7dphV4LOIxqiCZN3fPA8Eu7RzJHU4=; b=e/wqt3EsrFxAqsMXAVkr3LDceK
	RVY6ue5cYUQsh+PW5JXD1f726OqRmEtPUYlBag5S1M4NdtLSl/qOWeID8l4Rhk5U+JX/1+0aJ9Dsj
	0/3zbVatPHCYlLfqHXJ9hHZZsLhXWwmb5pMLmJbyyI8RFsyCWzRtmvswhJN93mFmCU6Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167760-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167760: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7709988dd8f9a69eea456869f468120f1f0fc7cb
X-Osstest-Versions-That:
    ovmf=772c5bb8dcb9841f1839dec02f33324e31b36d25
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jan 2022 18:32:48 +0000

flight 167760 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167760/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7709988dd8f9a69eea456869f468120f1f0fc7cb
baseline version:
 ovmf                 772c5bb8dcb9841f1839dec02f33324e31b36d25

Last test of basis   167754  2022-01-20 01:56:46 Z    0 days
Testing same since   167760  2022-01-20 13:43:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>

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
   772c5bb8dc..7709988dd8  7709988dd8f9a69eea456869f468120f1f0fc7cb -> xen-tested-master

