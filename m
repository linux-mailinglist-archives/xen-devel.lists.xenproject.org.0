Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A8A5E82A3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 21:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410928.654103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obocu-0002oN-Fw; Fri, 23 Sep 2022 19:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410928.654103; Fri, 23 Sep 2022 19:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obocu-0002mB-Ck; Fri, 23 Sep 2022 19:46:20 +0000
Received: by outflank-mailman (input) for mailman id 410928;
 Fri, 23 Sep 2022 19:46:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obocs-0002m1-Vn; Fri, 23 Sep 2022 19:46:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obocs-0002fD-TP; Fri, 23 Sep 2022 19:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obocs-0000zi-Ix; Fri, 23 Sep 2022 19:46:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obocs-0002PM-IW; Fri, 23 Sep 2022 19:46:18 +0000
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
	bh=H84jiw6cWR9uarHP+C7kY3L9DkCpAqzONrSUJMxx9vU=; b=GdZ8EnRcP2BGABJko6pEgZA67l
	tYm1DQBNwuLldxKkqWqEsTJpOiuxk4iNBKo51S4QeDsr9XvRBOyJvHaxAmpWDfa9QoFk39cO7KBpG
	JbsX2JbNDFtD4TyfNvfGGJCGTMO2pO9PP8zVzDzd3qbtIbul2oFuagho3ooH5RdwnsAM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173297: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2500ce101178e55ed29cd18931ab8a73d0ca6e4d
X-Osstest-Versions-That:
    ovmf=953438e4665c5993dfe5652c43ad43f963075b64
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 19:46:18 +0000

flight 173297 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173297/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2500ce101178e55ed29cd18931ab8a73d0ca6e4d
baseline version:
 ovmf                 953438e4665c5993dfe5652c43ad43f963075b64

Last test of basis   173293  2022-09-23 14:42:58 Z    0 days
Testing same since   173297  2022-09-23 17:43:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   953438e466..2500ce1011  2500ce101178e55ed29cd18931ab8a73d0ca6e4d -> xen-tested-master

