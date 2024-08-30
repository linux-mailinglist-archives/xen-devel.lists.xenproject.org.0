Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C1966143
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 14:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786411.1196005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0Kz-0003dv-T2; Fri, 30 Aug 2024 12:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786411.1196005; Fri, 30 Aug 2024 12:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0Kz-0003c4-Q9; Fri, 30 Aug 2024 12:02:45 +0000
Received: by outflank-mailman (input) for mailman id 786411;
 Fri, 30 Aug 2024 12:02:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk0Ky-0003bu-De; Fri, 30 Aug 2024 12:02:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk0Kx-0004DR-VV; Fri, 30 Aug 2024 12:02:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk0Kx-0007y9-Ft; Fri, 30 Aug 2024 12:02:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sk0Kx-0001A0-FP; Fri, 30 Aug 2024 12:02:43 +0000
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
	bh=ngl2L61OItj3nIr45PAA2oiqLsznJLqZt2dtftAyRwg=; b=zGiTtWiMjftx7MQjgsiX5NtXQF
	6D6fRycHOW/PAiDmR/hMkIXntjpA631jPgb+tL1wTmSiWbccGoIG7nn0XkG1uDmKJIAOB81rUrHAg
	oLGUcCbQJVk9SvuF0JjclBuBLaw5N8EfelFUPltQHyjXxibY0o02WcCRzgddIcb3fHGA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187419-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187419: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a63a7dbf85963d0c11617173b117ca9edb645875
X-Osstest-Versions-That:
    ovmf=0a6d41ba0a080ff40620ff304fa9c99bb2874570
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 12:02:43 +0000

flight 187419 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187419/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a63a7dbf85963d0c11617173b117ca9edb645875
baseline version:
 ovmf                 0a6d41ba0a080ff40620ff304fa9c99bb2874570

Last test of basis   187418  2024-08-30 08:13:30 Z    0 days
Testing same since   187419  2024-08-30 10:15:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Sami Mujawar <sami.mujawar@arm.com>

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
   0a6d41ba0a..a63a7dbf85  a63a7dbf85963d0c11617173b117ca9edb645875 -> xen-tested-master

