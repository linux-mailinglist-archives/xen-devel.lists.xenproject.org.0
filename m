Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C58625D2
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 16:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685100.1065454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdu5D-00031V-VM; Sat, 24 Feb 2024 15:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685100.1065454; Sat, 24 Feb 2024 15:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdu5D-0002zl-SN; Sat, 24 Feb 2024 15:36:59 +0000
Received: by outflank-mailman (input) for mailman id 685100;
 Sat, 24 Feb 2024 15:36:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdu5C-0002zb-Fr; Sat, 24 Feb 2024 15:36:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdu5C-00005P-Cw; Sat, 24 Feb 2024 15:36:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdu5C-0005Oy-0b; Sat, 24 Feb 2024 15:36:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rdu5C-0005Ab-06; Sat, 24 Feb 2024 15:36:58 +0000
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
	bh=x2o82TiMfOVeqYphLO19sKn8xD5epgGMEKjzAGMEr6s=; b=qF7i0b/XLPiNBukf82GvnncE+M
	ZCigmQ9tcOCWAiPNslAqJfCe1HRJzz9kiy1vnOCo7B5xOrhNlvG9kMtLkUbti7B4ptfIsde3GJbQT
	x4XVtgCGB5j9KeM7RiwCFOSOKcswmF57xANNIuZPzdJwGU3MBSUO8fn89S5esoVUivH8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184751-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184751: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7fa4a984c438b897086f5e2fea6b9e9ad17867c4
X-Osstest-Versions-That:
    ovmf=11ad164bcea6b0ed3628d595090f84892c367086
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Feb 2024 15:36:58 +0000

flight 184751 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184751/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7fa4a984c438b897086f5e2fea6b9e9ad17867c4
baseline version:
 ovmf                 11ad164bcea6b0ed3628d595090f84892c367086

Last test of basis   184736  2024-02-23 13:13:11 Z    1 days
Testing same since   184751  2024-02-24 13:41:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   11ad164bce..7fa4a984c4  7fa4a984c438b897086f5e2fea6b9e9ad17867c4 -> xen-tested-master

