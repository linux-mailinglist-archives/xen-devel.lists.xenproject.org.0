Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A42826FE6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 14:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663495.1033434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMpib-0007rR-EW; Mon, 08 Jan 2024 13:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663495.1033434; Mon, 08 Jan 2024 13:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMpib-0007pp-Ak; Mon, 08 Jan 2024 13:31:05 +0000
Received: by outflank-mailman (input) for mailman id 663495;
 Mon, 08 Jan 2024 13:31:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMpiZ-0007pe-Oh; Mon, 08 Jan 2024 13:31:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMpiZ-0005Uu-N1; Mon, 08 Jan 2024 13:31:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMpiZ-00055D-Bs; Mon, 08 Jan 2024 13:31:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rMpiZ-0000WM-BR; Mon, 08 Jan 2024 13:31:03 +0000
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
	bh=wyBBjkuiFQTGyYNwVGzfVwR9N1ZRgBi1mqN49D/i0iQ=; b=L7+IC9CWiyA7GTcrs/P+0L8z1K
	S8E7pWE+Bywf51S8VxNzBVDo2qN2pvSFQhc0DnJsSqyVimimTY97H41lWW1jV0zH25EVh5a1iUPTr
	gwYWSAWDAMkNOQnHkKgLTy52hcTsO38zxLtBPISShH2MH/QqlvDHKCxuklOeba5tPvIY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184276-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184276: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7152e6186d31bc138fbd2592e07886005177aab
X-Osstest-Versions-That:
    ovmf=c3d865a4c21d91f2e338a91d0c8b1eaf205575b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jan 2024 13:31:03 +0000

flight 184276 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184276/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7152e6186d31bc138fbd2592e07886005177aab
baseline version:
 ovmf                 c3d865a4c21d91f2e338a91d0c8b1eaf205575b5

Last test of basis   184273  2024-01-08 08:14:18 Z    0 days
Testing same since   184276  2024-01-08 10:43:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hou, Wenxing <wenxing.hou@intel.com>
  Wenxing Hou <wenxing.hou@intel.com>

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
   c3d865a4c2..e7152e6186  e7152e6186d31bc138fbd2592e07886005177aab -> xen-tested-master

