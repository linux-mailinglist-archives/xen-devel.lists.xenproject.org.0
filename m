Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A571F815B
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 08:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjzyq-0007R6-IF; Sat, 13 Jun 2020 06:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdXd=72=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jjzyo-0007Qv-VW
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 06:49:27 +0000
X-Inumbo-ID: 05cd86f2-ad42-11ea-b63e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05cd86f2-ad42-11ea-b63e-12813bfff9fa;
 Sat, 13 Jun 2020 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AeieTgTfJ7gQ/5+813NS3B77h5MTPX6xmERjrHva2iA=; b=6MBnivZAkuSF67Mm+V/vKCpHQ
 LwbXMsLm8br1uPiyjc466T345sxSNro6fIyjW9AcsHksgJXIc7+ytrRn3RXyYY4oUTSI8adJmwpU5
 kDV2YGjTC3YfEI9SzxlozYyQ7vZeWyG0zvuQSlbyWmaJnwXLI9xEwIJ+VDnpb2WbQb4X8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjzyn-0007ed-Lo; Sat, 13 Jun 2020 06:49:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjzyn-0001Ud-Ez; Sat, 13 Jun 2020 06:49:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jjzyn-0002r9-EJ; Sat, 13 Jun 2020 06:49:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151054-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151054: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985
X-Osstest-Versions-That: ovmf=dafce295e6f447ed8905db4e29241e2c6c2a4389
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Jun 2020 06:49:25 +0000
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

flight 151054 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151054/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985
baseline version:
 ovmf                 dafce295e6f447ed8905db4e29241e2c6c2a4389

Last test of basis   150978  2020-06-09 21:39:29 Z    3 days
Failing since        151024  2020-06-10 19:57:12 Z    2 days    2 attempts
Testing same since   151054  2020-06-11 23:04:05 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdul@marvell.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Dong, Eric <eric.dong@intel.com>
  Eric Dong <eric.dong@intel.com>
  Heyi Guo <guoheyi@linux.alibaba.com>
  Laszlo Ersek <lersek@redhat.com>
  Liming Gao <liming.gao@intel.com>
  Walon Li <walon.li@hpe.com>

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
   dafce295e6..3ee4f6cb36  3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 -> xen-tested-master

