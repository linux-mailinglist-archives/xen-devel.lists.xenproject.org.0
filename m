Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05357C01F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 00:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372434.604214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEIIf-0001Fk-Fm; Wed, 20 Jul 2022 22:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372434.604214; Wed, 20 Jul 2022 22:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEIIf-0001Df-BK; Wed, 20 Jul 2022 22:36:13 +0000
Received: by outflank-mailman (input) for mailman id 372434;
 Wed, 20 Jul 2022 22:36:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIId-0001DT-HC; Wed, 20 Jul 2022 22:36:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIId-0002p2-Ea; Wed, 20 Jul 2022 22:36:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIIc-0002Cq-V6; Wed, 20 Jul 2022 22:36:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIIc-0004Lb-Ud; Wed, 20 Jul 2022 22:36:10 +0000
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
	bh=jY9bft7TRhPT9c64YY55gWuP/7Drs3eiL5Gtnl6Adf8=; b=OYaFN2R2UoSSon7h1LW/50zAJG
	7qk4bDNawwjQhbFKuEagnKHuhOYYmI51Axb5rcdx1JRGE3Si7ye1dhDp39hN/NwGKI9nt6ad66aMJ
	Q8DPmHO3QWeQYE/hq/I75wn/L1PqVaAoFtwbhBlLriWE9rzSXJ/H1SS4p/gHNW3uhva0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171710-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171710: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b8cee1781c4149c7a762b8a1c8115b635cf4cad
X-Osstest-Versions-That:
    ovmf=48249243777882d7d89ca0b86c89e355b5f941f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jul 2022 22:36:10 +0000

flight 171710 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171710/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b8cee1781c4149c7a762b8a1c8115b635cf4cad
baseline version:
 ovmf                 48249243777882d7d89ca0b86c89e355b5f941f3

Last test of basis   171703  2022-07-20 07:35:12 Z    0 days
Testing same since   171710  2022-07-20 19:10:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gary Lin <gary.lin@hpe.com>

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
   4824924377..3b8cee1781  3b8cee1781c4149c7a762b8a1c8115b635cf4cad -> xen-tested-master

