Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FA6E2A0B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521199.809604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnO9p-0005Mn-Cy; Fri, 14 Apr 2023 18:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521199.809604; Fri, 14 Apr 2023 18:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnO9p-0005KL-A5; Fri, 14 Apr 2023 18:28:25 +0000
Received: by outflank-mailman (input) for mailman id 521199;
 Fri, 14 Apr 2023 18:28:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnO9n-0005K9-J5; Fri, 14 Apr 2023 18:28:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnO9n-0002H2-Fl; Fri, 14 Apr 2023 18:28:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pnO9n-00027a-1h; Fri, 14 Apr 2023 18:28:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pnO9n-0000QL-1C; Fri, 14 Apr 2023 18:28:23 +0000
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
	bh=QrJn6+JnF4EuEdXZYQHgGWBWO3b665cEZalgOdhtzsU=; b=B7X1OKN8iO7DGwGg4DBOfL6+Nz
	5T6cOE6kmyFRKsuzNArTdwiExSqMRxGKNYQgsa6yf1BaJbyOzVRwMyzNI5X8wuaoz3/lWHOhs1M2h
	Lyp0BLcg/kL9Z30gDQPYhKx0ubfRgnM1+DU6mrrK5/KUbxn6WP9elzroKCSxUQBao50U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180262-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180262: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=797f526ae2a83811b0ccbde0138c65a9f137eba5
X-Osstest-Versions-That:
    ovmf=c9fb11f92f52e06bcb1279b467a3b2667757be44
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Apr 2023 18:28:23 +0000

flight 180262 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180262/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 797f526ae2a83811b0ccbde0138c65a9f137eba5
baseline version:
 ovmf                 c9fb11f92f52e06bcb1279b467a3b2667757be44

Last test of basis   180261  2023-04-14 13:43:27 Z    0 days
Testing same since   180262  2023-04-14 16:12:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   c9fb11f92f..797f526ae2  797f526ae2a83811b0ccbde0138c65a9f137eba5 -> xen-tested-master

