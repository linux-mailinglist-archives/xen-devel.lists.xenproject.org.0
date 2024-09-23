Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECC97E61E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 08:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801667.1211634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssci3-00039D-Px; Mon, 23 Sep 2024 06:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801667.1211634; Mon, 23 Sep 2024 06:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssci3-00036f-MR; Mon, 23 Sep 2024 06:38:11 +0000
Received: by outflank-mailman (input) for mailman id 801667;
 Mon, 23 Sep 2024 06:38:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssci2-00036V-CQ; Mon, 23 Sep 2024 06:38:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssci2-0006vu-AG; Mon, 23 Sep 2024 06:38:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssci1-0003YK-RR; Mon, 23 Sep 2024 06:38:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssci1-0001B4-Qw; Mon, 23 Sep 2024 06:38:09 +0000
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
	bh=Qfp3CwsxF4yTXEtP+Cou6mIYtgw+8CDc/plF4g9HQK8=; b=FFghQ/3Xyrcuw3Ve9zidrpNbqk
	IM1JvKeGScS/C10ZjykpbL9IumuMuKUxvTR1OlVfhmnyuX2+92FjIoBQ36pJp3i4S5GN5VVZGNWxc
	SI1J1oqIo8ozoUPJWpnkxReVJj/S1tuJTsrW6q1zVpMe2m91NkExluFhXHlS4315nrAM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187821-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187821: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6820004b3e2b6997b8ad8663c548fb3da2fcb3b2
X-Osstest-Versions-That:
    ovmf=14bfcc402163d5e4fdefb1258740a24b6ee7261d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 06:38:09 +0000

flight 187821 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187821/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6820004b3e2b6997b8ad8663c548fb3da2fcb3b2
baseline version:
 ovmf                 14bfcc402163d5e4fdefb1258740a24b6ee7261d

Last test of basis   187819  2024-09-23 01:56:52 Z    0 days
Testing same since   187821  2024-09-23 05:13:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>
  Zhou Jianfeng <jianfeng.zhou@intel.com>

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
   14bfcc4021..6820004b3e  6820004b3e2b6997b8ad8663c548fb3da2fcb3b2 -> xen-tested-master

