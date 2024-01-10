Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1D829391
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 07:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665296.1035453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNRjL-0003F5-21; Wed, 10 Jan 2024 06:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665296.1035453; Wed, 10 Jan 2024 06:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNRjK-0003D5-Va; Wed, 10 Jan 2024 06:06:22 +0000
Received: by outflank-mailman (input) for mailman id 665296;
 Wed, 10 Jan 2024 06:06:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNRjJ-0003Cv-Lu; Wed, 10 Jan 2024 06:06:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNRjJ-0002UW-JA; Wed, 10 Jan 2024 06:06:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNRjJ-0008U9-2c; Wed, 10 Jan 2024 06:06:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNRjJ-000603-0p; Wed, 10 Jan 2024 06:06:21 +0000
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
	bh=wO46MgxCrlJ1JwGGRFVMOHRkpFLolCAhWwbJJigJvH8=; b=dtu5Fv3fp+Ok3YiYA2om3noooj
	K0oyLQj2v6m2MN/ZjW+QF6uleUqt2Ta10vJNQaGSik9mg1S37r+vLZQi5w6hkoMY2ehCNqMnAsBTT
	+cj2Eg0nEeMPX9I0iseJTvqCNIuglqGML61bBidsC1pMpJVA7zyJnU/s6ks//MiaVEPo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184300-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184300: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=edba0779ba05c0598dbdd32006714fed4fd24ae0
X-Osstest-Versions-That:
    ovmf=4a443f73fd67ca8caaf0a3e1a01f8231b330d2e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 06:06:21 +0000

flight 184300 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184300/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 edba0779ba05c0598dbdd32006714fed4fd24ae0
baseline version:
 ovmf                 4a443f73fd67ca8caaf0a3e1a01f8231b330d2e0

Last test of basis   184297  2024-01-09 16:43:52 Z    0 days
Testing same since   184300  2024-01-10 01:56:08 Z    0 days    1 attempts

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
   4a443f73fd..edba0779ba  edba0779ba05c0598dbdd32006714fed4fd24ae0 -> xen-tested-master

