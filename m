Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C66D6EFA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 23:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518162.804414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjoDQ-0000BD-K0; Tue, 04 Apr 2023 21:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518162.804414; Tue, 04 Apr 2023 21:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjoDQ-00008b-H9; Tue, 04 Apr 2023 21:29:20 +0000
Received: by outflank-mailman (input) for mailman id 518162;
 Tue, 04 Apr 2023 21:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjoDO-00008P-ID; Tue, 04 Apr 2023 21:29:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjoDO-0007a2-Er; Tue, 04 Apr 2023 21:29:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjoDO-0000I2-0U; Tue, 04 Apr 2023 21:29:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pjoDO-0006sT-02; Tue, 04 Apr 2023 21:29:18 +0000
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
	bh=3nsbpyvV8cjcptqjQ7Ew7Ma4IEDCW/Qt4OJrV0bNQmU=; b=qJ+h/1t9wqUMb6LXvzIjXuK19P
	njbdecVdmZ7M1s18BEUDBZVr+0gyKPXuzdOagDvaeK13PNITYFBxBiPS3pZqRmt3F3qOig2oWzd+w
	dt4GX+CXpaFeXleN6/B1yCsDrjuNNbanc/I2+Y2OnpWlCYZfKRvs0ciLNKWJSc2WRHd4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180141-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180141: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7df447930c42addaf2cc0d32916141d95ded677e
X-Osstest-Versions-That:
    ovmf=fb89f62d2702faf7db7f7afef342467d4f0fba3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Apr 2023 21:29:18 +0000

flight 180141 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180141/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7df447930c42addaf2cc0d32916141d95ded677e
baseline version:
 ovmf                 fb89f62d2702faf7db7f7afef342467d4f0fba3c

Last test of basis   180138  2023-04-04 15:10:48 Z    0 days
Testing same since   180141  2023-04-04 17:42:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   fb89f62d27..7df447930c  7df447930c42addaf2cc0d32916141d95ded677e -> xen-tested-master

