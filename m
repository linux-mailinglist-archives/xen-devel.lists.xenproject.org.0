Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B208A8D25
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 22:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707750.1105985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxC5f-0000ZQ-UR; Wed, 17 Apr 2024 20:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707750.1105985; Wed, 17 Apr 2024 20:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxC5f-0000Xr-Rp; Wed, 17 Apr 2024 20:41:11 +0000
Received: by outflank-mailman (input) for mailman id 707750;
 Wed, 17 Apr 2024 20:41:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxC5e-0000Xh-Iv; Wed, 17 Apr 2024 20:41:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxC5e-000640-CG; Wed, 17 Apr 2024 20:41:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rxC5e-0000v6-1P; Wed, 17 Apr 2024 20:41:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rxC5e-0007Ve-0z; Wed, 17 Apr 2024 20:41:10 +0000
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
	bh=G8w5eOfmOwLKDyHjjTl7Wft4kYfrPCtg8u1beyWf6SA=; b=GzzEkmbFDM8B/NOdm57JdUoHiJ
	90hoA93HQBYI2Yd5MV4O8yXVfkH0lsLOlSxGD/K9N7q9/C3quTE+MiR6KS+vpB+RUNnBTW6WcDvJZ
	/CBvPhJ4I7caeMPKc8K8OYZZfehMt5LClPyHmk4DGqtLtzSxCovbRhh4t1No/zBO3WMU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185725-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185725: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6ced1e91eff13dae1bfba95734e2b34a73601db2
X-Osstest-Versions-That:
    ovmf=61185f1d501512f35621d0fdc5f17503c77bf449
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Apr 2024 20:41:10 +0000

flight 185725 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185725/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ced1e91eff13dae1bfba95734e2b34a73601db2
baseline version:
 ovmf                 61185f1d501512f35621d0fdc5f17503c77bf449

Last test of basis   185701  2024-04-17 03:13:46 Z    0 days
Testing same since   185725  2024-04-17 18:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   61185f1d50..6ced1e91ef  6ced1e91eff13dae1bfba95734e2b34a73601db2 -> xen-tested-master

