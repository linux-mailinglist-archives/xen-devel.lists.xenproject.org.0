Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1991251861
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXqm-0007M2-11; Tue, 25 Aug 2020 12:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWsn=CD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAXqk-0007Lw-Pw
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:14:50 +0000
X-Inumbo-ID: abc11ca9-253c-40d1-814b-42ff3a5550e2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abc11ca9-253c-40d1-814b-42ff3a5550e2;
 Tue, 25 Aug 2020 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=oHxBKeBIPkA0SQralQrO4A7uORBgrGVUc4jjL4PAANs=; b=KMt0MVf069g/BchzaWwaqWMT2w
 K2yvGtcjFhflXi13EsNuOKLRhzHSnf6g0u7Gmd5seCnH506RxqSioSzwHD6ZkZSLx/T8uWJDEOFUo
 FEbDbTXnMmZfTeAC37NRJfCVm9My6CXcVvn7dXA2A9IGJmd9LarlsI7jGQ4k4qrP2Jms=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAXqj-0005Wf-AH; Tue, 25 Aug 2020 12:14:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAXqj-00009c-3Q; Tue, 25 Aug 2020 12:14:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAXqj-0001xK-2z; Tue, 25 Aug 2020 12:14:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152786: all pass - PUSHED
X-Osstest-Versions-This: ovmf=78ab44cb96808bd3ff0edf312599f94a6a92172a
X-Osstest-Versions-That: ovmf=ad40eb4e6c9d5576cca24bc934441f5bb0231c04
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Aug 2020 12:14:49 +0000
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

flight 152786 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 78ab44cb96808bd3ff0edf312599f94a6a92172a
baseline version:
 ovmf                 ad40eb4e6c9d5576cca24bc934441f5bb0231c04

Last test of basis   152769  2020-08-24 18:40:36 Z    0 days
Testing same since   152786  2020-08-25 04:47:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Liming Gao <gaoliming@byosoft.com.cn>
  Liming Gao <liming.gao@intel.com>
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
   ad40eb4e6c..78ab44cb96  78ab44cb96808bd3ff0edf312599f94a6a92172a -> xen-tested-master

