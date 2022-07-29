Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FC584D4C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 10:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377396.610593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLDW-0005bJ-I4; Fri, 29 Jul 2022 08:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377396.610593; Fri, 29 Jul 2022 08:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHLDW-0005Yh-F3; Fri, 29 Jul 2022 08:19:30 +0000
Received: by outflank-mailman (input) for mailman id 377396;
 Fri, 29 Jul 2022 08:19:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHLDV-0005YX-Cq; Fri, 29 Jul 2022 08:19:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHLDV-00060Z-8k; Fri, 29 Jul 2022 08:19:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHLDU-0002d3-UY; Fri, 29 Jul 2022 08:19:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHLDU-0001U9-U2; Fri, 29 Jul 2022 08:19:28 +0000
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
	bh=puDH+laWYcZBPoXGJcJFvh00Zz7Dz8CajW7DphHM6Uk=; b=MZoxH1PQMr2SvFdqSBQfEAI7TT
	oSoHaNBWwBZwI5ciFBzi6+UtcZsWtIvdtHvLjx91y3vtmkCz+eqz8MrbBHRC41oIxeU62NjRSJFkW
	BD1XF9KV+7/ux21vGYTBLCNz4vz5HzipHDKInpDgTl+YjfeUvb9fStFDhu4cZm20oNt8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171913-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171913: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0d0bfcb4571caa65b7875003f38e67e2ac7e5560
X-Osstest-Versions-That:
    ovmf=3eca64f157c340f9bbf552d89a69698a3090c080
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jul 2022 08:19:28 +0000

flight 171913 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171913/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0d0bfcb4571caa65b7875003f38e67e2ac7e5560
baseline version:
 ovmf                 3eca64f157c340f9bbf552d89a69698a3090c080

Last test of basis   171898  2022-07-28 17:13:05 Z    0 days
Testing same since   171913  2022-07-29 03:12:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   3eca64f157..0d0bfcb457  0d0bfcb4571caa65b7875003f38e67e2ac7e5560 -> xen-tested-master

