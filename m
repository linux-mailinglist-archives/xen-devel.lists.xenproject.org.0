Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C451454659B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 13:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346402.572200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcth-0006ec-FQ; Fri, 10 Jun 2022 11:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346402.572200; Fri, 10 Jun 2022 11:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcth-0006bq-Bo; Fri, 10 Jun 2022 11:33:49 +0000
Received: by outflank-mailman (input) for mailman id 346402;
 Fri, 10 Jun 2022 11:33:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzctf-0006bg-UJ; Fri, 10 Jun 2022 11:33:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzctf-0007Ru-T8; Fri, 10 Jun 2022 11:33:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzctf-0005WK-GX; Fri, 10 Jun 2022 11:33:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzctf-0005iL-G8; Fri, 10 Jun 2022 11:33:47 +0000
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
	bh=plAp/u0VwfbrD95IS7LQV7k3C/QvbxkL00N3KWbN8Og=; b=1MW7XHSfdZ+HTgL30wEdUqu32J
	zG1hXrBF/+X5NMyGr791KOsbuY4EKoQ6VuoSgTYXlrCHE8hzbxIZM8EGU2r1M6BCQJnNL9fGK+1Qq
	gYlv5l2DF7g6hKB/j5SMiSWFJ+BRsmmdcQSq7uv4UyUg/WmWaJJYbYNKaNSUvu4a5H8E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170919-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170919: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7abb94d1fb8a0e7725b983bbf5ab1334afe7ed1
X-Osstest-Versions-That:
    ovmf=ff36b2550f94dc5fac838cf298ae5a23cfddf204
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 11:33:47 +0000

flight 170919 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170919/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7abb94d1fb8a0e7725b983bbf5ab1334afe7ed1
baseline version:
 ovmf                 ff36b2550f94dc5fac838cf298ae5a23cfddf204

Last test of basis   170885  2022-06-08 12:11:46 Z    1 days
Testing same since   170919  2022-06-10 08:10:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eric Dong <eric.dong@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   ff36b2550f..e7abb94d1f  e7abb94d1fb8a0e7725b983bbf5ab1334afe7ed1 -> xen-tested-master

