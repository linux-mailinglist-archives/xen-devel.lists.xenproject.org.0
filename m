Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CADDB6DF0D6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:46:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520082.807325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX2s-0004AP-4s; Wed, 12 Apr 2023 09:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520082.807325; Wed, 12 Apr 2023 09:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX2s-000479-27; Wed, 12 Apr 2023 09:45:42 +0000
Received: by outflank-mailman (input) for mailman id 520082;
 Wed, 12 Apr 2023 09:45:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmX2q-00046z-1q; Wed, 12 Apr 2023 09:45:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmX2p-0004hN-V2; Wed, 12 Apr 2023 09:45:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmX2p-0002bT-HS; Wed, 12 Apr 2023 09:45:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pmX2p-000807-Gz; Wed, 12 Apr 2023 09:45:39 +0000
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
	bh=VMKyUUjzjrTCk4213uS93aIez0iiAg7/17gbjT222pE=; b=uOqOAWwB534Zuf+hcrZ6BMf0kQ
	aALRJJ7pQuORy7hD72VdaLRYB2KO30XF7mJUKsxIUDF0Xv2+aTwqmbjH+qY9KvPuBcLD8HYjnJGwK
	u0QT1j+2QTh362yNDcDDoulTucEF032YSlboM84JbIq1EOJCjt08e8ETysdKPpJ8rHF8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180216-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180216: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b991aec0509f24ae7573d732ba337549ecee310c
X-Osstest-Versions-That:
    ovmf=51734dfc48466eddfb0f8acdb24518266c36c905
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Apr 2023 09:45:39 +0000

flight 180216 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180216/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b991aec0509f24ae7573d732ba337549ecee310c
baseline version:
 ovmf                 51734dfc48466eddfb0f8acdb24518266c36c905

Last test of basis   180203  2023-04-11 07:40:42 Z    1 days
Testing same since   180216  2023-04-12 07:13:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yu Pu <yu.pu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   51734dfc48..b991aec050  b991aec0509f24ae7573d732ba337549ecee310c -> xen-tested-master

