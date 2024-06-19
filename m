Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B3590E1E0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 05:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743375.1150261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJllm-0003oG-F4; Wed, 19 Jun 2024 03:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743375.1150261; Wed, 19 Jun 2024 03:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJllm-0003mC-Bv; Wed, 19 Jun 2024 03:13:58 +0000
Received: by outflank-mailman (input) for mailman id 743375;
 Wed, 19 Jun 2024 03:13:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJlll-0003m2-Kq; Wed, 19 Jun 2024 03:13:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJlll-0000Pk-EQ; Wed, 19 Jun 2024 03:13:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJlll-0007Hs-5e; Wed, 19 Jun 2024 03:13:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJlll-00041B-5E; Wed, 19 Jun 2024 03:13:57 +0000
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
	bh=hyatbNoXIHvQ42m7f2HdDhB288E4++v/6h5SjP7xlEE=; b=ZoXCeq5HSnFd5WnALaFLe+THcz
	USSY34S1TUT/ivKJCtujJMrE9FtJKfy43/41XaDmzBJJDTCyIotD4Vgj1aWZeLKfU4nZnoVhVuhVc
	9i/illfY/yDEfpx4PBxN4pngkuRhaRO6fG8WpueU2BxWReTauaOMhwIXbA5Wz6GVug3k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186405-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186405: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=26a30abdd0f7fe5a9d2421cba6efe9397185ad98
X-Osstest-Versions-That:
    ovmf=c1d1910be6e04a8b1a73090cf2881fb698947a6e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Jun 2024 03:13:57 +0000

flight 186405 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186405/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 26a30abdd0f7fe5a9d2421cba6efe9397185ad98
baseline version:
 ovmf                 c1d1910be6e04a8b1a73090cf2881fb698947a6e

Last test of basis   186402  2024-06-18 21:41:10 Z    0 days
Testing same since   186405  2024-06-19 01:11:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   c1d1910be6..26a30abdd0  26a30abdd0f7fe5a9d2421cba6efe9397185ad98 -> xen-tested-master

