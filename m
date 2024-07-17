Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8E9342AB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 21:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760160.1169873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUATO-0002sl-I0; Wed, 17 Jul 2024 19:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760160.1169873; Wed, 17 Jul 2024 19:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUATO-0002qD-ES; Wed, 17 Jul 2024 19:37:58 +0000
Received: by outflank-mailman (input) for mailman id 760160;
 Wed, 17 Jul 2024 19:37:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUATM-0002q3-JL; Wed, 17 Jul 2024 19:37:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUATM-0000uF-Gs; Wed, 17 Jul 2024 19:37:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUATM-0003DT-8K; Wed, 17 Jul 2024 19:37:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sUATM-0000xj-7t; Wed, 17 Jul 2024 19:37:56 +0000
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
	bh=tfN8TCNDAnXn2PfU9eGc9wfe3XtYf8iCMaSxxVq5Nso=; b=EKhW5HUrV1EAOL6BPYeE977KUI
	PjNqUVEgsu8y1gTRRlzQmfg7eX8Iyu1Nq5Hi7bIBcD8NxRIxKssjxc11t15+0+T+qVaS+MUMPVz7I
	2j8Mw651TnYwOkGt+PSuIiGWxmPo6ar9eg45fH3C6ahpYFYirsW32E7KTypX35GAblYg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186845-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186845: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=11c50d6ca10a1410c2db187078fa7139e29e3042
X-Osstest-Versions-That:
    ovmf=23d3fc056d37039ffe1bd4461492a1e226c779e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 19:37:56 +0000

flight 186845 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186845/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 11c50d6ca10a1410c2db187078fa7139e29e3042
baseline version:
 ovmf                 23d3fc056d37039ffe1bd4461492a1e226c779e5

Last test of basis   186843  2024-07-17 16:11:08 Z    0 days
Testing same since   186845  2024-07-17 18:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   23d3fc056d..11c50d6ca1  11c50d6ca10a1410c2db187078fa7139e29e3042 -> xen-tested-master

