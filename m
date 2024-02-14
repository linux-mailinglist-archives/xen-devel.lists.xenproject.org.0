Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF76854233
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 05:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680186.1058121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra7LF-0004Ju-Pw; Wed, 14 Feb 2024 04:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680186.1058121; Wed, 14 Feb 2024 04:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra7LF-0004Hn-N2; Wed, 14 Feb 2024 04:57:53 +0000
Received: by outflank-mailman (input) for mailman id 680186;
 Wed, 14 Feb 2024 04:57:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra7LE-0004Hd-Lv; Wed, 14 Feb 2024 04:57:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra7LE-00016X-KJ; Wed, 14 Feb 2024 04:57:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra7LE-0002cp-85; Wed, 14 Feb 2024 04:57:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ra7LE-0003fv-7f; Wed, 14 Feb 2024 04:57:52 +0000
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
	bh=246dTh4CG7PrSCUfvOgBxOkwuHTInLXfpeRoPtXVaF4=; b=EHTtNrbUO0zrtboY5NL9WmQcSF
	lyehgcraxQPYFcNUxwShZVeogQN4khRF+8cl49MZyixmNEOPZF3pd91FFfLCMyXgtb/utmWGspHSG
	R/2nnZgCUXGGSoGMbQxX5m/L1bkPrlAmfov7cqAJ7z/yqC37XLgzYN+qR6ds8nbYv09I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184661-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184661: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a1c426e8440b55ee12d92cefa7114fd6f7b599cb
X-Osstest-Versions-That:
    ovmf=8801c75b4d77c2e6e06b3ddc8560e0db590f6342
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Feb 2024 04:57:52 +0000

flight 184661 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184661/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a1c426e8440b55ee12d92cefa7114fd6f7b599cb
baseline version:
 ovmf                 8801c75b4d77c2e6e06b3ddc8560e0db590f6342

Last test of basis   184639  2024-02-09 22:41:18 Z    4 days
Testing same since   184661  2024-02-14 02:46:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   8801c75b4d..a1c426e844  a1c426e8440b55ee12d92cefa7114fd6f7b599cb -> xen-tested-master

