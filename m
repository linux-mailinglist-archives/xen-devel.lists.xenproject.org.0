Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2A94FE09
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 08:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775960.1186115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlDp-0007q2-CM; Tue, 13 Aug 2024 06:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775960.1186115; Tue, 13 Aug 2024 06:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdlDp-0007nP-9M; Tue, 13 Aug 2024 06:41:33 +0000
Received: by outflank-mailman (input) for mailman id 775960;
 Tue, 13 Aug 2024 06:41:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdlDo-0007nB-Fu; Tue, 13 Aug 2024 06:41:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdlDo-0007UC-Cx; Tue, 13 Aug 2024 06:41:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdlDo-0002Cb-0F; Tue, 13 Aug 2024 06:41:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sdlDn-0003Ya-Vu; Tue, 13 Aug 2024 06:41:31 +0000
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
	bh=cWuijIoHNUobMFrmgpEtNPdbsYmOef5ZvpzFKe6IF+o=; b=w2/lFFkSVa+ivR0gmOs7xuPMYO
	sZ4gyttCmE5lQYE3VH2oycg1bzz0kYVRl7PG37hd84BJaMlYSILJVlV9nBXS6m98goHueBatDXRAf
	twr7jc68S3BaoNFoCMSwQr6RLIKYz5FmOQsQRkGM6epN11v4PFzPw7jdtaK5HdZ8QOvw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187222-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187222: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b158dad150bf02879668f72ce306445250838201
X-Osstest-Versions-That:
    ovmf=b0f43dd3fdec2363e3548ec31eb455dc1c4ac761
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Aug 2024 06:41:31 +0000

flight 187222 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187222/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b158dad150bf02879668f72ce306445250838201
baseline version:
 ovmf                 b0f43dd3fdec2363e3548ec31eb455dc1c4ac761

Last test of basis   187187  2024-08-08 01:56:57 Z    5 days
Testing same since   187222  2024-08-13 05:11:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali <ashraf.ali.s@intel.com>

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
   b0f43dd3fd..b158dad150  b158dad150bf02879668f72ce306445250838201 -> xen-tested-master

