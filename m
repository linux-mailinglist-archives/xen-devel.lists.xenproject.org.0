Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38426276F8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443152.697625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUPG-0000Lo-CP; Mon, 14 Nov 2022 08:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443152.697625; Mon, 14 Nov 2022 08:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUPG-0000K2-9f; Mon, 14 Nov 2022 08:01:26 +0000
Received: by outflank-mailman (input) for mailman id 443152;
 Mon, 14 Nov 2022 08:01:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouUPF-0000Js-Dw; Mon, 14 Nov 2022 08:01:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouUPF-0004yd-CV; Mon, 14 Nov 2022 08:01:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouUPE-0001Qh-SW; Mon, 14 Nov 2022 08:01:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ouUPE-0007XY-S3; Mon, 14 Nov 2022 08:01:24 +0000
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
	bh=BQFVHFGJfr3mIRlWuJagkgmcsT0HtrJSx7D1neRRCqU=; b=XW6b6B9Xe/rbgp89+c9v8cul5S
	UWz233jEErhEbGkbHNgw0j4ABqO45e+KDGjvSYyq9iJUnNEvxgX7n2k5geHAaOUy+lRGhp+zt4Lf3
	qHLoTKRSUd0HgwRcVbIAvKCn2yc7DESrin9Hq+bPeWdnee0poVvLRzD/n15/y5FXC9uo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174763-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174763: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0cb30c3f5e9b2be5157224afdf75fa16bc09b9c7
X-Osstest-Versions-That:
    ovmf=b9e702c3c9bfe7bfb6bbcff44603add64e1787bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Nov 2022 08:01:24 +0000

flight 174763 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174763/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0cb30c3f5e9b2be5157224afdf75fa16bc09b9c7
baseline version:
 ovmf                 b9e702c3c9bfe7bfb6bbcff44603add64e1787bf

Last test of basis   174737  2022-11-11 10:10:24 Z    2 days
Testing same since   174763  2022-11-14 05:14:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   b9e702c3c9..0cb30c3f5e  0cb30c3f5e9b2be5157224afdf75fa16bc09b9c7 -> xen-tested-master

