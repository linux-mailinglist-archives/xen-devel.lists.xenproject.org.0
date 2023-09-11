Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65179A392
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 08:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599033.934267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaVr-00058z-OC; Mon, 11 Sep 2023 06:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599033.934267; Mon, 11 Sep 2023 06:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaVr-00057G-KH; Mon, 11 Sep 2023 06:35:11 +0000
Received: by outflank-mailman (input) for mailman id 599033;
 Mon, 11 Sep 2023 06:35:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfaVq-000576-3P; Mon, 11 Sep 2023 06:35:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfaVp-0003XH-Uz; Mon, 11 Sep 2023 06:35:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfaVp-0006YA-Ms; Mon, 11 Sep 2023 06:35:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qfaVp-0002YU-MQ; Mon, 11 Sep 2023 06:35:09 +0000
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
	bh=5ruaSz7oOJ7kbOmRj/gSCphucZL0gF1mOjYmimQ8zdo=; b=cTd/R4hv3X6C1gVBsIrqj8R37w
	ghK65pccmRfI2ykBdd7D0f+sdfjKu1yefFZi6htm6TpcTLVykUibV9xfZHF0b7aSs5b0baYKUWlnH
	Z16/jEoHnQCuHtEojZFRUzsLQm6em1+oTfshhKNhaZp2lzCbbKNHR7sx8w1P5hI9g72s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182916-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182916: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a
X-Osstest-Versions-That:
    ovmf=0bcc503595fdd8036701dab54eabe4f40ecbb768
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Sep 2023 06:35:09 +0000

flight 182916 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182916/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a
baseline version:
 ovmf                 0bcc503595fdd8036701dab54eabe4f40ecbb768

Last test of basis   182911  2023-09-11 01:40:50 Z    0 days
Testing same since   182916  2023-09-11 03:51:19 Z    0 days    1 attempts

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
   0bcc503595..cc26a2cb31  cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a -> xen-tested-master

