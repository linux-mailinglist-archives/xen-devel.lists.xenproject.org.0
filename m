Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3B825D0E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 00:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662395.1032484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLtK6-0004KZ-Af; Fri, 05 Jan 2024 23:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662395.1032484; Fri, 05 Jan 2024 23:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLtK6-0004Ix-7n; Fri, 05 Jan 2024 23:09:54 +0000
Received: by outflank-mailman (input) for mailman id 662395;
 Fri, 05 Jan 2024 23:09:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLtK5-0004In-Ad; Fri, 05 Jan 2024 23:09:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLtK4-0001mi-SG; Fri, 05 Jan 2024 23:09:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLtK4-0001ay-EO; Fri, 05 Jan 2024 23:09:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rLtK4-0005xG-Da; Fri, 05 Jan 2024 23:09:52 +0000
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
	bh=k34DtSk6f8jVh69/dpwXoUF2ACIYQ93UXHBXjJXleO0=; b=HDND0wGti0cs5cfC812UmFJRoQ
	cA00PPQN3TWiXzZphay4k4AmgKe4aZ8iDmaTMkIJhQRakJStBwgUQcHCqdcpYD8fPNO0vGHOPsRgt
	fzjb56j/JCN4EdOoA7KdsVhK71uN1rNNxhusNBgFu9KJQf389iwT3QoapKyo+UIGkYuY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184259-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184259: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9cf1d03ebe076b3e3825dfebbc19fd6b52b5f336
X-Osstest-Versions-That:
    ovmf=e8166a852e63ee0c7c37291c1f88b19cc4692514
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jan 2024 23:09:52 +0000

flight 184259 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184259/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9cf1d03ebe076b3e3825dfebbc19fd6b52b5f336
baseline version:
 ovmf                 e8166a852e63ee0c7c37291c1f88b19cc4692514

Last test of basis   184257  2024-01-05 07:43:00 Z    0 days
Testing same since   184259  2024-01-05 20:42:55 Z    0 days    1 attempts

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
   e8166a852e..9cf1d03ebe  9cf1d03ebe076b3e3825dfebbc19fd6b52b5f336 -> xen-tested-master

