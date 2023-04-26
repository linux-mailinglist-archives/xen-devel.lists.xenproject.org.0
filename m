Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0246EF92B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 19:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526794.818780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prinB-0004EU-Ra; Wed, 26 Apr 2023 17:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526794.818780; Wed, 26 Apr 2023 17:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prinB-0004C9-O7; Wed, 26 Apr 2023 17:18:57 +0000
Received: by outflank-mailman (input) for mailman id 526794;
 Wed, 26 Apr 2023 17:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prinB-0004Bz-2w; Wed, 26 Apr 2023 17:18:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prinA-0002Is-So; Wed, 26 Apr 2023 17:18:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prinA-0002wf-CE; Wed, 26 Apr 2023 17:18:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1prinA-0007UL-Bj; Wed, 26 Apr 2023 17:18:56 +0000
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
	bh=sO4+oWVHkLK378sGccd9Kh72L2/iCoorfmIx3eNizY8=; b=Dm7uQkiary6TRYV53f6EzW1xJ8
	ImdpQoqoDcWSxjd+HXDjlXhjyVUtozoHiceT22SNXhewvBpu8SkC4IGMP+LO0LEVb8qGI/U4IBBkq
	/NUd97NoYFKNwsWZyod5Sr2q+1ohG6VeRf0W6bBC+9tzXBEKKy0SzEy05D7CO1KQDxZ0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180429-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180429: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ede0bd1496405f72147308b9570efba0234349b2
X-Osstest-Versions-That:
    ovmf=5a349b96b171e85744024904b0c8453d06d2fb45
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Apr 2023 17:18:56 +0000

flight 180429 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180429/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ede0bd1496405f72147308b9570efba0234349b2
baseline version:
 ovmf                 5a349b96b171e85744024904b0c8453d06d2fb45

Last test of basis   180423  2023-04-26 03:40:45 Z    0 days
Testing same since   180429  2023-04-26 09:41:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   5a349b96b1..ede0bd1496  ede0bd1496405f72147308b9570efba0234349b2 -> xen-tested-master

