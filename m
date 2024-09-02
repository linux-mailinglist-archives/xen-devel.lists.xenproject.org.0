Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E641968E86
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 21:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788422.1197912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slCyl-0006L1-3Y; Mon, 02 Sep 2024 19:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788422.1197912; Mon, 02 Sep 2024 19:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slCyl-0006IP-0q; Mon, 02 Sep 2024 19:44:47 +0000
Received: by outflank-mailman (input) for mailman id 788422;
 Mon, 02 Sep 2024 19:44:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slCyj-0006IF-AL; Mon, 02 Sep 2024 19:44:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slCyi-00026B-Up; Mon, 02 Sep 2024 19:44:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slCyi-0008Lr-Ev; Mon, 02 Sep 2024 19:44:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slCyi-00040X-EN; Mon, 02 Sep 2024 19:44:44 +0000
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
	bh=Bp3J5AYlNLCotN9n+kOuRYWXsU8aX1clKi5Q6ZNNqbw=; b=sjszGiJa9ZHHCJHuiJ8nqD1sKz
	Lk5Qr/q8mLmBO1CEzB6W5lyl/PcI0Z8vRTcvEpf8tYraXtQ0r5aFxwCgMBKe6CVOdVtwa3NeDf2ez
	3VxhMQ2AlBrJtYifpsEkMvR8wyTN63cAzc0QU7z0JUC0zarhWjpFUJGKKFurO20dP0/8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187459-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187459: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eaf78e43f206f8587bdf6c0f78c0f021192d5859
X-Osstest-Versions-That:
    ovmf=96b90e150c2f107c64a827e82451b642a42df686
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2024 19:44:44 +0000

flight 187459 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187459/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eaf78e43f206f8587bdf6c0f78c0f021192d5859
baseline version:
 ovmf                 96b90e150c2f107c64a827e82451b642a42df686

Last test of basis   187436  2024-08-31 10:45:13 Z    2 days
Failing since        187440  2024-08-31 17:11:30 Z    2 days    5 attempts
Testing same since   187459  2024-09-02 17:41:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>
  Carsten Haitzler <carsten.haitzler@foss.arm.com>
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>
  Saloni Kasbekar <saloni.kasbekar@intel.com>
  Wei6 Xu <wei6.xu@intel.com>
  xieyuanh <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  zodf0055980 <zodf0055980@gmail.com>

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
   96b90e150c..eaf78e43f2  eaf78e43f206f8587bdf6c0f78c0f021192d5859 -> xen-tested-master

