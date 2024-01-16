Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9D82E91C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 06:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667637.1039115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPbmY-0008WA-2Y; Tue, 16 Jan 2024 05:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667637.1039115; Tue, 16 Jan 2024 05:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPbmX-0008Tr-Vn; Tue, 16 Jan 2024 05:14:37 +0000
Received: by outflank-mailman (input) for mailman id 667637;
 Tue, 16 Jan 2024 05:14:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPbmW-0008Th-Az; Tue, 16 Jan 2024 05:14:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPbmV-0008U4-Vq; Tue, 16 Jan 2024 05:14:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPbmV-00086y-N0; Tue, 16 Jan 2024 05:14:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPbmV-0000BZ-MN; Tue, 16 Jan 2024 05:14:35 +0000
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
	bh=a7o8KhGjDAQk3SL/SxKsh4N7IapVNvIsLFs+kGefTXs=; b=SE7KjkQbdMc/LGY8+xmbrl0KH7
	n/PHayvxCfIswLY3yD9gBJgSq5MxtEMalQCrSEBmdZRFTmsbXWH1uzs3ZGZPwhqFvxU2KUC/8ulgk
	5pYP4X+uT7BfZvTzD2MnwWy6f/eYe5z1kbXMdwzEI426vlZRg7lA6huOaUIE9EdU4wVM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184366-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184366: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=682a5ed1a229443a259da2df9f961a0448071e3e
X-Osstest-Versions-That:
    ovmf=7c2757c298b40f5d7bad8da3faff7bb9c47ce2ae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jan 2024 05:14:35 +0000

flight 184366 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184366/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 682a5ed1a229443a259da2df9f961a0448071e3e
baseline version:
 ovmf                 7c2757c298b40f5d7bad8da3faff7bb9c47ce2ae

Last test of basis   184364  2024-01-15 20:12:55 Z    0 days
Testing same since   184366  2024-01-16 01:42:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Suqiang Ren <suqiangx.ren@intel.com>

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
   7c2757c298..682a5ed1a2  682a5ed1a229443a259da2df9f961a0448071e3e -> xen-tested-master

