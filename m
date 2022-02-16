Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D64B8703
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274044.469383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIlk-0004eM-KV; Wed, 16 Feb 2022 11:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274044.469383; Wed, 16 Feb 2022 11:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIlk-0004bW-HN; Wed, 16 Feb 2022 11:46:48 +0000
Received: by outflank-mailman (input) for mailman id 274044;
 Wed, 16 Feb 2022 11:46:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKIlj-0004bF-CL; Wed, 16 Feb 2022 11:46:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKIlj-0006jT-Ah; Wed, 16 Feb 2022 11:46:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKIli-00009m-TU; Wed, 16 Feb 2022 11:46:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nKIli-0001A3-T4; Wed, 16 Feb 2022 11:46:46 +0000
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
	bh=7Ms48RfWmL8GIzt9wUrvkx/rcZQaRiVy0RmnP/zAgrk=; b=xcEzAtzih/jUKi5x2V6Q14VINl
	D+Fb1NbS5szofpqnLXJxIwcsfnulxEEzTT1z7GiUvcXlhdgcC5kCrr+tzUX/0O6itMfbaR9wbh/re
	sNuNcNYog1pctgk6/TE6xq84MqbRD5XQJcTcTObH9iNQ4BbKSsKnYTQ7fNoXWxW5US98=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168127-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168127: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c28e376edc46e6db6e4a551c94b6ac90df0d8d6e
X-Osstest-Versions-That:
    ovmf=85589ddbf6f8c6dc75f73aa32e484e3cfd439e7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Feb 2022 11:46:46 +0000

flight 168127 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168127/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c28e376edc46e6db6e4a551c94b6ac90df0d8d6e
baseline version:
 ovmf                 85589ddbf6f8c6dc75f73aa32e484e3cfd439e7a

Last test of basis   168119  2022-02-15 10:43:01 Z    1 days
Testing same since   168127  2022-02-16 07:13:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  dann frazier <dann.frazier@canonical.com>

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
   85589ddbf6..c28e376edc  c28e376edc46e6db6e4a551c94b6ac90df0d8d6e -> xen-tested-master

