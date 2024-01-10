Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F4829E36
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 17:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665660.1035887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNb8s-00069y-QT; Wed, 10 Jan 2024 16:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665660.1035887; Wed, 10 Jan 2024 16:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNb8s-00067r-Ns; Wed, 10 Jan 2024 16:09:22 +0000
Received: by outflank-mailman (input) for mailman id 665660;
 Wed, 10 Jan 2024 16:09:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNb8r-00067h-Tl; Wed, 10 Jan 2024 16:09:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNb8r-00075w-ND; Wed, 10 Jan 2024 16:09:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNb8r-0000Jx-7t; Wed, 10 Jan 2024 16:09:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNb8r-0002MZ-7U; Wed, 10 Jan 2024 16:09:21 +0000
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
	bh=atz9OULK5kcGwxXS0TmAlM/EYRw6q/UhE2hZbbVVGC4=; b=13Z0wVIx/z7mOzdqGQj7FVYIxV
	1dg1d8ftrwbekrNzJwoYN0K0neAK6ipTzzoe++pFuETqsiCAeSIOZSfk9zP2nF1RhViEMno+MOqep
	hV02+RMIZILna/8Ntxd55wGc8BBs0Vu6F6f1+VAU9We6i+FHjXpLMh9zBh2Y9394GlqI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184307: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7d055812cc7a7d2b062cf56291211e8cecca36ed
X-Osstest-Versions-That:
    ovmf=bc34a79cd2a005e1d12d4b05bec6efc3b102cad6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 16:09:21 +0000

flight 184307 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184307/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7d055812cc7a7d2b062cf56291211e8cecca36ed
baseline version:
 ovmf                 bc34a79cd2a005e1d12d4b05bec6efc3b102cad6

Last test of basis   184305  2024-01-10 10:41:30 Z    0 days
Testing same since   184307  2024-01-10 12:41:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Arun Sura <arun.surax.soundara.pandian@intel.com>

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
   bc34a79cd2..7d055812cc  7d055812cc7a7d2b062cf56291211e8cecca36ed -> xen-tested-master

