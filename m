Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A3689ECA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 17:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489245.757586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNyXg-0003Ir-6D; Fri, 03 Feb 2023 16:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489245.757586; Fri, 03 Feb 2023 16:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNyXg-0003G9-3d; Fri, 03 Feb 2023 16:04:00 +0000
Received: by outflank-mailman (input) for mailman id 489245;
 Fri, 03 Feb 2023 16:03:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNyXf-0003G0-KF; Fri, 03 Feb 2023 16:03:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNyXf-0001PE-Hb; Fri, 03 Feb 2023 16:03:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNyXf-00028F-7b; Fri, 03 Feb 2023 16:03:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNyXf-0000Fz-74; Fri, 03 Feb 2023 16:03:59 +0000
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
	bh=NvSp6ej0TtjtxEiW9p0iFlIgjrXSJCMVKJdl6drUnlA=; b=JrNW+3FYCU3v6uRLZBag1Dv2D1
	gYk1kQ7oUshmhd0LTWcjh7pjGIbOUwwCiNkUozwIjIfnx6EEBvAGpAbUApH59nSV0xTdAEGivkHjm
	9jRB2Ev7BNsQb8xkSVz/wjHpmo9m90xIbNY4RpWlMQ07CBwPPkjXvLvOlejSmgD8n3d8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176348-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176348: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=13b97736c876919b9786055829caaa4fa46984b7
X-Osstest-Versions-That:
    ovmf=11f0014c0e3046e3762eac420b760091d0cdc063
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Feb 2023 16:03:59 +0000

flight 176348 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176348/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 13b97736c876919b9786055829caaa4fa46984b7
baseline version:
 ovmf                 11f0014c0e3046e3762eac420b760091d0cdc063

Last test of basis   176346  2023-02-03 08:11:24 Z    0 days
Testing same since   176348  2023-02-03 14:13:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eric Dong <eric.dong@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   11f0014c0e..13b97736c8  13b97736c876919b9786055829caaa4fa46984b7 -> xen-tested-master

