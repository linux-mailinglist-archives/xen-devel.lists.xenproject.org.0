Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE77E0CEB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Nov 2023 01:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627368.978361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz4rf-0008NY-2h; Sat, 04 Nov 2023 00:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627368.978361; Sat, 04 Nov 2023 00:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz4re-0008KZ-VZ; Sat, 04 Nov 2023 00:50:14 +0000
Received: by outflank-mailman (input) for mailman id 627368;
 Sat, 04 Nov 2023 00:50:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz4rc-0008KP-Os; Sat, 04 Nov 2023 00:50:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz4rc-0008Qf-Hb; Sat, 04 Nov 2023 00:50:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qz4rc-0005cG-7J; Sat, 04 Nov 2023 00:50:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qz4rc-0003vv-6t; Sat, 04 Nov 2023 00:50:12 +0000
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
	bh=2f/5PaOUtU4MPBHEpU0/V2wu5CBuRYraavsoOtEnSF4=; b=s2u+yznj7W7JLOqfhZJ89dsFCT
	hBJ+0D9M2WScSmrVLjwYEjMwAXpUwljyRmHkOiUalrVciJYtuvfEGkOx+OpYAnZkWJJ+whEo8xMnx
	jy3mq5iEULRSYTSkkoKLRAGU/C4kiaNTRjCZOMIa3OXB/9fK9g4eEs4WUp3JZ/47tXPM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183673-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183673: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=08ac799d36332d41d1a25ff3df748672676c0947
X-Osstest-Versions-That:
    ovmf=0b4acb88d67520ad5cd9fd8896db0a2e203eaca4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Nov 2023 00:50:12 +0000

flight 183673 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183673/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 08ac799d36332d41d1a25ff3df748672676c0947
baseline version:
 ovmf                 0b4acb88d67520ad5cd9fd8896db0a2e203eaca4

Last test of basis   183672  2023-11-03 20:14:31 Z    0 days
Testing same since   183673  2023-11-03 22:41:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>

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
   0b4acb88d6..08ac799d36  08ac799d36332d41d1a25ff3df748672676c0947 -> xen-tested-master

