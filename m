Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440669406B7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 07:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767244.1177839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYf6G-0004OW-Ky; Tue, 30 Jul 2024 05:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767244.1177839; Tue, 30 Jul 2024 05:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYf6G-0004M9-HR; Tue, 30 Jul 2024 05:08:40 +0000
Received: by outflank-mailman (input) for mailman id 767244;
 Tue, 30 Jul 2024 05:08:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYf6E-0004Lx-Sk; Tue, 30 Jul 2024 05:08:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYf6E-0003fz-KE; Tue, 30 Jul 2024 05:08:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYf6E-00023J-39; Tue, 30 Jul 2024 05:08:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYf6E-00083h-2g; Tue, 30 Jul 2024 05:08:38 +0000
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
	bh=8T+03Q0qS/5+XGGbjs6EBcoWvzu7U/57vxoauaHQRJk=; b=W7hMxgMy7WaCnGTgxSIL8BQdsT
	5D9nX1Or8T9n4/L6D79WhHuPzT2qA1Xlx/d4e0mupg51PLCbr/XgMl3HRraY87S+DqgCEj/lSf5bn
	Tuh/mD3MpNj65PSmnJ6AG05hl8Re5SEnX4TjuaTECxigNZr7sEN90q6OeTEOeDhnPqsY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187049-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187049: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=84fc1ec52fc0f650187359bb081ee5a9400d9675
X-Osstest-Versions-That:
    ovmf=909abd7104b87986ad22e92b4cb07d30a8cca11b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 05:08:38 +0000

flight 187049 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187049/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 84fc1ec52fc0f650187359bb081ee5a9400d9675
baseline version:
 ovmf                 909abd7104b87986ad22e92b4cb07d30a8cca11b

Last test of basis   187047  2024-07-29 23:11:32 Z    0 days
Testing same since   187049  2024-07-30 03:43:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Herman Li <herman.li@intel.com>

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
   909abd7104..84fc1ec52f  84fc1ec52fc0f650187359bb081ee5a9400d9675 -> xen-tested-master

