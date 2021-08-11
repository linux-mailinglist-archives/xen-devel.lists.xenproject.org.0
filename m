Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DED3E935D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 16:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166105.303352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDp0R-0002ho-0U; Wed, 11 Aug 2021 14:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166105.303352; Wed, 11 Aug 2021 14:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDp0Q-0002fK-TQ; Wed, 11 Aug 2021 14:14:54 +0000
Received: by outflank-mailman (input) for mailman id 166105;
 Wed, 11 Aug 2021 14:14:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDp0Q-0002f6-A0; Wed, 11 Aug 2021 14:14:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDp0Q-0007SV-2v; Wed, 11 Aug 2021 14:14:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDp0P-0001fR-QF; Wed, 11 Aug 2021 14:14:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mDp0P-00065F-Pn; Wed, 11 Aug 2021 14:14:53 +0000
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
	bh=Nnp9Ty2H0okXoFfZ5xd+C765PMCPMA51Q1r84fxAx4Q=; b=1BWkqdsHG185Dn0NiXfx645XQ+
	UPf0kTxqZWB29SV+hFh4qS63qu7zkhWfffANsfR7zsgecv3X/duKtJTLAkWLY8RTkSBWE6jtKeGG5
	Er9C04H3PL1h+YY1p3rwMZHVLfTQF+yoyLyiPqRE0wboaZNrhvCNaH/aywWFeFoDUr5A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164159-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164159: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7311e9641785bbcdf2925bfc91b92e43a6158a7d
X-Osstest-Versions-That:
    ovmf=3d359ff90571704b53f19bf95aa797337c041abc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Aug 2021 14:14:53 +0000

flight 164159 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164159/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7311e9641785bbcdf2925bfc91b92e43a6158a7d
baseline version:
 ovmf                 3d359ff90571704b53f19bf95aa797337c041abc

Last test of basis   164155  2021-08-11 01:55:18 Z    0 days
Testing same since   164159  2021-08-11 10:41:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   3d359ff905..7311e96417  7311e9641785bbcdf2925bfc91b92e43a6158a7d -> xen-tested-master

