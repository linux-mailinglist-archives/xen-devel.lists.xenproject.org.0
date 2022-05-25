Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9E5341EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 19:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337296.561852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntuPo-00088G-TB; Wed, 25 May 2022 17:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337296.561852; Wed, 25 May 2022 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntuPo-000863-Pp; Wed, 25 May 2022 17:03:20 +0000
Received: by outflank-mailman (input) for mailman id 337296;
 Wed, 25 May 2022 17:03:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntuPn-00085t-KX; Wed, 25 May 2022 17:03:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntuPn-0005Go-Ei; Wed, 25 May 2022 17:03:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntuPn-0006AY-26; Wed, 25 May 2022 17:03:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntuPn-00047y-1h; Wed, 25 May 2022 17:03:19 +0000
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
	bh=Jii++R8PwQPm7iRuQq3G6svGFcO6zmR9i2r8tW/gEWg=; b=XC0TlMfUnjVVLYvEEfBeatZaZr
	kKRbtmoqh5ntPka/Z7Ev8d0a5D5vMcE65sTA25dqh8MnqHE1VUw3+hIoYPdT+KUIU2U+Rq+mxzAeE
	yLvuy+FiNd6Pyy1tED/eu8EExWKmzXPlfR5fGdZHTuFMmwlweUAxhcEUgIuRq9bgb14Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170728-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170728: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9c733f0b90b31a7e3711f60da314f2a5cfe5fe8a
X-Osstest-Versions-That:
    ovmf=a21a3438f795deecb24e1843c1636f95c485017c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 May 2022 17:03:19 +0000

flight 170728 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170728/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9c733f0b90b31a7e3711f60da314f2a5cfe5fe8a
baseline version:
 ovmf                 a21a3438f795deecb24e1843c1636f95c485017c

Last test of basis   170710  2022-05-23 18:12:51 Z    1 days
Testing same since   170728  2022-05-25 12:40:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Isaku Yamahata <isaku.yamahata@intel.com>

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
   a21a3438f7..9c733f0b90  9c733f0b90b31a7e3711f60da314f2a5cfe5fe8a -> xen-tested-master

