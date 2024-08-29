Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232C963834
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 04:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785361.1194820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjUuX-0007y1-4o; Thu, 29 Aug 2024 02:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785361.1194820; Thu, 29 Aug 2024 02:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjUuX-0007wV-1x; Thu, 29 Aug 2024 02:29:21 +0000
Received: by outflank-mailman (input) for mailman id 785361;
 Thu, 29 Aug 2024 02:29:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjUuV-0007wL-2k; Thu, 29 Aug 2024 02:29:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjUuU-0008O7-Qk; Thu, 29 Aug 2024 02:29:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjUuU-0000bb-EM; Thu, 29 Aug 2024 02:29:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjUuU-0002E4-Dq; Thu, 29 Aug 2024 02:29:18 +0000
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
	bh=2ljJM7zGKzZYYc7PA6lO+xFey1xHqJ0/oZNqfpVmz/0=; b=6FkayGIntAl2asG/rLGuG40GCx
	Zy65rJ+2saWHlxmdG3dq7KTYocvOetsCFPZsLivI6Q/APQ5PRBKUszqLTn5SHMeaH1wWtO5ExFuRw
	2SG1w1E1ElJEFnhyg8yNlTTPC7qX943RAboafTw9yf6U3a4DZTdA5FSd40dwlbOMxecY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187391: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=41a51d173557350ec8bcf64075a3e97730bf70dd
X-Osstest-Versions-That:
    ovmf=7cde720e5126a47dadfb63ec9fd11b637620102d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 02:29:18 +0000

flight 187391 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187391/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 41a51d173557350ec8bcf64075a3e97730bf70dd
baseline version:
 ovmf                 7cde720e5126a47dadfb63ec9fd11b637620102d

Last test of basis   187389  2024-08-28 21:41:28 Z    0 days
Testing same since   187391  2024-08-29 00:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   7cde720e51..41a51d1735  41a51d173557350ec8bcf64075a3e97730bf70dd -> xen-tested-master

