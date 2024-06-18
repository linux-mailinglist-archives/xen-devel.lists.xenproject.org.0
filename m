Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E190C480
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 09:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742759.1149620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTQT-0006dY-5O; Tue, 18 Jun 2024 07:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742759.1149620; Tue, 18 Jun 2024 07:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTQT-0006bZ-26; Tue, 18 Jun 2024 07:38:45 +0000
Received: by outflank-mailman (input) for mailman id 742759;
 Tue, 18 Jun 2024 07:38:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJTQS-0006bP-3D; Tue, 18 Jun 2024 07:38:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJTQR-0002xj-QE; Tue, 18 Jun 2024 07:38:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJTQR-0008Bi-BQ; Tue, 18 Jun 2024 07:38:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJTQR-0002Xd-Aw; Tue, 18 Jun 2024 07:38:43 +0000
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
	bh=Lh67WCtQ02Or1J4BrJFejXEB9U+2B6kU6/wHvKjBJS0=; b=fXGKBq2W97Y0UKgcujhn1LqctZ
	cEO3GvAiFBhDws9g54H1zdT4pt2HdYhKbHZv4iAyAQmZWN1GsimAchq8vnvZVK+XK7lUxk4cZU2QX
	uyTonh2hno2tWNCI56JyBqQK/l+341nmtMtcVdbBfxKlPiyQw+0bMgHPL9GejSbBiZzI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186391: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=537a81ae81622d65052184b281e8b2754d0b5313
X-Osstest-Versions-That:
    ovmf=128513afcdfa77e94c9637e643898e61c8218e34
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 07:38:43 +0000

flight 186391 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186391/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 537a81ae81622d65052184b281e8b2754d0b5313
baseline version:
 ovmf                 128513afcdfa77e94c9637e643898e61c8218e34

Last test of basis   186382  2024-06-17 14:13:00 Z    0 days
Testing same since   186391  2024-06-18 06:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Paul Grimes <paul.grimes@amd.com>

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
   128513afcd..537a81ae81  537a81ae81622d65052184b281e8b2754d0b5313 -> xen-tested-master

