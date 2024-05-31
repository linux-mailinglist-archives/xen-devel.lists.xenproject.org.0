Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF18D68C3
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 20:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733827.1140137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6ln-0003xA-BX; Fri, 31 May 2024 18:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733827.1140137; Fri, 31 May 2024 18:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6ln-0003v7-8r; Fri, 31 May 2024 18:14:27 +0000
Received: by outflank-mailman (input) for mailman id 733827;
 Fri, 31 May 2024 18:14:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD6lm-0003ux-9V; Fri, 31 May 2024 18:14:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD6lm-0005Kc-7m; Fri, 31 May 2024 18:14:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sD6ll-0004Ta-WF; Fri, 31 May 2024 18:14:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sD6ll-0005jy-Vk; Fri, 31 May 2024 18:14:25 +0000
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
	bh=Qv2oqzRQqnIuPXyEvEPY4/RrIlabjolXt7BFmTGseQ4=; b=yHxfdYy5PoL25wlAVHm06Lr1Eg
	KX2eHpYXUYpUqA3tUkTuAK++1JWeX6rjlrK4qzXe0jfjgyvpI5Ich/NcWrHHTNe+XKNHb2UWCK7Rk
	MTagSqB0EBIBKixwWSuQHxY+wuZjsqJtnmwQpziHARwlvMK41/NfJRZ0t/E7zpSdwYcU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186211-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186211: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b36aa96de1d5f7a4660bec5c0cbad2616183dd6
X-Osstest-Versions-That:
    ovmf=7c584bb04874bb5bad16fcf3996f5a893cc81a1c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 31 May 2024 18:14:25 +0000

flight 186211 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186211/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b36aa96de1d5f7a4660bec5c0cbad2616183dd6
baseline version:
 ovmf                 7c584bb04874bb5bad16fcf3996f5a893cc81a1c

Last test of basis   186210  2024-05-31 12:44:34 Z    0 days
Testing same since   186211  2024-05-31 16:14:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shang Qingyu <qingyu.shang@intel.com>

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
   7c584bb048..3b36aa96de  3b36aa96de1d5f7a4660bec5c0cbad2616183dd6 -> xen-tested-master

