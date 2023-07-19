Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A649C75985F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 16:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565905.884520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM8Cj-0001hF-0c; Wed, 19 Jul 2023 14:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565905.884520; Wed, 19 Jul 2023 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM8Ci-0001eu-Th; Wed, 19 Jul 2023 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 565905;
 Wed, 19 Jul 2023 14:31:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qM8Ci-0001el-G9; Wed, 19 Jul 2023 14:31:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qM8Ci-0004s5-5b; Wed, 19 Jul 2023 14:31:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qM8Ch-0001T1-FA; Wed, 19 Jul 2023 14:30:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qM8Ch-0003qR-Eg; Wed, 19 Jul 2023 14:30:59 +0000
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
	bh=Xsk4jZMzZGF81o1LoNvsBmQRSncpEXIXy+ckns1uBPk=; b=W+GT2paZIa7n4yKM5baBnb+aor
	OfR+nfZjMxU+vwngJ3MVJAe2a2l+fHSqnd/dPcEgdEgL5FxZtnRV4BnWgj3QBQeGvYgfE66KMVi/D
	OeP25mAF5WHpVD03mnWm+zfHneCgbvVSkmniEIy5pNvDEPyvz94kO/20ePQvxqm4lcFE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181896-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181896: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=08aacbf0560d98929d402af029ac010d35abb3d6
X-Osstest-Versions-That:
    ovmf=4d1014093fbf1ae2788caaad8e70eabb15720ce4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Jul 2023 14:30:59 +0000

flight 181896 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181896/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 08aacbf0560d98929d402af029ac010d35abb3d6
baseline version:
 ovmf                 4d1014093fbf1ae2788caaad8e70eabb15720ce4

Last test of basis   181847  2023-07-17 14:10:50 Z    2 days
Testing same since   181896  2023-07-19 12:12:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anatol Belski <anbelski@linux.microsoft.com>
  Jianyong Wu <jianyong.wu@arm.com>

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
   4d1014093f..08aacbf056  08aacbf0560d98929d402af029ac010d35abb3d6 -> xen-tested-master

