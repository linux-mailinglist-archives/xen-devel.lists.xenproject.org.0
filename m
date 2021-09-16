Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5040D365
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188121.337186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlAZ-0002ec-Ij; Thu, 16 Sep 2021 06:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188121.337186; Thu, 16 Sep 2021 06:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlAZ-0002co-Fk; Thu, 16 Sep 2021 06:46:51 +0000
Received: by outflank-mailman (input) for mailman id 188121;
 Thu, 16 Sep 2021 06:46:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQlAY-0002cc-Mt; Thu, 16 Sep 2021 06:46:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQlAY-0007mn-G5; Thu, 16 Sep 2021 06:46:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQlAY-0006S2-63; Thu, 16 Sep 2021 06:46:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mQlAY-0006ot-5Z; Thu, 16 Sep 2021 06:46:50 +0000
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
	bh=O1gK2bQGxtTfIH2tNKXWWKwCElJyjZ7SL7OOynG+tLE=; b=3aHEV6YO7lhO4mBzEX49rwQdYI
	oRT8IlTvmWS9WyV7bHwo/3dLi+Fj1zZ0Q8/uyLarz+6BjoWBs2YKEpDrWFhS2soh05SY92bkzHnfa
	HjcayB+AvemKAEFJtmpjiENFLjmOtFbkYvQLTbl7y6JsUxfKGVLGUCT/yxBdyfs/kVWo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165001-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165001: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c19d18136ef920e3e84f961e2a335a41147adcb8
X-Osstest-Versions-That:
    ovmf=3b69fcf5f849021aa3bc810f8100ea71c03019e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Sep 2021 06:46:50 +0000

flight 165001 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165001/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c19d18136ef920e3e84f961e2a335a41147adcb8
baseline version:
 ovmf                 3b69fcf5f849021aa3bc810f8100ea71c03019e5

Last test of basis   164971  2021-09-13 17:12:37 Z    2 days
Testing same since   165001  2021-09-16 01:55:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   3b69fcf5f8..c19d18136e  c19d18136ef920e3e84f961e2a335a41147adcb8 -> xen-tested-master

