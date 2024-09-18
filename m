Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568597B788
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 07:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800157.1210073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqnZ7-0001OD-93; Wed, 18 Sep 2024 05:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800157.1210073; Wed, 18 Sep 2024 05:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqnZ7-0001Mh-6E; Wed, 18 Sep 2024 05:49:25 +0000
Received: by outflank-mailman (input) for mailman id 800157;
 Wed, 18 Sep 2024 05:49:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqnZ5-0001MX-SG; Wed, 18 Sep 2024 05:49:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqnZ5-0002ce-QF; Wed, 18 Sep 2024 05:49:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqnZ5-00022D-BZ; Wed, 18 Sep 2024 05:49:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sqnZ5-0008PV-8G; Wed, 18 Sep 2024 05:49:23 +0000
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
	bh=VY3ddQdPFdlsOXeuIhQFWiBnYOjajU+Dp1LQYw40p8E=; b=Ha5GIXr0JWvPa/A9RyzWJFsM8J
	Qg1SkiirFP7RzT3EWzReV8MWNM3FkThOZC7J7lRf8WE6UT521RZLer00z1WWJtw2EAkjPuuMxBR6L
	aZ2HURmCoJ+gruN2nK4gs/1Y48Qo3vhJb1NlsvMzuqOuNu+3LGK8xzKS2ieg5eZS/4Os=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187740-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187740: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=21e8a85653e104385bfb8218fe22a72053bd3d2d
X-Osstest-Versions-That:
    ovmf=170fa8ecd4bc5acb704400c5610365acff6a78e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Sep 2024 05:49:23 +0000

flight 187740 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187740/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21e8a85653e104385bfb8218fe22a72053bd3d2d
baseline version:
 ovmf                 170fa8ecd4bc5acb704400c5610365acff6a78e8

Last test of basis   187738  2024-09-18 02:43:26 Z    0 days
Testing same since   187740  2024-09-18 04:13:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Phil Noh <Phil.Noh@amd.com>

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
   170fa8ecd4..21e8a85653  21e8a85653e104385bfb8218fe22a72053bd3d2d -> xen-tested-master

