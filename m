Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFB6BE8C5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 13:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511039.789787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8qR-0001yI-H8; Fri, 17 Mar 2023 12:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511039.789787; Fri, 17 Mar 2023 12:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8qR-0001v2-Dh; Fri, 17 Mar 2023 12:06:03 +0000
Received: by outflank-mailman (input) for mailman id 511039;
 Fri, 17 Mar 2023 12:06:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd8qQ-0001uq-Cr; Fri, 17 Mar 2023 12:06:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd8qQ-00074X-BS; Fri, 17 Mar 2023 12:06:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd8qP-0000iN-Qc; Fri, 17 Mar 2023 12:06:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pd8qP-0001Pr-Q5; Fri, 17 Mar 2023 12:06:01 +0000
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
	bh=TtLV9qfgc0c3LiAmxD/MjCx4AqjI+pumTcyl4W0E2sI=; b=AHoxMzeM5roQN23M9GOOBmrF0H
	BEyp2D0nm3eAOl6d7gxGTREWxibpz5/ZTC4tRZ1WqbqjNWWKbr0/svl5ivtUwx6LCCjA8++OcrXAN
	dlLAA0tHELQEZ3b4pVdWK1B1Ysf/F37lLntwYHXG0Hv+hdmJQJNyhmo5IDVW8PPH054w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179713-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179713: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=410ca0ff94a42ee541dd6ceab70ea974eeb7e500
X-Osstest-Versions-That:
    ovmf=0e5717009779ec6c1e35f979426a2cd407b3e73a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Mar 2023 12:06:01 +0000

flight 179713 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179713/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 410ca0ff94a42ee541dd6ceab70ea974eeb7e500
baseline version:
 ovmf                 0e5717009779ec6c1e35f979426a2cd407b3e73a

Last test of basis   179705  2023-03-17 04:10:46 Z    0 days
Testing same since   179713  2023-03-17 08:15:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gang Chen <gang.c.chen@intel.com>

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
   0e57170097..410ca0ff94  410ca0ff94a42ee541dd6ceab70ea974eeb7e500 -> xen-tested-master

