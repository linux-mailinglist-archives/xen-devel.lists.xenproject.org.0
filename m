Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0197C81B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800582.1210512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEba-0002hO-8u; Thu, 19 Sep 2024 10:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800582.1210512; Thu, 19 Sep 2024 10:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEba-0002ey-6K; Thu, 19 Sep 2024 10:41:46 +0000
Received: by outflank-mailman (input) for mailman id 800582;
 Thu, 19 Sep 2024 10:41:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srEbY-0002eo-O8; Thu, 19 Sep 2024 10:41:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srEbY-0003ik-MF; Thu, 19 Sep 2024 10:41:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srEbY-0005yz-5e; Thu, 19 Sep 2024 10:41:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1srEbY-0001TA-56; Thu, 19 Sep 2024 10:41:44 +0000
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
	bh=WYHzAED/n/6EK2wSFKA6/qQfO4SDUyjg1FI9YlnyIYs=; b=XNNiMN98py/9xmYf5bcpU4qKJ7
	GuYCAWFINXHqRSCrLVFDvZV4A+CQGLm0dxh6araqffcDqhxeKVS5H1JuAYO+WygzUpKlxdWg9Vcwt
	muRmtdXjnNpiEYoL2zSD5R6BivjXeXYU9p3PtQBSYMpvhAXjNQbta2r8inbZ3L88rYkw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187757-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187757: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff8a7d101f7d892dea96254bc1309c1a7c502e02
X-Osstest-Versions-That:
    ovmf=5901f19a877c87de73f6b28265ad5db60b2239e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Sep 2024 10:41:44 +0000

flight 187757 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187757/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff8a7d101f7d892dea96254bc1309c1a7c502e02
baseline version:
 ovmf                 5901f19a877c87de73f6b28265ad5db60b2239e1

Last test of basis   187744  2024-09-18 08:13:37 Z    1 days
Testing same since   187757  2024-09-19 08:50:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   5901f19a87..ff8a7d101f  ff8a7d101f7d892dea96254bc1309c1a7c502e02 -> xen-tested-master

