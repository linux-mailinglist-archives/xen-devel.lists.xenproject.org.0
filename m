Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AFF655322
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 18:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468977.728203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8lcH-0000Hz-D7; Fri, 23 Dec 2022 17:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468977.728203; Fri, 23 Dec 2022 17:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8lcH-0000FM-AU; Fri, 23 Dec 2022 17:13:53 +0000
Received: by outflank-mailman (input) for mailman id 468977;
 Fri, 23 Dec 2022 17:13:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8lcF-0000FC-Gh; Fri, 23 Dec 2022 17:13:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8lcF-0002xn-Dn; Fri, 23 Dec 2022 17:13:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8lcE-0007hk-SM; Fri, 23 Dec 2022 17:13:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8lcE-00043t-Rv; Fri, 23 Dec 2022 17:13:50 +0000
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
	bh=fSyD7l+xqbRtABIKtMMZvhD7JJHH2b5PEmqkiaQzuGc=; b=pdjJvvW1q55SbB0FR90yrPRwLw
	AVGkzxnNqxxP7zBCX251ADEHycp3Hrqcd0Puq0HFV91ohCUNdLkWeeQOhmttpRFA1vQMc7nBo8SvC
	xO0mwr4phhXsdTll1MdRrA07oUFTF6LeUfSUam1joHRmYA+o2NasP91DNhihKDh6qLMM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175467-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175467: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a086f4a63bc0295b0b02f8ee76381c6b437122bf
X-Osstest-Versions-That:
    ovmf=bf65d7ee8842a93116534f727abcad235dd3e233
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Dec 2022 17:13:50 +0000

flight 175467 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175467/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a086f4a63bc0295b0b02f8ee76381c6b437122bf
baseline version:
 ovmf                 bf65d7ee8842a93116534f727abcad235dd3e233

Last test of basis   175465  2022-12-23 12:10:49 Z    0 days
Testing same since   175467  2022-12-23 15:12:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Michael Brown <mcb30@ipxe.org>

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
   bf65d7ee88..a086f4a63b  a086f4a63bc0295b0b02f8ee76381c6b437122bf -> xen-tested-master

