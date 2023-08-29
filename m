Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2378BD1B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 05:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591917.924499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaox0-0006Ob-EX; Tue, 29 Aug 2023 02:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591917.924499; Tue, 29 Aug 2023 02:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaox0-0006MS-BV; Tue, 29 Aug 2023 02:59:30 +0000
Received: by outflank-mailman (input) for mailman id 591917;
 Tue, 29 Aug 2023 02:59:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaowy-0006MI-Qh; Tue, 29 Aug 2023 02:59:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaowy-0004mA-Lj; Tue, 29 Aug 2023 02:59:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaowy-00044M-4B; Tue, 29 Aug 2023 02:59:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qaowy-0004bF-3c; Tue, 29 Aug 2023 02:59:28 +0000
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
	bh=GLrgtnHkB6w5q6GORVFEVBNqm6pjMDZD2bCpJA9adl8=; b=k+ox6Coy9hRm0/5rLVugZRRLaa
	WmQsHWeZSWwJ1CTq6Kekp0QUTRInpMwJ2VSisVsPwui1j76gmaEmdPCbZedlWKrQ+84IrzuzN5A8D
	ztNxRNhN6gm7DcC5hNxZFfDdnyh2t+ByMXv9Gq5PL1ZvSpJyyVBnDDTEMXvekL8MVAqo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182547-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182547: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b1e558f6369fc85ae053e0c16ffcd600880fe78d
X-Osstest-Versions-That:
    ovmf=2c7fd32676272e22ed44fdfc8fa7e47f5c7a93b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 02:59:28 +0000

flight 182547 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182547/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b1e558f6369fc85ae053e0c16ffcd600880fe78d
baseline version:
 ovmf                 2c7fd32676272e22ed44fdfc8fa7e47f5c7a93b8

Last test of basis   182545  2023-08-28 20:43:06 Z    0 days
Testing same since   182547  2023-08-29 01:12:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hongbin1 Zhang <hongbin1.zhang@intel.com>
  Zhang, Hongbin1 <Hongbin1.Zhang@intel.com>

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
   2c7fd32676..b1e558f636  b1e558f6369fc85ae053e0c16ffcd600880fe78d -> xen-tested-master

