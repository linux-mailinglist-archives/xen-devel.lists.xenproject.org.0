Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD1937017
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760719.1170620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUYgg-0007aa-DB; Thu, 18 Jul 2024 21:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760719.1170620; Thu, 18 Jul 2024 21:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUYgg-0007XY-A9; Thu, 18 Jul 2024 21:29:18 +0000
Received: by outflank-mailman (input) for mailman id 760719;
 Thu, 18 Jul 2024 21:29:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUYgf-0007XO-9a; Thu, 18 Jul 2024 21:29:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUYgf-00032G-6f; Thu, 18 Jul 2024 21:29:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUYge-0004UK-UR; Thu, 18 Jul 2024 21:29:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sUYge-0001wl-Tu; Thu, 18 Jul 2024 21:29:16 +0000
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
	bh=fydHBttRgvlLDtuKuWbzU2NG9K2DuEPHx4XrLbupbpQ=; b=AT/PD3vZp9LsVpQz9uUFJi3gHo
	MdEQH+MCZKkdTL3XhEcHugGI9P6qw1uRaj+5ve0vWGjSZ3+eTmbwgTvAh2Dzq2WmhWJFCuGFbDN24
	kMNAgwpDzU4CjB1vhq1HFuugLEABhWaGtDIHiK+U4GGzlazO++ljMk8LPrWUJne2OrmY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186881-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186881: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=489e4a60ea88326a07a7cee8086227c3df2bf93d
X-Osstest-Versions-That:
    ovmf=62bf2aefc7d58288bb9e32c0c7fe2052c33101e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Jul 2024 21:29:16 +0000

flight 186881 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186881/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 489e4a60ea88326a07a7cee8086227c3df2bf93d
baseline version:
 ovmf                 62bf2aefc7d58288bb9e32c0c7fe2052c33101e9

Last test of basis   186848  2024-07-17 23:42:52 Z    0 days
Testing same since   186881  2024-07-18 19:45:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <brbarkel@microsoft.com>
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
   62bf2aefc7..489e4a60ea  489e4a60ea88326a07a7cee8086227c3df2bf93d -> xen-tested-master

