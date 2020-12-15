Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75CC2DADBC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 14:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54047.93576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpA36-0002o2-Mw; Tue, 15 Dec 2020 13:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54047.93576; Tue, 15 Dec 2020 13:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpA36-0002nd-Jf; Tue, 15 Dec 2020 13:07:28 +0000
Received: by outflank-mailman (input) for mailman id 54047;
 Tue, 15 Dec 2020 13:07:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpA36-0002nV-39; Tue, 15 Dec 2020 13:07:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpA35-0006kg-VE; Tue, 15 Dec 2020 13:07:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpA35-0000mG-Ku; Tue, 15 Dec 2020 13:07:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kpA35-0008Oa-KQ; Tue, 15 Dec 2020 13:07:27 +0000
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
	bh=sHteU6LjM1FXOPVr9/wjsoqz8KT0wOIipWTcan40jVc=; b=jZteqDPW4p1t20z3lQkXir1p3O
	M9X7lO+V8pFoJgK9IwrwaPyCIMi+ppTQa6GFPo28lVCmc5tvYu6x1gE3WLmIF6A9Vj4mtlh83nwsh
	MeUblXeg9lkDJm06enwqDjhiqwRMC8Y8uHXCgBQOoX6aD5m/M4XAkUtE1V/IkcdfUIcc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157549-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157549: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=532f907b753ef99b47371629187d5f53ea3c83e2
X-Osstest-Versions-That:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Dec 2020 13:07:27 +0000

flight 157549 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157549/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345

version targeted for testing:
 ovmf                 532f907b753ef99b47371629187d5f53ea3c83e2
baseline version:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e

Last test of basis   157345  2020-12-09 12:40:46 Z    6 days
Failing since        157348  2020-12-09 15:39:39 Z    5 days   48 attempts
Testing same since   157549  2020-12-15 08:40:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Baraneedharan Anbazhagan <anbazhagan@hp.com>
  Baraneedharan Anbazhagan <anbazhgan@hp.com>
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Chen, Christine <Yuwei.Chen@intel.com>
  Fan Wang <fan.wang@intel.com>
  James Bottomley <jejb@linux.ibm.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Star Zeng <star.zeng@intel.com>
  Ting Ye <ting.ye@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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

(No revision log; it would be 641 lines long.)

