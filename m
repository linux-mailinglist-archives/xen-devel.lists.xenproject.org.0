Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9D2C6E93
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 04:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39809.72828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiqVD-0002oR-TB; Sat, 28 Nov 2020 03:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39809.72828; Sat, 28 Nov 2020 03:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiqVD-0002o9-M9; Sat, 28 Nov 2020 03:02:23 +0000
Received: by outflank-mailman (input) for mailman id 39809;
 Sat, 28 Nov 2020 03:02:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiqVD-0002o1-3K; Sat, 28 Nov 2020 03:02:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiqVC-00029f-U2; Sat, 28 Nov 2020 03:02:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiqVC-0002P3-KW; Sat, 28 Nov 2020 03:02:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiqVC-0007BA-K1; Sat, 28 Nov 2020 03:02:22 +0000
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
	bh=g/1saNe/5/IRzJyFBMMJH0AgQgjg636now6T1Yt+drA=; b=zi1UsZ9TlqPIXVSlL+LC39GAce
	JCB9XoSOKpvHnr7xmpoqb7Uysgr6OUk0Jo1qZ2vXc8O8LrBDpFEK39Qo1OVISLvrIN0SfAMf579fo
	jWbrz9CH2FbESfnFBS4DfQYunGaIXtPkiheyICjh/5mTkR7BwqkbWQZqiwff5kWUY/UI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157060-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157060: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f69a2b9a42029bcbcf88d074425ebe63495b0a08
X-Osstest-Versions-That:
    ovmf=73b604bb1e13ff915c523180979f7b4db34b6d1b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Nov 2020 03:02:22 +0000

flight 157060 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157060/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f69a2b9a42029bcbcf88d074425ebe63495b0a08
baseline version:
 ovmf                 73b604bb1e13ff915c523180979f7b4db34b6d1b

Last test of basis   157055  2020-11-27 17:09:39 Z    0 days
Testing same since   157060  2020-11-27 19:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>

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
   73b604bb1e..f69a2b9a42  f69a2b9a42029bcbcf88d074425ebe63495b0a08 -> xen-tested-master

