Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6C6D2E6B
	for <lists+xen-devel@lfdr.de>; Sat,  1 Apr 2023 07:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517111.802205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piU0h-0007GZ-3U; Sat, 01 Apr 2023 05:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517111.802205; Sat, 01 Apr 2023 05:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piU0h-0007EV-0Z; Sat, 01 Apr 2023 05:42:43 +0000
Received: by outflank-mailman (input) for mailman id 517111;
 Sat, 01 Apr 2023 05:42:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piU0f-0007EL-RM; Sat, 01 Apr 2023 05:42:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piU0f-0001ry-Oy; Sat, 01 Apr 2023 05:42:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piU0f-0003Xp-Di; Sat, 01 Apr 2023 05:42:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1piU0f-0005cH-DI; Sat, 01 Apr 2023 05:42:41 +0000
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
	bh=/cpMKIZ1/NjyUFabX38tOt0vuWWogMjA76BUJDVGFEc=; b=WRAb7IiFMyReZBINyO7ZSbps7u
	ONGPRzaRXXOEXncQbR7CO5ivCyhAUKTNu/ohcTe0Kd9w0xBn1Aoza74bqPruzYtHhVfijEboLtIWC
	94k9c/xl2mQ47raIK30JUe4ZXD4786+oVijZTws3iNcBFnd+ELcalJSDnKv4dI/xS9CE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180101-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180101: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=67a6f414aa0e2a9cac965fcc6d83b6cbd6e893c0
X-Osstest-Versions-That:
    ovmf=2f499c36db51980ad43fc6b578c7678a1720bd9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Apr 2023 05:42:41 +0000

flight 180101 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180101/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 67a6f414aa0e2a9cac965fcc6d83b6cbd6e893c0
baseline version:
 ovmf                 2f499c36db51980ad43fc6b578c7678a1720bd9c

Last test of basis   180099  2023-04-01 00:44:02 Z    0 days
Testing same since   180101  2023-04-01 03:35:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Lendacky, Thomas via groups.io <thomas.lendacky=amd.com@groups.io>
  Ray Ni <ray.ni@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   2f499c36db..67a6f414aa  67a6f414aa0e2a9cac965fcc6d83b6cbd6e893c0 -> xen-tested-master

