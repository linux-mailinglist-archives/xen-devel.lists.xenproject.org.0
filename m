Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33273350546
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 19:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104029.198527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRePc-0001gy-Sy; Wed, 31 Mar 2021 17:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104029.198527; Wed, 31 Mar 2021 17:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRePc-0001gT-NU; Wed, 31 Mar 2021 17:13:48 +0000
Received: by outflank-mailman (input) for mailman id 104029;
 Wed, 31 Mar 2021 17:13:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRePb-0001gL-7v; Wed, 31 Mar 2021 17:13:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRePb-0007er-0v; Wed, 31 Mar 2021 17:13:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRePa-0006yI-Qc; Wed, 31 Mar 2021 17:13:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lRePa-0007Pi-Q3; Wed, 31 Mar 2021 17:13:46 +0000
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
	bh=Qv/AMeDBqAJpVM68lvRVbAwQbqqEnmRwDjamajlQcy4=; b=UtuJd5bU8BZkxX7eQy4XXklzuF
	fcmH9gALJ31MxPB/ftjohJEjGCP8+JoobozX3Nk68dRcbk/9MRK5iwQNnJEwtz9RgKxSW4AobvpV5
	j12aLHi32cIS0kuAdAAkMr/tZbP0MZt1XzJd+jjbCZvd0XqZpineqsmiRv0jz/gkKtlE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160578-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160578: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=62bad17dcae18f55cb3bdc19909543dfdf928a2b
X-Osstest-Versions-That:
    ovmf=98ff7e3c6373d3e0590f953459b6234ab12edce6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Mar 2021 17:13:46 +0000

flight 160578 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160578/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 62bad17dcae18f55cb3bdc19909543dfdf928a2b
baseline version:
 ovmf                 98ff7e3c6373d3e0590f953459b6234ab12edce6

Last test of basis   160560  2021-03-30 13:10:07 Z    1 days
Testing same since   160578  2021-03-31 06:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Dandan Bi <dandan.bi@intel.com>

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
   98ff7e3c63..62bad17dca  62bad17dcae18f55cb3bdc19909543dfdf928a2b -> xen-tested-master

