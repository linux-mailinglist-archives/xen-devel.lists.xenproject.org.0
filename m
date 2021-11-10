Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E887944BBC5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 07:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224190.387332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkhBv-0000FH-1B; Wed, 10 Nov 2021 06:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224190.387332; Wed, 10 Nov 2021 06:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkhBu-0000Cl-Tq; Wed, 10 Nov 2021 06:34:38 +0000
Received: by outflank-mailman (input) for mailman id 224190;
 Wed, 10 Nov 2021 06:34:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkhBt-0000CY-ST; Wed, 10 Nov 2021 06:34:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkhBt-0003VN-LV; Wed, 10 Nov 2021 06:34:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkhBt-0000C7-8j; Wed, 10 Nov 2021 06:34:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkhBt-0004ZM-8F; Wed, 10 Nov 2021 06:34:37 +0000
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
	bh=rs21mYwoSY7wow0QaKXs4LqRY+cLtI9iYmig5u6slik=; b=xvThbFDDJA0Hxu4caYX2p0EgbJ
	ahiIbGk5IgeyGrHY1VUKWURjJQ9vO+Kw8UBhkc9LdzCniG6vx0ZGuyYRjYsagaBASMX8OuDSHxhRB
	NpArOqSJqj8n6rP89QDEAmqDUgmO7e+t1kXSrHVYaRVCfRULXEAJ7muI7ZNi1vk48stQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166102-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166102: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aab6bb3d32e207c89364504e4a195f9f0cf5ce31
X-Osstest-Versions-That:
    ovmf=c974257821208fc6191779d1ddea918499f165b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Nov 2021 06:34:37 +0000

flight 166102 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166102/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aab6bb3d32e207c89364504e4a195f9f0cf5ce31
baseline version:
 ovmf                 c974257821208fc6191779d1ddea918499f165b8

Last test of basis   166097  2021-11-09 11:40:05 Z    0 days
Testing same since   166102  2021-11-10 02:40:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Morgan <bobm@nvidia.com>

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
   c974257821..aab6bb3d32  aab6bb3d32e207c89364504e4a195f9f0cf5ce31 -> xen-tested-master

