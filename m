Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC361988224
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 12:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806197.1217545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7mi-0002ri-M9; Fri, 27 Sep 2024 10:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806197.1217545; Fri, 27 Sep 2024 10:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7mi-0002pq-J7; Fri, 27 Sep 2024 10:01:12 +0000
Received: by outflank-mailman (input) for mailman id 806197;
 Fri, 27 Sep 2024 10:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1su7mh-0002pg-9G; Fri, 27 Sep 2024 10:01:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1su7mg-0005RU-V3; Fri, 27 Sep 2024 10:01:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1su7mg-00049X-Kf; Fri, 27 Sep 2024 10:01:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1su7mg-00085r-KD; Fri, 27 Sep 2024 10:01:10 +0000
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
	bh=wSiZ8LmnKFqNKu4GYnuIXBfFKrDGhIeZj49Ly1rKhxY=; b=tfgRiV3cm1n5GEdsUH6jkR1CZ8
	3yNYb1l2quPFlJUNaoJT8bfaCbcmiqEwZlAgwQZgKsKSJaB2mnRXhRPHVLwhv0xe2+iKW3FfxgqHX
	t01fThiR/FEi2GVF5HsSBcNRkb4kogtTWaLb9kWkFcD5LqEOmnGh12zkJnY7nc4mKndA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187874-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187874: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fe93b3745f13d7eb891d9666debf2689a8975e5b
X-Osstest-Versions-That:
    ovmf=3ed4f43f83c1f9ef6033a889d0c50378165623a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Sep 2024 10:01:10 +0000

flight 187874 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187874/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fe93b3745f13d7eb891d9666debf2689a8975e5b
baseline version:
 ovmf                 3ed4f43f83c1f9ef6033a889d0c50378165623a5

Last test of basis   187871  2024-09-27 04:41:33 Z    0 days
Testing same since   187874  2024-09-27 07:43:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   3ed4f43f83..fe93b3745f  fe93b3745f13d7eb891d9666debf2689a8975e5b -> xen-tested-master

