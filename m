Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A649135C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 02:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258304.444588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9dEJ-0007v2-Qa; Tue, 18 Jan 2022 01:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258304.444588; Tue, 18 Jan 2022 01:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9dEJ-0007sc-Nj; Tue, 18 Jan 2022 01:24:11 +0000
Received: by outflank-mailman (input) for mailman id 258304;
 Tue, 18 Jan 2022 01:24:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9dEI-0007sS-AN; Tue, 18 Jan 2022 01:24:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9dEI-0002qn-12; Tue, 18 Jan 2022 01:24:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9dEH-0001qK-Nx; Tue, 18 Jan 2022 01:24:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n9dEH-0003YL-NU; Tue, 18 Jan 2022 01:24:09 +0000
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
	bh=gE8qA6P6BrhNs5QOiHq9a0acTe3bORWDmNJyXviEGJs=; b=Y4fhiYV0ZRymTqHhYd3sW/mlki
	ChHBSEb7Hh11cdfJPDLK2HnZiFj9znvWSz9YkPPqiSdQzDRV9KDg5haw7Jb6hOiXOB3YetLGBB1DC
	XAhlKn1DWsk7JFRHj38WJ+DW1J6Vmv+7fiYV/LeLniYKFhad0jZQrBCCU7NmAAotuInI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167729-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167729: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5801910013757bd626f67ed77eea6c16a176eebf
X-Osstest-Versions-That:
    ovmf=59c48c9314111e41550cac7875c5e9235809c3ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jan 2022 01:24:09 +0000

flight 167729 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167729/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5801910013757bd626f67ed77eea6c16a176eebf
baseline version:
 ovmf                 59c48c9314111e41550cac7875c5e9235809c3ef

Last test of basis   167727  2022-01-17 18:40:25 Z    0 days
Testing same since   167729  2022-01-17 22:40:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
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
   59c48c9314..5801910013  5801910013757bd626f67ed77eea6c16a176eebf -> xen-tested-master

