Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3026209BD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 07:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439739.693788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osIS0-0006yR-Bo; Tue, 08 Nov 2022 06:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439739.693788; Tue, 08 Nov 2022 06:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osIS0-0006wT-8g; Tue, 08 Nov 2022 06:51:12 +0000
Received: by outflank-mailman (input) for mailman id 439739;
 Tue, 08 Nov 2022 06:51:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osIRz-0006wJ-9c; Tue, 08 Nov 2022 06:51:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osIRz-0005n7-7b; Tue, 08 Nov 2022 06:51:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osIRy-0005Xy-TC; Tue, 08 Nov 2022 06:51:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1osIRy-0004Lk-So; Tue, 08 Nov 2022 06:51:10 +0000
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
	bh=2u5lGvR9OXb5AbHVrRYm2ItwswDJTJdrCUBzZ49JkxY=; b=oPPGQZPKCrxorLpLAdOvXlUraM
	KPkU7V+y5xTJWaPadZk644bMFy7tUTC2Le+VuHCwf4OK+hNOfn0DCUigUiBC3CR5Bz0nIi7OI5tsk
	W0hjTRelx2C/RdjHSi/wWgXaJV+zh6dxhNS/ihjfqEbk9YUO/yP3xHC8O4jbWh3PN1H0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174666-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174666: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=50bee4cc121aacc67f40b6c5ee0c71d3879dcc41
X-Osstest-Versions-That:
    ovmf=239bcf78053f4581cc3468ab961f9d37e859c7d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Nov 2022 06:51:10 +0000

flight 174666 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174666/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 50bee4cc121aacc67f40b6c5ee0c71d3879dcc41
baseline version:
 ovmf                 239bcf78053f4581cc3468ab961f9d37e859c7d9

Last test of basis   174658  2022-11-07 16:11:49 Z    0 days
Testing same since   174666  2022-11-08 03:42:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jian J Wang <jian.j.wang@intel.com>
  Judah Vang <judah.vang@intel.com>
  Nishant C Mistry <nishant.c.mistry@intel.com>

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
   239bcf7805..50bee4cc12  50bee4cc121aacc67f40b6c5ee0c71d3879dcc41 -> xen-tested-master

