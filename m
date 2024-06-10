Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED413901F7E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737156.1143328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcRY-0004pj-E4; Mon, 10 Jun 2024 10:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737156.1143328; Mon, 10 Jun 2024 10:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcRY-0004mQ-B4; Mon, 10 Jun 2024 10:40:04 +0000
Received: by outflank-mailman (input) for mailman id 737156;
 Mon, 10 Jun 2024 10:40:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGcRX-0004Yd-14; Mon, 10 Jun 2024 10:40:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGcRW-0003jr-Ul; Mon, 10 Jun 2024 10:40:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGcRW-0002dK-J4; Mon, 10 Jun 2024 10:40:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sGcRW-00017i-IY; Mon, 10 Jun 2024 10:40:02 +0000
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
	bh=SF5BwBYGD9mE2JvRk3oKQarjDGQkxDyCSLqBA3ZcT8I=; b=bJ4UlakIoF0zJBgfmLEtMEZlkZ
	fDjtXlegDFM7em5L2DL1O0qq8VPjoTxXgGzlbLz4PenQ2hBED04G1pXp0QCgXoMbjQndkRdQwmNPv
	0KcQA/VmLOKw+wYdYfOxoMaNc1DxUfmq0Lu9/hDhov8KAcMY2hj8fMv/cdDg1r8ram1U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186302-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186302: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3dcc7b73df2b1c38c3c1a31724d577f4085f3ab1
X-Osstest-Versions-That:
    ovmf=ab069d580111ccc64d6b0c9697b7c5fd6e1507ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Jun 2024 10:40:02 +0000

flight 186302 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186302/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3dcc7b73df2b1c38c3c1a31724d577f4085f3ab1
baseline version:
 ovmf                 ab069d580111ccc64d6b0c9697b7c5fd6e1507ce

Last test of basis   186283  2024-06-07 18:13:28 Z    2 days
Testing same since   186302  2024-06-10 09:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   ab069d5801..3dcc7b73df  3dcc7b73df2b1c38c3c1a31724d577f4085f3ab1 -> xen-tested-master

