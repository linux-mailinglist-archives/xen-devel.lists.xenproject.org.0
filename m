Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBD6C986F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 00:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515020.797504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgYZZ-00063z-PQ; Sun, 26 Mar 2023 22:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515020.797504; Sun, 26 Mar 2023 22:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgYZZ-00060c-Lx; Sun, 26 Mar 2023 22:10:45 +0000
Received: by outflank-mailman (input) for mailman id 515020;
 Sun, 26 Mar 2023 22:10:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgYZY-00060S-6J; Sun, 26 Mar 2023 22:10:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgYZY-0007ds-3T; Sun, 26 Mar 2023 22:10:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgYZX-0004SJ-OW; Sun, 26 Mar 2023 22:10:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgYZX-0008Uj-O1; Sun, 26 Mar 2023 22:10:43 +0000
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
	bh=5mqTajKiSsFIaTzNifjMhiNE1qVOPM9FSUhFOjIJWik=; b=ixYxzN8E9YZlq1EEUih/KgFIqe
	L2SFRLg4OzcstRnsCKwRMUYIVSIqfND8akTqrwu/yAZ2NYMrCdb5eQ3g+llFEsKGMl3txFmUdr/dr
	+cKU0Y4scnrXKspYGBu/NGFuza6DidkTT6xndQhpVlNr+/yZ/+ID1CQhU+lNHtcRhXBM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180009-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180009: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=69e59545b14739e004d3f0452411e195d2a3c197
X-Osstest-Versions-That:
    ovmf=2c93253c95dbbc161650dfaeccaa3d866a2e29f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Mar 2023 22:10:43 +0000

flight 180009 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180009/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 69e59545b14739e004d3f0452411e195d2a3c197
baseline version:
 ovmf                 2c93253c95dbbc161650dfaeccaa3d866a2e29f2

Last test of basis   180006  2023-03-26 17:42:11 Z    0 days
Testing same since   180009  2023-03-26 20:12:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Isaac Oram <isaac.w.oram@intel.com>

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
   2c93253c95..69e59545b1  69e59545b14739e004d3f0452411e195d2a3c197 -> xen-tested-master

