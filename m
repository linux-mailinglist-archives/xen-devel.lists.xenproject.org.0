Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D08D5EA5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733527.1139831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyl7-0006T4-Mu; Fri, 31 May 2024 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733527.1139831; Fri, 31 May 2024 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyl7-0006RN-KL; Fri, 31 May 2024 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 733527;
 Fri, 31 May 2024 09:41:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCyl5-0006RB-Pd; Fri, 31 May 2024 09:41:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCyl5-0004ev-LL; Fri, 31 May 2024 09:41:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCyl5-0000eN-EZ; Fri, 31 May 2024 09:41:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCyl5-0007l3-E3; Fri, 31 May 2024 09:41:11 +0000
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
	bh=WSu+Xy1B0+MZjupwPUj0sTeMgbMzYOmiuifM1izT6WM=; b=esNJS5BhVesG4fsKxO5LuKl4hD
	GcvV3GaTRJp5DFtfi6YRfje9EU+IGRmVqxTHJ2H6FiVO+qnX7KNuEajKgPDSAXrxqRP8wfULlM8hq
	XGJp0Pxeu5DXF3cnm/bk3Bu6Y8ssJ1emBFSZFcJzHr79aZ1WZQy7mU3dRashm/6iPVmw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186209-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186209: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=746cc5cc40bef22d606cd22d1feb10d73a7b3d11
X-Osstest-Versions-That:
    ovmf=5f68a363d0d95bd0d383861ae21886d9824a8cd4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 31 May 2024 09:41:11 +0000

flight 186209 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186209/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 746cc5cc40bef22d606cd22d1feb10d73a7b3d11
baseline version:
 ovmf                 5f68a363d0d95bd0d383861ae21886d9824a8cd4

Last test of basis   186205  2024-05-31 02:11:12 Z    0 days
Testing same since   186209  2024-05-31 08:13:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shang Qingyu <qingyu.shang@intel.com>

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
   5f68a363d0..746cc5cc40  746cc5cc40bef22d606cd22d1feb10d73a7b3d11 -> xen-tested-master

