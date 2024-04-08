Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7A89BA0A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701827.1096340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkDH-0001Qx-Ai; Mon, 08 Apr 2024 08:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701827.1096340; Mon, 08 Apr 2024 08:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkDH-0001O1-4L; Mon, 08 Apr 2024 08:18:47 +0000
Received: by outflank-mailman (input) for mailman id 701827;
 Mon, 08 Apr 2024 08:18:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtkDG-0001Nl-6m; Mon, 08 Apr 2024 08:18:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtkDG-0000L7-3g; Mon, 08 Apr 2024 08:18:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtkDF-0003oB-PA; Mon, 08 Apr 2024 08:18:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rtkDF-0005eJ-OK; Mon, 08 Apr 2024 08:18:45 +0000
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
	bh=IYQIQQBewc2ToJ/Qy4ybDjvPT4ojfEhJeITMFa3ddfY=; b=oCR6dtAuNFYsBjlJcw6g8Md8nd
	qcSQFcxxVaty5b8yN4JRuN5og2v+iHSA4AFpZMMkS0KUoPjxfWb8MzT6ZT7MCZTR29RMf5JIU+Gvr
	Seb7ZEt6Mah9xlH70eKMogyK/Re7llZOCpO2Ewdl3G6L+at5TZ8N/Xv6rp8Nvqjx+8sk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185272-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185272: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b7f8779fe1f60113fdaab3b2f3f17c9f900b0456
X-Osstest-Versions-That:
    ovmf=c98c14576f1a93519402a8e2f4736b479ad6007c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Apr 2024 08:18:45 +0000

flight 185272 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185272/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456
baseline version:
 ovmf                 c98c14576f1a93519402a8e2f4736b479ad6007c

Last test of basis   185264  2024-04-07 04:44:23 Z    1 days
Testing same since   185272  2024-04-08 06:12:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tuan Phan <tphan@ventanamicro.com>

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
   c98c14576f..b7f8779fe1  b7f8779fe1f60113fdaab3b2f3f17c9f900b0456 -> xen-tested-master

