Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33836167F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 01:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111536.213330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXBhV-0006CL-4A; Thu, 15 Apr 2021 23:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111536.213330; Thu, 15 Apr 2021 23:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXBhU-0006Bj-Uf; Thu, 15 Apr 2021 23:47:08 +0000
Received: by outflank-mailman (input) for mailman id 111536;
 Thu, 15 Apr 2021 23:47:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXBhT-0006Bb-I5; Thu, 15 Apr 2021 23:47:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXBhT-0003Cz-AA; Thu, 15 Apr 2021 23:47:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXBhS-0000OH-Vx; Thu, 15 Apr 2021 23:47:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXBhS-000501-VU; Thu, 15 Apr 2021 23:47:06 +0000
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
	bh=DgB2rwEaYTMfu6P288rZWDwNmQndyVfztZVHlMWm+H4=; b=YU0w5Fid4FtjHZxUcoB1MdJSge
	o3L5NiCxaeqsQVbx7v+/Ye/YXBHB4JZjcD9VJ+U6M9RmnpIvEsLXNN/c2TRLJyZI98taCVKi2iORV
	6lPjrJ87Y6r+ne5d8l8mr+91AjTPVD36Ue9pbGDvvDQa2uENUj1+3pgcFWbk5IgNn1vE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161177-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161177: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=90320d569b830666afc369992a507a61f0668534
X-Osstest-Versions-That:
    xtf=4288d41183a6a14f328504d8b206ea27e9981266
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Apr 2021 23:47:06 +0000

flight 161177 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161177/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  90320d569b830666afc369992a507a61f0668534
baseline version:
 xtf                  4288d41183a6a14f328504d8b206ea27e9981266

Last test of basis   161113  2021-04-14 01:40:17 Z    1 days
Testing same since   161177  2021-04-15 17:41:37 Z    0 days    1 attempts

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
   4288d41..90320d5  90320d569b830666afc369992a507a61f0668534 -> xen-tested-master

