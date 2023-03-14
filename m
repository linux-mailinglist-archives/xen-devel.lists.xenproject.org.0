Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E804B6B8971
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 05:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509450.785223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbw6T-00068O-VY; Tue, 14 Mar 2023 04:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509450.785223; Tue, 14 Mar 2023 04:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbw6T-00065Z-RV; Tue, 14 Mar 2023 04:17:37 +0000
Received: by outflank-mailman (input) for mailman id 509450;
 Tue, 14 Mar 2023 04:17:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbw6R-00065P-TC; Tue, 14 Mar 2023 04:17:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbw6R-0008UY-RS; Tue, 14 Mar 2023 04:17:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbw6R-0004Kq-BZ; Tue, 14 Mar 2023 04:17:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pbw6R-0004oi-B4; Tue, 14 Mar 2023 04:17:35 +0000
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
	bh=R9dTPUABrMduiyJ+NZO4ZF9ZVInGzlwpBuT2/08S8lk=; b=RSP29hM9DCN9ahfO1dPaBELjR0
	yjjiaCQyeIT2u81MRm/2v0aczQfN42wnv2eUw8+T6QD5GSPEdbQtKUjXQ592hlb4WR+EZZr4nsrOw
	eHyMp8mBLksTIPvfM/V4YHCVabwsZ3Z/4WmRay4BBE8ZfwfFU32gcknh7Qv5b/E8hxg8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179613-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179613: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a1386bb252066262c0b6664af9a6143306d88512
X-Osstest-Versions-That:
    ovmf=e4c1d8d2317984bd9cb447eba916956841063ec4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Mar 2023 04:17:35 +0000

flight 179613 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179613/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a1386bb252066262c0b6664af9a6143306d88512
baseline version:
 ovmf                 e4c1d8d2317984bd9cb447eba916956841063ec4

Last test of basis   179610  2023-03-13 22:40:48 Z    0 days
Testing same since   179613  2023-03-14 02:06:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>

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
   e4c1d8d231..a1386bb252  a1386bb252066262c0b6664af9a6143306d88512 -> xen-tested-master

