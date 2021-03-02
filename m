Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C632A420
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 16:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92460.174384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH71s-0001o3-Eo; Tue, 02 Mar 2021 15:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92460.174384; Tue, 02 Mar 2021 15:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH71s-0001ni-AR; Tue, 02 Mar 2021 15:33:44 +0000
Received: by outflank-mailman (input) for mailman id 92460;
 Tue, 02 Mar 2021 15:33:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lH71q-0001nX-Q0; Tue, 02 Mar 2021 15:33:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lH71q-0007X6-GA; Tue, 02 Mar 2021 15:33:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lH71q-0003yD-6w; Tue, 02 Mar 2021 15:33:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lH71q-0001np-6R; Tue, 02 Mar 2021 15:33:42 +0000
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
	bh=YYP//o24WolSQ2TjHAcIb3wrE1rkLFCAn5fgqC2bTOs=; b=cPoYZE8Np+w+fXZESgm4PTIu6S
	7ZmFGl9w5Rl8XTbeHLpptkdwL8YWSk0dsss6UYDcjiA6EGmmE0v8yqJig8js1yTzxQxSqXjys0xn2
	KLNkUJMW8PAczh9kEIjW+sT3QgPsOc9aU90RcnxWYv/UtIqnWvlcpRHVNCXIivugHDDM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159800-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159800: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ef91b07388e1c0a50c604e5350eeda98428ccea6
X-Osstest-Versions-That:
    ovmf=0996a7883c6dd939d6e769b1ce1fd2b2e250bcfb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Mar 2021 15:33:42 +0000

flight 159800 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159800/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef91b07388e1c0a50c604e5350eeda98428ccea6
baseline version:
 ovmf                 0996a7883c6dd939d6e769b1ce1fd2b2e250bcfb

Last test of basis   159792  2021-03-01 13:39:45 Z    1 days
Testing same since   159800  2021-03-02 05:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   0996a7883c..ef91b07388  ef91b07388e1c0a50c604e5350eeda98428ccea6 -> xen-tested-master

