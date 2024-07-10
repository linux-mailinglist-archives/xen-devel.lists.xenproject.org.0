Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5792C972
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 05:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756514.1165155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sROOB-0005Wo-2t; Wed, 10 Jul 2024 03:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756514.1165155; Wed, 10 Jul 2024 03:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sROOA-0005Ub-Vx; Wed, 10 Jul 2024 03:53:06 +0000
Received: by outflank-mailman (input) for mailman id 756514;
 Wed, 10 Jul 2024 03:53:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sROO9-0005UL-Gn; Wed, 10 Jul 2024 03:53:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sROO9-0007W6-Dp; Wed, 10 Jul 2024 03:53:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sROO9-0000WD-0S; Wed, 10 Jul 2024 03:53:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sROO8-0003GH-VH; Wed, 10 Jul 2024 03:53:04 +0000
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
	bh=Y4yktUeJNrjt1L8hk8SD424JSLRbVlBKyhJGK5d/um4=; b=f06XPrbnbjtszBGzcXTvpOL4m/
	KK5SVuWSe6hS0vem0qwVAiM5O79U5g+D4vMqoSC0Hi8tKANy3idIv0jfYcYf62KWnlIWSxxtk7k9X
	AVz/8IqeaBA+IAuKDkULbDbcxlsgL/rvLQNGBQJ2D8/l2MRJBWw4d+j16d1ZKGBsX6tY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186746: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f91211049c1522f7db2ae8f7a509ac270868d0e9
X-Osstest-Versions-That:
    ovmf=7aaee521a1966e71a51b71b73f5e3bbddb6faa31
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jul 2024 03:53:04 +0000

flight 186746 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186746/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f91211049c1522f7db2ae8f7a509ac270868d0e9
baseline version:
 ovmf                 7aaee521a1966e71a51b71b73f5e3bbddb6faa31

Last test of basis   186744  2024-07-09 18:11:13 Z    0 days
Testing same since   186746  2024-07-10 02:12:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin@microsoft.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   7aaee521a1..f91211049c  f91211049c1522f7db2ae8f7a509ac270868d0e9 -> xen-tested-master

