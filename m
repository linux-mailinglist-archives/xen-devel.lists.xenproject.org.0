Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC43965292
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 00:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786121.1195660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnC6-0005xv-O3; Thu, 29 Aug 2024 22:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786121.1195660; Thu, 29 Aug 2024 22:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnC6-0005vI-Kq; Thu, 29 Aug 2024 22:00:42 +0000
Received: by outflank-mailman (input) for mailman id 786121;
 Thu, 29 Aug 2024 22:00:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjnC5-0005up-DH; Thu, 29 Aug 2024 22:00:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjnC4-00055s-Vp; Thu, 29 Aug 2024 22:00:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjnC4-0000ZE-Kg; Thu, 29 Aug 2024 22:00:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjnC4-0007NY-KE; Thu, 29 Aug 2024 22:00:40 +0000
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
	bh=UROqgLuWIAW8rATgavjMUMlPjnO7Bk6XTreeV4x8v90=; b=nX2z2FcIu2HSwRe4xP6lawzafF
	XUFnuUgJMYnNRZeCYVHpqG8BA+xwQD0xTZu1ZfYwmQ7TtUcHAHt08gI5JNR95z6xOOV6h8T7/iMuQ
	u9myFtIom4E1fUX8KXscOlip23SMN0+xSzhwxC+jZ7Pu5xRPahaYBzZGAgOHoO6Zr8PY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187409-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187409: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b6c4708c4d3470cfd9f465771a665510d3ad1a66
X-Osstest-Versions-That:
    ovmf=1169122c6f22d4db3e44b7b720480522b6933a62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 22:00:40 +0000

flight 187409 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187409/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b6c4708c4d3470cfd9f465771a665510d3ad1a66
baseline version:
 ovmf                 1169122c6f22d4db3e44b7b720480522b6933a62

Last test of basis   187407  2024-08-29 16:45:30 Z    0 days
Testing same since   187409  2024-08-29 20:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  Ray Robles <rayrobles@microsoft.com>

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
   1169122c6f..b6c4708c4d  b6c4708c4d3470cfd9f465771a665510d3ad1a66 -> xen-tested-master

