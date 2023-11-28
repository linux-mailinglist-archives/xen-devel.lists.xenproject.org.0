Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778B7FC7E4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643489.1003790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85a3-0002Jq-13; Tue, 28 Nov 2023 21:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643489.1003790; Tue, 28 Nov 2023 21:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85a2-0002Ho-UQ; Tue, 28 Nov 2023 21:25:18 +0000
Received: by outflank-mailman (input) for mailman id 643489;
 Tue, 28 Nov 2023 21:25:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r85a1-0002He-6r; Tue, 28 Nov 2023 21:25:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r85a1-0001hX-5w; Tue, 28 Nov 2023 21:25:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r85a0-0000Qb-Pg; Tue, 28 Nov 2023 21:25:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r85a0-0001C5-PE; Tue, 28 Nov 2023 21:25:16 +0000
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
	bh=qC7Bra9O/61qmk46PhkcTQLSsdB5tM+NbRVDUu7ta9s=; b=pJOS5rmkg2HO/WAFiTqNJO0NWB
	8NuU120fLVFrhOzuVMumrKBL+vUGCDFAsdslZT4zOSHLE0kgCfY8hcoqbn3ymNV6YwNM4Mo4cY9Ke
	BXhRwURKf9fcKqdLYHailydGpV5cq6TwBacbTUMq85knObBHrKNRNypJDRPFd2kzZW2U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183909-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183909: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e1627f77201ac55d24e9d0e3380f9dbdc600843c
X-Osstest-Versions-That:
    ovmf=9eec96bd4fc53d7836b5606f2a8bbb10713cc8f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 21:25:16 +0000

flight 183909 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183909/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e1627f77201ac55d24e9d0e3380f9dbdc600843c
baseline version:
 ovmf                 9eec96bd4fc53d7836b5606f2a8bbb10713cc8f5

Last test of basis   183895  2023-11-28 13:41:02 Z    0 days
Testing same since   183909  2023-11-28 18:11:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   9eec96bd4f..e1627f7720  e1627f77201ac55d24e9d0e3380f9dbdc600843c -> xen-tested-master

