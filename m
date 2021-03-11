Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF09336D82
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 09:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96374.182247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGNz-0005Vw-Nu; Thu, 11 Mar 2021 08:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96374.182247; Thu, 11 Mar 2021 08:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGNz-0005VI-Jk; Thu, 11 Mar 2021 08:09:35 +0000
Received: by outflank-mailman (input) for mailman id 96374;
 Thu, 11 Mar 2021 08:09:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKGNx-0005Uy-SX; Thu, 11 Mar 2021 08:09:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKGNx-0000QB-Jc; Thu, 11 Mar 2021 08:09:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKGNx-0007uU-88; Thu, 11 Mar 2021 08:09:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lKGNx-000520-7f; Thu, 11 Mar 2021 08:09:33 +0000
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
	bh=x/9KpcJhv4Fsb/U0Lk7ZX1vQ2iCRaJYxmj7sKF+UO+s=; b=5A1LfipSyvdImBS0wtrIXM+tXL
	D4UG2eXhixU4cuY6rK+XfxLc0n9cU5L1QS8m4oZNdnKH9zWf/BgbgfApiZrGZ3ybejlyVzXOR9+cW
	7e4N8gEUIsxOzpPBl3XXI7pbb+lIt1GD+wtQu0cyISF53qKJPByFWnGwUddBN7yCZ5o4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159924-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159924: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=54ba08c6b66090bdc03186110149bfe4b0f75208
X-Osstest-Versions-That:
    ovmf=edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Mar 2021 08:09:33 +0000

flight 159924 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159924/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 54ba08c6b66090bdc03186110149bfe4b0f75208
baseline version:
 ovmf                 edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507

Last test of basis   159879  2021-03-08 21:40:45 Z    2 days
Testing same since   159924  2021-03-11 01:54:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>

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
   edd46cd407..54ba08c6b6  54ba08c6b66090bdc03186110149bfe4b0f75208 -> xen-tested-master

