Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748E7460FB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 18:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558108.871932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGMmN-0005eL-IN; Mon, 03 Jul 2023 16:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558108.871932; Mon, 03 Jul 2023 16:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGMmN-0005cG-Fb; Mon, 03 Jul 2023 16:51:59 +0000
Received: by outflank-mailman (input) for mailman id 558108;
 Mon, 03 Jul 2023 16:51:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGMmM-0005c6-17; Mon, 03 Jul 2023 16:51:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGMmL-0005Sj-PE; Mon, 03 Jul 2023 16:51:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGMmL-0006ZN-H1; Mon, 03 Jul 2023 16:51:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qGMmL-0004Ip-GP; Mon, 03 Jul 2023 16:51:57 +0000
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
	bh=KAac5I6jp3jYwJPvR518QZO6JDKeojORPLGjiqD+qls=; b=3CsY3B6G2d3c0gb9i2GEI7SgMv
	7QHpu6mSaCK5VR+x8RUl3PbGiS5PZYqJez84ioENvHhI5um+vibEYwGQVfSoQkRGVG79foZKRnW6c
	/kdMP+H/QkIJjkUxpgy10joc9YH9vLt1L3nGJ1iZuViJs10hFtkwLkGYSlpzU+LztIpY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181687-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181687: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6c744465b6970080dadb1f297db024284153c912
X-Osstest-Versions-That:
    ovmf=f2188fe5d1553ad1896e27b2514d2f8d0308da8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 03 Jul 2023 16:51:57 +0000

flight 181687 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181687/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6c744465b6970080dadb1f297db024284153c912
baseline version:
 ovmf                 f2188fe5d1553ad1896e27b2514d2f8d0308da8a

Last test of basis   181685  2023-07-03 03:12:31 Z    0 days
Testing same since   181687  2023-07-03 14:42:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Taylor Beebe <t@taylorbeebe.com>
  Taylor Beebe <tabeebe@microsoft.com>

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
   f2188fe5d1..6c744465b6  6c744465b6970080dadb1f297db024284153c912 -> xen-tested-master

