Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12A8294E8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 09:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665325.1035494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNTjg-0005Zk-UO; Wed, 10 Jan 2024 08:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665325.1035494; Wed, 10 Jan 2024 08:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNTjg-0005YE-Qn; Wed, 10 Jan 2024 08:14:52 +0000
Received: by outflank-mailman (input) for mailman id 665325;
 Wed, 10 Jan 2024 08:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNTjf-0005Y4-JP; Wed, 10 Jan 2024 08:14:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNTjf-0005a3-Fq; Wed, 10 Jan 2024 08:14:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNTjf-00045M-2S; Wed, 10 Jan 2024 08:14:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNTjf-0002dH-1z; Wed, 10 Jan 2024 08:14:51 +0000
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
	bh=hqSXFvpRgPBmbcPBioGeuF4uoAWongd4s1Ikp5/gv1w=; b=B6GtL26Y71O4D4fGZvsX+FxEFm
	s/rXL6FumMgexYLHLocVDnTHwbN3whfHxVXRA/OSAUyYX5s68HWZ+QPzaPboSnqN0OYVNmqRQdvwq
	yTjozWfstd3ZaLnUPKxQMT/RHRbUfawdK8kFJTF0fC57a8OTxcr8Ar/zBuo2zuKe1ZtE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184302-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184302: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=265b4ab91b8a31d6d1760ad1eaa1e16f9244cba7
X-Osstest-Versions-That:
    ovmf=edba0779ba05c0598dbdd32006714fed4fd24ae0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 08:14:51 +0000

flight 184302 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184302/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 265b4ab91b8a31d6d1760ad1eaa1e16f9244cba7
baseline version:
 ovmf                 edba0779ba05c0598dbdd32006714fed4fd24ae0

Last test of basis   184300  2024-01-10 01:56:08 Z    0 days
Testing same since   184302  2024-01-10 06:11:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>

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
   edba0779ba..265b4ab91b  265b4ab91b8a31d6d1760ad1eaa1e16f9244cba7 -> xen-tested-master

