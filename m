Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A47486C6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559281.874138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3mJ-0003Kz-0Y; Wed, 05 Jul 2023 14:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559281.874138; Wed, 05 Jul 2023 14:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3mI-0003Ig-SO; Wed, 05 Jul 2023 14:46:46 +0000
Received: by outflank-mailman (input) for mailman id 559281;
 Wed, 05 Jul 2023 14:46:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qH3mH-0003IS-HQ; Wed, 05 Jul 2023 14:46:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qH3mH-0002EM-GM; Wed, 05 Jul 2023 14:46:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qH3mH-0007n6-1e; Wed, 05 Jul 2023 14:46:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qH3mH-0006F3-1E; Wed, 05 Jul 2023 14:46:45 +0000
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
	bh=F9LoW0gBMKtN3qK0pbTK8hMQF+yIU5l4J6BGj4GkSbI=; b=rTNvtG374MdQvJxSBQ4cMXW7Ql
	r0zEw0rKj+z0x8YuzW2Ij/PmpClCTA5sR3yGz1oA2dj1BXmaICshhhAT9gdnS/T9m8+2le+IkSXTS
	Cp6Cn8rK4F5iJ6j0Hlfbo7nQSMlpMPpwd8WEuo6Yp7L19x4IrDRLpccVL8Vlw6LhIMlw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181705-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181705: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=af8859bce2ffa8d72d8fb30149a0ef6423a8cc47
X-Osstest-Versions-That:
    ovmf=1fadd18d0c0c65ffde9e128a486414ba43b3387c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jul 2023 14:46:45 +0000

flight 181705 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181705/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 af8859bce2ffa8d72d8fb30149a0ef6423a8cc47
baseline version:
 ovmf                 1fadd18d0c0c65ffde9e128a486414ba43b3387c

Last test of basis   181702  2023-07-05 07:40:44 Z    0 days
Testing same since   181705  2023-07-05 10:10:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Yi Li <yi1.li@intel.com>

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
   1fadd18d0c..af8859bce2  af8859bce2ffa8d72d8fb30149a0ef6423a8cc47 -> xen-tested-master

