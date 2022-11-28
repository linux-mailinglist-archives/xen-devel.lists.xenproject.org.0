Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7263A663
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 11:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448869.705445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbis-0006vt-CN; Mon, 28 Nov 2022 10:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448869.705445; Mon, 28 Nov 2022 10:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbis-0006tE-9Q; Mon, 28 Nov 2022 10:50:50 +0000
Received: by outflank-mailman (input) for mailman id 448869;
 Mon, 28 Nov 2022 10:50:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozbiq-0006sm-VL; Mon, 28 Nov 2022 10:50:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozbiq-0004oE-Tr; Mon, 28 Nov 2022 10:50:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ozbiq-0007cj-Hv; Mon, 28 Nov 2022 10:50:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ozbiq-0006Hp-HP; Mon, 28 Nov 2022 10:50:48 +0000
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
	bh=f5L2nzLgIKf+oAurg5YRvimHBpjHyCi3AMrEUfGPaLU=; b=Bz8wmAIcY4ERpEaIOfpRe6exKG
	AKSBy/KDeoBAyVT1rjBRbenxGxrVzC+4ddaRiEPma+mbrpbVupSN8SkprMNDoA455LgwK4pTLMY7o
	RVS5xpBhPu12Wwk4Gbfu9w/cFSZ3OGXMsB+El4OT9SqR21QL4Dm1pdLbkj1QHkRy7SOQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174980-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174980: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d992163da6cb3c6e91c24938ad4b8804227eafd8
X-Osstest-Versions-That:
    ovmf=85d805ed3201de16c4dcbfc4b886a0d11ad5885c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Nov 2022 10:50:48 +0000

flight 174980 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174980/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d992163da6cb3c6e91c24938ad4b8804227eafd8
baseline version:
 ovmf                 85d805ed3201de16c4dcbfc4b886a0d11ad5885c

Last test of basis   174978  2022-11-28 07:12:02 Z    0 days
Testing same since   174980  2022-11-28 09:10:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  JuX Zhang <jux.zhang@intel.com>
  Zhang, JuX <jux.zhang@intel.com>

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
   85d805ed32..d992163da6  d992163da6cb3c6e91c24938ad4b8804227eafd8 -> xen-tested-master

