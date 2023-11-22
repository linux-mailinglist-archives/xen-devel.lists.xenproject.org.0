Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C297F4C4A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638889.995834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q0g-0005tk-4A; Wed, 22 Nov 2023 16:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638889.995834; Wed, 22 Nov 2023 16:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5q0g-0005rq-05; Wed, 22 Nov 2023 16:23:30 +0000
Received: by outflank-mailman (input) for mailman id 638889;
 Wed, 22 Nov 2023 16:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5q0e-0005rZ-9t; Wed, 22 Nov 2023 16:23:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5q0e-0002kU-7s; Wed, 22 Nov 2023 16:23:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5q0d-0001Fz-Re; Wed, 22 Nov 2023 16:23:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r5q0d-0005Cr-R9; Wed, 22 Nov 2023 16:23:27 +0000
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
	bh=lIEE4LkvTdOUTmsFdKSSU+nrrikgDxrmlT03n+9IDJ8=; b=NmqONI8sV2J2v3lLDiEcP9c1GA
	0IFokG4n7kJVwu7NV8pOqO1SY5OhYtRQYLDJwk5hYuicjp02DeDMrz9cgimzUMoWNzI8qeDo2Kv8Q
	OPJK75K1xAnq2gkVVTn/EDPj7H4nq3UCObpkn40ozf9DvGh0FUFj9RRJ/x9T88Sj7jxE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183825-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183825: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8736b8fdca85e02933cdb0a13309de14c9799ece
X-Osstest-Versions-That:
    ovmf=23dbb8a07d108a7b8589e31639b6302b70445b9f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Nov 2023 16:23:27 +0000

flight 183825 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183825/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8736b8fdca85e02933cdb0a13309de14c9799ece
baseline version:
 ovmf                 23dbb8a07d108a7b8589e31639b6302b70445b9f

Last test of basis   183810  2023-11-21 14:42:50 Z    1 days
Testing same since   183825  2023-11-22 13:41:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igor Kulchytskyy <igork@ami.com>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   23dbb8a07d..8736b8fdca  8736b8fdca85e02933cdb0a13309de14c9799ece -> xen-tested-master

