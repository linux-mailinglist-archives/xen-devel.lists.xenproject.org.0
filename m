Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B28383B62
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 19:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128434.241123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihAE-0000zR-Fe; Mon, 17 May 2021 17:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128434.241123; Mon, 17 May 2021 17:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihAE-0000xJ-A4; Mon, 17 May 2021 17:36:22 +0000
Received: by outflank-mailman (input) for mailman id 128434;
 Mon, 17 May 2021 17:36:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lihAC-0000x8-RF; Mon, 17 May 2021 17:36:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lihAC-0000av-Ke; Mon, 17 May 2021 17:36:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lihAC-000586-Ca; Mon, 17 May 2021 17:36:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lihAC-0004nR-C7; Mon, 17 May 2021 17:36:20 +0000
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
	bh=SJSSs1DxLASH8X3r16XZ5xp/emnhb4l75L9+ruwEx4o=; b=COR1BeNRimN6hqn2/ZVtZAqzCP
	8fIZDVwttsd7mZ9Mv518N9o8FF54hCa+qoh9jz9ajJhBC2Jk2wcetbjCun3uESTlUqyDeiNgDxPn3
	vYPRwWMed0Uk06YseVRqYtJ8eGmMgt796ZY8W2qaUTWGatStuRYUVsCjZ3HOPliYjwHY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161979-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161979: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d2e0c473e6f0d518e8acb187f99bb7e61f7df862
X-Osstest-Versions-That:
    ovmf=e0cb5e1814a67bb12dd476a72d1698350633bcbb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 May 2021 17:36:20 +0000

flight 161979 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161979/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d2e0c473e6f0d518e8acb187f99bb7e61f7df862
baseline version:
 ovmf                 e0cb5e1814a67bb12dd476a72d1698350633bcbb

Last test of basis   161974  2021-05-17 02:40:16 Z    0 days
Testing same since   161979  2021-05-17 11:10:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Daniel Schaefer <daniel.schaefer@hpe.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   e0cb5e1814..d2e0c473e6  d2e0c473e6f0d518e8acb187f99bb7e61f7df862 -> xen-tested-master

