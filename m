Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49E988DB7
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2024 05:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806613.1217976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suNz7-00057X-PH; Sat, 28 Sep 2024 03:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806613.1217976; Sat, 28 Sep 2024 03:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suNz7-000560-MW; Sat, 28 Sep 2024 03:19:05 +0000
Received: by outflank-mailman (input) for mailman id 806613;
 Sat, 28 Sep 2024 03:19:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suNz6-00055o-Sf; Sat, 28 Sep 2024 03:19:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suNz6-0002jy-Nx; Sat, 28 Sep 2024 03:19:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suNz6-0004js-4z; Sat, 28 Sep 2024 03:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1suNz5-0006DH-6B; Sat, 28 Sep 2024 03:19:03 +0000
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
	bh=aYslViRBxHXz787cG+eXTdP5mPN2GF5jMXIkR93T3bI=; b=yCcNXne8eNoKlfrKpdlDCItpaz
	wzcQGm3/U4OuFYqcfNRFooF2HJbEO6dn3gNYT3UyodnPNSDg56za0E6iIalqJ5Ix7Hhl/BpaoKNxE
	C7l46dqwfpTlCnFdJh7GJ5U/RVGNbCII579fZfCOZM90bJj1cgund4F9xcH0zAyNrE+g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187883-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187883: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=10783187ddb71808a4ea361e887800d3b899b85f
X-Osstest-Versions-That:
    ovmf=48b5815d7771b92f343bfa2b32b70be36c98e6f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Sep 2024 03:19:03 +0000

flight 187883 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187883/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 10783187ddb71808a4ea361e887800d3b899b85f
baseline version:
 ovmf                 48b5815d7771b92f343bfa2b32b70be36c98e6f3

Last test of basis   187881  2024-09-27 19:41:33 Z    0 days
Testing same since   187883  2024-09-28 01:41:33 Z    0 days    1 attempts

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
   48b5815d77..10783187dd  10783187ddb71808a4ea361e887800d3b899b85f -> xen-tested-master

