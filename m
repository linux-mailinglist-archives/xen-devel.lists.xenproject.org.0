Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553790B683
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 18:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742519.1149331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJFJw-0002Q4-8N; Mon, 17 Jun 2024 16:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742519.1149331; Mon, 17 Jun 2024 16:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJFJw-0002OG-5j; Mon, 17 Jun 2024 16:35:04 +0000
Received: by outflank-mailman (input) for mailman id 742519;
 Mon, 17 Jun 2024 16:35:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJFJu-0002O6-HF; Mon, 17 Jun 2024 16:35:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJFJu-0002kH-As; Mon, 17 Jun 2024 16:35:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJFJu-0000Vx-08; Mon, 17 Jun 2024 16:35:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJFJt-0000YT-Vo; Mon, 17 Jun 2024 16:35:01 +0000
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
	bh=DnubjkE1ogvk2LVLk9bop5nDr48EGPR41PdUTrHyR6c=; b=JBHBiqP/Q/YRLy81AYRVAbSBPZ
	pjbfQc0sWxhAXK2DP5TZzveahBdgcVUlRneZIQIoT1Ase48+hy/Kzsx86NPSpCeKFZ9ocBbl9DYn5
	DtU6q9UtWIL9W0vkTi55yYk0/lhSq5wyoWpJ8p37qbOOD0LzOez2gqBGdFGvTDuoSgBs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186382-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186382: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=128513afcdfa77e94c9637e643898e61c8218e34
X-Osstest-Versions-That:
    ovmf=9fc61309bf56aa7863e36b8f418a49ca6d8364d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jun 2024 16:35:01 +0000

flight 186382 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186382/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 128513afcdfa77e94c9637e643898e61c8218e34
baseline version:
 ovmf                 9fc61309bf56aa7863e36b8f418a49ca6d8364d0

Last test of basis   186379  2024-06-17 12:12:58 Z    0 days
Testing same since   186382  2024-06-17 14:13:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   9fc61309bf..128513afcd  128513afcdfa77e94c9637e643898e61c8218e34 -> xen-tested-master

