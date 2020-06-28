Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F920C90A
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jun 2020 18:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpaS5-0000mS-Oy; Sun, 28 Jun 2020 16:46:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqO6=AJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jpaS3-0000m8-W2
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2020 16:46:44 +0000
X-Inumbo-ID: ef51d9b8-b95e-11ea-84ab-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef51d9b8-b95e-11ea-84ab-12813bfff9fa;
 Sun, 28 Jun 2020 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OVPtR+KiljdjTwl0aqpC8UNnr8b+rTGK7F8v9eEc+XU=; b=ry4ZpztT/p4apP7SIrPRW/T8V
 HGlHDbbRldZGdUksBoZcrCno+W12DKQj01SwAVzm2CgrJou58OZ10JW0GOEY7tGNiffAgzOMyrHOP
 1AMbWTXAMLRcLCMVcMt9alnTq10jbzn8OT8vDLB7tw5qhWG0f/AqLgC02J6rYvJ1VONq0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpaRx-0002Ii-LD; Sun, 28 Jun 2020 16:46:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpaRx-0001iS-6n; Sun, 28 Jun 2020 16:46:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jpaRx-0003No-6D; Sun, 28 Jun 2020 16:46:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151417-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 151417: tolerable all pass - PUSHED
X-Osstest-Failures: libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=d482cf6bef484e697f1dbb99f2504e7d67b149e7
X-Osstest-Versions-That: libvirt=f6f745297d884453ef4ed65643d267069f778517
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jun 2020 16:46:37 +0000
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

flight 151417 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151417/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151396
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151396
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              d482cf6bef484e697f1dbb99f2504e7d67b149e7
baseline version:
 libvirt              f6f745297d884453ef4ed65643d267069f778517

Last test of basis   151396  2020-06-27 04:19:57 Z    1 days
Testing same since   151417  2020-06-28 04:19:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel Henrique Barboza <danielhb413@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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

To xenbits.xen.org:/home/xen/git/libvirt.git
   f6f745297d..d482cf6bef  d482cf6bef484e697f1dbb99f2504e7d67b149e7 -> xen-tested-master

