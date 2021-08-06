Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB33E216B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 04:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164628.300942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBpOK-000736-W5; Fri, 06 Aug 2021 02:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164628.300942; Fri, 06 Aug 2021 02:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBpOK-0006zh-Rh; Fri, 06 Aug 2021 02:15:20 +0000
Received: by outflank-mailman (input) for mailman id 164628;
 Fri, 06 Aug 2021 02:15:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBpOJ-0006zX-Ps; Fri, 06 Aug 2021 02:15:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBpOJ-0007Vk-JE; Fri, 06 Aug 2021 02:15:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mBpOJ-0001lQ-94; Fri, 06 Aug 2021 02:15:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mBpOJ-0003Rv-8T; Fri, 06 Aug 2021 02:15:19 +0000
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
	bh=A5CNijYW4UsbniyiF+RSEGcwj365mU26F2rRNB3L56A=; b=4MtZpRB2vFBeIjZxz2ggBQqq3C
	glsBSHmDZS/sJ4CDVwFr4chHUaP2omsOp9fRbdEIMvVrnuykQTGVJaZUugI2XbDkISQoAA9ncH2oi
	ADV01sQYjSVYEGuHVsUU2Xro7TSut1wsX70PzWqocpaSc+XX7vAjTKf13J1tMWQn5bwE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=97fdcbda4e69d6f085ec3f2bd9d29a04af2b50a4
X-Osstest-Versions-That:
    ovmf=9abc60f9f722d891b3cedb0205fd6c9c0e2af54b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Aug 2021 02:15:19 +0000

flight 164114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 97fdcbda4e69d6f085ec3f2bd9d29a04af2b50a4
baseline version:
 ovmf                 9abc60f9f722d891b3cedb0205fd6c9c0e2af54b

Last test of basis   164111  2021-08-05 12:42:15 Z    0 days
Testing same since   164114  2021-08-05 21:40:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
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
   9abc60f9f7..97fdcbda4e  97fdcbda4e69d6f085ec3f2bd9d29a04af2b50a4 -> xen-tested-master

