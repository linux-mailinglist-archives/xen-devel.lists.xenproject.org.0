Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821897435DB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557314.870568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8ff-0005Sq-EG; Fri, 30 Jun 2023 07:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557314.870568; Fri, 30 Jun 2023 07:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8ff-0005Pu-BD; Fri, 30 Jun 2023 07:35:59 +0000
Received: by outflank-mailman (input) for mailman id 557314;
 Fri, 30 Jun 2023 07:35:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qF8fe-0005ND-LJ; Fri, 30 Jun 2023 07:35:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qF8fe-0006RF-FH; Fri, 30 Jun 2023 07:35:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qF8fe-00070u-1w; Fri, 30 Jun 2023 07:35:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qF8fe-0004hR-1Z; Fri, 30 Jun 2023 07:35:58 +0000
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
	bh=W5STxP7W7QRMelyiMizFpGsvNgPqQ4oruW0BNopLD8s=; b=J1D782nWIORtuoYZ9GtfhNIJn3
	yPaZEt5RluDb2YrkTLj0YpcywLTXCafKVjEtO3d8ekCjdQcs9Hy8y8u+ooVmfcDTuN5D2rHCiq7Qs
	33abxly05ENNHPK5yg7GTw8mBdOAzdtcCI32P/5DjzlzAlSUACokyoMx+ehuAbmG4p4Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181652-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181652: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f5c987fcac567b1f84a418826f30d8ef2b46860e
X-Osstest-Versions-That:
    ovmf=6607062e91f676db8764871e2a40ee8704e8a731
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Jun 2023 07:35:58 +0000

flight 181652 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181652/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f5c987fcac567b1f84a418826f30d8ef2b46860e
baseline version:
 ovmf                 6607062e91f676db8764871e2a40ee8704e8a731

Last test of basis   181630  2023-06-28 19:40:44 Z    1 days
Testing same since   181652  2023-06-30 05:42:20 Z    0 days    1 attempts

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
   6607062e91..f5c987fcac  f5c987fcac567b1f84a418826f30d8ef2b46860e -> xen-tested-master

