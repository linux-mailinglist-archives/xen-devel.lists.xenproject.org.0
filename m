Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015A687550
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 06:42:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488541.756661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNSMK-0001kQ-ST; Thu, 02 Feb 2023 05:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488541.756661; Thu, 02 Feb 2023 05:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNSMK-0001hN-PL; Thu, 02 Feb 2023 05:42:08 +0000
Received: by outflank-mailman (input) for mailman id 488541;
 Thu, 02 Feb 2023 05:42:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNSMJ-0001hD-DU; Thu, 02 Feb 2023 05:42:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNSMJ-0000PE-AE; Thu, 02 Feb 2023 05:42:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNSMI-0000vD-Vf; Thu, 02 Feb 2023 05:42:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNSMI-0003bU-VD; Thu, 02 Feb 2023 05:42:06 +0000
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
	bh=2z9oUQpyi74edL7LvNI5Mbu+KlGndAbDW8L4hannf+E=; b=jQ7sI4KXHvCPwCRESx6CjcOV/X
	W7f3RL51qeLmncJA1ihLuu/AW/w7ODi25BNEk1PCTBw/BlICF2Pa4Uq+jx1YKR3Rpe5JtfQJfkRky
	VqRTRsh9NlY9bj+KBoxat2vQE3uMQX7S1otQ5AnSdwsNeNdUTEkyhvBe6vYUeXj+QsyI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176323-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176323: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d375273c899bfa279c2732c509caf455af285006
X-Osstest-Versions-That:
    ovmf=bda715bf6d7cf565ccd4eda1f48e850ab8e2d452
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Feb 2023 05:42:06 +0000

flight 176323 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176323/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d375273c899bfa279c2732c509caf455af285006
baseline version:
 ovmf                 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452

Last test of basis   176306  2023-02-01 02:42:07 Z    1 days
Testing same since   176323  2023-02-02 02:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuan Yu <yuanyu@google.com>

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
   bda715bf6d..d375273c89  d375273c899bfa279c2732c509caf455af285006 -> xen-tested-master

