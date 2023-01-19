Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA167307A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 05:41:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480844.745423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIMjm-0005LS-1N; Thu, 19 Jan 2023 04:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480844.745423; Thu, 19 Jan 2023 04:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIMjl-0005JB-Uf; Thu, 19 Jan 2023 04:41:17 +0000
Received: by outflank-mailman (input) for mailman id 480844;
 Thu, 19 Jan 2023 04:41:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIMjk-0005J1-Pm; Thu, 19 Jan 2023 04:41:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIMjk-00060t-NI; Thu, 19 Jan 2023 04:41:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIMjk-0002f6-GX; Thu, 19 Jan 2023 04:41:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIMjk-0005Xw-Fs; Thu, 19 Jan 2023 04:41:16 +0000
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
	bh=5+IVaCGAs1szDOkO3Zy/SEwHGi2s5Jx0jytJCMeVOu8=; b=pKmFfmfBf4jlpbQjoH9EtBpgoB
	vgbypwvsRQmeST6NpdjfHcnedTMP7pEWYKVQ+f5OooUVTuXc2h2s63JYD11HKr/wAJVunIxLAKe0N
	62QxBisndCzgk5AjSXLvQgfDSTgYVxJESi2GLlPY5rmwaVZuv3c/8KkyboqSMD2upbuQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175964-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175964: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=426efcc37492da4ebd86799c2d4f5dfeac806848
X-Osstest-Versions-That:
    ovmf=998ebe5ca0ae5c449e83ede533bee872f97d63af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Jan 2023 04:41:16 +0000

flight 175964 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175964/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 426efcc37492da4ebd86799c2d4f5dfeac806848
baseline version:
 ovmf                 998ebe5ca0ae5c449e83ede533bee872f97d63af

Last test of basis   175960  2023-01-18 13:10:41 Z    0 days
Testing same since   175964  2023-01-19 02:42:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Nickle Wang <nicklew@nvidia.com>

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
   998ebe5ca0..426efcc374  426efcc37492da4ebd86799c2d4f5dfeac806848 -> xen-tested-master

