Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB035EB14
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 04:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110200.210344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWVVt-00031b-8J; Wed, 14 Apr 2021 02:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110200.210344; Wed, 14 Apr 2021 02:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWVVt-000319-0w; Wed, 14 Apr 2021 02:44:21 +0000
Received: by outflank-mailman (input) for mailman id 110200;
 Wed, 14 Apr 2021 02:44:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWVVr-000311-Je; Wed, 14 Apr 2021 02:44:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWVVr-0007CA-Ej; Wed, 14 Apr 2021 02:44:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWVVr-0006CU-70; Wed, 14 Apr 2021 02:44:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWVVr-0007ik-6V; Wed, 14 Apr 2021 02:44:19 +0000
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
	bh=e4slEL0+Xs875GOrpUWnmvVYs6/JVmQcps16Q5HKi+c=; b=lW5kmjn1kJXjMB/ihvrbKxAWzN
	kipezu8SG5cdo78gmGlQT+cr9+CnbQ5xFff/r8hPGle+MVZkJ2npAgUr2rNyt9MrbRVh0K7ITk3DD
	xAc2XY2bzDDOVUXs7zMgwjZJn5lQLXBhHDzv9VRRL9ccIq3d/A9lvmqRtv4HHV/I1Qsw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161113-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161113: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=4288d41183a6a14f328504d8b206ea27e9981266
X-Osstest-Versions-That:
    xtf=7cd8f381d0fe1736d00a568e1381956197e66699
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Apr 2021 02:44:19 +0000

flight 161113 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161113/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  4288d41183a6a14f328504d8b206ea27e9981266
baseline version:
 xtf                  7cd8f381d0fe1736d00a568e1381956197e66699

Last test of basis   161108  2021-04-13 23:10:06 Z    0 days
Testing same since   161113  2021-04-14 01:40:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@arm.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   7cd8f38..4288d41  4288d41183a6a14f328504d8b206ea27e9981266 -> xen-tested-master

