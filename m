Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4765E7718
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 11:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410678.653788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obey5-0003rz-OI; Fri, 23 Sep 2022 09:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410678.653788; Fri, 23 Sep 2022 09:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obey5-0003pz-LC; Fri, 23 Sep 2022 09:27:33 +0000
Received: by outflank-mailman (input) for mailman id 410678;
 Fri, 23 Sep 2022 09:27:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obey4-0003pp-IA; Fri, 23 Sep 2022 09:27:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obey4-0006iq-Fz; Fri, 23 Sep 2022 09:27:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obey4-0008SV-4u; Fri, 23 Sep 2022 09:27:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obey4-0004RM-4T; Fri, 23 Sep 2022 09:27:32 +0000
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
	bh=eYXOB++OVxjvSZGqolmShyPZ4WkUqBbw36GM8Z3qMb4=; b=b5weyxxC39i7Q6FHXZeX5FijeF
	O1YcEUIMYZ5MwUqKzg7KHzA/hpRmdLlI5yYt0Gij7FDXP969kElp74Haln9XXNr9TRZPfYL57y7Vj
	wz72VNYLF26la4XdnulOLRvBs5XrCAu5wpRIykIAw7KZOdANEF+21j2LKkmbZi+eXr+c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173288-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173288: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b19793a2ec6466c04e5e3506fbe82038fb0a885f
X-Osstest-Versions-That:
    ovmf=238f5f95448c0cbffab5532b21bc4d5f27cf1cee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 09:27:32 +0000

flight 173288 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173288/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b19793a2ec6466c04e5e3506fbe82038fb0a885f
baseline version:
 ovmf                 238f5f95448c0cbffab5532b21bc4d5f27cf1cee

Last test of basis   173286  2022-09-23 02:58:06 Z    0 days
Testing same since   173288  2022-09-23 07:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qi Zhang <qi1.zhang@intel.com>

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
   238f5f9544..b19793a2ec  b19793a2ec6466c04e5e3506fbe82038fb0a885f -> xen-tested-master

