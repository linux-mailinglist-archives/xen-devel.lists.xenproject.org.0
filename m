Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66686230996
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 14:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0OP7-00014D-Cj; Tue, 28 Jul 2020 12:08:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E6Nk=BH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0OP5-000148-9g
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 12:08:19 +0000
X-Inumbo-ID: 0546bfbc-d0cb-11ea-a8b6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0546bfbc-d0cb-11ea-a8b6-12813bfff9fa;
 Tue, 28 Jul 2020 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GykV/FJJCAbwWOJk4uwAGIo6lKI+SKaL3E2nrR5CLU=; b=KkutKignzh1EEWFGziafmnX2Q
 3scXDH28T6wpDP2284xNFSjlqlLCwJWSK9Rs8gHrsU4Lwzm7rUWffMv8VbMTa29ZulcE60nm4qeIb
 ZiPaWFdaCIckF9Xe1cdgvp2XkH2C+7+Sts6RqQOLRjool5Xv+kTmBUypfEStTK8deaHj0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0OP2-0007Jw-MH; Tue, 28 Jul 2020 12:08:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0OP2-0001za-Aq; Tue, 28 Jul 2020 12:08:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0OP2-0003hs-A5; Tue, 28 Jul 2020 12:08:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152249: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ffde22468e2f0e93b51f97b801e6c7a181088c61
X-Osstest-Versions-That: ovmf=a44f558a84c67cd88b8215d4c076123cf58438f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Jul 2020 12:08:16 +0000
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

flight 152249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ffde22468e2f0e93b51f97b801e6c7a181088c61
baseline version:
 ovmf                 a44f558a84c67cd88b8215d4c076123cf58438f4

Last test of basis   152244  2020-07-28 00:40:52 Z    0 days
Testing same since   152249  2020-07-28 07:04:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael Kubacki <michael.a.kubacki@intel.com>

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
   a44f558a84..ffde22468e  ffde22468e2f0e93b51f97b801e6c7a181088c61 -> xen-tested-master

