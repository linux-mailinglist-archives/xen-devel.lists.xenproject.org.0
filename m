Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BF78D5F0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 14:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592870.925705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKY6-0003QH-Kf; Wed, 30 Aug 2023 12:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592870.925705; Wed, 30 Aug 2023 12:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKY6-0003P3-HJ; Wed, 30 Aug 2023 12:43:54 +0000
Received: by outflank-mailman (input) for mailman id 592870;
 Wed, 30 Aug 2023 12:43:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbKY5-0003Ot-68; Wed, 30 Aug 2023 12:43:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbKY4-0003to-QZ; Wed, 30 Aug 2023 12:43:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbKY4-0005os-AO; Wed, 30 Aug 2023 12:43:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbKY4-0000pZ-9t; Wed, 30 Aug 2023 12:43:52 +0000
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
	bh=EavbEufFUcfBMCg529+QXytZLLgoyPyv2gkXC3J4E00=; b=I/vBiazesxDz+IPteGpIJBitFo
	rNaNGTGSwBnErkx8ANB9lGvkWqyy2KAq/7xtwF+rNWcR/uy1kZGHY/RU4LWqpz5YasFzXLQP7fmeJ
	63fC/IPzZVZlhqAXBZPellQ2a8SA8X9dUdfbuYoT3jmr8pyLqsNLsRC/Kf/biBz7IeLA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182567-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182567: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a481c1114474160f53b1662fd3726b48c88ae82e
X-Osstest-Versions-That:
    ovmf=5f46eb2307dd6d4ea163b6899ded81e795780059
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 12:43:52 +0000

flight 182567 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182567/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a481c1114474160f53b1662fd3726b48c88ae82e
baseline version:
 ovmf                 5f46eb2307dd6d4ea163b6899ded81e795780059

Last test of basis   182564  2023-08-30 06:40:43 Z    0 days
Testing same since   182567  2023-08-30 10:12:15 Z    0 days    1 attempts

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
   5f46eb2307..a481c11144  a481c1114474160f53b1662fd3726b48c88ae82e -> xen-tested-master

