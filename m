Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C27177EF
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541545.844413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4G7k-0003iG-2S; Wed, 31 May 2023 07:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541545.844413; Wed, 31 May 2023 07:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4G7j-0003gB-Vb; Wed, 31 May 2023 07:19:59 +0000
Received: by outflank-mailman (input) for mailman id 541545;
 Wed, 31 May 2023 07:19:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4G7i-0003g1-LS; Wed, 31 May 2023 07:19:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4G7i-0005uE-GD; Wed, 31 May 2023 07:19:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4G7i-0008J8-29; Wed, 31 May 2023 07:19:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4G7i-0003jN-1h; Wed, 31 May 2023 07:19:58 +0000
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
	bh=5gLU0rKs/8wDw3R3LxOXT1LHa2Fu1D9F758wFoVa/m4=; b=azIxCIO+gZu0L1sXyEsLRyT9Z5
	rXo7VYJZNRTlIM7hTcN4UUpT0TPTFb2hHPqUwjfTHWBjYh1f6jopWoDyuNTpsgCkhZKdh5xWTWdM8
	AGy69IfZWWW2ThnssaLHLEwL+y7E+Q/RxrNTnE+TRNhmncsPvPVfjsFiK5UHhcp79KOk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181024-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181024: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d8e5d35ede7158ccbb9abf600e65b9aa6e043f74
X-Osstest-Versions-That:
    ovmf=0f9283429dd487deeeb264ee5670551d596fc208
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 May 2023 07:19:58 +0000

flight 181024 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181024/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d8e5d35ede7158ccbb9abf600e65b9aa6e043f74
baseline version:
 ovmf                 0f9283429dd487deeeb264ee5670551d596fc208

Last test of basis   181011  2023-05-30 08:42:06 Z    0 days
Testing same since   181024  2023-05-31 05:10:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   0f9283429d..d8e5d35ede  d8e5d35ede7158ccbb9abf600e65b9aa6e043f74 -> xen-tested-master

