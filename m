Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37385361F3B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 14:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111694.213594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXN9d-0000cu-7h; Fri, 16 Apr 2021 12:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111694.213594; Fri, 16 Apr 2021 12:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXN9d-0000cP-3r; Fri, 16 Apr 2021 12:00:57 +0000
Received: by outflank-mailman (input) for mailman id 111694;
 Fri, 16 Apr 2021 12:00:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXN9b-0000cH-O4; Fri, 16 Apr 2021 12:00:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXN9b-0005b1-KV; Fri, 16 Apr 2021 12:00:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXN9b-00073j-Ch; Fri, 16 Apr 2021 12:00:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXN9b-0000oS-CD; Fri, 16 Apr 2021 12:00:55 +0000
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
	bh=ifCTHtI9v7IcKlvLh6BjMQ4v54BJpxbYBa5YBi9d+aU=; b=drljubLVuWlcehc0W+dfKTDSJd
	n6qB8Fi/Q6FD7vJvRGnYH3Qsy5yF644X1BeuazqWCQcqz0/V0g3EgJ5Ycn19ttUIgrUQxchIAMI7Z
	WN7pEWpGWLLH2GfMrrlfCQosPbUFNQ3qVUQc5QjdOO8hpWJEPeyODdi+0ZPtgeRgOAyE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161187: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=96479947bcd7b425e4f2196b06701fd8ec3da595
X-Osstest-Versions-That:
    ovmf=3c13938079886e0e49031ab29a4f1ed7a4ceab68
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Apr 2021 12:00:55 +0000

flight 161187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 96479947bcd7b425e4f2196b06701fd8ec3da595
baseline version:
 ovmf                 3c13938079886e0e49031ab29a4f1ed7a4ceab68

Last test of basis   161176  2021-04-15 16:40:13 Z    0 days
Testing same since   161187  2021-04-16 00:11:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>
  Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>

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
   3c13938079..96479947bc  96479947bcd7b425e4f2196b06701fd8ec3da595 -> xen-tested-master

