Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F665939C40
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762664.1172872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAZ8-0006TF-LF; Tue, 23 Jul 2024 08:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762664.1172872; Tue, 23 Jul 2024 08:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAZ8-0006RD-IY; Tue, 23 Jul 2024 08:08:10 +0000
Received: by outflank-mailman (input) for mailman id 762664;
 Tue, 23 Jul 2024 08:08:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWAZ7-0006R3-8S; Tue, 23 Jul 2024 08:08:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWAZ6-0000hy-T6; Tue, 23 Jul 2024 08:08:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWAZ6-0000DD-LX; Tue, 23 Jul 2024 08:08:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWAZ6-0005ai-L9; Tue, 23 Jul 2024 08:08:08 +0000
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
	bh=QXTNYusbcADYCKPiClXui8o/I/veP5OuwpZPd89/EZw=; b=ZbLu7RwWiuKgAjJb6pTrkystw0
	b1zL8V2PFTPZMOhr3BifY90AMUpuFuhDtERzKfwYJebuwfB1mnBMaIPEErJIHHV8YADKjauIX4eKh
	iPBzpRiN/+d8R7i+YmsJW/3kH5TQUnnhJQCs0lQz8uJnjodZ0iGFHx2bfyCUlnzRbQGk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186961-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186961: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5ab17430b2579dd79e3cbd497b8b9deccd34abc
X-Osstest-Versions-That:
    ovmf=e10de1cb0345e54c0b4d83f5979a76111d10d6c7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jul 2024 08:08:08 +0000

flight 186961 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186961/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5ab17430b2579dd79e3cbd497b8b9deccd34abc
baseline version:
 ovmf                 e10de1cb0345e54c0b4d83f5979a76111d10d6c7

Last test of basis   186958  2024-07-23 03:41:28 Z    0 days
Testing same since   186961  2024-07-23 06:15:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   e10de1cb03..c5ab17430b  c5ab17430b2579dd79e3cbd497b8b9deccd34abc -> xen-tested-master

