Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421583A725
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670921.1044007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSan4-0000Zg-7k; Wed, 24 Jan 2024 10:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670921.1044007; Wed, 24 Jan 2024 10:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSan4-0000WR-3K; Wed, 24 Jan 2024 10:47:30 +0000
Received: by outflank-mailman (input) for mailman id 670921;
 Wed, 24 Jan 2024 10:47:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSan2-0000WG-F7; Wed, 24 Jan 2024 10:47:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSan2-0001xh-8g; Wed, 24 Jan 2024 10:47:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSan1-0004Uw-Tk; Wed, 24 Jan 2024 10:47:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSan1-0002Pr-TH; Wed, 24 Jan 2024 10:47:27 +0000
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
	bh=fbflBwBIAoib9i96yTpfFjWRK6DPmnWy66tRZ6b1PZ4=; b=B1ehYm+15Hc7P+pgQjZkZDAIms
	RcXCnQKuJd+ElKtxoMzUAo3/29jnu7MguNqkKm0DirBnMgRAq6VrE7WzTopye3a9DaCg9qSzlZJwK
	rm7TLLkLauvLVTjv8WRQZcTQb+CBP1RbayKhVUqNPmJqBMGi2hBOYK1k56yaueW6NrrE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184448-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184448: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=97e1ef87300cdf01f5b21cd4c5ee1d8df6ae1f39
X-Osstest-Versions-That:
    ovmf=d24187a81f724fc2af4f739ad92a9b158c9254df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jan 2024 10:47:27 +0000

flight 184448 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184448/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 97e1ef87300cdf01f5b21cd4c5ee1d8df6ae1f39
baseline version:
 ovmf                 d24187a81f724fc2af4f739ad92a9b158c9254df

Last test of basis   184446  2024-01-24 06:41:04 Z    0 days
Testing same since   184448  2024-01-24 08:42:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  devel@edk2.groups.io <devel@edk2.groups.io>
  Jeff Brasen <jbrasen@nvidia.com>

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
   d24187a81f..97e1ef8730  97e1ef87300cdf01f5b21cd4c5ee1d8df6ae1f39 -> xen-tested-master

