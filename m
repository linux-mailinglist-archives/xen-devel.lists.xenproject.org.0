Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37050966EFF
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 05:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787087.1196737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skEa6-0005Mx-5X; Sat, 31 Aug 2024 03:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787087.1196737; Sat, 31 Aug 2024 03:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skEa6-0005KS-1Z; Sat, 31 Aug 2024 03:15:18 +0000
Received: by outflank-mailman (input) for mailman id 787087;
 Sat, 31 Aug 2024 03:15:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skEa4-0005KI-EJ; Sat, 31 Aug 2024 03:15:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skEa4-0005hG-A4; Sat, 31 Aug 2024 03:15:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skEa4-0000hi-33; Sat, 31 Aug 2024 03:15:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skEa4-00047z-2X; Sat, 31 Aug 2024 03:15:16 +0000
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
	bh=juPcg3HdKvv7xatuy4LYYjOL3bSUg7OAnkdS4P+ODYE=; b=qrmhAcOIxgJUzqsAUojYeiEJvW
	BH2FYzKOVa90KcAV1dEwDI90ZGY3i59QNk+zfjnimLCfpaLqAP72hRssIyOR1JRRUVWxQxCLtGqFn
	FpBSo4NN9NMbckNZnPMKRnfHlgilxCTiMwvxftaaV5QGBbHlLLbeqHqlsVfpj/Eyekb8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187430-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187430: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5c63e22a9fe268bdfa18d49419cbf43d4ec65b93
X-Osstest-Versions-That:
    ovmf=662272ef41fe848a6c0515de6b43e93d3dc5c672
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 03:15:16 +0000

flight 187430 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187430/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5c63e22a9fe268bdfa18d49419cbf43d4ec65b93
baseline version:
 ovmf                 662272ef41fe848a6c0515de6b43e93d3dc5c672

Last test of basis   187429  2024-08-30 23:15:18 Z    0 days
Testing same since   187430  2024-08-31 01:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dionna Glaze <dionnaglaze@google.com>

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
   662272ef41..5c63e22a9f  5c63e22a9fe268bdfa18d49419cbf43d4ec65b93 -> xen-tested-master

