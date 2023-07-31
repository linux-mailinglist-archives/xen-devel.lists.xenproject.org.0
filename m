Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA876A3F0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 00:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573492.898255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQb6v-0008Td-7h; Mon, 31 Jul 2023 22:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573492.898255; Mon, 31 Jul 2023 22:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQb6v-0008Ry-4f; Mon, 31 Jul 2023 22:11:29 +0000
Received: by outflank-mailman (input) for mailman id 573492;
 Mon, 31 Jul 2023 22:11:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qQb6t-0008Rg-Cq; Mon, 31 Jul 2023 22:11:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qQb6t-00053o-8I; Mon, 31 Jul 2023 22:11:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qQb6t-0001Qs-08; Mon, 31 Jul 2023 22:11:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qQb6s-00070K-Tk; Mon, 31 Jul 2023 22:11:26 +0000
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
	bh=IUeqVcFK/1x4cuhFbkujLNvD576UAqXWGwHbzjaHTKo=; b=bmK5PUS7LlIv6je/KOY3BZGGFu
	VMMnhgDWHANW0HS7+aa1CwL/XF6CUt+Myw1yktymUTaUhW8PTFps7X4F1jElZWla3ghW2cgYlW40x
	pHl20qUpLDMXyAx6fetG0GQv8lRO6OiuW1Wy86Cvum3pEgH7C1u8Mv5JWmUrChkTmzp0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=677f2c6f1509da21258e02957b869b71b008fc61
X-Osstest-Versions-That:
    ovmf=70f3e62dc73d28962b833373246ef25c865c575e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 31 Jul 2023 22:11:26 +0000

flight 182090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 677f2c6f1509da21258e02957b869b71b008fc61
baseline version:
 ovmf                 70f3e62dc73d28962b833373246ef25c865c575e

Last test of basis   182084  2023-07-31 01:44:53 Z    0 days
Testing same since   182090  2023-07-31 12:44:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Ard Biesheuvel <ardb@kernel.org> # Debian clang version 14.0.6
  Sunil V L <sunilvl@ventanamicro.com>

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
   70f3e62dc7..677f2c6f15  677f2c6f1509da21258e02957b869b71b008fc61 -> xen-tested-master

