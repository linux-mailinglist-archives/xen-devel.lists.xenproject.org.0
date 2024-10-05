Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A19913A2
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 02:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810710.1223469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swt4s-0006Ro-GL; Sat, 05 Oct 2024 00:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810710.1223469; Sat, 05 Oct 2024 00:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swt4s-0006Od-CV; Sat, 05 Oct 2024 00:55:22 +0000
Received: by outflank-mailman (input) for mailman id 810710;
 Sat, 05 Oct 2024 00:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swt4r-0006OT-H9; Sat, 05 Oct 2024 00:55:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swt4r-0001IY-4k; Sat, 05 Oct 2024 00:55:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swt4q-0008Bc-Nl; Sat, 05 Oct 2024 00:55:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swt4q-0004wy-NH; Sat, 05 Oct 2024 00:55:20 +0000
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
	bh=9l7ih54lrA4aW7/iVTCR/t+OFeoBcNbA60StUcexYnk=; b=3bcYyNu4igGJC6bfFHZascKdwA
	Wuo/eHtWw2J2yBVp5KKu9ghCyMMthxfFw7x1O3ouwGsrEI2vWuTaLoiZp5SUDchLa+ahDZj4S/Ih6
	xw7nKv+woLIuBekaO7o2NMVxFvyeOsThyPCGnCOdwr5MgS7RxHyWWD1ENtiw5qRF9nvs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187974-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187974: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8cce048d4834d6967a568f3a0adc1efcf97c80c7
X-Osstest-Versions-That:
    ovmf=54469a6918320591a3ec318eada60aed3c75334c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Oct 2024 00:55:20 +0000

flight 187974 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187974/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8cce048d4834d6967a568f3a0adc1efcf97c80c7
baseline version:
 ovmf                 54469a6918320591a3ec318eada60aed3c75334c

Last test of basis   187973  2024-10-04 21:45:07 Z    0 days
Testing same since   187974  2024-10-04 23:13:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   54469a6918..8cce048d48  8cce048d4834d6967a568f3a0adc1efcf97c80c7 -> xen-tested-master

