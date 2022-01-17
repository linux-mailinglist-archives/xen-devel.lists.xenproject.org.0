Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57E4911A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 23:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258289.444567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9aFb-0004Oh-S0; Mon, 17 Jan 2022 22:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258289.444567; Mon, 17 Jan 2022 22:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9aFb-0004Mb-OH; Mon, 17 Jan 2022 22:13:19 +0000
Received: by outflank-mailman (input) for mailman id 258289;
 Mon, 17 Jan 2022 22:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9aFa-0004MR-EA; Mon, 17 Jan 2022 22:13:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9aFa-0005my-6W; Mon, 17 Jan 2022 22:13:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9aFZ-0002XU-W1; Mon, 17 Jan 2022 22:13:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n9aFZ-0004QO-Va; Mon, 17 Jan 2022 22:13:17 +0000
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
	bh=7UM+TZr2JcU7ImTVcsgX/lRYiC1YlDO+ZEP9R2cz0Ag=; b=OJJFVwdU2CHU2W1Eoyb4eXI66m
	6A7F7u6idkZMWbM4J+OV/IixsywLxUnRAj9r9DmCH8DJL0LSO8zptA3buHWM2ETNUQM96wrjznyKC
	/IfU3bxaoOcT2rbeCfRafn2H+MmD37PxtcmUoIJmHFrCFkdR/0ImC0l9Or0mD6lqoIIo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167727-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167727: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=59c48c9314111e41550cac7875c5e9235809c3ef
X-Osstest-Versions-That:
    ovmf=5302bd81d9ba0c9e7f2371a81c438ec919ec8e1e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jan 2022 22:13:17 +0000

flight 167727 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167727/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 59c48c9314111e41550cac7875c5e9235809c3ef
baseline version:
 ovmf                 5302bd81d9ba0c9e7f2371a81c438ec919ec8e1e

Last test of basis   167689  2022-01-13 15:11:44 Z    4 days
Testing same since   167727  2022-01-17 18:40:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   5302bd81d9..59c48c9314  59c48c9314111e41550cac7875c5e9235809c3ef -> xen-tested-master

