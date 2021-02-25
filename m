Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC132583D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 22:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89972.170062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNku-00034V-Qu; Thu, 25 Feb 2021 21:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89972.170062; Thu, 25 Feb 2021 21:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNku-000343-N1; Thu, 25 Feb 2021 21:01:04 +0000
Received: by outflank-mailman (input) for mailman id 89972;
 Thu, 25 Feb 2021 21:01:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFNkt-00033v-Rg; Thu, 25 Feb 2021 21:01:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFNkt-0000y0-LU; Thu, 25 Feb 2021 21:01:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFNkt-0007Qj-Dk; Thu, 25 Feb 2021 21:01:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFNkt-0000re-DH; Thu, 25 Feb 2021 21:01:03 +0000
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
	bh=Cnq5+9SWbjVJWKOkXN6AfJUfe+sw9uMuWHok9baBTeM=; b=BWgXqUl9e8Izs1ZSvaPmb+0DYA
	BqBAe/NzjbysW5hJAL68r+lTepEvrLKXs5KEtIqIE9TTrF3+n0wzu8yE1/xZfHOPZLLKEshYRHcfO
	nKHfz7cbtR4UjE7kPyEhb1d8uZqDv3K9RjNpGQveCs3NbuxV1Jxvgk2YXW8HqWbQ7ZE8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159676-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159676: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7f34681c488aee2563eaa2afcc6a2c8aa7c5b912
X-Osstest-Versions-That:
    ovmf=35f87da8a2debd443ac842db0a3794b17914a8f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Feb 2021 21:01:03 +0000

flight 159676 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159676/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f34681c488aee2563eaa2afcc6a2c8aa7c5b912
baseline version:
 ovmf                 35f87da8a2debd443ac842db0a3794b17914a8f4

Last test of basis   159640  2021-02-24 17:10:46 Z    1 days
Testing same since   159676  2021-02-25 16:11:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Li, Walon <walon.li@hpe.com>
  Walon Li <walon.li@hpe.com>

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
   35f87da8a2..7f34681c48  7f34681c488aee2563eaa2afcc6a2c8aa7c5b912 -> xen-tested-master

