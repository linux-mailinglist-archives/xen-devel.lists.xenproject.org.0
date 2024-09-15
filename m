Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D79979988
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 01:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799102.1208936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spyeI-0003AB-17; Sun, 15 Sep 2024 23:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799102.1208936; Sun, 15 Sep 2024 23:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spyeH-00038e-Tf; Sun, 15 Sep 2024 23:27:21 +0000
Received: by outflank-mailman (input) for mailman id 799102;
 Sun, 15 Sep 2024 23:27:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spyeG-00038U-RQ; Sun, 15 Sep 2024 23:27:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spyeG-00040W-EU; Sun, 15 Sep 2024 23:27:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spyeG-00064b-7O; Sun, 15 Sep 2024 23:27:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spyeG-0005aQ-6q; Sun, 15 Sep 2024 23:27:20 +0000
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
	bh=qEWh5kwvYQcCYTrVv9nW069JOvJKpwKqn6GxlqTMJGc=; b=FgjmPvo88TvGwbSoS/G/AvIb81
	XO6sbMuVcHVTGkTxHyfXnQz8cy5cXLeSP/5T3Pe7cQYF64CLrk+4CdPXZM+5t46/LTuUKGB1M3uTR
	2ZrOb/GAHW4AvHRruTqH0O02G8TZqFLJ01uokW6kBl3KWAu6KbMZqUe2LpFFXShmGktY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187715-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187715: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=73dbb68006caf538d1b69a11e306b161526932f3
X-Osstest-Versions-That:
    ovmf=1f32b5a30e473d5e37881c3232f7226dd8311b44
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Sep 2024 23:27:20 +0000

flight 187715 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187715/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 73dbb68006caf538d1b69a11e306b161526932f3
baseline version:
 ovmf                 1f32b5a30e473d5e37881c3232f7226dd8311b44

Last test of basis   187703  2024-09-14 03:44:01 Z    1 days
Testing same since   187715  2024-09-15 21:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>

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
   1f32b5a30e..73dbb68006  73dbb68006caf538d1b69a11e306b161526932f3 -> xen-tested-master

