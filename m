Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824D6BD301
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510674.788808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpGQ-0007jB-Dh; Thu, 16 Mar 2023 15:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510674.788808; Thu, 16 Mar 2023 15:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpGQ-0007gI-9u; Thu, 16 Mar 2023 15:11:34 +0000
Received: by outflank-mailman (input) for mailman id 510674;
 Thu, 16 Mar 2023 15:11:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcpGP-0007g6-O0; Thu, 16 Mar 2023 15:11:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcpGP-0001vd-ME; Thu, 16 Mar 2023 15:11:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pcpGP-0008MG-F9; Thu, 16 Mar 2023 15:11:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pcpGP-0001GZ-Ei; Thu, 16 Mar 2023 15:11:33 +0000
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
	bh=5F6wXr8rXxnnlvfOlT4tHV0xsWRI461l7D2ZXQKTzg8=; b=kbgbDoipyFshh9PQvmQAXFweuL
	zNzvTjkAZ3T0WvgxfzU1zZbkRMLqlFxP5B9RNT9Ia8wAZRVG7PrwMWg6ZMbnBm5kRooySUK7yQPWf
	39Na3m6c4TPCza3Hk03kXUbVDE9qJKoFt1C8/i2drMm5ma5yppJz2Kfqde1dpv+te9Vk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179677-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179677: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7cfe9048e3ecad7988d66ce1f0ec20d9aef509ee
X-Osstest-Versions-That:
    ovmf=961792c9d61f7e03e0c1b6b9f93b8b306df94bf9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Mar 2023 15:11:33 +0000

flight 179677 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179677/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7cfe9048e3ecad7988d66ce1f0ec20d9aef509ee
baseline version:
 ovmf                 961792c9d61f7e03e0c1b6b9f93b8b306df94bf9

Last test of basis   179625  2023-03-14 10:15:04 Z    2 days
Testing same since   179677  2023-03-16 11:12:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Sunil V L <sunilvl@ventanamicro.com>

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
   961792c9d6..7cfe9048e3  7cfe9048e3ecad7988d66ce1f0ec20d9aef509ee -> xen-tested-master

