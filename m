Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81B84D394
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 22:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677891.1054800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXpHj-0007Qs-UX; Wed, 07 Feb 2024 21:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677891.1054800; Wed, 07 Feb 2024 21:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXpHj-0007OD-R8; Wed, 07 Feb 2024 21:16:47 +0000
Received: by outflank-mailman (input) for mailman id 677891;
 Wed, 07 Feb 2024 21:16:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXpHh-0007O3-Vz; Wed, 07 Feb 2024 21:16:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXpHh-0002kF-Of; Wed, 07 Feb 2024 21:16:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXpHh-0008JG-Ga; Wed, 07 Feb 2024 21:16:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXpHh-0004bi-G5; Wed, 07 Feb 2024 21:16:45 +0000
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
	bh=sh99rsEOK9gifGJuArcmFiJY3tRRQFGSHgXG37x4WbM=; b=BQj5gTWeDI0gU1lkrIR0D1Zci1
	COJLyVUMeH0Y7TKKrbZXxHkWRoNX1zEZXOQZIJVexAS72P/XsMcudCm0gQdq8YVHzBk8ql06MqodI
	802SUZEJ3ihDp3F8WSnBZHAR6yD2QXKkUkHt+HavrBgAJGwPzUqraX7ZfcDIsmQaWUEQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184619-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184619: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4d1f0babe20cf757897fa43c399fd79bb6aa8a30
X-Osstest-Versions-That:
    ovmf=1d0b95f6457d225c5108302a9da74b4ed7aa5a38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Feb 2024 21:16:45 +0000

flight 184619 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184619/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4d1f0babe20cf757897fa43c399fd79bb6aa8a30
baseline version:
 ovmf                 1d0b95f6457d225c5108302a9da74b4ed7aa5a38

Last test of basis   184609  2024-02-06 20:43:02 Z    1 days
Testing same since   184619  2024-02-07 19:12:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   1d0b95f645..4d1f0babe2  4d1f0babe20cf757897fa43c399fd79bb6aa8a30 -> xen-tested-master

