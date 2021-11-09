Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124F44B194
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 17:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224074.387131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkUNm-0000qv-9n; Tue, 09 Nov 2021 16:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224074.387131; Tue, 09 Nov 2021 16:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkUNm-0000nv-6D; Tue, 09 Nov 2021 16:54:02 +0000
Received: by outflank-mailman (input) for mailman id 224074;
 Tue, 09 Nov 2021 16:54:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkUNk-0000ni-Hp; Tue, 09 Nov 2021 16:54:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkUNk-0003YU-Bu; Tue, 09 Nov 2021 16:54:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mkUNk-0004kz-2l; Tue, 09 Nov 2021 16:54:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mkUNk-00031c-2H; Tue, 09 Nov 2021 16:54:00 +0000
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
	bh=g4Kr+ATsss26DapBKDcebEOOtXouHqaNoR5g+5MByAA=; b=PLtsBkNQHJfXSCc8d2qFnDYJBp
	qlnUxzMTPa1ktEzrrmtZvJGObHxTBxSO3c+W+ZVviMiCHxgKk6+qI34t7+/4wbDEGXs+OWh+GruAu
	r8LV4DDJROEJEtzJICiVzWgkNZUjA4XpGaXJPylBOi4KT9KtdTldSt1sw0m8K3D/wGqE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166097-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166097: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c974257821208fc6191779d1ddea918499f165b8
X-Osstest-Versions-That:
    ovmf=d6e6337cd6ee0b7f06578693ea0cef8e428b93f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Nov 2021 16:54:00 +0000

flight 166097 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166097/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c974257821208fc6191779d1ddea918499f165b8
baseline version:
 ovmf                 d6e6337cd6ee0b7f06578693ea0cef8e428b93f9

Last test of basis   166093  2021-11-09 06:21:29 Z    0 days
Testing same since   166097  2021-11-09 11:40:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   d6e6337cd6..c974257821  c974257821208fc6191779d1ddea918499f165b8 -> xen-tested-master

