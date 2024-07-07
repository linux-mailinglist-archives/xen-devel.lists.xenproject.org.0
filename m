Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA2A92977C
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 12:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754894.1163190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQPR9-0002Up-Cy; Sun, 07 Jul 2024 10:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754894.1163190; Sun, 07 Jul 2024 10:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQPR9-0002Rp-A2; Sun, 07 Jul 2024 10:48:07 +0000
Received: by outflank-mailman (input) for mailman id 754894;
 Sun, 07 Jul 2024 10:48:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQPR7-0002Rf-Ql; Sun, 07 Jul 2024 10:48:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQPR7-0000QJ-My; Sun, 07 Jul 2024 10:48:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sQPR7-0004h9-DE; Sun, 07 Jul 2024 10:48:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sQPR7-0001fC-Cf; Sun, 07 Jul 2024 10:48:05 +0000
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
	bh=CpHDETRws2NAkbnN9j5MNqhSr8uzNz5YKS4wfRjso/E=; b=lOAMfICzJxkJh8UsfkU8Je3hej
	X1CScz9yq1osdbBXLJC8oh810tP+inUnGlBw4CatopIGIMg7QIQs4Bk3C+eMjdUhpyjZKq7aw2rVN
	V72wPl32VTsXeKdCMRn9w0orlD8+G6U6MjGeqs9wcUef4kUWpER3VQ9X5NKmZTiHGlP8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186721: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d5fad2176cb14283922e07ff1758118d16b17383
X-Osstest-Versions-That:
    ovmf=26bc42f1e34cdf43057a75b8edcc0bd86c091214
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Jul 2024 10:48:05 +0000

flight 186721 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186721/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d5fad2176cb14283922e07ff1758118d16b17383
baseline version:
 ovmf                 26bc42f1e34cdf43057a75b8edcc0bd86c091214

Last test of basis   186707  2024-07-05 19:44:54 Z    1 days
Testing same since   186721  2024-07-07 08:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   26bc42f1e3..d5fad2176c  d5fad2176cb14283922e07ff1758118d16b17383 -> xen-tested-master

