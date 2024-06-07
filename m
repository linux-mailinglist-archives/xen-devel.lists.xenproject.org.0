Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5198FFBD2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 08:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736220.1142276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFShy-0002J7-I6; Fri, 07 Jun 2024 06:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736220.1142276; Fri, 07 Jun 2024 06:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFShy-0002GV-EY; Fri, 07 Jun 2024 06:04:14 +0000
Received: by outflank-mailman (input) for mailman id 736220;
 Fri, 07 Jun 2024 06:04:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFShw-0002GI-MD; Fri, 07 Jun 2024 06:04:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFShw-0005B6-KD; Fri, 07 Jun 2024 06:04:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFShw-0006Rk-4B; Fri, 07 Jun 2024 06:04:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFShw-0000G6-3X; Fri, 07 Jun 2024 06:04:12 +0000
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
	bh=IXjSIVB3ttvQDVEyDjCmTY530/6JOiCr3ZxZqM7bEjk=; b=0G3FI+h8KS808ok8DK4leje7cO
	If/dx5Me32ZFKpXd1uj8v0dLI0R5M65OGnKqDR+PSHWPhGJ13IEJSDL5Ro7TYIMCpoVnuYzFw2rOm
	X0Q7xtQ9xeJAUJrv5wjPkJCpOIy5YTcac2zOZhNmut8twqeEDbfaao2HKdOhbup8m5TM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186273-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186273: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=80b59ff8320d1bd134bf689fe9c0ddf4e0473b88
X-Osstest-Versions-That:
    ovmf=f9c2f2fa0fd92f94d6c20292f37d5302762cad66
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 06:04:12 +0000

flight 186273 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186273/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 80b59ff8320d1bd134bf689fe9c0ddf4e0473b88
baseline version:
 ovmf                 f9c2f2fa0fd92f94d6c20292f37d5302762cad66

Last test of basis   186271  2024-06-07 01:41:10 Z    0 days
Testing same since   186273  2024-06-07 04:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Steffen <osteffen@redhat.com>

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
   f9c2f2fa0f..80b59ff832  80b59ff8320d1bd134bf689fe9c0ddf4e0473b88 -> xen-tested-master

