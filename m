Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B17CB7AC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 02:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617949.961097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYLA-0003Ga-Nf; Tue, 17 Oct 2023 00:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617949.961097; Tue, 17 Oct 2023 00:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYLA-0003Di-Kg; Tue, 17 Oct 2023 00:53:44 +0000
Received: by outflank-mailman (input) for mailman id 617949;
 Tue, 17 Oct 2023 00:53:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsYL8-0003DY-En; Tue, 17 Oct 2023 00:53:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsYL8-0003Wu-C2; Tue, 17 Oct 2023 00:53:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsYL7-0003nK-Ne; Tue, 17 Oct 2023 00:53:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qsYL7-0001cG-NA; Tue, 17 Oct 2023 00:53:41 +0000
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
	bh=pHzkM+BarHZqsjpb51TqiAWJTw4O/uMEzMEx7pZ7x5Y=; b=ZSoFcEYZjzx5JwCKz8CCbfP9sy
	Y9bKB03iHYc+fkrhEp8gUSQgQlRjROkkhcb7KT75mwcmOiz3HZcIP/iRNOLMcQVcs/I+YbWjPBqMT
	J/s2uMIfvmcy9rrje03A4z1nY1djDPHHxVfitZRs4ORZ1rvPTOfKw/vv8CQfcJWcef78=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183390-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183390: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=03d6569f70939d2a1653265367121212459a6b89
X-Osstest-Versions-That:
    ovmf=326b9e1d815c4ae4b0b207fcb0bfa16864af5400
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Oct 2023 00:53:41 +0000

flight 183390 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183390/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 03d6569f70939d2a1653265367121212459a6b89
baseline version:
 ovmf                 326b9e1d815c4ae4b0b207fcb0bfa16864af5400

Last test of basis   183355  2023-10-12 09:13:57 Z    4 days
Testing same since   183390  2023-10-16 23:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   326b9e1d81..03d6569f70  03d6569f70939d2a1653265367121212459a6b89 -> xen-tested-master

