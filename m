Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1F7DDD75
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 08:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626089.976060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy5zT-0001A9-1l; Wed, 01 Nov 2023 07:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626089.976060; Wed, 01 Nov 2023 07:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy5zS-00017t-T7; Wed, 01 Nov 2023 07:50:14 +0000
Received: by outflank-mailman (input) for mailman id 626089;
 Wed, 01 Nov 2023 07:50:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qy5zR-00017K-98; Wed, 01 Nov 2023 07:50:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qy5zQ-0001Up-R0; Wed, 01 Nov 2023 07:50:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qy5zQ-0004fK-Fx; Wed, 01 Nov 2023 07:50:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qy5zQ-0004fY-FR; Wed, 01 Nov 2023 07:50:12 +0000
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
	bh=exkMw6VqQQWz+ttpKRbtdmVV54YfQ007PBDMfU/z6tg=; b=KleFjDQk57/vn9phqz6wYmExWe
	7gPNS6VVpbaLDtDaVqDiMoWcvI2cwcqQujbU42hVcw4UXAHZ51H4vKVwoXN41Cne01OKbnxs5Ds7l
	Q5J5dJze+n75uCtkXPXDs2TCMEa3HGrujmch5xv9TjGlJgPvVg/wIZ7hhw9JHymu5HCU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183646-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183646: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1b1509abee839b74d3232bbd6a256a1bdc230925
X-Osstest-Versions-That:
    ovmf=ccbe2e938386ed1ec49b3ad8ed6d107e7416e273
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Nov 2023 07:50:12 +0000

flight 183646 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183646/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1b1509abee839b74d3232bbd6a256a1bdc230925
baseline version:
 ovmf                 ccbe2e938386ed1ec49b3ad8ed6d107e7416e273

Last test of basis   183643  2023-10-31 21:14:30 Z    0 days
Testing same since   183646  2023-11-01 03:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>
  Nickle Wang <nicklew@nvidia.com>

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
   ccbe2e9383..1b1509abee  1b1509abee839b74d3232bbd6a256a1bdc230925 -> xen-tested-master

