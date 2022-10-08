Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F65F84D2
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 12:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418474.663292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh7QO-0002W1-Mz; Sat, 08 Oct 2022 10:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418474.663292; Sat, 08 Oct 2022 10:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh7QO-0002U1-JR; Sat, 08 Oct 2022 10:51:20 +0000
Received: by outflank-mailman (input) for mailman id 418474;
 Sat, 08 Oct 2022 10:51:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh7QN-0002Tr-1s; Sat, 08 Oct 2022 10:51:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh7QM-0006jm-U0; Sat, 08 Oct 2022 10:51:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh7QM-0004kA-Iq; Sat, 08 Oct 2022 10:51:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oh7QM-00075J-IS; Sat, 08 Oct 2022 10:51:18 +0000
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
	bh=iMWsdncL3/F6vZQzu0OAd43E0rRhrwsvf991i0X3wQg=; b=oKcewxupota+lDduSd7cFRLVd7
	XcHf0i/X7TfG2NS2im5gxom7gITATJQHap8S5q+XG7UqrJSRLaz+XvGtwcB6qckGnsiF76ErPe6QZ
	BITKdbAEYt2pxn9jlLrsq8dFEcmk0kZMyr2aY4DXeDT3Jkl2VbBMyAENgECT5WSVKFGQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173471-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173471: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4364d661685d4806b8fb66ff76eaece7ea6a4426
X-Osstest-Versions-That:
    ovmf=a670f12a741a9511d9cedc7257d3693567f8fc43
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Oct 2022 10:51:18 +0000

flight 173471 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173471/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4364d661685d4806b8fb66ff76eaece7ea6a4426
baseline version:
 ovmf                 a670f12a741a9511d9cedc7257d3693567f8fc43

Last test of basis   173469  2022-10-08 06:11:54 Z    0 days
Testing same since   173471  2022-10-08 08:41:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhihao Li <zhihao.li@intel.com>

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
   a670f12a74..4364d66168  4364d661685d4806b8fb66ff76eaece7ea6a4426 -> xen-tested-master

