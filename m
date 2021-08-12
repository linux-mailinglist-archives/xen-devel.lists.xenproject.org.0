Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665DD3EA3CB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 13:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166258.303589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8yS-0004f2-DK; Thu, 12 Aug 2021 11:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166258.303589; Thu, 12 Aug 2021 11:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8yS-0004ck-8z; Thu, 12 Aug 2021 11:34:12 +0000
Received: by outflank-mailman (input) for mailman id 166258;
 Thu, 12 Aug 2021 11:34:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mE8yQ-0004ca-Ev; Thu, 12 Aug 2021 11:34:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mE8yQ-0004Uj-5J; Thu, 12 Aug 2021 11:34:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mE8yP-00006P-Rz; Thu, 12 Aug 2021 11:34:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mE8yP-0007lt-RR; Thu, 12 Aug 2021 11:34:09 +0000
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
	bh=5JmQen2XlT+o3rT9Enzrst/Jo7jgxP2vPCfNR0zswnI=; b=wZVLWTmbfy1tl1RYfOoz+pXFg7
	oiDbi/8rmGwHuqisq80VgOI8KF0toe/dn0ViTBnVrd0rPJZePl8fYKlNbklGgUKa4fcvi8oLHY6Gz
	6FBer1FxeHJt4JLGKDOXZxUfV+bB18va5S6PjkgLyIlUZt990bxiLyqlc17G16hVzrX4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164166-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164166: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ac826886c98524e918753419c039d8b44198943f
X-Osstest-Versions-That:
    ovmf=a776bbabd9e8f370feb089cdc016324b1d6a37c7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Aug 2021 11:34:09 +0000

flight 164166 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164166/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ac826886c98524e918753419c039d8b44198943f
baseline version:
 ovmf                 a776bbabd9e8f370feb089cdc016324b1d6a37c7

Last test of basis   164160  2021-08-11 14:41:07 Z    0 days
Testing same since   164166  2021-08-12 08:41:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>

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
   a776bbabd9..ac826886c9  ac826886c98524e918753419c039d8b44198943f -> xen-tested-master

