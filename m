Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C315174E95A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 10:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561617.878072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ93i-0005EC-Lo; Tue, 11 Jul 2023 08:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561617.878072; Tue, 11 Jul 2023 08:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ93i-0005CJ-IX; Tue, 11 Jul 2023 08:49:22 +0000
Received: by outflank-mailman (input) for mailman id 561617;
 Tue, 11 Jul 2023 08:49:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ93i-0005CA-3i; Tue, 11 Jul 2023 08:49:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ93i-0001qe-0K; Tue, 11 Jul 2023 08:49:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ93h-0008Cd-JK; Tue, 11 Jul 2023 08:49:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ93h-0006zq-Im; Tue, 11 Jul 2023 08:49:21 +0000
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
	bh=yYBxpm20Fx1MLzv++v6c+PbvH0TOseSsd+VcVJnmiHQ=; b=IY3Y0zGrJQr0o07ECJ2zoxbycs
	f9qdyLLWVodIrhBtXHFxWUWbXBLNoqWriGlf2APvN2utE1ab28Q5ANT2zQ1lVkUvy+zkUEnLUzcC+
	iNkEh15A5pCKrjp87bo38I8b71PhOX1w1LRjUY8K/nLE9c4Vy1cw4N60OUSIxSnVTESY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181760-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181760: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8dab4eebe435fc28cae329867a74cee45d040d3e
X-Osstest-Versions-That:
    ovmf=964a4f032dcd15d7b0d9246625b13b71182e4eae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Jul 2023 08:49:21 +0000

flight 181760 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181760/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8dab4eebe435fc28cae329867a74cee45d040d3e
baseline version:
 ovmf                 964a4f032dcd15d7b0d9246625b13b71182e4eae

Last test of basis   181757  2023-07-11 03:12:21 Z    0 days
Testing same since   181760  2023-07-11 06:42:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  MarsX Lin <marsx.lin@intel.com>

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
   964a4f032d..8dab4eebe4  8dab4eebe435fc28cae329867a74cee45d040d3e -> xen-tested-master

