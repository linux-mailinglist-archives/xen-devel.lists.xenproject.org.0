Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD336596EB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 10:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469871.729298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBBvs-00052T-8H; Fri, 30 Dec 2022 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469871.729298; Fri, 30 Dec 2022 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBBvs-00050V-4c; Fri, 30 Dec 2022 09:44:08 +0000
Received: by outflank-mailman (input) for mailman id 469871;
 Fri, 30 Dec 2022 09:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBBvq-00050L-TT; Fri, 30 Dec 2022 09:44:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBBvq-0006ck-RC; Fri, 30 Dec 2022 09:44:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBBvq-0006s9-Ft; Fri, 30 Dec 2022 09:44:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pBBvq-0005sv-FS; Fri, 30 Dec 2022 09:44:06 +0000
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
	bh=PNiQZwDxIpWfgE1gd4oftNjl8vXvZSrmcRFqNZU2KJY=; b=pUzXfuhcp2RM65Xlo6vnwtIf7f
	EA56eo1HBuimSArxbGQ282C8N7Xxpbh1GiGg1GbaEF+PK5nhFjplelklE16uTBjcdWxf3ZMQNiKhD
	RdoX1MQYKcP2ybtuxZVA2gcrj4NUxV+zxJnXiqZgKGvTLu3x1EqKgTL98uSPHNgXfXiU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175529-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175529: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bbd30066e137c036db140b6e58e6e172e2827eb3
X-Osstest-Versions-That:
    ovmf=c5d68ef6e7553ab2894f541eba4e982428ecbd53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Dec 2022 09:44:06 +0000

flight 175529 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175529/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bbd30066e137c036db140b6e58e6e172e2827eb3
baseline version:
 ovmf                 c5d68ef6e7553ab2894f541eba4e982428ecbd53

Last test of basis   175527  2022-12-30 03:42:19 Z    0 days
Testing same since   175529  2022-12-30 07:40:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jake Garver <jake@nvidia.com>
  Jake Garver via groups.io <jake=nvidia.com@groups.io>

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
   c5d68ef6e7..bbd30066e1  bbd30066e137c036db140b6e58e6e172e2827eb3 -> xen-tested-master

