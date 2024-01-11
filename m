Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8BB82B10D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666336.1036896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwRq-0002io-RS; Thu, 11 Jan 2024 14:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666336.1036896; Thu, 11 Jan 2024 14:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwRq-0002hN-Nx; Thu, 11 Jan 2024 14:54:22 +0000
Received: by outflank-mailman (input) for mailman id 666336;
 Thu, 11 Jan 2024 14:54:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNwRp-0002hB-LW; Thu, 11 Jan 2024 14:54:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNwRp-0007fW-EF; Thu, 11 Jan 2024 14:54:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNwRo-0006P6-VI; Thu, 11 Jan 2024 14:54:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNwRo-0006Ei-Uo; Thu, 11 Jan 2024 14:54:20 +0000
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
	bh=DT4vMUYDSydvsGopZwARtdxXRkHYONVvUArVP4VqF7M=; b=tG66MOdpFCvWGqX8eM9m4pUcps
	O4xhEk+zPbXK6E2gzxFRZSpUKaiY2TxYpe7t+6joq+z4q2Pvhbrdg+j5Hg7FdLxUQr/D9Kz0wLWop
	toyOt7Hvmd4TPoH/hsf9h8uEjuEVuNlNGrXGmR4ebFxe4mZNg4qysdV2HAHboU28nP44=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184320: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ebf378a1ada6d128dbf32aec76b3911895747bbb
X-Osstest-Versions-That:
    ovmf=889535caf8869e3d4818b75f95f2fc910c84a4d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jan 2024 14:54:20 +0000

flight 184320 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184320/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ebf378a1ada6d128dbf32aec76b3911895747bbb
baseline version:
 ovmf                 889535caf8869e3d4818b75f95f2fc910c84a4d2

Last test of basis   184315  2024-01-11 03:12:57 Z    0 days
Testing same since   184320  2024-01-11 12:12:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunil V L <sunilvl@ventanamicro.com>

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
   889535caf8..ebf378a1ad  ebf378a1ada6d128dbf32aec76b3911895747bbb -> xen-tested-master

