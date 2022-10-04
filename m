Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC95F49BB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 21:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415789.660443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofnZp-0004yz-8V; Tue, 04 Oct 2022 19:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415789.660443; Tue, 04 Oct 2022 19:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofnZp-0004wR-57; Tue, 04 Oct 2022 19:27:37 +0000
Received: by outflank-mailman (input) for mailman id 415789;
 Tue, 04 Oct 2022 19:27:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofnZn-0004wH-Rv; Tue, 04 Oct 2022 19:27:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofnZn-0001yQ-OZ; Tue, 04 Oct 2022 19:27:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofnZn-0004ru-9J; Tue, 04 Oct 2022 19:27:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofnZn-0003mN-8o; Tue, 04 Oct 2022 19:27:35 +0000
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
	bh=bXS62iZdPrYxBl2ENt+5ldZaQZSEULuN1gYpyf3/cQ0=; b=0FOzMiFmvG82qQXCM5uYuXNaoY
	BSs0BGHWzrojtwC45AhR735P75SSDHsPqao2hU9NE5gFWJEYtdLVYE9FfXb1685H8NWIIO/z0fhPB
	OmeaCSt8EKMvLH48PZF8Wgq+9m+v+qW4wbqIjTaITBWncIYv6cCNPZ6rA2ICydpye37k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173418-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173418: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=769879e2a6761277b8099014ad8bc426d23dc50b
X-Osstest-Versions-That:
    ovmf=12973359d02d59c0f856b1c1dd6d0ad2f85cdab9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Oct 2022 19:27:35 +0000

flight 173418 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173418/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 769879e2a6761277b8099014ad8bc426d23dc50b
baseline version:
 ovmf                 12973359d02d59c0f856b1c1dd6d0ad2f85cdab9

Last test of basis   173406  2022-10-03 18:40:36 Z    1 days
Testing same since   173418  2022-10-04 17:13:19 Z    0 days    1 attempts

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
   12973359d0..769879e2a6  769879e2a6761277b8099014ad8bc426d23dc50b -> xen-tested-master

