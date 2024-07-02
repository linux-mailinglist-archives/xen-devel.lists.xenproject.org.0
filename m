Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E575F91EE73
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 07:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751958.1160082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOWGC-0007iv-Pk; Tue, 02 Jul 2024 05:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751958.1160082; Tue, 02 Jul 2024 05:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOWGC-0007go-Ka; Tue, 02 Jul 2024 05:41:00 +0000
Received: by outflank-mailman (input) for mailman id 751958;
 Tue, 02 Jul 2024 05:40:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOWGB-0007gZ-A0; Tue, 02 Jul 2024 05:40:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOWGB-0007Im-9G; Tue, 02 Jul 2024 05:40:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOWGB-0001as-1O; Tue, 02 Jul 2024 05:40:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sOWGB-0005cS-0t; Tue, 02 Jul 2024 05:40:59 +0000
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
	bh=GxFI3OycxPXbVjq2uGL2fdk3mwFnA3xFKfM48aSjDEE=; b=OOSByJvnQ8dZjpOTHEIpkYdK/7
	WSvd8Hq/iS7ypQHfK5LgMk0GFWxhPqltsanoeHazLAx0ql5bkeEkE4JMqDWDprCH4j7iS68d9ds5A
	sakawr5xHSm8vC9WJwMTESnsZf6FHxHFzt6BKXhwhgjFsqQF65KXckGhJWHrWslHpku4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186624-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186624: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e939ecf6c19f932535d073e383d016e8bf2e8ee7
X-Osstest-Versions-That:
    ovmf=8bf27965dbb94ecccc453c60de3270acf238ea3d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jul 2024 05:40:59 +0000

flight 186624 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186624/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e939ecf6c19f932535d073e383d016e8bf2e8ee7
baseline version:
 ovmf                 8bf27965dbb94ecccc453c60de3270acf238ea3d

Last test of basis   186616  2024-07-01 09:44:55 Z    0 days
Testing same since   186624  2024-07-02 03:41:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   8bf27965db..e939ecf6c1  e939ecf6c19f932535d073e383d016e8bf2e8ee7 -> xen-tested-master

