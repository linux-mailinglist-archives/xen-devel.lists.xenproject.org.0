Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B056F0FC0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 02:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527126.819387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psCDE-0007Ei-SD; Fri, 28 Apr 2023 00:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527126.819387; Fri, 28 Apr 2023 00:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psCDE-0007D1-PM; Fri, 28 Apr 2023 00:43:48 +0000
Received: by outflank-mailman (input) for mailman id 527126;
 Fri, 28 Apr 2023 00:43:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psCDE-0007Cr-1v; Fri, 28 Apr 2023 00:43:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psCDD-0004jk-Iu; Fri, 28 Apr 2023 00:43:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psCDC-0002kK-US; Fri, 28 Apr 2023 00:43:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psCDC-0008Px-To; Fri, 28 Apr 2023 00:43:46 +0000
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
	bh=J5wFZJGm+fBSPARAxXR5FGqoBdfLM9+5YADp7nyW0u4=; b=2eBEAvQuNJaxqq22GjtfMvnVqY
	YlHaDVk7385VOVwDk9MW+08R8sg26qGB0XG4CIcikUcapvGyGd9ka3hrgNaonPTsiNfVgfoKQPzr2
	2wLtoBOZ4Mh84iXwqxOkpgDeUMDO+oqQilebgIMcwLz7HtOE/d+Z2kXIsJYEvC8NCjuY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180454-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180454: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e5e1cd1a83e2e7aa2179db3de5fc00d76713ec6f
X-Osstest-Versions-That:
    ovmf=edacc551e6586258ab046dd852f65d674e3e2af0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Apr 2023 00:43:46 +0000

flight 180454 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180454/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e5e1cd1a83e2e7aa2179db3de5fc00d76713ec6f
baseline version:
 ovmf                 edacc551e6586258ab046dd852f65d674e3e2af0

Last test of basis   180436  2023-04-26 17:42:39 Z    1 days
Testing same since   180454  2023-04-27 22:12:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   edacc551e6..e5e1cd1a83  e5e1cd1a83e2e7aa2179db3de5fc00d76713ec6f -> xen-tested-master

