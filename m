Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8A8FC312
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 07:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735545.1141667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEjR1-0002DD-Qb; Wed, 05 Jun 2024 05:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735545.1141667; Wed, 05 Jun 2024 05:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEjR1-0002Bl-Nl; Wed, 05 Jun 2024 05:43:43 +0000
Received: by outflank-mailman (input) for mailman id 735545;
 Wed, 05 Jun 2024 05:43:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEjR0-0002Bb-1F; Wed, 05 Jun 2024 05:43:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEjQz-0006vy-TB; Wed, 05 Jun 2024 05:43:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEjQz-0002Dz-MP; Wed, 05 Jun 2024 05:43:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEjQz-0001Gq-Lw; Wed, 05 Jun 2024 05:43:41 +0000
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
	bh=OoQlAvB/DhlR4NJTxwvWX8ipfBD0LXeF3W9RwwbvNYQ=; b=HCTj+BxgE9+YNrNqnKnqQQNiUb
	FNVAR7Sb/iVfSvvBBDoriKaPZwJ2P4/JmjPkBpeF4nwun/r3N1amenz3qZk8aFRe98x1AtyOwa5qW
	lOT4nGr3wfJaEILNdfYh9nkGnVHQPEKWjEl09PEVXKqtDv7xHowxctnC8VslQBk1Jxis=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186254-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186254: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e2e09d8512898709a3d076fdd36c8abee2734027
X-Osstest-Versions-That:
    ovmf=7772e339bdbbaad81e84086eec0f8577e54e0f28
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jun 2024 05:43:41 +0000

flight 186254 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186254/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e2e09d8512898709a3d076fdd36c8abee2734027
baseline version:
 ovmf                 7772e339bdbbaad81e84086eec0f8577e54e0f28

Last test of basis   186251  2024-06-04 23:14:39 Z    0 days
Testing same since   186254  2024-06-05 03:41:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron <105021049+apop5@users.noreply.github.com>
  Aaron Pop <aaronpop@microsoft.com>

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
   7772e339bd..e2e09d8512  e2e09d8512898709a3d076fdd36c8abee2734027 -> xen-tested-master

