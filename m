Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FA642507
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 09:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453253.710918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p27AN-0000ZW-Rw; Mon, 05 Dec 2022 08:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453253.710918; Mon, 05 Dec 2022 08:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p27AN-0000W2-P4; Mon, 05 Dec 2022 08:49:35 +0000
Received: by outflank-mailman (input) for mailman id 453253;
 Mon, 05 Dec 2022 08:49:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p27AL-0000Vr-Mr; Mon, 05 Dec 2022 08:49:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p27AL-0001ZC-KM; Mon, 05 Dec 2022 08:49:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p27AL-0004MR-4R; Mon, 05 Dec 2022 08:49:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p27AL-0007hJ-3x; Mon, 05 Dec 2022 08:49:33 +0000
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
	bh=0GX38HIu7MOkQAwuY/NJCKmLqcojb6J3eQ0CJ0TMIk8=; b=sqUHjuMvUVdahIwHYiM0UfD2y1
	lFs49FV5/DfWkxfyh/+rFwRWcE11RsXYxyS7IN18qNBFjFKBKPaubjATokhhVEy1zADYm/la+wUz0
	lPB5ijzqHIQXbx94UbuGWjLFDbMAkYHRetlwrR5UzFW99mFvzj3fFxcn5Ctz2dQN1sGU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175047-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175047: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7bee2498910a9034faaf90802c49188afb7582dc
X-Osstest-Versions-That:
    ovmf=735a7496cb35e48ccad51aad0934844a475e3fef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Dec 2022 08:49:33 +0000

flight 175047 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175047/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7bee2498910a9034faaf90802c49188afb7582dc
baseline version:
 ovmf                 735a7496cb35e48ccad51aad0934844a475e3fef

Last test of basis   175045  2022-12-05 02:10:48 Z    0 days
Testing same since   175047  2022-12-05 05:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ni, Ray <ray.ni@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   735a7496cb..7bee249891  7bee2498910a9034faaf90802c49188afb7582dc -> xen-tested-master

