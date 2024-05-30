Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DD8D43B5
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 04:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732436.1138439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCVYA-0001Hu-8B; Thu, 30 May 2024 02:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732436.1138439; Thu, 30 May 2024 02:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCVYA-0001GJ-4f; Thu, 30 May 2024 02:29:54 +0000
Received: by outflank-mailman (input) for mailman id 732436;
 Thu, 30 May 2024 02:29:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCVY9-0001G9-CT; Thu, 30 May 2024 02:29:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCVY9-0004Yq-1h; Thu, 30 May 2024 02:29:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCVY8-0006o9-M4; Thu, 30 May 2024 02:29:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCVY8-0003qZ-Lc; Thu, 30 May 2024 02:29:52 +0000
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
	bh=BdMY+ghUta+KZ9MqOWP+KW4CI0BSTrK9gqnZMQZl47A=; b=6jRokYR4+hFd2KtliOf/JyTWbR
	FD1+4Xe3Ci4EJc9ugCSS62u/qCQx5ntfdfBQIjo3r1AOIwxuDFNVDVC9/W3/lxV8uuo0oJRZXWhpZ
	H9cS8WNAyADfv2atzMBXnWd276/ijfjtTEIStjOv4F/fVEIMI/JSsO7rJd0Bzdd4VZ1I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186187: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=79655e27686031326eda3ea290225db6aea3b53f
X-Osstest-Versions-That:
    ovmf=55f8bddade205c9cbe3583d5d31d0048cdf26ed4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 02:29:52 +0000

flight 186187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 79655e27686031326eda3ea290225db6aea3b53f
baseline version:
 ovmf                 55f8bddade205c9cbe3583d5d31d0048cdf26ed4

Last test of basis   186178  2024-05-29 00:41:09 Z    1 days
Testing same since   186187  2024-05-30 00:42:59 Z    0 days    1 attempts

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
   55f8bddade..79655e2768  79655e27686031326eda3ea290225db6aea3b53f -> xen-tested-master

