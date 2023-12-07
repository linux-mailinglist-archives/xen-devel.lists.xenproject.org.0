Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA87809201
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 21:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650165.1015406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBKZp-0001c1-OX; Thu, 07 Dec 2023 20:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650165.1015406; Thu, 07 Dec 2023 20:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBKZp-0001Zc-LW; Thu, 07 Dec 2023 20:02:29 +0000
Received: by outflank-mailman (input) for mailman id 650165;
 Thu, 07 Dec 2023 20:02:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBKZo-0001ZS-SE; Thu, 07 Dec 2023 20:02:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBKZo-0003EM-FW; Thu, 07 Dec 2023 20:02:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBKZo-0000ln-2v; Thu, 07 Dec 2023 20:02:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBKZo-0001gw-2S; Thu, 07 Dec 2023 20:02:28 +0000
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
	bh=K0IME7rZShUTPPAINkq8BDeKbN9fdIVY/czzvCMDJcY=; b=3IBxHGCSzwp+H7G6BJKROvEgHh
	7jlXaqw8DvH+2ahOMG3Il4kU6uKwc+N1zTqe4D5JOHorwFZVpOq6YPfP3MBcunVlL0n1LCg08NkgM
	xIffHNaO5MXjGAzSBzLKoAdPfI3SNNkl47rQ+Yc1fLSRsUCewTBRw5XWkVjdczXh5tww=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184027-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184027: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=238690a30d02d3f95f0355c88c35dc0e4232342a
X-Osstest-Versions-That:
    ovmf=553dfb0f57ae8a666938873cf836a33549568c87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Dec 2023 20:02:28 +0000

flight 184027 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184027/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 238690a30d02d3f95f0355c88c35dc0e4232342a
baseline version:
 ovmf                 553dfb0f57ae8a666938873cf836a33549568c87

Last test of basis   184023  2023-12-07 10:14:25 Z    0 days
Testing same since   184027  2023-12-07 17:11:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>

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
   553dfb0f57..238690a30d  238690a30d02d3f95f0355c88c35dc0e4232342a -> xen-tested-master

