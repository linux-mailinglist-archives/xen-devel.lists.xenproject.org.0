Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD0943836
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 23:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769137.1180028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZH98-0006ti-Hx; Wed, 31 Jul 2024 21:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769137.1180028; Wed, 31 Jul 2024 21:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZH98-0006qz-FF; Wed, 31 Jul 2024 21:46:10 +0000
Received: by outflank-mailman (input) for mailman id 769137;
 Wed, 31 Jul 2024 21:46:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZH96-0006qp-7P; Wed, 31 Jul 2024 21:46:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZH95-0005Jf-Vj; Wed, 31 Jul 2024 21:46:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZH95-0005D7-NQ; Wed, 31 Jul 2024 21:46:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZH95-0003uu-Mw; Wed, 31 Jul 2024 21:46:07 +0000
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
	bh=k1lCB5aot4UzVptA2u6cK9ofja0gHKWkfj/I2Itqj9E=; b=o/01X63gUfKdyLsEDCBHP31DQQ
	S04eJE6vNYZxBFuh3dxZXPJKn0eRiekhWYVRi8EfVJHtQwskMiXSAlqYN58hcq6kHPfuPV4rdEP++
	AC34490prZCHhuYDjCQTHKafB5dAQMNqS+9+b7p4PzF9SE49mkj/V9byapOw2KEkA0mU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187090-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187090: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a9158fe9a670cebbb9d361a1b7fc3075fdf33393
X-Osstest-Versions-That:
    ovmf=1fc55a3933b0d17430c2857629ee54abefaad7eb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jul 2024 21:46:07 +0000

flight 187090 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187090/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a9158fe9a670cebbb9d361a1b7fc3075fdf33393
baseline version:
 ovmf                 1fc55a3933b0d17430c2857629ee54abefaad7eb

Last test of basis   187085  2024-07-31 14:43:21 Z    0 days
Testing same since   187090  2024-07-31 20:15:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  xieyuanh <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   1fc55a3933..a9158fe9a6  a9158fe9a670cebbb9d361a1b7fc3075fdf33393 -> xen-tested-master

