Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623B6E010C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 23:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520389.807928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmi93-0001cg-Vp; Wed, 12 Apr 2023 21:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520389.807928; Wed, 12 Apr 2023 21:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmi93-0001aw-T1; Wed, 12 Apr 2023 21:36:49 +0000
Received: by outflank-mailman (input) for mailman id 520389;
 Wed, 12 Apr 2023 21:36:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmi92-0001am-01; Wed, 12 Apr 2023 21:36:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmi91-0005ZX-TU; Wed, 12 Apr 2023 21:36:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmi91-00033J-CT; Wed, 12 Apr 2023 21:36:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pmi91-0006wH-C5; Wed, 12 Apr 2023 21:36:47 +0000
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
	bh=GZgkiwoKGHEopYJwhWrhHdliT63KV7XQXMNuoYtFrhk=; b=Dj0kqyuvqjpUhOmvAUndUC+TM5
	xsHtFx/6YtKFWR+PsFQhu6Ybyq2El0mWoRxfv33C+R/H4mPrCUDVNbcZ1qHTB/YfS9Mv0IKAac7Fc
	uloO/AwcaUwGBZ+z5OX1Uep7+etPbpzrIXDHhw8oHg/oaTqUEkvy+zTeTMokqTPRaH2I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180223-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180223: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5430f7f60dee3747fff906b48718db8afb4589d9
X-Osstest-Versions-That:
    ovmf=89520115b89d755ae79f61850c356aae4be2d9ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Apr 2023 21:36:47 +0000

flight 180223 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180223/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5430f7f60dee3747fff906b48718db8afb4589d9
baseline version:
 ovmf                 89520115b89d755ae79f61850c356aae4be2d9ad

Last test of basis   180221  2023-04-12 12:11:24 Z    0 days
Testing same since   180223  2023-04-12 19:43:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Rebecca Cran <rebecca@quicinc.com>

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
   89520115b8..5430f7f60d  5430f7f60dee3747fff906b48718db8afb4589d9 -> xen-tested-master

