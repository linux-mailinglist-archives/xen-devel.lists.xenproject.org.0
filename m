Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABC67CA7B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484992.751899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0zt-00086N-FG; Thu, 26 Jan 2023 12:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484992.751899; Thu, 26 Jan 2023 12:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0zt-00084d-Bx; Thu, 26 Jan 2023 12:04:53 +0000
Received: by outflank-mailman (input) for mailman id 484992;
 Thu, 26 Jan 2023 12:04:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pL0zs-00084T-4P; Thu, 26 Jan 2023 12:04:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pL0zs-0001Tx-3Z; Thu, 26 Jan 2023 12:04:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pL0zr-0005Rx-Pv; Thu, 26 Jan 2023 12:04:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pL0zr-00012J-PT; Thu, 26 Jan 2023 12:04:51 +0000
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
	bh=+OmUHSYHsNr/JUmhwbLgyGxpx+vgRMvixWpuyMpwIZc=; b=cEgoVMw3FD9FZMJ3vXUtvufm+d
	zmjY0KFukTvtd0nscOiIPhvuFb2wATulhHkO8FXhOTRCKBhmhrppwB7EKZ74OkjHnKpyJKOoSDxaw
	ureHwQe7LfMKOxYTAEnYsf8HK5skTkAlsNjvOZj+v/wG9D6Qcs26aDSC8ESNRKZSHX60=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176144-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176144: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d0ff1cae3a1ab20ffd5a1d80658c38c113585651
X-Osstest-Versions-That:
    ovmf=37d3eb026a766b2405daae47e02094c2ec248646
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Jan 2023 12:04:51 +0000

flight 176144 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176144/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d0ff1cae3a1ab20ffd5a1d80658c38c113585651
baseline version:
 ovmf                 37d3eb026a766b2405daae47e02094c2ec248646

Last test of basis   176059  2023-01-23 06:10:49 Z    3 days
Testing same since   176144  2023-01-26 09:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jake Garver <jake@nvidia.com>
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
   37d3eb026a..d0ff1cae3a  d0ff1cae3a1ab20ffd5a1d80658c38c113585651 -> xen-tested-master

