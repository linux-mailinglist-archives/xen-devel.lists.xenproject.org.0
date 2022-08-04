Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B45897D9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 08:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380176.614206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUZa-0005cG-O2; Thu, 04 Aug 2022 06:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380176.614206; Thu, 04 Aug 2022 06:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUZa-0005Z2-Kl; Thu, 04 Aug 2022 06:43:10 +0000
Received: by outflank-mailman (input) for mailman id 380176;
 Thu, 04 Aug 2022 06:43:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJUZZ-0005Ys-Aw; Thu, 04 Aug 2022 06:43:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJUZZ-0004E7-74; Thu, 04 Aug 2022 06:43:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJUZY-0006tz-St; Thu, 04 Aug 2022 06:43:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJUZY-0005zM-SR; Thu, 04 Aug 2022 06:43:08 +0000
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
	bh=RMUXF8QUyBHsZAth/8TXFTms0vNZhfZQKfPrCWHPa68=; b=bsehLFOnxEtuzVj2UXko3hrgdG
	fN5rayDj2F4hBvkHPGUgc8TMK7Dli+bWSsmk6+/Tmuu8Ye8rS6siO3FnF8hp04Aw+iMnsbLfxT+O1
	pddiajZeCJ0T0ygl+xHhBCP74R6vRM3eZwqGOCJxxkw8Ge8mwhIYqh5e+B/RP5ohVWhI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172126-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172126: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d2191197217f9d16541c2d051235c494fa80bce3
X-Osstest-Versions-That:
    ovmf=0dc9b78a46813d61533b2bb0f7ef897a06a273be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Aug 2022 06:43:08 +0000

flight 172126 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172126/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d2191197217f9d16541c2d051235c494fa80bce3
baseline version:
 ovmf                 0dc9b78a46813d61533b2bb0f7ef897a06a273be

Last test of basis   172091  2022-08-03 00:41:46 Z    1 days
Testing same since   172126  2022-08-03 22:12:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sean Rhodes <sean@starlabs.systems>

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
   0dc9b78a46..d219119721  d2191197217f9d16541c2d051235c494fa80bce3 -> xen-tested-master

