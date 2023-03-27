Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC86CAE71
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515443.798317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsOH-00080N-1G; Mon, 27 Mar 2023 19:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515443.798317; Mon, 27 Mar 2023 19:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsOG-0007xP-Ta; Mon, 27 Mar 2023 19:20:24 +0000
Received: by outflank-mailman (input) for mailman id 515443;
 Mon, 27 Mar 2023 19:20:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgsOF-0007xF-If; Mon, 27 Mar 2023 19:20:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgsOF-0005Hl-Fj; Mon, 27 Mar 2023 19:20:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgsOF-0006eq-5C; Mon, 27 Mar 2023 19:20:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgsOF-0000Pi-4R; Mon, 27 Mar 2023 19:20:23 +0000
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
	bh=E1jubpIdtFmOFm4XPnt5jgBTGJdb+QV590cZbz1z3tQ=; b=DWGSZx1t8bPqP2Cxxpc8IDJ2TR
	/0Y5BjmaQbat52MBu0Ac5wT0dxLVPBBJtYEjBrhh15gK9gtLm3aVUA1LColRi5f5yQfir+mSZI8vg
	4WsrI5rpL0jNjIjMkhCm5Ru/7b9t8cqbsEf/k9RZULeqs9pgfNrp5EaV5yT+DP4poU50=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180031-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180031: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=144028626e0072c2c4fdfcc0fe1b72de319bdd2f
X-Osstest-Versions-That:
    ovmf=2bc854588309b6a9b348655297f3f82165de23a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Mar 2023 19:20:23 +0000

flight 180031 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180031/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 144028626e0072c2c4fdfcc0fe1b72de319bdd2f
baseline version:
 ovmf                 2bc854588309b6a9b348655297f3f82165de23a7

Last test of basis   180028  2023-03-27 09:42:11 Z    0 days
Testing same since   180031  2023-03-27 16:40:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Patel Umang <umang.patel@intel.com>
  Umang Patel <umang.patel@intel.com>

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
   2bc8545883..144028626e  144028626e0072c2c4fdfcc0fe1b72de319bdd2f -> xen-tested-master

