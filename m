Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF19546E4B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 22:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346709.572602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzlBW-0007j8-4d; Fri, 10 Jun 2022 20:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346709.572602; Fri, 10 Jun 2022 20:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzlBW-0007gq-11; Fri, 10 Jun 2022 20:24:46 +0000
Received: by outflank-mailman (input) for mailman id 346709;
 Fri, 10 Jun 2022 20:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzlBU-0007gg-6P; Fri, 10 Jun 2022 20:24:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzlBU-0000IU-2K; Fri, 10 Jun 2022 20:24:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzlBT-0007Gw-Lk; Fri, 10 Jun 2022 20:24:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzlBT-0003cU-LF; Fri, 10 Jun 2022 20:24:43 +0000
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
	bh=IgIE+Tpl40SqXHmm3kfaVLNhLOS+F5qwsoozkk4ExLU=; b=VWA6FtDR1rHVixigdLxZjD8vJ0
	aI5XtC3ouShhkDuSdCrOeN2dnm+RYV1quUeP2VP92aH6DKDaESg5fe+1As+DYPCDbrbJYaBaqgyJj
	yNjnH4tHvMmizcxijn2Z+pRl4LYPnvJ8Dn1ZR3XeBqKPxR9jeYSIbj72gdoEk1rY4C0I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170935-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170935: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ccc269756f773d35aab67ccb935fa9548f30cff3
X-Osstest-Versions-That:
    ovmf=e7abb94d1fb8a0e7725b983bbf5ab1334afe7ed1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 20:24:43 +0000

flight 170935 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170935/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ccc269756f773d35aab67ccb935fa9548f30cff3
baseline version:
 ovmf                 e7abb94d1fb8a0e7725b983bbf5ab1334afe7ed1

Last test of basis   170919  2022-06-10 08:10:33 Z    0 days
Testing same since   170935  2022-06-10 12:40:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   e7abb94d1f..ccc269756f  ccc269756f773d35aab67ccb935fa9548f30cff3 -> xen-tested-master

