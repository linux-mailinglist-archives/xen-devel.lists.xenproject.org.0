Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677E42A781
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207318.363106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIyz-0005Hz-Lz; Tue, 12 Oct 2021 14:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207318.363106; Tue, 12 Oct 2021 14:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIyz-0005Fj-Hk; Tue, 12 Oct 2021 14:42:21 +0000
Received: by outflank-mailman (input) for mailman id 207318;
 Tue, 12 Oct 2021 14:42:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maIyy-0005FZ-B3; Tue, 12 Oct 2021 14:42:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maIyy-0002zd-7A; Tue, 12 Oct 2021 14:42:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maIyx-0008Lh-UR; Tue, 12 Oct 2021 14:42:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1maIyx-0007K1-Ty; Tue, 12 Oct 2021 14:42:19 +0000
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
	bh=lk+0YB/VDJMjpjpKDbdk+zovGovYHmFbyyWnj2hSG4E=; b=W+knjy3P4Gp7+HvvnKMmJs9dMY
	EaBzha9vPb7D3YZxypcmqPX75gUOrTNKtcz4Dk7Atz3te3ubMvp7BEmH1ls4nMzKtJx40lWPqwyaa
	crX0xkJST7jgK4LL+jI1ku79UGOUbxR9/knDIGCCANZfno9ycbDj2HkSb5yHwF7XHddA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165474-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165474: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ba4ae92234b1985a89b3abed221d825b8d9ef9e2
X-Osstest-Versions-That:
    ovmf=19ee56c4b33faa33078894a6c8495c81c660b8be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Oct 2021 14:42:19 +0000

flight 165474 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165474/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ba4ae92234b1985a89b3abed221d825b8d9ef9e2
baseline version:
 ovmf                 19ee56c4b33faa33078894a6c8495c81c660b8be

Last test of basis   165462  2021-10-11 06:10:05 Z    1 days
Testing same since   165474  2021-10-12 06:12:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Star Zeng <star.zeng@intel.com>
  Zeng, Star <star.zeng@intel.com>

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
   19ee56c4b3..ba4ae92234  ba4ae92234b1985a89b3abed221d825b8d9ef9e2 -> xen-tested-master

