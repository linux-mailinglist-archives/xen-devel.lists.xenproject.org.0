Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F3243C6C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 17:25:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6F5o-0003Aw-5X; Thu, 13 Aug 2020 15:24:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrUg=BX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k6F5m-0003AW-Q5
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 15:24:34 +0000
X-Inumbo-ID: 0b133290-1c37-47ae-93ce-948a0b49eb4c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b133290-1c37-47ae-93ce-948a0b49eb4c;
 Thu, 13 Aug 2020 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=FxJ4s9K3+gQij8lbwWhNn/rCzuXwXmC/TqDv94wuwd4=; b=Z5m3G6O+NSrsEAnflTOs8u9uLm
 C+u7ggqFLW5UA9tpkalyqogJiUm+NHs/cHvJN+QSkd2c5cTuLGgQnRgkzk3M0cblxFn1ajvoTZm+V
 h8ygkW5Qt7GpM0Nt5d0+f9O8Vkcf2V9DJWKCJ7JIi5A+rblkzrXOqq7VjRDVZvpPz0sA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6F5e-0004Do-TA; Thu, 13 Aug 2020 15:24:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6F5e-0000rn-KT; Thu, 13 Aug 2020 15:24:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k6F5e-0002mf-Ju; Thu, 13 Aug 2020 15:24:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152585-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 152585: regressions - FAIL
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=a6886aafacaf25d1ce667ae961264ae1eb69900f
X-Osstest-Versions-That: libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Aug 2020 15:24:26 +0000
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

flight 152585 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152585/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 151777
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 151777

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              a6886aafacaf25d1ce667ae961264ae1eb69900f
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z   34 days
Failing since        151818  2020-07-11 04:18:52 Z   33 days   34 attempts
Testing same since   152585  2020-08-13 04:21:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Balázs Meskó <meskobalazs@mailbox.org>
  Bastien Orivel <bastien.orivel@diateam.net>
  Bihong Yu <yubihong@huawei.com>
  Binfeng Wu <wubinfeng@huawei.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Côme Borsoi <fedora@borsoi.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Erik Skultety <eskultet@redhat.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
  Jamie Strandboge <jamie@canonical.com>
  Jamie Strandboge <jamie@ubuntu.com>
  Jean-Baptiste Holcroft <jean-baptiste@holcroft.fr>
  Jianan Gao <jgao@redhat.com>
  Jin Yan <jinyan12@huawei.com>
  Jiri Denemark <jdenemar@redhat.com>
  Ján Tomko <jtomko@redhat.com>
  Laine Stump <laine@redhat.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Martin Kletzander <mkletzan@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Paulo de Rezende Pinatti <ppinatti@linux.ibm.com>
  Pavel Hrdina <phrdina@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Pino Toscano <ptoscano@redhat.com>
  Pino Toscano <toscano.pino@tiscali.it>
  Piotr Drąg <piotrdrag@gmail.com>
  Prathamesh Chavan <pc44800@gmail.com>
  Roman Bogorodskiy <bogorodskiy@gmail.com>
  Ryan Schmidt <git@ryandesign.com>
  Sam Hartman <hartmans@debian.org>
  Stefan Bader <stefan.bader@canonical.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Szymon Scholz <szymonscholz@gmail.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  Weblate <noreply@weblate.org>
  Yang Hang <yanghang44@huawei.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zheng Chuan <zhengchuan@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 


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

(No revision log; it would be 9343 lines long.)

