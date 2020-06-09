Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B181F398C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicKx-0005CK-7X; Tue, 09 Jun 2020 11:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKNw=7W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jicKv-0005Bu-DQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:22:33 +0000
X-Inumbo-ID: 7fbee3fe-aa43-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fbee3fe-aa43-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5ZhW7+bte0y7uuzhMDJ4QymV22Bst8n+dodwxtl8fk=; b=XDyxdt/9UZrFBQ75no/5d9h8S
 m0JQPGkw/3og8M4t6dX5ea9/TcfMrK2dWdcJSCUxunWBRL+UU0MAhONvcfbOhEpWulZUXP42XRvXT
 vWzLNsdD0PRmmoZO25dEId6yhySysOObPpKuwxpZ96p8V+IegVALHHJRjDB64VpIlY7G0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jicKo-000502-OD; Tue, 09 Jun 2020 11:22:26 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jicKo-0004cg-DT; Tue, 09 Jun 2020 11:22:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jicKo-00043Y-Cy; Tue, 09 Jun 2020 11:22:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150932-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 150932: tolerable all pass - PUSHED
X-Osstest-Failures: libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
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
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=2f82fe467f7a67d11500a566054b403e9d6d0a9c
X-Osstest-Versions-That: libvirt=a1cd25b919509be2645dbe6f952d5263e0d4e4e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jun 2020 11:22:26 +0000
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

flight 150932 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150932/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 146182
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 146182
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
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              2f82fe467f7a67d11500a566054b403e9d6d0a9c
baseline version:
 libvirt              a1cd25b919509be2645dbe6f952d5263e0d4e4e5

Last test of basis   146182  2020-01-17 06:00:23 Z  144 days
Failing since        146211  2020-01-18 04:18:52 Z  143 days  134 attempts
Testing same since   150932  2020-06-09 04:20:38 Z    0 days    1 attempts

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
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Gaurav Agrawal <agrawalgaurav@gnome.org>
  Han Han <hhan@redhat.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jaak Ristioja <jaak@ristioja.ee>
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
  Weblate <noreply@weblate.org>
  Wu Qingliang <wuqingliang4@huawei.com>
  Xu Yandong <xuyandong2@huawei.com>
  Yan Wang <wangyan122@huawei.com>
  Yi Li <yili@winhong.com>
  Your Name <you@example.com>
  Yuri Chornoivan <yurchor@ukr.net>
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
   a1cd25b919..2f82fe467f  2f82fe467f7a67d11500a566054b403e9d6d0a9c -> xen-tested-master

