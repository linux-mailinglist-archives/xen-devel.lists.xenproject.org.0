Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6521E7DB3
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeZB-0005U3-7X; Fri, 29 May 2020 12:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8V9=7L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jeeZ9-0005Ty-Vc
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:56:52 +0000
X-Inumbo-ID: d97449ac-a1ab-11ea-a8ae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d97449ac-a1ab-11ea-a8ae-12813bfff9fa;
 Fri, 29 May 2020 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1mDn0ZmkMPxvV5UASxA4Ca+GOE7sk+YihisM92zqJcU=; b=ivzSTsUbCWyJj6F9nmkj292wW
 hJxDzDr6zbIPgkWgujZVe1+eywCNHHoEprLz6s0N4HQ9sEvaWYcvVFQv85Qqce32moLFv0PMUxwaH
 qMQem94bi0OR9wuHomLDikqTOme2YKPT8f4AWQezRxXrI0CG9K6cZqljJTqU38wWxIcB4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeeZ2-0004ao-FI; Fri, 29 May 2020 12:56:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeeZ2-0000WL-3v; Fri, 29 May 2020 12:56:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jeeZ2-0003Ne-3H; Fri, 29 May 2020 12:56:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150462-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 150462: regressions - FAIL
X-Osstest-Failures: libvirt:build-amd64-libvirt:libvirt-build:fail:regression
 libvirt:build-i386-libvirt:libvirt-build:fail:regression
 libvirt:build-arm64-libvirt:libvirt-build:fail:regression
 libvirt:build-armhf-libvirt:libvirt-build:fail:regression
 libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: libvirt=6f60d2a8503ce8c624bce6b53bf7b68476f5056f
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 May 2020 12:56:44 +0000
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

flight 150462 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150462/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 146182
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 146182
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 146182
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 146182

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              6f60d2a8503ce8c624bce6b53bf7b68476f5056f
baseline version:
 libvirt              a1cd25b919509be2645dbe6f952d5263e0d4e4e5

Last test of basis   146182  2020-01-17 06:00:23 Z  133 days
Failing since        146211  2020-01-18 04:18:52 Z  132 days  123 attempts
Testing same since   150462  2020-05-29 04:18:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Arnaud Patard <apatard@hupstream.com>
  Artur Puzio <contact@puzio.waw.pl>
  Bjoern Walk <bwalk@linux.ibm.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Chen Hanxiao <chen_han_xiao@126.com>
  Chris Jester-Young <cky@cky.nz>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Collin Walling <walling@linux.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniel Veillard <veillard@redhat.com>
  Dario Faggioli <dfaggioli@suse.com>
  Erik Skultety <eskultet@redhat.com>
  Gaurav Agrawal <agrawalgaurav@gnome.org>
  Han Han <hhan@redhat.com>
  Jamie Strandboge <jamie@canonical.com>
  Jim Fehlig <jfehlig@suse.com>
  Jiri Denemark <jdenemar@redhat.com>
  Jonathon Jongsma <jjongsma@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
  Ján Tomko <jtomko@redhat.com>
  Laine Stump <laine@redhat.com>
  Leonid Bloch <lb.workbox@gmail.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Lin Ma <LMa@suse.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mark Asselstine <mark.asselstine@windriver.com>
  Mauro S. M. Rodrigues <maurosr@linux.vnet.ibm.com>
  Michal Privoznik <mprivozn@redhat.com>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Hrdina <phrdina@redhat.com>
  Pavel Mores <pmores@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Philipp Hahn <hahn@univention.de>
  Pino Toscano <ptoscano@redhat.com>
  Prathamesh Chavan <pc44800@gmail.com>
  Rafael Fonseca <r4f4rfs@gmail.com>
  Richard W.M. Jones <rjones@redhat.com>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Ryan Moeller <ryan@iXsystems.com>
  Sahid Orentino Ferdjaoui <sahid.ferdjaoui@canonical.com>
  Sebastian Mitterle <smitterl@redhat.com>
  Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Wu Qingliang <wuqingliang4@huawei.com>
  Xu Yandong <xuyandong2@huawei.com>
  Yan Wang <wangyan122@huawei.com>
  Yi Li <yili@winhong.com>
  Your Name <you@example.com>
  Zhang Bo <oscar.zhangbo@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Zheng <zheng.zhenyu@outlook.com>
  Zhimin Feng <fengzhimin1@huawei.com>

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

(No revision log; it would be 19583 lines long.)

