Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B14603B1C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 10:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425620.673561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol44o-0004ft-Rv; Wed, 19 Oct 2022 08:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425620.673561; Wed, 19 Oct 2022 08:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol44o-0004dU-Ol; Wed, 19 Oct 2022 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 425620;
 Wed, 19 Oct 2022 08:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol44m-0004dK-JR; Wed, 19 Oct 2022 08:05:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol44m-0006ds-H7; Wed, 19 Oct 2022 08:05:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol44m-0007LS-8u; Wed, 19 Oct 2022 08:05:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ol44m-00087E-8Q; Wed, 19 Oct 2022 08:05:20 +0000
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
	bh=F8CRWsJ2npbrRrVtrRtopYc/kDOSdy8Fco1b8x7Nb2Y=; b=nXWFmm6YcHMWKl4tXS5Eom4Spe
	TpdjRKGbNHqX+g4GkGq1e19IOXJGKR0AHIBEFNRBDjiydqTsMCKJEm7s10vBBXNECv0XPx0JMWTda
	NbsrVJJgfHczbVhC4MCqRnrvNLwVJjt3xFXXoi4vCH4epaolioykoRg/IZ2JwKqv3bcI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174075-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174075: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c4663e7277d12835a886994919822e218a01b62e
X-Osstest-Versions-That:
    ovmf=9d6915ca91519271a79bc6190a31f0af89e339b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Oct 2022 08:05:20 +0000

flight 174075 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174075/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c4663e7277d12835a886994919822e218a01b62e
baseline version:
 ovmf                 9d6915ca91519271a79bc6190a31f0af89e339b2

Last test of basis   173982  2022-10-17 08:12:08 Z    1 days
Testing same since   174075  2022-10-19 04:40:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   9d6915ca91..c4663e7277  c4663e7277d12835a886994919822e218a01b62e -> xen-tested-master

