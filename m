Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AE807DFA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 02:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649517.1014088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3Kv-0002ON-OK; Thu, 07 Dec 2023 01:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649517.1014088; Thu, 07 Dec 2023 01:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3Kv-0002M5-LI; Thu, 07 Dec 2023 01:37:57 +0000
Received: by outflank-mailman (input) for mailman id 649517;
 Thu, 07 Dec 2023 01:37:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB3Kt-0002Lc-IX; Thu, 07 Dec 2023 01:37:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB3Kt-0005lB-Fh; Thu, 07 Dec 2023 01:37:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rB3Kt-0003n0-3M; Thu, 07 Dec 2023 01:37:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rB3Kt-0006fB-2Q; Thu, 07 Dec 2023 01:37:55 +0000
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
	bh=Yv2Cofbv9zOaN3DLJM/5vf6ZPk6QbD/ng7XwJZ1OI6I=; b=E+X53wtO1uIyYdpw/sf4mHzeSM
	eWQVI53ATPBpZW16DdMO1J7euQ6XbQGG0nQpAtqSKsZgRmfzrjv9qWCRheAnWQ+nAmHcR8yepfzYK
	3imWzUzJKN1NyRcsGdMoRrtq8THcwQEorro7WxfAMJ1FPHvlRa49We7+EBzozzkP64kE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184016-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184016: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=df2ec2aab0876d34025968030d1f26ad8e5106ec
X-Osstest-Versions-That:
    ovmf=b59ab98049f20f826ff5302a498a435cbb3b3753
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Dec 2023 01:37:55 +0000

flight 184016 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184016/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 df2ec2aab0876d34025968030d1f26ad8e5106ec
baseline version:
 ovmf                 b59ab98049f20f826ff5302a498a435cbb3b3753

Last test of basis   184014  2023-12-06 17:11:09 Z    0 days
Testing same since   184016  2023-12-06 23:12:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   b59ab98049..df2ec2aab0  df2ec2aab0876d34025968030d1f26ad8e5106ec -> xen-tested-master

