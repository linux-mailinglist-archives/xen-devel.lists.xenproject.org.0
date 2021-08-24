Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0DF3F6B9D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 00:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171727.313345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIefn-0007PU-87; Tue, 24 Aug 2021 22:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171727.313345; Tue, 24 Aug 2021 22:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIefn-0007MS-47; Tue, 24 Aug 2021 22:13:35 +0000
Received: by outflank-mailman (input) for mailman id 171727;
 Tue, 24 Aug 2021 22:13:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIefm-0007MI-53; Tue, 24 Aug 2021 22:13:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIefl-00062U-Uf; Tue, 24 Aug 2021 22:13:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIefl-00038P-Gf; Tue, 24 Aug 2021 22:13:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mIefl-0001cO-GD; Tue, 24 Aug 2021 22:13:33 +0000
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
	bh=fNX+9mOhmPQmVsjtJqG9Wj9/tChr7ug30eEeYvVp1JQ=; b=rdcMf/YFm1AxX1ElEBAGAxPvKa
	BboqUeSUigFGrG64+h+Kp+7SbB1txjY6A13o0nNqZ9I6HCt1NGtW6tvQ2cPEU4us+5l67cOqHEQcx
	pNeq7Caz98yRqok5AF9AJF50Tlg46ophgAt/5Y1hsAoefKA+1iRvqBrw4q0tNaK1OEes=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164406-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164406: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8dd4fc5be6189666b37e5b00131a4173c6a2b085
X-Osstest-Versions-That:
    ovmf=ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Aug 2021 22:13:33 +0000

flight 164406 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164406/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8dd4fc5be6189666b37e5b00131a4173c6a2b085
baseline version:
 ovmf                 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c

Last test of basis   164229  2021-08-17 14:11:15 Z    7 days
Testing same since   164406  2021-08-23 08:10:21 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason <yun.lou@intel.com>
  Jason Lou <yun.lou@intel.com>

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
   ef56f55d19..8dd4fc5be6  8dd4fc5be6189666b37e5b00131a4173c6a2b085 -> xen-tested-master

