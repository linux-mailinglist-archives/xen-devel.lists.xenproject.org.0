Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D50B7E0B10
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 23:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627349.978350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz2cu-0005Xj-6R; Fri, 03 Nov 2023 22:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627349.978350; Fri, 03 Nov 2023 22:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz2cu-0005VQ-3h; Fri, 03 Nov 2023 22:26:52 +0000
Received: by outflank-mailman (input) for mailman id 627349;
 Fri, 03 Nov 2023 22:26:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz2cs-0005VG-I7; Fri, 03 Nov 2023 22:26:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz2cs-0004Xx-Aj; Fri, 03 Nov 2023 22:26:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz2cr-0001m7-UQ; Fri, 03 Nov 2023 22:26:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qz2cr-0005oa-Tw; Fri, 03 Nov 2023 22:26:49 +0000
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
	bh=81D1ClNhe55sPubkoqKvkHJzRovz6XF+h4yukbzxjBw=; b=YY9gwv8b1OWpiZgEE2xDcbwZa/
	C/5NtYkv0Km09Tjl2QKoxpnHz9IOLYPG0pUhY0YGoKFv1+mLPeyDEI7934eBFJxeZQiwFaCD4C5Kn
	zLijIYHK0sAXUCPVxvuxrAVksxLqrjxgY9JPwtWjo/JhGIjb/dVBdEE+golNm/pJrJUM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183672-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183672: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0b4acb88d67520ad5cd9fd8896db0a2e203eaca4
X-Osstest-Versions-That:
    ovmf=8da978bf68535ec9fc41f400f22f09b033dd535a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Nov 2023 22:26:49 +0000

flight 183672 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183672/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0b4acb88d67520ad5cd9fd8896db0a2e203eaca4
baseline version:
 ovmf                 8da978bf68535ec9fc41f400f22f09b033dd535a

Last test of basis   183662  2023-11-02 19:12:44 Z    1 days
Testing same since   183672  2023-11-03 20:14:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ni, Ray <ray.ni@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   8da978bf68..0b4acb88d6  0b4acb88d67520ad5cd9fd8896db0a2e203eaca4 -> xen-tested-master

