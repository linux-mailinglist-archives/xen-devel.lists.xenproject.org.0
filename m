Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F144614AB3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 13:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434367.686889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opqPg-000213-Ra; Tue, 01 Nov 2022 12:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434367.686889; Tue, 01 Nov 2022 12:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opqPg-0001zF-Oe; Tue, 01 Nov 2022 12:30:40 +0000
Received: by outflank-mailman (input) for mailman id 434367;
 Tue, 01 Nov 2022 12:30:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1opqPf-0001z3-Lb; Tue, 01 Nov 2022 12:30:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1opqPf-0006Gp-Jt; Tue, 01 Nov 2022 12:30:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1opqPf-0005Tt-2r; Tue, 01 Nov 2022 12:30:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1opqPf-0003dT-2R; Tue, 01 Nov 2022 12:30:39 +0000
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
	bh=YLicT4P2c8UEiyoaF63laJMQkm18JAV9OZEEypNJfPk=; b=oajYzGfS2FB+MU0jZOSRmHaXwl
	M2YRAmYzXOHZ3OnCrWXqrwKeX/hBJ/Y1TcIz2qdBBrFsRbGcIP7HycD7GvB/QOQIwP/x+ZbQJr/sU
	T8gmCIU+M2BGI+LHrI0yxOUqvJ3La7EsKwXYvzGi8JAozM1sORjdsfuV6wjHm7qHCH+Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174565-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174565: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=720c25ab41400f9a3dfd0742da5a6d237991df5b
X-Osstest-Versions-That:
    ovmf=df7ce74e6c75e19a528d5b4921e5b3d0260e45fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 01 Nov 2022 12:30:39 +0000

flight 174565 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174565/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 720c25ab41400f9a3dfd0742da5a6d237991df5b
baseline version:
 ovmf                 df7ce74e6c75e19a528d5b4921e5b3d0260e45fe

Last test of basis   174562  2022-11-01 01:43:29 Z    0 days
Testing same since   174565  2022-11-01 10:13:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiaqi Gao <jiaqi.gao@intel.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   df7ce74e6c..720c25ab41  720c25ab41400f9a3dfd0742da5a6d237991df5b -> xen-tested-master

