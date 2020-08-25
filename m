Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51C2510D8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 06:47:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAQr8-000527-Mr; Tue, 25 Aug 2020 04:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWsn=CD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAQr8-00051m-21
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 04:46:46 +0000
X-Inumbo-ID: f75b3d83-c45f-4776-be22-a39b1366a9a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f75b3d83-c45f-4776-be22-a39b1366a9a0;
 Tue, 25 Aug 2020 04:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=mBNwhLidRamN+Lp9NeMc1LlMrwtdYd+5oj6rERNNFw8=; b=r/be92B0sV8J0pIqSDXI1YMZtU
 yOYKUb8HJ6NkSwfm+VMIzBmbe6Iuoil2cb/jPbe8sL4u6pNxTMziRJOnB+SIJ4FwzMJnLAE4R9nmJ
 RmL383xC9HOQ1nWJ298Qg+uktXEiW9RW8MmKCPU4DxANOMRkRywGXOArVax0M19LAsYU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAQr0-0003Z7-VN; Tue, 25 Aug 2020 04:46:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAQr0-0005Zs-NC; Tue, 25 Aug 2020 04:46:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAQr0-0007zV-Mh; Tue, 25 Aug 2020 04:46:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152769-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152769: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ad40eb4e6c9d5576cca24bc934441f5bb0231c04
X-Osstest-Versions-That: ovmf=4535fc312b76cb5b05b6a8064c1c64d9780f55ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Aug 2020 04:46:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152769 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152769/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ad40eb4e6c9d5576cca24bc934441f5bb0231c04
baseline version:
 ovmf                 4535fc312b76cb5b05b6a8064c1c64d9780f55ba

Last test of basis   152743  2020-08-24 16:09:39 Z    0 days
Testing same since   152769  2020-08-24 18:40:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   4535fc312b..ad40eb4e6c  ad40eb4e6c9d5576cca24bc934441f5bb0231c04 -> xen-tested-master

