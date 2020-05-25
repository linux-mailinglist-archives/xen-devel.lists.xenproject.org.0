Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C71E0649
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 07:04:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd5GG-0000iS-0m; Mon, 25 May 2020 05:02:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KePG=7H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jd5GF-0000iN-1i
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 05:02:51 +0000
X-Inumbo-ID: fa6a1520-9e44-11ea-ae88-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa6a1520-9e44-11ea-ae88-12813bfff9fa;
 Mon, 25 May 2020 05:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zs9GZwf0ncnGqn1NG4B3deSE1OxXDnOEKj+d6G8V3DA=; b=vXNbKLsdp2AY9o/K76sp2TgZJ
 0g05iL+Tb4qTB2g4dN0wesewJPtDasdXqsUIOIkRuHzOfaQLxKEhYl0O3eUM14o5q6oyMalsAQHHg
 AmBuMqBAqiyFVEwmjO+4Nr0JPL+9lo4LfyIlYzXYZiBS6zau36XGz/4UaKECKYTCwPMOs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jd5GC-0000eM-4r; Mon, 25 May 2020 05:02:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jd5GB-0000cZ-Ij; Mon, 25 May 2020 05:02:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jd5GB-0000D3-I4; Mon, 25 May 2020 05:02:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150357-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 150357: regressions - trouble:
 blocked/fail/pass/starved
X-Osstest-Failures: seabios:build-amd64-xsm:xen-build:fail:regression
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: seabios=d9aea4a7cd59e00f5ed96b6442806dde0959e1ca
X-Osstest-Versions-That: seabios=7e9db04923854b7f4edca33948f55abee22907b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 May 2020 05:02:47 +0000
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

flight 150357 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150357/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 150308

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150308
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150308
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150308
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64  2 hosts-allocate              starved n/a

version targeted for testing:
 seabios              d9aea4a7cd59e00f5ed96b6442806dde0959e1ca
baseline version:
 seabios              7e9db04923854b7f4edca33948f55abee22907b9

Last test of basis   150308  2020-05-21 18:10:18 Z    3 days
Testing same since   150357  2020-05-25 02:10:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kevin O'Connor <kevin@koconnor.net>
  Matt DeVillier <matt.devillier@gmail.com>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    


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


Not pushing.

------------------------------------------------------------
commit d9aea4a7cd59e00f5ed96b6442806dde0959e1ca
Author: Kevin O'Connor <kevin@koconnor.net>
Date:   Sun May 24 21:57:19 2020 -0400

    boot: Fixup check for only one item in boot list
    
    Signed-off-by: Kevin O'Connor <kevin@koconnor.net>

commit 926fd4e05e667e7835073ee7c8612c11e23dc57f
Author: Matt DeVillier <matt.devillier@gmail.com>
Date:   Sun May 24 17:45:34 2020 -0500

    boot: Fix logic for boot menu display
    
    Commit c61193d3 [boot: Extend `etc/show-boot-menu`...] changed the
    logic surrounding the use of show_boot_menu incorrectly, leading the
    boot menu to be skipped by default with no way to override. Correct
    the logic error so that show_boot_menu works as documented.
    
    Test: build/boot SeaBIOS, verify boot menu option shown by default.
    
    Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>

