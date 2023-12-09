Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04280B16A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 02:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650834.1016654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBm7b-00047l-NQ; Sat, 09 Dec 2023 01:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650834.1016654; Sat, 09 Dec 2023 01:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBm7b-00044x-KF; Sat, 09 Dec 2023 01:27:11 +0000
Received: by outflank-mailman (input) for mailman id 650834;
 Sat, 09 Dec 2023 01:27:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBm7Z-00044n-RM; Sat, 09 Dec 2023 01:27:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBm7Z-0003Y2-KU; Sat, 09 Dec 2023 01:27:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBm7Z-0004xp-6Q; Sat, 09 Dec 2023 01:27:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBm7Z-0004kc-5y; Sat, 09 Dec 2023 01:27:09 +0000
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
	bh=VjvqClAMeNyp2Cg4lS+g4w4o3yvJC/0rrV8u/hs+F+0=; b=7CyIQ/GkyeZiA2RD8oe73Zo2Wp
	eELmXUFo9pbXr3Er/V09HZrWaGE6z9NzxrKmNutuCncYO2p3pxmvbXVeWuvX40HIPpFI8ljENLVYa
	lBHJHEEBI7WOPVrdpl1pi88Wmwn6jcA1KciF80D8xpzXJQe4v2HIkDZGZIlj2ns6U4Dk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184040-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184040: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c40ee8c68efb787b13be1a120d2ea0ebf1fc949
X-Osstest-Versions-That:
    ovmf=2cd9d5f6fa710e9a8ee810212081f86702114d2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Dec 2023 01:27:09 +0000

flight 184040 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184040/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c40ee8c68efb787b13be1a120d2ea0ebf1fc949
baseline version:
 ovmf                 2cd9d5f6fa710e9a8ee810212081f86702114d2f

Last test of basis   184038  2023-12-08 13:43:06 Z    0 days
Testing same since   184040  2023-12-08 23:12:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  ManickamX Srinivasan <manickamx.srinivasan@intel.com>

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
   2cd9d5f6fa..3c40ee8c68  3c40ee8c68efb787b13be1a120d2ea0ebf1fc949 -> xen-tested-master

