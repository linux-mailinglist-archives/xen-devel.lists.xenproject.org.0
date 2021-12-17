Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DFB47815C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 01:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248358.428438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my1Bc-00015S-IH; Fri, 17 Dec 2021 00:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248358.428438; Fri, 17 Dec 2021 00:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my1Bc-00012D-Dh; Fri, 17 Dec 2021 00:33:24 +0000
Received: by outflank-mailman (input) for mailman id 248358;
 Fri, 17 Dec 2021 00:33:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my1Ba-000123-6S; Fri, 17 Dec 2021 00:33:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my1Ba-00046l-3g; Fri, 17 Dec 2021 00:33:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my1BZ-0004lg-LH; Fri, 17 Dec 2021 00:33:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1my1BZ-0004nP-Kf; Fri, 17 Dec 2021 00:33:21 +0000
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
	bh=G7022vhqjJiBMMMa2wMwWtiEv1JrR00ttVVfr72jp9w=; b=j/DhATiugBJW/8LM62qT+VM4fC
	sNwa8A3spw+deLtI6lCjMNOlAHCRAAo/4Ozm2vacQ37O57lW727n5k4ZFLNJfH9n6jiLcneDiwDWb
	rUEHi2DJFeNKhzqeYHG6aMOHW2Aj7Ld48yFZAunAkIOK64pKOsaetKT/4CzAdUlojPvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167450-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167450: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b451c6908878c448c2a2aa6e9ca2a2dfe078fbb8
X-Osstest-Versions-That:
    ovmf=e6ea1464a846b3f012a9ca07d92924c2e1b88334
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Dec 2021 00:33:21 +0000

flight 167450 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167450/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b451c6908878c448c2a2aa6e9ca2a2dfe078fbb8
baseline version:
 ovmf                 e6ea1464a846b3f012a9ca07d92924c2e1b88334

Last test of basis   167445  2021-12-16 04:45:51 Z    0 days
Testing same since   167450  2021-12-16 18:10:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>
  Nhi Pham via groups.io <nhi=os.amperecomputing.com@groups.io>

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
   e6ea1464a8..b451c69088  b451c6908878c448c2a2aa6e9ca2a2dfe078fbb8 -> xen-tested-master

