Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE067DCC7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 05:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485284.752389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLG4U-0006uW-ME; Fri, 27 Jan 2023 04:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485284.752389; Fri, 27 Jan 2023 04:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLG4U-0006sp-J7; Fri, 27 Jan 2023 04:10:38 +0000
Received: by outflank-mailman (input) for mailman id 485284;
 Fri, 27 Jan 2023 04:10:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLG4T-0006sf-0v; Fri, 27 Jan 2023 04:10:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLG4T-0007Rz-08; Fri, 27 Jan 2023 04:10:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLG4S-0000o8-Om; Fri, 27 Jan 2023 04:10:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLG4S-0004lv-OL; Fri, 27 Jan 2023 04:10:36 +0000
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
	bh=tojenUbH89imVLJ1Tfxy4zNhjtTPKFyyN11R1dIr28s=; b=RTkIPYUh25ScdNnsFKxcRDmri5
	1E1S2w8ZN/G25oIi5q5Hffdf/GSzrwa86Cv3by4TxgEJ2lSzFEaGQEHjLM1L323n6+k7ZgpQtWeWX
	UMsI+ntp9qLHkoTUbIy+OUWveiNz+pCNxwMyDqsIYsM9u7mWjonjIjoxr6qsqve+lYMU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176225-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176225: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4
X-Osstest-Versions-That:
    ovmf=d0ff1cae3a1ab20ffd5a1d80658c38c113585651
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 04:10:36 +0000

flight 176225 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176225/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4
baseline version:
 ovmf                 d0ff1cae3a1ab20ffd5a1d80658c38c113585651

Last test of basis   176144  2023-01-26 09:10:46 Z    0 days
Testing same since   176225  2023-01-26 22:14:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>

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
   d0ff1cae3a..ca573b8615  ca573b86157e7fcd34cd44e79ebd10e89d8b8cc4 -> xen-tested-master

