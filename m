Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37275966CB4
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 00:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786981.1196707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skAQ8-0007ne-6j; Fri, 30 Aug 2024 22:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786981.1196707; Fri, 30 Aug 2024 22:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skAQ8-0007l9-3N; Fri, 30 Aug 2024 22:48:44 +0000
Received: by outflank-mailman (input) for mailman id 786981;
 Fri, 30 Aug 2024 22:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skAQ7-0007kz-5j; Fri, 30 Aug 2024 22:48:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skAQ6-0000xb-Vn; Fri, 30 Aug 2024 22:48:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skAQ6-0001pt-Gw; Fri, 30 Aug 2024 22:48:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skAQ6-0003eF-GU; Fri, 30 Aug 2024 22:48:42 +0000
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
	bh=hRTXuUxS3GyLErSej36rCspqauvOE7HstXLxNwtmsfg=; b=2o9Qe1z7DdFiHAxfuyb7KjKG8x
	GYfCcaJ8HqKZQRPzwnmH+YFxrZmpVgoaRWIw+PSKwLRdjP72JqCIJ6x+g0kYeHy5cmc2iI47yGonL
	NRqr56v2VqzRPTxXZyQbEfUHZbsHFr+I8wCEokyfKUMEiHZmdIqRFM92DThAXqj80egg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187428: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f6092b5e2be20139393a58bf454fb000020a3918
X-Osstest-Versions-That:
    ovmf=0b0b7041cc6cab48479caeb4013f2a77b26b9b1d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 22:48:42 +0000

flight 187428 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187428/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f6092b5e2be20139393a58bf454fb000020a3918
baseline version:
 ovmf                 0b0b7041cc6cab48479caeb4013f2a77b26b9b1d

Last test of basis   187425  2024-08-30 18:11:27 Z    0 days
Testing same since   187428  2024-08-30 20:43:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>
  Wei6 Xu <wei6.xu@intel.com>

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
   0b0b7041cc..f6092b5e2b  f6092b5e2be20139393a58bf454fb000020a3918 -> xen-tested-master

