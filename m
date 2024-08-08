Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB294B5F2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 06:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773711.1184153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbust-0002uy-2I; Thu, 08 Aug 2024 04:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773711.1184153; Thu, 08 Aug 2024 04:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbuss-0002sV-V5; Thu, 08 Aug 2024 04:36:18 +0000
Received: by outflank-mailman (input) for mailman id 773711;
 Thu, 08 Aug 2024 04:36:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbusq-0002sL-QI; Thu, 08 Aug 2024 04:36:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbusq-00077d-Fg; Thu, 08 Aug 2024 04:36:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbusp-0006ph-WB; Thu, 08 Aug 2024 04:36:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sbusp-0008Ay-VZ; Thu, 08 Aug 2024 04:36:15 +0000
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
	bh=T9pia2LFqC+DREfFaCHmV5goD/0qMqRGtB6yWdsCg3M=; b=7Nm8ip2OW7bm2O6hW4wLiwPL37
	+fH/9lFv232u628OgSmnKAFzBSioq20BYAVpClz2zpYifZUgO1ICNid8VpuQRtLIaDDRZI1ebg4U5
	yTzTPsLz15Uq3qtHfZTIVzZMm0Iu+31WfSdahh2fHIsz4piB4OyRz+gttTPfny8TS+Wg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187187: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b0f43dd3fdec2363e3548ec31eb455dc1c4ac761
X-Osstest-Versions-That:
    ovmf=ab6ad2fbdbaad1eb3a766973d6f587685d784d48
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Aug 2024 04:36:15 +0000

flight 187187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b0f43dd3fdec2363e3548ec31eb455dc1c4ac761
baseline version:
 ovmf                 ab6ad2fbdbaad1eb3a766973d6f587685d784d48

Last test of basis   187185  2024-08-07 23:13:17 Z    0 days
Testing same since   187187  2024-08-08 01:56:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dat Mach <dmach@nvidia.com>

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
   ab6ad2fbdb..b0f43dd3fd  b0f43dd3fdec2363e3548ec31eb455dc1c4ac761 -> xen-tested-master

