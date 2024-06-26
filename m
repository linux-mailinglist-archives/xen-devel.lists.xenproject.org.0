Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91C917EB4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748728.1156550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQB2-0004Jw-LA; Wed, 26 Jun 2024 10:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748728.1156550; Wed, 26 Jun 2024 10:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQB2-0004Gf-HE; Wed, 26 Jun 2024 10:47:00 +0000
Received: by outflank-mailman (input) for mailman id 748728;
 Wed, 26 Jun 2024 10:46:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMQB1-0004Fn-1b; Wed, 26 Jun 2024 10:46:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMQB0-0004c8-Sv; Wed, 26 Jun 2024 10:46:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMQB0-0004Wv-9A; Wed, 26 Jun 2024 10:46:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMQB0-0008PN-8d; Wed, 26 Jun 2024 10:46:58 +0000
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
	bh=otb8uxi86p1QMZXMoYmYgcqr0perS+5NhLOXark85+A=; b=RfPpCa345PAYfEMoCGyWNSEoXK
	Yjigt3JK+poorSWrupntLakYUUYTp0WQlKoBpt7gStHSQh8E0Ub1/N2JtKw80DrUemV6KoZhgf5fL
	61R1HjyuM6Fekxf9AjexiQF6H5l2SJKVtFo5egRI2ALUn9MkLqiRvevPkSXGUyxIErZs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186512-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186512: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dc002d4f2d76bdd826359a3dd608d9bc621fcb47
X-Osstest-Versions-That:
    ovmf=78bccfec9ce5082499db035270e7998d5330d75c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2024 10:46:58 +0000

flight 186512 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186512/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dc002d4f2d76bdd826359a3dd608d9bc621fcb47
baseline version:
 ovmf                 78bccfec9ce5082499db035270e7998d5330d75c

Last test of basis   186511  2024-06-26 07:13:01 Z    0 days
Testing same since   186512  2024-06-26 09:14:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   78bccfec9c..dc002d4f2d  dc002d4f2d76bdd826359a3dd608d9bc621fcb47 -> xen-tested-master

