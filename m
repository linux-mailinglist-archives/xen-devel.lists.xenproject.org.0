Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82C7A4078
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 07:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603755.940811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi6qF-0005B8-Pp; Mon, 18 Sep 2023 05:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603755.940811; Mon, 18 Sep 2023 05:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi6qF-00059N-LX; Mon, 18 Sep 2023 05:30:39 +0000
Received: by outflank-mailman (input) for mailman id 603755;
 Mon, 18 Sep 2023 05:30:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qi6qE-00059D-Dq; Mon, 18 Sep 2023 05:30:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qi6qE-0005y8-81; Mon, 18 Sep 2023 05:30:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qi6qD-0008PM-Kf; Mon, 18 Sep 2023 05:30:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qi6qD-00045Z-K1; Mon, 18 Sep 2023 05:30:37 +0000
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
	bh=TdBPWLnFl0YyPaStbsC/+sfcM6Eb6Xr12vU6rTlgOwA=; b=ZU57v3bZ4G3AY7/VjlhWUDCb8h
	IMB0CnilMzwiUsa3E1KzL95SCclwGJ7oJYg3z9V+69ogOw9wHll4I6xTFZLYjgnV2OCR+vwrYtjwo
	zFLDlgAos6cRte8y7KGxeqpQablYa3IrKEw9G/5Ea/3xETMqXIzxrTgqPcGS1OEZlX0I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183027-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183027: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=db38c7de64d4dda2bf3cc6e5d764b027b00afa59
X-Osstest-Versions-That:
    ovmf=29cce3356aec6db878ad318c4abeb63aa9e845aa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Sep 2023 05:30:37 +0000

flight 183027 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183027/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 db38c7de64d4dda2bf3cc6e5d764b027b00afa59
baseline version:
 ovmf                 29cce3356aec6db878ad318c4abeb63aa9e845aa

Last test of basis   183003  2023-09-14 10:12:23 Z    3 days
Testing same since   183027  2023-09-18 02:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   29cce3356a..db38c7de64  db38c7de64d4dda2bf3cc6e5d764b027b00afa59 -> xen-tested-master

