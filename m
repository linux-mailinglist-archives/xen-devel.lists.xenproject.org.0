Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4FD21951D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 02:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtKQQ-0004N6-Kg; Thu, 09 Jul 2020 00:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKwJ=AU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jtKQO-0004N1-HJ
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 00:28:28 +0000
X-Inumbo-ID: 1b65731a-c17b-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b65731a-c17b-11ea-b7bb-bc764e2007e4;
 Thu, 09 Jul 2020 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fkBDi18tr5bh4YvlL/8oU0UtJ3Hr3LRBgsQeQJJhT6w=; b=Se9iBf//yu9w6aHfze1FXG/Fg
 v2BcFZLv8k+MNcqOe44gSh7cnSJIZjeCS3gLpqWr7QKTR9m9gCPa5XHA6wox8g7ENwGsGAxoXnrlG
 ibdCsyU1HtEQ3W795GPm0AXrREtPJeL+x9pld40KiEkufintxqtYNtKIwYsG/RbZdlXHA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtKQM-0006mY-Lf; Thu, 09 Jul 2020 00:28:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtKQM-0004CG-Ay; Thu, 09 Jul 2020 00:28:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jtKQM-0003kJ-AJ; Thu, 09 Jul 2020 00:28:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151729-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 151729: regressions - FAIL
X-Osstest-Failures: libvirt:test-amd64-amd64-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=26daf37623395c18e07bc86f58363f40e8f4235b
X-Osstest-Versions-That: libvirt=e7998ebeaf15e4e8825be0dd97aa1316f194f00d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Jul 2020 00:28:26 +0000
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

flight 151729 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151729/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496
 test-amd64-i386-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151496
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151496
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              26daf37623395c18e07bc86f58363f40e8f4235b
baseline version:
 libvirt              e7998ebeaf15e4e8825be0dd97aa1316f194f00d

Last test of basis   151496  2020-07-01 04:23:43 Z    7 days
Failing since        151527  2020-07-02 04:29:15 Z    6 days    7 attempts
Testing same since   151729  2020-07-08 04:20:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniel Veillard <veillard@redhat.com>
  Laine Stump <laine@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Yanqiu Zhang <yanqzhan@redhat.com>

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
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
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


Not pushing.

(No revision log; it would be 554 lines long.)

