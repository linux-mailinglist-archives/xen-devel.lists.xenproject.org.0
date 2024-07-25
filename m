Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF893BBCC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 06:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764622.1175113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWqHK-00028T-Ez; Thu, 25 Jul 2024 04:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764622.1175113; Thu, 25 Jul 2024 04:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWqHK-00026V-Bz; Thu, 25 Jul 2024 04:40:34 +0000
Received: by outflank-mailman (input) for mailman id 764622;
 Thu, 25 Jul 2024 04:40:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWqHI-00026L-Sg; Thu, 25 Jul 2024 04:40:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWqHH-0004m1-OM; Thu, 25 Jul 2024 04:40:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWqHH-0006qt-9D; Thu, 25 Jul 2024 04:40:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWqHH-00036I-8r; Thu, 25 Jul 2024 04:40:31 +0000
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
	bh=g+Rsc2p5zh3D3/VpJ+IKmuJKlgpWYjU2QFJvFs4ZreE=; b=Oe3Zk61S3sFz/wMAdbLrKkEoqs
	wOvElfepWtGzPG+BXMAvsh6x0wXcTeClcRL1z8KHHF0SrA3ZZHHjZDxBmVKrG20AG1gP2HRnc3rdx
	dOzdu/Qhf4SlqaFdqd0HgSLwr3ZMKM82o3x/QbbgSwETxlPrqTOVHCfTy9ZfZpwGb/Q4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186997-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186997: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6271b617b4e653029246152871cde93f3926e144
X-Osstest-Versions-That:
    ovmf=a96d2a8f2dd3eb7e32b383821fe30cfd7cdb2248
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jul 2024 04:40:31 +0000

flight 186997 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186997/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6271b617b4e653029246152871cde93f3926e144
baseline version:
 ovmf                 a96d2a8f2dd3eb7e32b383821fe30cfd7cdb2248

Last test of basis   186991  2024-07-24 22:11:40 Z    0 days
Testing same since   186997  2024-07-25 02:41:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   a96d2a8f2d..6271b617b4  6271b617b4e653029246152871cde93f3926e144 -> xen-tested-master

