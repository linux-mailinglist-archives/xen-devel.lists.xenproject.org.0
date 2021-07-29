Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B73DAFAE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 01:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162238.297597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9F2F-0001q5-3z; Thu, 29 Jul 2021 23:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162238.297597; Thu, 29 Jul 2021 23:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9F2F-0001nK-0d; Thu, 29 Jul 2021 23:01:51 +0000
Received: by outflank-mailman (input) for mailman id 162238;
 Thu, 29 Jul 2021 23:01:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9F2D-0001nA-2C; Thu, 29 Jul 2021 23:01:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9F2C-0007Xr-P6; Thu, 29 Jul 2021 23:01:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9F2C-0007N4-GW; Thu, 29 Jul 2021 23:01:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m9F2C-0000vB-Fy; Thu, 29 Jul 2021 23:01:48 +0000
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
	bh=eiwBwePz1DDf78CsIakU6EzLFQiIz13SHTuFO6I+tgU=; b=BIxm7ovBvD2bqvf664MXZrxT+K
	Jc6/LhmbmCGme5PMRQmtYn8EchOgVpxPYIXji5RE/bzlR19XNrxIvFzqsjEUAEybxZP9eFhrN6hc5
	r1D35mTept4Weg7Z097KqWuJ3JbLjrYpjUT/rUj4NslmFbKpsg/wTRZsijSzITz0DIEk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164039-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164039: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=514b3aa08ece52140b769a8676595655691c7cb3
X-Osstest-Versions-That:
    ovmf=dc485c556d5f5db21debe8de3a45a7564aacbe24
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Jul 2021 23:01:48 +0000

flight 164039 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164039/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 514b3aa08ece52140b769a8676595655691c7cb3
baseline version:
 ovmf                 dc485c556d5f5db21debe8de3a45a7564aacbe24

Last test of basis   164028  2021-07-29 01:40:11 Z    0 days
Testing same since   164039  2021-07-29 10:10:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dov Murik <dovmurik@linux.ibm.com>
  James Bottomley <jejb@linux.ibm.com>
  Jiewen Yao <jiewen.yao@intel.com>

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
   dc485c556d..514b3aa08e  514b3aa08ece52140b769a8676595655691c7cb3 -> xen-tested-master

