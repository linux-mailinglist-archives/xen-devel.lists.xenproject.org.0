Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE16798B92
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 19:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598136.932678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefXf-0004zU-I5; Fri, 08 Sep 2023 17:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598136.932678; Fri, 08 Sep 2023 17:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefXf-0004xM-F1; Fri, 08 Sep 2023 17:45:15 +0000
Received: by outflank-mailman (input) for mailman id 598136;
 Fri, 08 Sep 2023 17:45:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qefXd-0004xC-LP; Fri, 08 Sep 2023 17:45:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qefXd-0002Jx-KY; Fri, 08 Sep 2023 17:45:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qefXd-0005ib-Ea; Fri, 08 Sep 2023 17:45:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qefXd-0007i6-E7; Fri, 08 Sep 2023 17:45:13 +0000
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
	bh=5pkAzvPszo/d9Z4PMDfcN1gvIsMHwXasAqBmD+VB7ik=; b=ES/KUqrInNSKh9c6VKXfgCb28z
	vXXWDIcZdOmtIoUM8xfzIWV4Jq8T/4UT39pFgoUC16M4hvwg1QNHc9i8uRi/vx+M68pFPsyJCkGIP
	gCIXGnbvSd23bOhreLVShJpawKgGXrhdd2hWGBBW5ZWuwK8LLOBH0G90F4C/4ceyykBA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182760-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182760: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=493a375eef584be2beaaa3d418a8e7ff333c5468
X-Osstest-Versions-That:
    ovmf=b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Sep 2023 17:45:13 +0000

flight 182760 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182760/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 493a375eef584be2beaaa3d418a8e7ff333c5468
baseline version:
 ovmf                 b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430

Last test of basis   182753  2023-09-08 13:43:09 Z    0 days
Testing same since   182760  2023-09-08 15:40:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   b74f1f7ab5..493a375eef  493a375eef584be2beaaa3d418a8e7ff333c5468 -> xen-tested-master

