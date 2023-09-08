Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA867989F8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 17:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598055.932537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qedMu-0005v1-ON; Fri, 08 Sep 2023 15:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598055.932537; Fri, 08 Sep 2023 15:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qedMu-0005sV-L5; Fri, 08 Sep 2023 15:26:00 +0000
Received: by outflank-mailman (input) for mailman id 598055;
 Fri, 08 Sep 2023 15:25:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qedMt-0005sJ-D6; Fri, 08 Sep 2023 15:25:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qedMt-00078m-9q; Fri, 08 Sep 2023 15:25:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qedMt-0002NM-0u; Fri, 08 Sep 2023 15:25:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qedMt-0001Gw-0S; Fri, 08 Sep 2023 15:25:59 +0000
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
	bh=TV7lPfIIe+dBl0tycoqDYCEY96BWCJ6L/5ooXgjY7CQ=; b=TiiqYulpUIBHv1ls3O76UaNDss
	uqoNwcfO6FN4vPfl5VfLjKQhpco7u42d1ofTqBC0rAqQcWJFe+JT5JtAMBDjG4akIIq7VASmwQM9j
	iC4dor21mMSls2LML0KVDIGwlV3Ez8jjHI1d+NDXYTA5DhdUWU5/9DsspoCImST+0eZs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182753-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182753: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430
X-Osstest-Versions-That:
    ovmf=ff7ddc02b273f9159ef46fdb67d99062f8e598d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Sep 2023 15:25:59 +0000

flight 182753 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182753/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430
baseline version:
 ovmf                 ff7ddc02b273f9159ef46fdb67d99062f8e598d9

Last test of basis   182740  2023-09-08 10:15:07 Z    0 days
Testing same since   182753  2023-09-08 13:43:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin@microsoft.com>

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
   ff7ddc02b2..b74f1f7ab5  b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 -> xen-tested-master

