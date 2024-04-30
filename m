Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B78B69AF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 07:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714492.1115755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1fe6-0000x0-Em; Tue, 30 Apr 2024 05:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714492.1115755; Tue, 30 Apr 2024 05:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1fe6-0000wA-Bm; Tue, 30 Apr 2024 05:03:14 +0000
Received: by outflank-mailman (input) for mailman id 714492;
 Tue, 30 Apr 2024 05:03:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1fe4-0000w0-Q0; Tue, 30 Apr 2024 05:03:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1fe4-0007Ro-Mk; Tue, 30 Apr 2024 05:03:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s1fe4-0001my-A1; Tue, 30 Apr 2024 05:03:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s1fe4-0001s9-9i; Tue, 30 Apr 2024 05:03:12 +0000
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
	bh=RezFGtXuc8fCk25pk2VPCz4H/UtfBfVRkgG6/4vH/vQ=; b=PH9s979t5jAQ/g/X9Kwo0a5ms7
	5rbQ/A0s7FEZNfWmIUFkWjqQvMMNyrzZ2ObYzNenS79g1oBmNT31JN11Tvgxl4cPhgkK8c+yvegdr
	x4KiTRRGgsGuMxYygkrHn8htr9FzEp5FVCnoU+JK/GazP39Y2vPloHzlLAMaahemMJy8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185873-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185873: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=88781ccd744c73acbbbe9767627860a538b9f3a2
X-Osstest-Versions-That:
    ovmf=094727264f887e275444bd11d9d99c651a85c2e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Apr 2024 05:03:12 +0000

flight 185873 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185873/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 88781ccd744c73acbbbe9767627860a538b9f3a2
baseline version:
 ovmf                 094727264f887e275444bd11d9d99c651a85c2e4

Last test of basis   185868  2024-04-29 10:45:51 Z    0 days
Testing same since   185873  2024-04-30 02:41:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   094727264f..88781ccd74  88781ccd744c73acbbbe9767627860a538b9f3a2 -> xen-tested-master

