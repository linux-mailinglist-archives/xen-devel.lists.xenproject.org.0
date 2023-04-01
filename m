Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DB6D2DF8
	for <lists+xen-devel@lfdr.de>; Sat,  1 Apr 2023 05:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517105.802194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piRzQ-0002Mf-VI; Sat, 01 Apr 2023 03:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517105.802194; Sat, 01 Apr 2023 03:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piRzQ-0002KD-Nt; Sat, 01 Apr 2023 03:33:16 +0000
Received: by outflank-mailman (input) for mailman id 517105;
 Sat, 01 Apr 2023 03:33:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piRzP-0002K3-5Q; Sat, 01 Apr 2023 03:33:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piRzP-0006qb-1z; Sat, 01 Apr 2023 03:33:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piRzO-0007ct-JL; Sat, 01 Apr 2023 03:33:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1piRzO-0000xl-Ip; Sat, 01 Apr 2023 03:33:14 +0000
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
	bh=bGttNYeg4tpFhyWMo8aXw7Bm5/7Jf5XskJBEDQYBhWg=; b=HhkxbCaHT0kzCYNydzhuWBImNG
	1ZkFbr7k9k5+WO4MXEbDFMlovrexQrLXtRNVk4OOKHsgHjzrIAxjaSzO/1wkKZa9WTizbDLrGG/K3
	xRbvabyGA1UJOxfGTK58RR8wToyTnh5tJPpHLEu8K24aVqOaTeEeS68osCjA/dzOUcg0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180099-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180099: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2f499c36db51980ad43fc6b578c7678a1720bd9c
X-Osstest-Versions-That:
    ovmf=eb6a74827200eedc81b8f45f332d6e9f3b3d2906
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Apr 2023 03:33:14 +0000

flight 180099 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180099/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2f499c36db51980ad43fc6b578c7678a1720bd9c
baseline version:
 ovmf                 eb6a74827200eedc81b8f45f332d6e9f3b3d2906

Last test of basis   180095  2023-03-31 21:10:41 Z    0 days
Testing same since   180099  2023-04-01 00:44:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   eb6a748272..2f499c36db  2f499c36db51980ad43fc6b578c7678a1720bd9c -> xen-tested-master

