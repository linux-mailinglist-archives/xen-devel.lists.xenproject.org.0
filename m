Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576E6632F4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 22:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474026.734913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEzkf-0004ch-Pl; Mon, 09 Jan 2023 21:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474026.734913; Mon, 09 Jan 2023 21:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEzkf-0004av-MS; Mon, 09 Jan 2023 21:32:17 +0000
Received: by outflank-mailman (input) for mailman id 474026;
 Mon, 09 Jan 2023 21:32:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEzkd-0004ai-EE; Mon, 09 Jan 2023 21:32:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEzkd-0001aU-CE; Mon, 09 Jan 2023 21:32:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEzkd-00073e-1h; Mon, 09 Jan 2023 21:32:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pEzkd-0001C5-1E; Mon, 09 Jan 2023 21:32:15 +0000
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
	bh=9czV+nBOby4ICdg3XPJWfbPzEZ89NPCMWILMffFC6u4=; b=axsfg0Arm98aTmjyObsDeQH36v
	4/HCPuaasOU44VoN216HuNkx4+vkdTQ82lMK+igwVWWokr6illRHtJus1onlRE2qnOnIp7bvnSWUv
	T3rq5bUrHFUbGZF6CYmpV8y/2xthEZ7Kx9Hq9/Fv4EtXwuu8rnwCGxcEJ1JAHuC4wC68=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175655-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175655: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=33a3408fbbf988aaa8ecc6e721cf83e3ae810e54
X-Osstest-Versions-That:
    ovmf=d8d829b89dababf763ab33b8cdd852b2830db3cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Jan 2023 21:32:15 +0000

flight 175655 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175655/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 33a3408fbbf988aaa8ecc6e721cf83e3ae810e54
baseline version:
 ovmf                 d8d829b89dababf763ab33b8cdd852b2830db3cf

Last test of basis   175606  2023-01-06 16:13:16 Z    3 days
Testing same since   175655  2023-01-09 18:11:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   d8d829b89d..33a3408fbb  33a3408fbbf988aaa8ecc6e721cf83e3ae810e54 -> xen-tested-master

