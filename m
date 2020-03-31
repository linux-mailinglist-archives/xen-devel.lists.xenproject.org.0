Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AB1999D8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJIuI-00053T-5r; Tue, 31 Mar 2020 15:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebgM=5Q=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJIuH-00053O-2A
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:34:25 +0000
X-Inumbo-ID: 16396f9a-7365-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16396f9a-7365-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKFio4PC6PJXL75ADTO4ITDtR5lR9pMLBSTbMhW3Nb4=; b=tKqoKUOhTOlJSZCorHexInK8C
 OFJTv3kbNrYnn3MsmfHSF6Vs23KX6OFQd9Icb31ZnrawxdUmQeOrN6YJNp3CJkVwi585Y2Sffcwgx
 KzWnClTjvQmm9Zp2OfU+Z4FF3Z6rfPEVSyqg5WOyhEx8t+Zk3I1R1/i8G/2FaXT5oIFlU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJIuA-0008T3-R7; Tue, 31 Mar 2020 15:34:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJIuA-00008a-G2; Tue, 31 Mar 2020 15:34:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJIuA-0006qm-FI; Tue, 31 Mar 2020 15:34:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149211-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 149211: tolerable FAIL - PUSHED
X-Osstest-Failures: seabios:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:heisenbug
 seabios:test-amd64-i386-qemuu-rhel6hvm-intel:guest-start/redhat.repeat:fail:heisenbug
 seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: seabios=6a3b59ab9c7dc00331c21346052dfa6a0df45aa3
X-Osstest-Versions-That: seabios=066a9956097b54530888b88ab9aa1ea02e42af5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Mar 2020 15:34:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149211 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149211/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail in 149173 pass in 149211
 test-amd64-i386-qemuu-rhel6hvm-intel 12 guest-start/redhat.repeat fail pass in 149173

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 148666
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 148666
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 148666
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop      fail starved in 148666

version targeted for testing:
 seabios              6a3b59ab9c7dc00331c21346052dfa6a0df45aa3
baseline version:
 seabios              066a9956097b54530888b88ab9aa1ea02e42af5a

Last test of basis   148666  2020-03-17 13:39:45 Z   14 days
Failing since        148690  2020-03-18 06:43:59 Z   13 days   16 attempts
Testing same since   149120  2020-03-28 03:28:10 Z    3 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Paul Menzel <pmenzel@molgen.mpg.de>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/seabios.git
   066a995..6a3b59a  6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 -> xen-tested-master

