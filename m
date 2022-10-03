Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139905F37A6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 23:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415055.659535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSwQ-0000jg-Br; Mon, 03 Oct 2022 21:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415055.659535; Mon, 03 Oct 2022 21:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSwQ-0000fr-91; Mon, 03 Oct 2022 21:25:34 +0000
Received: by outflank-mailman (input) for mailman id 415055;
 Mon, 03 Oct 2022 21:25:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofSwO-0000ff-4u; Mon, 03 Oct 2022 21:25:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofSwO-0006mV-37; Mon, 03 Oct 2022 21:25:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofSwN-0002SI-NB; Mon, 03 Oct 2022 21:25:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofSwN-0000Id-Mn; Mon, 03 Oct 2022 21:25:31 +0000
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
	bh=LFhvTYvb1yyEUxOBsnII7uMDJBOM3J4cWxq7H0uJYx8=; b=03DTfo+yqdBIJ0i8Mm74K5lNai
	BEXN9qU6ILHTxYRhM2s7mpLjiC03ss0V7j4WgTxe6/Qq1zElVTdK8VBGuqoAIQMislnUcyU8roS0E
	m8xJ2OzdZ13hEq3JWEAVTRcj1Y1CqPGmFuljypiuDWjSPXAAxNOX7ZfUxCX4zNY5+uZg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173406-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173406: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=12973359d02d59c0f856b1c1dd6d0ad2f85cdab9
X-Osstest-Versions-That:
    ovmf=f01d3ee12caf5eae4ece4fc5b85c57c56fb06cc0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 03 Oct 2022 21:25:31 +0000

flight 173406 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173406/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 12973359d02d59c0f856b1c1dd6d0ad2f85cdab9
baseline version:
 ovmf                 f01d3ee12caf5eae4ece4fc5b85c57c56fb06cc0

Last test of basis   173399  2022-10-02 05:41:55 Z    1 days
Testing same since   173406  2022-10-03 18:40:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   f01d3ee12c..12973359d0  12973359d02d59c0f856b1c1dd6d0ad2f85cdab9 -> xen-tested-master

