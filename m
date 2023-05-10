Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E06FDDFF
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 14:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532778.829081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwj98-00071O-Ps; Wed, 10 May 2023 12:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532778.829081; Wed, 10 May 2023 12:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwj98-0006yr-Lt; Wed, 10 May 2023 12:42:18 +0000
Received: by outflank-mailman (input) for mailman id 532778;
 Wed, 10 May 2023 12:42:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwj97-0006yh-A2; Wed, 10 May 2023 12:42:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwj97-0001aD-7r; Wed, 10 May 2023 12:42:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwj96-0000Ph-OH; Wed, 10 May 2023 12:42:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pwj96-0006iv-Ni; Wed, 10 May 2023 12:42:16 +0000
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
	bh=zUCd6CdzUSlY6LJW78wfkcyjIA2GfdFevU1THHy6Uto=; b=qXglOlDl+N8yNOB0ZeUg0Ftm7l
	hxFXPkXZ++QXaXp0MU377GqYLIHhkfyX59dQcD9cyTtIs4WZwzrZRJyG0r952W4Xpxn8l7wdP7VoK
	h1KLFmzyw09SWQHX5NyXFwm7qiLFAhhbdFLqHoqWeCX0mjA3c8K4+XW0z512kRVngJsE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180601-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180601: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=373a95532a785108f625877d993451d4a6d36713
X-Osstest-Versions-That:
    ovmf=9165a7e95ec6263c04c8babfdbe8bee133959300
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 May 2023 12:42:16 +0000

flight 180601 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180601/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 373a95532a785108f625877d993451d4a6d36713
baseline version:
 ovmf                 9165a7e95ec6263c04c8babfdbe8bee133959300

Last test of basis   180597  2023-05-10 03:12:17 Z    0 days
Testing same since   180601  2023-05-10 10:12:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   9165a7e95e..373a95532a  373a95532a785108f625877d993451d4a6d36713 -> xen-tested-master

