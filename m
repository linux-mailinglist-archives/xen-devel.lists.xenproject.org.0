Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CFC898B1E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700944.1094814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsP0p-0004n4-8V; Thu, 04 Apr 2024 15:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700944.1094814; Thu, 04 Apr 2024 15:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsP0p-0004mR-53; Thu, 04 Apr 2024 15:28:23 +0000
Received: by outflank-mailman (input) for mailman id 700944;
 Thu, 04 Apr 2024 15:28:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsP0o-0004mH-5A; Thu, 04 Apr 2024 15:28:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsP0n-0000T4-UW; Thu, 04 Apr 2024 15:28:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsP0n-0005LP-LR; Thu, 04 Apr 2024 15:28:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rsP0n-0004Gr-Kv; Thu, 04 Apr 2024 15:28:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=AptFddzrO4xpaGd1XPmxh6k2flcDcc+3QfhBIhCz8CY=; b=IzvC/JDd4iApmZJqoYhuXxF7Ed
	dgwf/qrJzT62O5g23uTOZBRRzYZ6ji57CypU5dO1BfqHa8XpLcIuuipSFRIIqL5NclSHNqOZSt/6a
	KzD4/Ofr1IKLL8V1YQkDTY7DXaFnTKZb4EvnuaNeBzsCDEvMuWSiZxnkJpdN19EZ1vSk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185235-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 185235: tolerable all pass - PUSHED
X-Osstest-Failures:
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=e2a7dd3f7e9843b0c0753cf6b6d9792351f8c6e1
X-Osstest-Versions-That:
    libvirt=c8ca9d0118ec21dbff07147e0bbffcd19fb196b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Apr 2024 15:28:21 +0000

flight 185235 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185235/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184708
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              e2a7dd3f7e9843b0c0753cf6b6d9792351f8c6e1
baseline version:
 libvirt              c8ca9d0118ec21dbff07147e0bbffcd19fb196b7

Last test of basis   184708  2024-02-20 04:18:53 Z   44 days
Testing same since   185235  2024-04-04 04:18:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhiram Tilak <atp.exp@gmail.com>
  Adam Julis <ajulis@redhat.com>
  Andrea Bolognani <abologna@redhat.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Brett Holman <brett.holman@canonical.com>
  Cole Robinson <crobinso@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Denis V. Lunev <den@openvz.org>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Göran Uddeborg <goeran@uddeborg.se>
  Jiri Denemark <jdenemar@redhat.com>
  Jonathon Jongsma <jjongsma@redhat.com>
  Ján Tomko <jtomko@redhat.com>
  Karim Taha <kariem.taha2.7@gmail.com>
  Laine Stump <laine@redhat.com>
  Lennart Fricke <lennart.fricke@drehpunkt.com>
  Martin Kletzander <mkletzan@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Pavel Hrdina <phrdina@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Praveen K Paladugu <prapal@linux.microsoft.com>
  Praveen K Paladugu <praveenkpaladugu@gmail.com>
  Purna Pavan Chandra Aekkaladevi <paekkaladevi@linux.microsoft.com>
  ray <honglei.wang@smartx.com>
  Rayhan Faizel <rayhan.faizel@gmail.com>
  Tim Wiederhake <twiederh@redhat.com>
  Vincent Vanlaer <libvirt-e6954efa@volkihar.be>
  Weblate <noreply-mt-weblate@weblate.org>
  Weblate <noreply@weblate.org>
  Wei Gong <gongwei833x@gmail.com>
  Xianglai Li <lixianglai@loongson.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zheng Yan <yanzheng759@huawei.com>
  김인수 <simmon@nplob.com>

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
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    


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
   c8ca9d0118..e2a7dd3f7e  e2a7dd3f7e9843b0c0753cf6b6d9792351f8c6e1 -> xen-tested-master

