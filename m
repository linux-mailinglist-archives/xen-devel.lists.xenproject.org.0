Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55F41519A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 22:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193034.343834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT99R-0005H5-Tt; Wed, 22 Sep 2021 20:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193034.343834; Wed, 22 Sep 2021 20:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT99R-0005FD-Qa; Wed, 22 Sep 2021 20:47:33 +0000
Received: by outflank-mailman (input) for mailman id 193034;
 Wed, 22 Sep 2021 20:47:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT99R-0005F3-19; Wed, 22 Sep 2021 20:47:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT99Q-0007zE-Qd; Wed, 22 Sep 2021 20:47:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mT99Q-0004tj-Iq; Wed, 22 Sep 2021 20:47:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mT99Q-0007Fd-IL; Wed, 22 Sep 2021 20:47:32 +0000
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
	bh=d7XrgVjbrrlBPL86Ij/OiMtD0FBKwjVYOQl0sFghkW8=; b=3O88E8WV1obpM85OVA2tR6Dv7T
	Rb4vd/LHw5FWhmQUs1DDWdL1yjwn3F97SUmt5aa2bVR9SE0bGKyVGZEDpwoDiSS4RmjTgQCkV7ysv
	K+LCRJtKdNkxBNRYWoriXo1i6HdINbYXwtLR1ZFVUuS5tGnIUrFDZyu1CW8TJicCeIqY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165155-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165155: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=79019c7a42287e8591ec98487db0e849384a74e1
X-Osstest-Versions-That:
    ovmf=f334c5a41dc4702b1c767c6614025aa2f802f9a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Sep 2021 20:47:32 +0000

flight 165155 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165155/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 79019c7a42287e8591ec98487db0e849384a74e1
baseline version:
 ovmf                 f334c5a41dc4702b1c767c6614025aa2f802f9a4

Last test of basis   165151  2021-09-22 09:30:38 Z    0 days
Testing same since   165155  2021-09-22 12:40:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <c.koehne@beckhoff.com>

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
   f334c5a41d..79019c7a42  79019c7a42287e8591ec98487db0e849384a74e1 -> xen-tested-master

