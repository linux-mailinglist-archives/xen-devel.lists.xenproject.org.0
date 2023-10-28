Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15B7DA842
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 19:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624781.973434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwnEl-0004jM-Uo; Sat, 28 Oct 2023 17:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624781.973434; Sat, 28 Oct 2023 17:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwnEl-0004hh-RJ; Sat, 28 Oct 2023 17:36:39 +0000
Received: by outflank-mailman (input) for mailman id 624781;
 Sat, 28 Oct 2023 17:36:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwnEl-0004hX-2s; Sat, 28 Oct 2023 17:36:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwnEk-000659-Ub; Sat, 28 Oct 2023 17:36:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwnEk-0005bH-OJ; Sat, 28 Oct 2023 17:36:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwnEk-0003FK-Nq; Sat, 28 Oct 2023 17:36:38 +0000
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
	bh=ZX3MmTpNN7hmGYMvoW1j5ObMe3GtUzU3blAwVM+cBnI=; b=hox2Hf5v3ABTiDj2pdpinkYMbl
	vSmNiK/5mMDY1SfmVJku7lwKZgDrqe9nyo3NYom920d5RyU/jYrAhS4bLJCO+mV8Y0ZOaIevA+uwY
	2qdDfeUTZ7/aum7YalSLKVqV1JVX7Tsj7mmXfrDmD8Ju0rf726KvN+olsxnuAu6Tuads=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183571-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183571: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7806713f00e92b37799ef920daae3ebf14c5b07f
X-Osstest-Versions-That:
    ovmf=7ff6ab2b3e09ee7ec0d698398001295b7867b08c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Oct 2023 17:36:38 +0000

flight 183571 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183571/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7806713f00e92b37799ef920daae3ebf14c5b07f
baseline version:
 ovmf                 7ff6ab2b3e09ee7ec0d698398001295b7867b08c

Last test of basis   183565  2023-10-27 23:41:06 Z    0 days
Testing same since   183571  2023-10-28 15:12:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joeyvagedes@gmail.com>
  Joey Vagedes <joeyvagedes@microsoft.com>

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
   7ff6ab2b3e..7806713f00  7806713f00e92b37799ef920daae3ebf14c5b07f -> xen-tested-master

