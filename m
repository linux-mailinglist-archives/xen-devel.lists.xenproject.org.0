Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267582684A7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 08:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHhmu-0003Bf-KE; Mon, 14 Sep 2020 06:16:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qj2e=CX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHhmt-0003Ay-56
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 06:16:27 +0000
X-Inumbo-ID: d8aa5215-d50a-4dac-95fb-2149930eb471
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8aa5215-d50a-4dac-95fb-2149930eb471;
 Mon, 14 Sep 2020 06:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=aoqOk+pLmN/ACy4d1EX4mbuyJZVEQNlogsgtdIAQ0kc=; b=EJ+VrWJUtJ5ZOkuooSQklENiq3
 7RZmUD48NHUM6oqa1dZ7Nd3NULq+lfW7XaFl1pUnVHX3MaRKBPIqQefKjw7wkhg9/VjCLunS8kEkt
 vlERUOsel1ScFISu3zjuNY0dfzH/Z6OROZ93OEiRj6BeeixH6J3NdyANnOrxU5NFfFyw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHhmS-0004H3-Fn; Mon, 14 Sep 2020 06:16:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHhmS-0002JR-7u; Mon, 14 Sep 2020 06:16:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHhmS-0007eI-7Q; Mon, 14 Sep 2020 06:16:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154313-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 154313: regressions - FAIL
X-Osstest-Failures: libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
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
X-Osstest-Versions-This: libvirt=d9ee51ef46b922db353ccb6cb6f559a559a6d186
X-Osstest-Versions-That: libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Sep 2020 06:16:00 +0000
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

flight 154313 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154313/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 151777
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 151777

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
 libvirt              d9ee51ef46b922db353ccb6cb6f559a559a6d186
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z   66 days
Failing since        151818  2020-07-11 04:18:52 Z   65 days   61 attempts
Testing same since   154313  2020-09-14 04:19:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andika Triwidada <andika@gmail.com>
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
  Fangge Jin <fjin@redhat.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
  Ian Wienand <iwienand@redhat.com>
  Jamie Strandboge <jamie@canonical.com>
  Jamie Strandboge <jamie@ubuntu.com>
  Jean-Baptiste Holcroft <jean-baptiste@holcroft.fr>
  Jianan Gao <jgao@redhat.com>
  Jim Fehlig <jfehlig@suse.com>
  Jin Yan <jinyan12@huawei.com>
  Jiri Denemark <jdenemar@redhat.com>
  Jonathon Jongsma <jjongsma@redhat.com>
  Ján Tomko <jtomko@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Locke <kevin@kevinlocke.name>
  Laine Stump <laine@redhat.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Lin Ma <lma@suse.de>
  Lin Ma <morecache@gmail.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Kletzander <mkletzan@redhat.com>
  Matt Coleman <matt@datto.com>
  Matt Coleman <mcoleman@datto.com>
  Michal Privoznik <mprivozn@redhat.com>
  Neal Gompa <ngompa13@gmail.com>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Patrick Magauran <patmagauran.j@gmail.com>
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
  Scott Shambarger <scott-libvirt@shambarger.net>
  Sebastian Mitterle <smitterl@redhat.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Stefan Bader <stefan.bader@canonical.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Szymon Scholz <szymonscholz@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tim Wiederhake <twiederh@redhat.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  Weblate <noreply@weblate.org>
  Yang Hang <yanghang44@huawei.com>
  Yanqiu Zhang <yanqzhan@redhat.com>
  Yi Li <yili@winhong.com>
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

(No revision log; it would be 14307 lines long.)

