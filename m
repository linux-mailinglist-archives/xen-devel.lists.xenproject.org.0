Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B0563BC2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 23:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359244.588669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7OCH-0001NV-63; Fri, 01 Jul 2022 21:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359244.588669; Fri, 01 Jul 2022 21:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7OCH-0001Ko-1Z; Fri, 01 Jul 2022 21:29:05 +0000
Received: by outflank-mailman (input) for mailman id 359244;
 Fri, 01 Jul 2022 21:29:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7OCF-0001Ke-2L; Fri, 01 Jul 2022 21:29:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7OCE-0003DU-WB; Fri, 01 Jul 2022 21:29:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7OCE-0007ij-JL; Fri, 01 Jul 2022 21:29:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o7OCE-0008I3-Iu; Fri, 01 Jul 2022 21:29:02 +0000
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
	bh=OKvqkIdXnqzpLGOhkfto0PCQKOvRlZ5dexiIWPVhA70=; b=gk0s5QiZMVF+hBY6/X1w8QgFRl
	8KaFhvORcCz/d5gLx9VlTVw86HEwmYgKiZMU14m28t+g8k2ba02fsZWrgri7FYBnUTf19d2nkvmg1
	lDDo+mzVnMLZhZ8fzC9oLG6lSxUeCEABebbXLAKnxddQFkhUJgz23w3szvoA8pDVyFls=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171446-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171446: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e1eef3a8b01a25e75abf63d15bdc90157a74cba9
X-Osstest-Versions-That:
    ovmf=70586d4e3af67dcc4fa2cd49524b7e5b71e0c7e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Jul 2022 21:29:02 +0000

flight 171446 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171446/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e1eef3a8b01a25e75abf63d15bdc90157a74cba9
baseline version:
 ovmf                 70586d4e3af67dcc4fa2cd49524b7e5b71e0c7e1

Last test of basis   171444  2022-07-01 15:13:05 Z    0 days
Testing same since   171446  2022-07-01 17:40:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heng Luo <heng.luo@intel.com>
  Robbie King <robbiek@xsightlabs.com>

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
   70586d4e3a..e1eef3a8b0  e1eef3a8b01a25e75abf63d15bdc90157a74cba9 -> xen-tested-master

