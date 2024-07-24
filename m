Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D90593B9A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 01:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764581.1175061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWljf-0006Iu-VN; Wed, 24 Jul 2024 23:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764581.1175061; Wed, 24 Jul 2024 23:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWljf-0006GZ-RV; Wed, 24 Jul 2024 23:49:31 +0000
Received: by outflank-mailman (input) for mailman id 764581;
 Wed, 24 Jul 2024 23:49:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWlje-0006GP-0n; Wed, 24 Jul 2024 23:49:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWljd-0003bS-I8; Wed, 24 Jul 2024 23:49:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWljd-00076I-4b; Wed, 24 Jul 2024 23:49:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWljd-0003y3-47; Wed, 24 Jul 2024 23:49:29 +0000
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
	bh=ZPM722QZAOUAUdoEWWadWR6nJYZjbzUUBr37qP4bvfQ=; b=csPqcmJMk5LBo0Yz7sDgTs0gGp
	cqi5jXoBTxd7OenjW0YASVEl3WJBEjG5KW58IdU7gE6q/ewiCkWMc4CJF4ix6Td1rFUx2hTeUwaw1
	n5AOHCU7leg0pI1YT06UtQpgsOGdAbkg5duVamjGIap5NXp4ZVEsUxC0lPvbOhZ434gM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186991-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186991: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a96d2a8f2dd3eb7e32b383821fe30cfd7cdb2248
X-Osstest-Versions-That:
    ovmf=a7abb77c599f4243d7dbab552ec74ed4d0d0d152
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 23:49:29 +0000

flight 186991 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186991/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a96d2a8f2dd3eb7e32b383821fe30cfd7cdb2248
baseline version:
 ovmf                 a7abb77c599f4243d7dbab552ec74ed4d0d0d152

Last test of basis   186988  2024-07-24 20:13:23 Z    0 days
Testing same since   186991  2024-07-24 22:11:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Taylor Beebe <31827475+TaylorBeebe@users.noreply.github.com>

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
   a7abb77c59..a96d2a8f2d  a96d2a8f2dd3eb7e32b383821fe30cfd7cdb2248 -> xen-tested-master

