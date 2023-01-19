Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F6673CBD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481183.745917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWCg-0003eP-Np; Thu, 19 Jan 2023 14:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481183.745917; Thu, 19 Jan 2023 14:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWCg-0003by-Ji; Thu, 19 Jan 2023 14:47:46 +0000
Received: by outflank-mailman (input) for mailman id 481183;
 Thu, 19 Jan 2023 14:47:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIWCf-0003bV-B9; Thu, 19 Jan 2023 14:47:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIWCf-00051D-4d; Thu, 19 Jan 2023 14:47:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIWCe-0005IU-8Z; Thu, 19 Jan 2023 14:47:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIWCe-0005kY-88; Thu, 19 Jan 2023 14:47:44 +0000
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
	bh=yTXd0x/3pCNgyrB6Dk5Cu8WKs7raObg6u/PRco+hAyY=; b=hbvigvASyCGOmnDkGpb9bLRI50
	kBpAj9kPmtxrsra7vgHJuqlomJdtdl5nkxQWJ3uejDXF7IWr6Zl55P/Q1vITeDnVps+430EJxvlHi
	yDJImZafbswO2iDdPTNFtaN/xCtgDko+OHyZzg3zSRdUBOKejb4v6gfO0pMbWVwjMb6s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175981-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175981: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=51411435d559c55eaf38c02baf5d76da78bb658d
X-Osstest-Versions-That:
    ovmf=18df11da8c14e48b6e4a90fb0b5befb1c243070a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Jan 2023 14:47:44 +0000

flight 175981 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175981/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 51411435d559c55eaf38c02baf5d76da78bb658d
baseline version:
 ovmf                 18df11da8c14e48b6e4a90fb0b5befb1c243070a

Last test of basis   175971  2023-01-19 05:11:58 Z    0 days
Testing same since   175981  2023-01-19 12:43:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   18df11da8c..51411435d5  51411435d559c55eaf38c02baf5d76da78bb658d -> xen-tested-master

