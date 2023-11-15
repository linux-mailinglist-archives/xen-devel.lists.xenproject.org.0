Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AD7DDA95
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 02:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626051.975969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxzxy-0007uO-FY; Wed, 01 Nov 2023 01:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626051.975969; Wed, 01 Nov 2023 01:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxzxy-0007rE-CZ; Wed, 01 Nov 2023 01:24:18 +0000
Received: by outflank-mailman (input) for mailman id 626051;
 Wed, 01 Nov 2023 01:24:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxzxw-0007r4-NO; Wed, 01 Nov 2023 01:24:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxzxw-0003oK-Gi; Wed, 01 Nov 2023 01:24:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxzxw-0004D3-6Y; Wed, 01 Nov 2023 01:24:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qxzxw-0000Gg-69; Wed, 01 Nov 2023 01:24:16 +0000
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
	bh=5bx8P6c4GS48VSyJXTPN7BSTL6gRkNA+cla4NhznPtI=; b=OsvwYvydCs41Y1i45eG76A7E86
	Rakj3s9deagSgizKbwWSbcO71TvhE7xllZCIBGzE+2TWGQqzgLHaQ74Gyn8eTZhh5fSTsDCfSylOM
	ExGGY60V8dZ4ky4z3OQY3jgRf9vUgPN2Kq5B3RfWJhYMWiLNCd4eBtdyyHk9UOsrKM6w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183643-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183643: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ccbe2e938386ed1ec49b3ad8ed6d107e7416e273
X-Osstest-Versions-That:
    ovmf=36812d6c3e0c4402ea90e20566ac80de634d210b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Nov 2023 01:24:16 +0000

flight 183643 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183643/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ccbe2e938386ed1ec49b3ad8ed6d107e7416e273
baseline version:
 ovmf                 36812d6c3e0c4402ea90e20566ac80de634d210b

Last test of basis   183639  2023-10-31 15:12:49 Z    0 days
Testing same since   183643  2023-10-31 21:14:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   36812d6c3e..ccbe2e9383  ccbe2e938386ed1ec49b3ad8ed6d107e7416e273 -> xen-tested-master

