Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BE2445DF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 09:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6UFI-0008Vm-HW; Fri, 14 Aug 2020 07:35:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c45b=BY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k6UFG-0008VS-W1
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 07:35:23 +0000
X-Inumbo-ID: 8f63891d-2456-4321-bdfb-3316f44cfb5e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f63891d-2456-4321-bdfb-3316f44cfb5e;
 Fri, 14 Aug 2020 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=hHgvMR3aSspvgkZuNKYmnR37tV4UUAEuVDCJtjbUSho=; b=klQdhc4kwC2ddQUNYvg1zxFM1n
 9N2h58wBtdNVwfWYPY3lzZE4QdqoKfw7PBcGo0LWAXYbhSbOZV79LiUNEOBCtaiOSVu1kIyAwmpBG
 9LU1xEwec/7RxzWoJIQHBMfLL8/AD9Bc8sTyqma0xjwe/jTmp/zZCpGfGA3Jq8sfYTw8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6UF9-0006AU-US; Fri, 14 Aug 2020 07:35:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6UF9-0002ZH-79; Fri, 14 Aug 2020 07:35:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k6UF9-00023Y-6X; Fri, 14 Aug 2020 07:35:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152594-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152594: all pass - PUSHED
X-Osstest-Versions-This: ovmf=7f7f511c5a74676523ed48435350f6e35282b62b
X-Osstest-Versions-That: ovmf=3633d5309f67550e2369776b37220674ad1b623c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Aug 2020 07:35:15 +0000
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

flight 152594 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152594/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f7f511c5a74676523ed48435350f6e35282b62b
baseline version:
 ovmf                 3633d5309f67550e2369776b37220674ad1b623c

Last test of basis   152587  2020-08-13 07:51:44 Z    0 days
Testing same since   152594  2020-08-14 03:13:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Cole Robinson <crobinso@redhat.com>
  Liming Gao <liming.gao@intel.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   3633d5309f..7f7f511c5a  7f7f511c5a74676523ed48435350f6e35282b62b -> xen-tested-master

