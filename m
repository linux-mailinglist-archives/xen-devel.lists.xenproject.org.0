Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52283A0A0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 05:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670706.1043655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSUvV-0004Gp-0Y; Wed, 24 Jan 2024 04:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670706.1043655; Wed, 24 Jan 2024 04:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSUvU-0004Eh-Sc; Wed, 24 Jan 2024 04:31:48 +0000
Received: by outflank-mailman (input) for mailman id 670706;
 Wed, 24 Jan 2024 04:31:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSUvT-0004EX-Ui; Wed, 24 Jan 2024 04:31:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSUvT-0002Qz-Kh; Wed, 24 Jan 2024 04:31:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSUvT-0002Ox-AZ; Wed, 24 Jan 2024 04:31:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSUvT-00057f-A4; Wed, 24 Jan 2024 04:31:47 +0000
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
	bh=eGzfawEwxbc9uuNGnBqn0kQjQgVKMjDkz1G2/wxGdA0=; b=wZtOpY3L7DymvinsvZFm0ceo03
	FOx4XrhbFZd6ddqOz6xhcALa8aHyQO1za1wDPLsdRy2MXZjFsa0MAzjnIgXDJTbofBlT9EcfVAklL
	1cvFSX7Y53Vg/03d280U0fP/cAjK+uwhy4H6SgPv+KsLeMH6+sA4KwUpmf98ylJ6lrYA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184444-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184444: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1063665fa5466ece0814a3e764ee3382656956a1
X-Osstest-Versions-That:
    ovmf=7f72c2829fa29d2b4451c9a60e904df4c6a5df6c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jan 2024 04:31:47 +0000

flight 184444 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184444/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1063665fa5466ece0814a3e764ee3382656956a1
baseline version:
 ovmf                 7f72c2829fa29d2b4451c9a60e904df4c6a5df6c

Last test of basis   184442  2024-01-23 23:41:02 Z    0 days
Testing same since   184444  2024-01-24 01:58:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashish Singhal <ashishsingha@nvidia.com>

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
   7f72c2829f..1063665fa5  1063665fa5466ece0814a3e764ee3382656956a1 -> xen-tested-master

