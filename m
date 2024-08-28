Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA03961DB0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 06:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784467.1193811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjARI-0002Ju-CZ; Wed, 28 Aug 2024 04:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784467.1193811; Wed, 28 Aug 2024 04:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjARI-0002Hy-9K; Wed, 28 Aug 2024 04:37:48 +0000
Received: by outflank-mailman (input) for mailman id 784467;
 Wed, 28 Aug 2024 04:37:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjARG-0002Ho-W4; Wed, 28 Aug 2024 04:37:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjARG-0006tS-OB; Wed, 28 Aug 2024 04:37:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjARG-0000gi-9i; Wed, 28 Aug 2024 04:37:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjARG-0001Yd-9G; Wed, 28 Aug 2024 04:37:46 +0000
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
	bh=3cfAQg0/2tmf884P4XrtpHXIyII8v0qyHI125kMktsQ=; b=R3z9q1JwjP73GusXcgj+A/iHiI
	I3NZ5ikuJyeCG8hbjbMJZWQjFoFZPkb2WShdrfSJWAHWpAXjXx99REVEm5UhAJMpy4M285Bgn+mHP
	ZOZRf/9yiCFTwzqmXjM90zYOMmJ5NbpVySidIy7yWevDstObRPOfQZxMCAJ+plIoWwQs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187373-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187373: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=39a999eb1decf486c615489174912f2d278636d1
X-Osstest-Versions-That:
    ovmf=ded4191e1087c56e0bdeb118fd519d18cb353ef3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 04:37:46 +0000

flight 187373 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187373/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 39a999eb1decf486c615489174912f2d278636d1
baseline version:
 ovmf                 ded4191e1087c56e0bdeb118fd519d18cb353ef3

Last test of basis   187372  2024-08-28 00:43:28 Z    0 days
Testing same since   187373  2024-08-28 03:14:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   ded4191e10..39a999eb1d  39a999eb1decf486c615489174912f2d278636d1 -> xen-tested-master

