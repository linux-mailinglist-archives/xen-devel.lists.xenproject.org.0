Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D85E74C0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 09:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410603.653685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obczo-0001eO-3d; Fri, 23 Sep 2022 07:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410603.653685; Fri, 23 Sep 2022 07:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obczo-0001bx-0M; Fri, 23 Sep 2022 07:21:12 +0000
Received: by outflank-mailman (input) for mailman id 410603;
 Fri, 23 Sep 2022 07:21:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obczm-0001bn-9t; Fri, 23 Sep 2022 07:21:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obczm-0003fA-24; Fri, 23 Sep 2022 07:21:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obczl-0004ZC-Oc; Fri, 23 Sep 2022 07:21:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obczl-0001TC-O6; Fri, 23 Sep 2022 07:21:09 +0000
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
	bh=83Y1wIi2B66CTlbFo5z48wGihevd0PD/9ViA5VbGw4A=; b=dazz5XV5ghyzP1TtaqAVLbVry3
	M2KiJbbYJOOcqx9bY0xBZM0JRFHXxQlx5YP9zssfRm2fCmrargP4/YaNgb+lTN7lV8YQXCiwP80X0
	V7r2apU8xwAUgtOMr+Yn7IE1gH9nYLf3jfMqbHpMqG4LTVTcS5XzyKvsV0Ht3DtNv8CQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173286: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=238f5f95448c0cbffab5532b21bc4d5f27cf1cee
X-Osstest-Versions-That:
    ovmf=6f340acfb10992af914ed5e17127cc786e0a7f7b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 07:21:09 +0000

flight 173286 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173286/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 238f5f95448c0cbffab5532b21bc4d5f27cf1cee
baseline version:
 ovmf                 6f340acfb10992af914ed5e17127cc786e0a7f7b

Last test of basis   173282  2022-09-23 00:41:56 Z    0 days
Testing same since   173286  2022-09-23 02:58:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   6f340acfb1..238f5f9544  238f5f95448c0cbffab5532b21bc4d5f27cf1cee -> xen-tested-master

