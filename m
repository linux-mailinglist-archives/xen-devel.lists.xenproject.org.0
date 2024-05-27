Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58738CFF1D
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 13:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730694.1135853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBYd5-0002K5-7s; Mon, 27 May 2024 11:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730694.1135853; Mon, 27 May 2024 11:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBYd5-0002HP-5H; Mon, 27 May 2024 11:35:03 +0000
Received: by outflank-mailman (input) for mailman id 730694;
 Mon, 27 May 2024 11:35:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBYd3-0002HF-Mx; Mon, 27 May 2024 11:35:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBYd3-0002Po-LK; Mon, 27 May 2024 11:35:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sBYd3-0003sl-9y; Mon, 27 May 2024 11:35:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sBYd3-0003Rd-9M; Mon, 27 May 2024 11:35:01 +0000
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
	bh=6e8NIsWcB0oDnMEEAJUcw5Za6nRD2KdlyX/rOwZeCWA=; b=xW2J31IxHjeognIaH0CG9OI0a0
	G2cmwwsQbErtOPHh4uDU6NYNlVl+0oHfU4g6tojxStvo8J8hWouwSGT+BbRWMZwKAtvVEJA/poMP+
	U6zhIiHSnaUKWp5qAIjuVjtYv6q0acOEE2QNdHIzVR68hPnD/vXWYubd/0niuVntkeLM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186160-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186160: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=08281572aab5b1f7e05bf26de4148af19eddc8b7
X-Osstest-Versions-That:
    ovmf=88a4de450f17c6a319c3e8b2135cd7068a07d0f8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 May 2024 11:35:01 +0000

flight 186160 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186160/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 08281572aab5b1f7e05bf26de4148af19eddc8b7
baseline version:
 ovmf                 88a4de450f17c6a319c3e8b2135cd7068a07d0f8

Last test of basis   186158  2024-05-27 02:13:38 Z    0 days
Testing same since   186160  2024-05-27 09:43:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <Jiewen.yao@intel.com>
  Wenxing Hou <wenxing.hou@intel.com>

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
   88a4de450f..08281572aa  08281572aab5b1f7e05bf26de4148af19eddc8b7 -> xen-tested-master

