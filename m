Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B97678BC3A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 02:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591888.924454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qamut-0006AU-LA; Tue, 29 Aug 2023 00:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591888.924454; Tue, 29 Aug 2023 00:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qamut-00067l-IR; Tue, 29 Aug 2023 00:49:11 +0000
Received: by outflank-mailman (input) for mailman id 591888;
 Tue, 29 Aug 2023 00:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qamus-00067Z-CI; Tue, 29 Aug 2023 00:49:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qamus-00089b-36; Tue, 29 Aug 2023 00:49:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qamur-0004Mr-Ov; Tue, 29 Aug 2023 00:49:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qamur-0002nq-NV; Tue, 29 Aug 2023 00:49:09 +0000
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
	bh=/iUZfFoS0ajQgFr0Kz2MS9gcIPBVwD+W4leoSzMCYvM=; b=5stDHRu9Y+7UyAWprLtkmjXHw9
	f1lRdsjDMSvVkNXQZxAy9qZ8COmKvcn6YeE+56LYLepRo6XOxdPJ1TCe4QgEXi1980uB8t54jKG99
	ssuxqf9UKASojpcMVCzEvjOHnYbHs1BNBMDnLP5mMVlMBav6C7tuZdggFAp8cXA6sMgc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182545-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182545: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2c7fd32676272e22ed44fdfc8fa7e47f5c7a93b8
X-Osstest-Versions-That:
    ovmf=92006e5804a4adff05556a97a951fd7766a1d79f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 00:49:09 +0000

flight 182545 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182545/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2c7fd32676272e22ed44fdfc8fa7e47f5c7a93b8
baseline version:
 ovmf                 92006e5804a4adff05556a97a951fd7766a1d79f

Last test of basis   182538  2023-08-28 09:12:19 Z    0 days
Testing same since   182545  2023-08-28 20:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kuo, Ted <ted.kuo@intel.com>
  Ted Kuo <ted.kuo@intel.com>

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
   92006e5804..2c7fd32676  2c7fd32676272e22ed44fdfc8fa7e47f5c7a93b8 -> xen-tested-master

