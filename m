Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA2E367EE6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 12:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115261.219808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWnS-0002RA-9P; Thu, 22 Apr 2021 10:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115261.219808; Thu, 22 Apr 2021 10:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWnS-0002Qh-5a; Thu, 22 Apr 2021 10:42:58 +0000
Received: by outflank-mailman (input) for mailman id 115261;
 Thu, 22 Apr 2021 10:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZWnR-0002QU-H2; Thu, 22 Apr 2021 10:42:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZWnR-00043l-9y; Thu, 22 Apr 2021 10:42:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZWnR-0007XZ-2H; Thu, 22 Apr 2021 10:42:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lZWnQ-0001Yl-VT; Thu, 22 Apr 2021 10:42:56 +0000
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
	bh=AhZ/y7aBCiYmIWcKf/1Hbk+lhtFbJz33jIWy6iex7rk=; b=ZkZRWMq6U4HNS/ff93vScQ5Q3I
	p21NdDmsrdfi/3mSByJY2zsgHztgVRaDwkre8JSzWh6t1SQwto7UM2+vAXYsv+B/SaLbfR4y+ZXHj
	pSTFg3nqcG15+SMJWkVJhQk/QxLtxvsBI5b9AKfWuCo6+9Vfbn6HxpQrZ7kOI3jQ8+oc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161363-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161363: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=e24fbec38e66e0df8471efb0c804256bdac96636
X-Osstest-Versions-That:
    xtf=0395a690c921cb195619b689ba0c0b687531c64c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Apr 2021 10:42:56 +0000

flight 161363 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161363/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  e24fbec38e66e0df8471efb0c804256bdac96636
baseline version:
 xtf                  0395a690c921cb195619b689ba0c0b687531c64c

Last test of basis   161302  2021-04-19 21:40:10 Z    2 days
Testing same since   161363  2021-04-21 23:10:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
   0395a69..e24fbec  e24fbec38e66e0df8471efb0c804256bdac96636 -> xen-tested-master

