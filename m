Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AE326EC4
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 20:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90962.172080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG5TI-0004Yr-Dg; Sat, 27 Feb 2021 19:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90962.172080; Sat, 27 Feb 2021 19:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lG5TI-0004YN-88; Sat, 27 Feb 2021 19:41:48 +0000
Received: by outflank-mailman (input) for mailman id 90962;
 Sat, 27 Feb 2021 19:41:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lG5TG-0004YF-5N; Sat, 27 Feb 2021 19:41:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lG5TF-0004uU-U8; Sat, 27 Feb 2021 19:41:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lG5TF-0005rG-JD; Sat, 27 Feb 2021 19:41:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lG5TF-0002Zy-Ij; Sat, 27 Feb 2021 19:41:45 +0000
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
	bh=wYd3Z1Lem3pB2sbAgfrWf4Pr2amC6MpMNTaDehB09v0=; b=oGjtGinjWCaWeubkjsPVdxTqf0
	iC0H9FYGIZEhZ/Q1VEzla9aOGUy57rwiju8P2JGxZTS0y7gn+4sjz/GXUM5uL9lRNn9QgFw0omRxe
	yO0zm+LSsV8JVCcFaGbjGNR3/f3mKxcA/YCQykDzYwS1fu5tFfn9xAPDCZCRz5R5ha30=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159741-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159741: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=31eaefd4df78d58ad4087a13f6fc7607b266d04e
X-Osstest-Versions-That:
    ovmf=cd14150c1594d8deeee6ecf80feb5751dcd7f315
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Feb 2021 19:41:45 +0000

flight 159741 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159741/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 31eaefd4df78d58ad4087a13f6fc7607b266d04e
baseline version:
 ovmf                 cd14150c1594d8deeee6ecf80feb5751dcd7f315

Last test of basis   159721  2021-02-26 23:39:43 Z    0 days
Testing same since   159741  2021-02-27 11:09:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>
  Sughosh Ganu <sughosh.ganu@linaro.org>

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
   cd14150c15..31eaefd4df  31eaefd4df78d58ad4087a13f6fc7607b266d04e -> xen-tested-master

