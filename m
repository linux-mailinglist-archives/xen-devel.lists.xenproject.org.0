Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AC484153C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 22:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673177.1047408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUZV0-0007qx-QZ; Mon, 29 Jan 2024 21:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673177.1047408; Mon, 29 Jan 2024 21:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUZV0-0007pz-Nk; Mon, 29 Jan 2024 21:49:02 +0000
Received: by outflank-mailman (input) for mailman id 673177;
 Mon, 29 Jan 2024 21:49:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUZUz-0007pp-C3; Mon, 29 Jan 2024 21:49:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUZUz-0003B8-5H; Mon, 29 Jan 2024 21:49:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rUZUy-0002Rs-Or; Mon, 29 Jan 2024 21:49:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rUZUy-00027F-OP; Mon, 29 Jan 2024 21:49:00 +0000
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
	bh=u/nEFeTpm0IUcT36amPBj8IkrmRXFtycUCKmyTR7PQQ=; b=l/bM4KsGJp47dM3AQOxhWBzGVF
	K/YBuMSGLg0L4X05XP60PSDuyod/2cLUtVy67wBK/T/WTgR7cj5WBGNbBzn9bLFP8+adx9oZngLF/
	PzaQgh5B8I11NP0LZR2LLmYITwXkpdt6FN1OTk6NUWxXIJ1yf+i8gXOlTcPoWaYETuFk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184519-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184519: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dc3339470166884197e9be5a6b3e7afe13104f1f
X-Osstest-Versions-That:
    ovmf=4c43209a740d4b38094f9495ce85219421a938af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 29 Jan 2024 21:49:00 +0000

flight 184519 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184519/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dc3339470166884197e9be5a6b3e7afe13104f1f
baseline version:
 ovmf                 4c43209a740d4b38094f9495ce85219421a938af

Last test of basis   184498  2024-01-27 19:41:06 Z    2 days
Testing same since   184519  2024-01-29 17:12:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Pierre Gondois <pierre.gondois@arm.com>

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
   4c43209a74..dc33394701  dc3339470166884197e9be5a6b3e7afe13104f1f -> xen-tested-master

