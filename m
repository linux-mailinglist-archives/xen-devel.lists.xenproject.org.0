Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E847E6D7CB6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 14:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518498.805121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2L6-0000ZA-4M; Wed, 05 Apr 2023 12:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518498.805121; Wed, 05 Apr 2023 12:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2L6-0000WR-18; Wed, 05 Apr 2023 12:34:12 +0000
Received: by outflank-mailman (input) for mailman id 518498;
 Wed, 05 Apr 2023 12:34:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2L4-0000Vv-Gl; Wed, 05 Apr 2023 12:34:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2L4-0007UA-FX; Wed, 05 Apr 2023 12:34:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2L4-0002XQ-07; Wed, 05 Apr 2023 12:34:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2L3-0004rT-Vr; Wed, 05 Apr 2023 12:34:09 +0000
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
	bh=lla/AEeIulxWhi8A1nh0/EHunR5dFLClMwvtKlMkPYA=; b=nHS4TLucBXJSMlu6sWLYMP+cDH
	QUk3W96Yv5w27xUpUiHc5CVTXZA3pVo+FeIgr1E2BqtQSBqGfbwIY7YkGog2zjAD9DXzXSs1AjJMx
	zS/Zc4L9cvp3tAwjqwjVJbXSvCm92QE43VlCudcPCwpmUdW6AD0VplsVuw9SznAJi1zM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180150-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180150: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdd79996c217805a5bd67bb0c0e4ca05474ef92e
X-Osstest-Versions-That:
    ovmf=7df447930c42addaf2cc0d32916141d95ded677e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Apr 2023 12:34:09 +0000

flight 180150 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180150/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdd79996c217805a5bd67bb0c0e4ca05474ef92e
baseline version:
 ovmf                 7df447930c42addaf2cc0d32916141d95ded677e

Last test of basis   180141  2023-04-04 17:42:43 Z    0 days
Testing same since   180150  2023-04-05 09:43:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   7df447930c..cdd79996c2  cdd79996c217805a5bd67bb0c0e4ca05474ef92e -> xen-tested-master

