Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCC323674
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 05:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89163.167739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEluz-0006Ne-U8; Wed, 24 Feb 2021 04:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89163.167739; Wed, 24 Feb 2021 04:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEluz-0006NF-Q8; Wed, 24 Feb 2021 04:36:57 +0000
Received: by outflank-mailman (input) for mailman id 89163;
 Wed, 24 Feb 2021 04:36:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lElux-0006N7-Qk; Wed, 24 Feb 2021 04:36:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lElux-0004ra-LF; Wed, 24 Feb 2021 04:36:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lElux-0005Vi-Bl; Wed, 24 Feb 2021 04:36:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lElux-0007XV-BE; Wed, 24 Feb 2021 04:36:55 +0000
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
	bh=0/3k44Y5ERqxt1cB60AmAB57RKdjryWosn5Mokvdx7I=; b=AVUafvfzE9s3eBz9XIhFZPkYkd
	wm1c2kcXM7DqEodWjtHElZpVj+q9xPdNQnZ3CXcJNTIEThMAjOVHFJn7ntQNh1HrfkFGwDJOPhV5g
	6qmtZaP+4uEz4mn0bJ3lxThTcGHhjwaLwcpNyfgcYv8b7mOz+/NxQ1JrUrpf41W35XWg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159598-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159598: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=68e5ecc4d208fe900530fdbe6b44dfc85bef60a8
X-Osstest-Versions-That:
    ovmf=a2b5ea38a6fbbcf1a8f4c2128be35121236437a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 04:36:55 +0000

flight 159598 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159598/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 68e5ecc4d208fe900530fdbe6b44dfc85bef60a8
baseline version:
 ovmf                 a2b5ea38a6fbbcf1a8f4c2128be35121236437a7

Last test of basis   159585  2021-02-23 12:39:43 Z    0 days
Testing same since   159598  2021-02-23 19:09:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Achin Gupta <achin.gupta@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ilias Apalodimas <ilias.apalodimas@linaro.org>
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
   a2b5ea38a6..68e5ecc4d2  68e5ecc4d208fe900530fdbe6b44dfc85bef60a8 -> xen-tested-master

