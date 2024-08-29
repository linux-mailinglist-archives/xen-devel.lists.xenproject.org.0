Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B611965011
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 21:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786083.1195631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjl9H-0007Rd-CC; Thu, 29 Aug 2024 19:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786083.1195631; Thu, 29 Aug 2024 19:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjl9H-0007PA-8o; Thu, 29 Aug 2024 19:49:39 +0000
Received: by outflank-mailman (input) for mailman id 786083;
 Thu, 29 Aug 2024 19:49:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjl9G-0007P0-Am; Thu, 29 Aug 2024 19:49:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjl9G-0002of-64; Thu, 29 Aug 2024 19:49:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjl9F-0002jQ-OS; Thu, 29 Aug 2024 19:49:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjl9F-000185-Nv; Thu, 29 Aug 2024 19:49:37 +0000
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
	bh=O0JxnP196E7yKRBZSvzAA/c1gqa3Pjk6MGCEwKNb4L0=; b=29MEsEy8b3MraH9ZxCopiouU7Q
	x8CTv/v7m7wtur6ESRJQrXDAAotNYWFjoxoE2CKFeLHNhBZJmpxCkbeRF7pRnQNtLHX3jJPBQ8TC1
	14wzWsuW0eHUkZiDriRlRFDmdTZd0kfdQ12aSt8kQdBsioi6wk2sQNukPXb8K54hxYKI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187407-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187407: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1169122c6f22d4db3e44b7b720480522b6933a62
X-Osstest-Versions-That:
    ovmf=01735bbe4a46a6fb7d5d739d0fc5a14897ad18da
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Aug 2024 19:49:37 +0000

flight 187407 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187407/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1169122c6f22d4db3e44b7b720480522b6933a62
baseline version:
 ovmf                 01735bbe4a46a6fb7d5d739d0fc5a14897ad18da

Last test of basis   187403  2024-08-29 13:15:08 Z    0 days
Testing same since   187407  2024-08-29 16:45:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

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
   01735bbe4a..1169122c6f  1169122c6f22d4db3e44b7b720480522b6933a62 -> xen-tested-master

