Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC59097ED
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2024 13:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741042.1148080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIROR-0008G1-DO; Sat, 15 Jun 2024 11:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741042.1148080; Sat, 15 Jun 2024 11:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIROR-0008Cu-A2; Sat, 15 Jun 2024 11:16:23 +0000
Received: by outflank-mailman (input) for mailman id 741042;
 Sat, 15 Jun 2024 11:16:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIROP-0008Ck-Ld; Sat, 15 Jun 2024 11:16:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIROP-0007zU-H8; Sat, 15 Jun 2024 11:16:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIROP-00040P-9V; Sat, 15 Jun 2024 11:16:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sIROP-00072J-8z; Sat, 15 Jun 2024 11:16:21 +0000
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
	bh=WGAYwdlUBV7hLQSAQXXnxqDq8/QHbwJYiupCfU4QQjM=; b=lloxx01XEWLKWEq222USflXQyB
	SeVzLBFSUM6cpSaA967eL4zRs7EwDAiIdncitKAtlg0rxkqElcifzQYG2ULRMV/BoQ+LFK1c8qyty
	8+6NYKIaX2ZyUUiJ8ESmMmTXQlfvt7M/5beZ5v2hDMyXKWWL1X2P769JtBBdgANEEUlA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186361-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186361: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d8095b36abc521970dd930449a8ae8ddc431314c
X-Osstest-Versions-That:
    ovmf=a84876ba283176eb683dc84274bc6c66faffc7a0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jun 2024 11:16:21 +0000

flight 186361 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186361/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d8095b36abc521970dd930449a8ae8ddc431314c
baseline version:
 ovmf                 a84876ba283176eb683dc84274bc6c66faffc7a0

Last test of basis   186360  2024-06-15 07:42:57 Z    0 days
Testing same since   186361  2024-06-15 09:42:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   a84876ba28..d8095b36ab  d8095b36abc521970dd930449a8ae8ddc431314c -> xen-tested-master

