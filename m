Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A331156C832
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 10:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363761.594463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA6Cz-0005CA-WB; Sat, 09 Jul 2022 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363761.594463; Sat, 09 Jul 2022 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA6Cz-00059G-Rn; Sat, 09 Jul 2022 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 363761;
 Sat, 09 Jul 2022 08:52:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oA6Cx-000594-Nw; Sat, 09 Jul 2022 08:52:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oA6Cx-0004ms-Mu; Sat, 09 Jul 2022 08:52:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oA6Cx-0006nJ-4J; Sat, 09 Jul 2022 08:52:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oA6Cx-0002W1-3u; Sat, 09 Jul 2022 08:52:59 +0000
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
	bh=sbPEeAEyAc4H7oK5grYT+XiM6F7EWE1R0Y/QMthHfl4=; b=x7R3A7GKQ2BarZKKHTLnXUFHl4
	SGyYf/BhGk0Lzwq2zaZ+rK1Rnv4PazGjAw5utGAVLYeAVC8KO4nZ2CyglRVCTLGW4PR4SzgWkySY9
	rzeYpsIYOTRuGVNTVg+E/Oxrz4ii5PlQZ1O1EwRvJ/51CqlL/5znJ0WIBbeIGTcdgP/0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171567-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171567: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=86a0f84470f7df815c54b6da26874314e58c8a1a
X-Osstest-Versions-That:
    ovmf=e93bc6309ba743c6bdaae4d1dc6f0fb141c47ee5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Jul 2022 08:52:59 +0000

flight 171567 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171567/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 86a0f84470f7df815c54b6da26874314e58c8a1a
baseline version:
 ovmf                 e93bc6309ba743c6bdaae4d1dc6f0fb141c47ee5

Last test of basis   171554  2022-07-08 04:10:36 Z    1 days
Testing same since   171567  2022-07-09 07:10:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>

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
   e93bc6309b..86a0f84470  86a0f84470f7df815c54b6da26874314e58c8a1a -> xen-tested-master

