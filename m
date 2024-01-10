Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003D829A81
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 13:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665419.1035614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNXs0-0002Hr-5X; Wed, 10 Jan 2024 12:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665419.1035614; Wed, 10 Jan 2024 12:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNXs0-0002FH-1p; Wed, 10 Jan 2024 12:39:44 +0000
Received: by outflank-mailman (input) for mailman id 665419;
 Wed, 10 Jan 2024 12:39:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNXry-0002F7-KR; Wed, 10 Jan 2024 12:39:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNXry-0002Ic-Gs; Wed, 10 Jan 2024 12:39:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNXry-0006HJ-5J; Wed, 10 Jan 2024 12:39:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNXry-0002G3-4V; Wed, 10 Jan 2024 12:39:42 +0000
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
	bh=KchJmWNIiQth6ExTyrehNEu/4gXrHQ6uQinHx5FGTto=; b=ZAU7UJJ8YRVb1X1VcESMyfqS2y
	VBqDjWK0KOetAzoeZn8KzWynhSfprmFw8bynuPraOobU1yiBk5FvdFx2k0yOk1+8+GjyU+Q3aDK7p
	BuLCLNEsSQC+19fExeM5kgzUPD2wFDCtfZOFxRdN+VKiQB4i7CiE0S7z8pjI8yRk1gQE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184305-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184305: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bc34a79cd2a005e1d12d4b05bec6efc3b102cad6
X-Osstest-Versions-That:
    ovmf=265b4ab91b8a31d6d1760ad1eaa1e16f9244cba7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 12:39:42 +0000

flight 184305 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184305/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bc34a79cd2a005e1d12d4b05bec6efc3b102cad6
baseline version:
 ovmf                 265b4ab91b8a31d6d1760ad1eaa1e16f9244cba7

Last test of basis   184302  2024-01-10 06:11:07 Z    0 days
Testing same since   184305  2024-01-10 10:41:30 Z    0 days    1 attempts

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
   265b4ab91b..bc34a79cd2  bc34a79cd2a005e1d12d4b05bec6efc3b102cad6 -> xen-tested-master

