Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D525E69F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 10:54:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kETwh-0004ps-Fv; Sat, 05 Sep 2020 08:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5tp=CO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kETwg-0004pY-Bz
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 08:53:14 +0000
X-Inumbo-ID: 2b8a18db-2f9c-4730-975b-7adccd01c915
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8a18db-2f9c-4730-975b-7adccd01c915;
 Sat, 05 Sep 2020 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=PhmHJBF6maPZp7gzqIkmysOzUOpKCXY5blzgsUX6pHk=; b=NeZkwpO/xrXn5P3cD6if9qCVdk
 06dqIofiY4FD26gRtQAXRwPsbEEBgYGJT96syzaAXy/kasy8TOuWVx6MJrM3xQ7eEwejzXF5XqDK9
 BDQEqEk6STsDcyag2xATlttcntXpD0qf2yiXAinq/yM4ZPU37HTPj7f5LSpnQ8gucjyM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kETwV-0003XO-8f; Sat, 05 Sep 2020 08:53:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kETwU-00021g-W8; Sat, 05 Sep 2020 08:53:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kETwU-0006rD-Va; Sat, 05 Sep 2020 08:53:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153742-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 153742: trouble: blocked/broken
X-Osstest-Failures: libvirt:build-amd64:<job status>:broken:regression
 libvirt:build-amd64-pvops:<job status>:broken:regression
 libvirt:build-amd64-xsm:<job status>:broken:regression
 libvirt:build-arm64:<job status>:broken:regression
 libvirt:build-arm64-pvops:<job status>:broken:regression
 libvirt:build-arm64-xsm:<job status>:broken:regression
 libvirt:build-armhf:<job status>:broken:regression
 libvirt:build-armhf-pvops:<job status>:broken:regression
 libvirt:build-i386:<job status>:broken:regression
 libvirt:build-i386-pvops:<job status>:broken:regression
 libvirt:build-i386-xsm:<job status>:broken:regression
 libvirt:build-amd64:hosts-allocate:broken:regression
 libvirt:build-amd64-pvops:hosts-allocate:broken:regression
 libvirt:build-arm64:hosts-allocate:broken:regression
 libvirt:build-arm64-pvops:hosts-allocate:broken:regression
 libvirt:build-i386:hosts-allocate:broken:regression
 libvirt:build-i386-pvops:hosts-allocate:broken:regression
 libvirt:build-amd64-xsm:hosts-allocate:broken:regression
 libvirt:build-arm64-xsm:hosts-allocate:broken:regression
 libvirt:build-armhf:hosts-allocate:broken:regression
 libvirt:build-armhf-pvops:hosts-allocate:broken:regression
 libvirt:build-i386-xsm:hosts-allocate:broken:regression
 libvirt:build-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:build-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:build-i386-libvirt:build-check(1):blocked:nonblocking
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
X-Osstest-Versions-This: libvirt=ee6c936fbbfb217175326f0201d59cc6727a0678
X-Osstest-Versions-That: libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Sep 2020 08:53:02 +0000
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

flight 153742 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153742/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64                   2 hosts-allocate         broken REGR. vs. 151777
 build-amd64-pvops             2 hosts-allocate         broken REGR. vs. 151777
 build-arm64                   2 hosts-allocate         broken REGR. vs. 151777
 build-arm64-pvops             2 hosts-allocate         broken REGR. vs. 151777
 build-i386                    2 hosts-allocate         broken REGR. vs. 151777
 build-i386-pvops              2 hosts-allocate         broken REGR. vs. 151777
 build-amd64-xsm               2 hosts-allocate         broken REGR. vs. 151777
 build-arm64-xsm               2 hosts-allocate         broken REGR. vs. 151777
 build-armhf                   2 hosts-allocate         broken REGR. vs. 151777
 build-armhf-pvops             2 hosts-allocate         broken REGR. vs. 151777
 build-i386-xsm                2 hosts-allocate         broken REGR. vs. 151777

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
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
 libvirt              ee6c936fbbfb217175326f0201d59cc6727a0678
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z   57 days
Failing since        151818  2020-07-11 04:18:52 Z   56 days   52 attempts
Testing same since   153742  2020-09-05 04:19:05 Z    0 days    1 attempts

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
  Fangge Jin <fjin@redhat.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
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
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Kletzander <mkletzan@redhat.com>
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
  Yi Wang <wang.yi59@zte.com.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zheng Chuan <zhengchuan@huawei.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-amd64 hosts-allocate
broken-step build-amd64-pvops hosts-allocate
broken-step build-arm64 hosts-allocate
broken-step build-arm64-pvops hosts-allocate
broken-step build-i386 hosts-allocate
broken-step build-i386-pvops hosts-allocate
broken-step build-amd64-xsm hosts-allocate
broken-step build-arm64-xsm hosts-allocate
broken-step build-armhf hosts-allocate
broken-step build-armhf-pvops hosts-allocate
broken-step build-i386-xsm hosts-allocate

Not pushing.

(No revision log; it would be 12662 lines long.)

