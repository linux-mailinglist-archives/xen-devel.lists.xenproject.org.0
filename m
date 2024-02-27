Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE589868555
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 01:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685854.1067253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relmW-0006AQ-17; Tue, 27 Feb 2024 00:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685854.1067253; Tue, 27 Feb 2024 00:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relmV-00068n-UQ; Tue, 27 Feb 2024 00:57:15 +0000
Received: by outflank-mailman (input) for mailman id 685854;
 Tue, 27 Feb 2024 00:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1relmT-00068d-Sw; Tue, 27 Feb 2024 00:57:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1relmT-0002xF-Pb; Tue, 27 Feb 2024 00:57:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1relmT-0006TK-G8; Tue, 27 Feb 2024 00:57:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1relmT-0004n5-FW; Tue, 27 Feb 2024 00:57:13 +0000
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
	bh=INLM7nRsD98S3WVP0RaMg1uIk6Fy8XF6ylq09s+Lkh4=; b=yUXP6dqcztydmFREEtp9eebERI
	wxS1JTsytOak+KG8kXfkGFFeqECoTUMark9OxPbxNEeI1758iTzOoR7xpCWhJsfeEl5Z32V3JpFMi
	wNBdu8V8ztDhuCeimkm5eSXr8VjOoK1ho3+/sq893wHuMcNZmTfH7vJgJuPylNrgvvCs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184775-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184775: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d25421d0d8cd2493b30215ef80d2424ecb19c870
X-Osstest-Versions-That:
    ovmf=68238d4f948069fc2c6b9cc13863bdced52a84d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Feb 2024 00:57:13 +0000

flight 184775 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184775/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d25421d0d8cd2493b30215ef80d2424ecb19c870
baseline version:
 ovmf                 68238d4f948069fc2c6b9cc13863bdced52a84d0

Last test of basis   184772  2024-02-26 19:43:08 Z    0 days
Testing same since   184775  2024-02-26 22:43:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   68238d4f94..d25421d0d8  d25421d0d8cd2493b30215ef80d2424ecb19c870 -> xen-tested-master

