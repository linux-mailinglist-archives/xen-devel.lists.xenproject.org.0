Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC710818AE6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656967.1025514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbm5-0005wN-AP; Tue, 19 Dec 2023 15:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656967.1025514; Tue, 19 Dec 2023 15:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbm5-0005uK-6v; Tue, 19 Dec 2023 15:12:49 +0000
Received: by outflank-mailman (input) for mailman id 656967;
 Tue, 19 Dec 2023 15:12:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFbm3-0005uA-Ky; Tue, 19 Dec 2023 15:12:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFbm3-0003hU-DI; Tue, 19 Dec 2023 15:12:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFbm3-0008FL-3n; Tue, 19 Dec 2023 15:12:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFbm3-0005oc-3I; Tue, 19 Dec 2023 15:12:47 +0000
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
	bh=w37YUUod1JvJ3PsVbsAJmOcroo3kgldvLgb3JgwsFSA=; b=KYyeteV+EWLBW9Ygndxa/s/NSD
	2mQMJFoe7VPoK559dSt7rzx6rne7J/UToI8JVFBRnKJJ3awXLpAg3VUNQoBRjaEC9sBLBcuiGNS1V
	MIQ+vA07exVbNqMT74JAYmu/Fku0irOfxwEPSRcmljNDu25ENygGcx6wCs/FApnzbrks=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184175-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184175: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b1f33cbf8113bb07526c9f6946c250c7d9db44f9
X-Osstest-Versions-That:
    ovmf=3c66390e4a514dcce4c8cc82f489d653d55ee3fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Dec 2023 15:12:47 +0000

flight 184175 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184175/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b1f33cbf8113bb07526c9f6946c250c7d9db44f9
baseline version:
 ovmf                 3c66390e4a514dcce4c8cc82f489d653d55ee3fa

Last test of basis   184173  2023-12-19 09:44:28 Z    0 days
Testing same since   184175  2023-12-19 13:11:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dhaval <dhaval@rivosinc.com>
  Dhaval Sharma <dhaval@rivosinc.com>
  Laszlo Ersek <lersek@redhat.com>

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
   3c66390e4a..b1f33cbf81  b1f33cbf8113bb07526c9f6946c250c7d9db44f9 -> xen-tested-master

