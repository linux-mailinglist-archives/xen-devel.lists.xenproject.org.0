Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8072EBD60
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62459.110639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7RQ-0006U9-BF; Wed, 06 Jan 2021 11:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62459.110639; Wed, 06 Jan 2021 11:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7RQ-0006Tk-81; Wed, 06 Jan 2021 11:57:28 +0000
Received: by outflank-mailman (input) for mailman id 62459;
 Wed, 06 Jan 2021 11:57:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx7RP-0006Tc-Jv; Wed, 06 Jan 2021 11:57:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx7RP-0007rx-9r; Wed, 06 Jan 2021 11:57:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kx7RP-00060O-1A; Wed, 06 Jan 2021 11:57:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kx7RP-0004LQ-0g; Wed, 06 Jan 2021 11:57:27 +0000
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
	bh=+R4TKKVpkYF1uQAwSDc9Q5K96JFvGo1IPHPSQdWdHCk=; b=mTXc4wUSodjBN2B42yb7pMDBCr
	CWk2gT42szRb5tSMu0iXKkCycTnT7cdW0zDHx+Hmh5YQabI02taDY9jVJTlrrN+szaw44WG1c0ZxZ
	x+JmJ1fl6RYKU2QKizV9k853IZ9giJRgt9xbi5aS7SVNC9Qhd2kV13JgCmWMGJeTYkos=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158199-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158199: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=67e0e4caa5bacdd65327d8b302eace2d9ebd209f
X-Osstest-Versions-That:
    ovmf=21e1dc286e799830bb159e3afc6f1be71a3c382a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jan 2021 11:57:27 +0000

flight 158199 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158199/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 67e0e4caa5bacdd65327d8b302eace2d9ebd209f
baseline version:
 ovmf                 21e1dc286e799830bb159e3afc6f1be71a3c382a

Last test of basis   158185  2021-01-06 03:31:28 Z    0 days
Testing same since   158199  2021-01-06 08:41:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Enze Zhu <zhuenze@byosoft.com.cn>
  gaoliming <gaoliming@byosoft.com.cn>
  Liming Gao <gaoliming@byosoft.com.cn>
  Pete Batard <pete@akeo.ie>
  Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>

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
   21e1dc286e..67e0e4caa5  67e0e4caa5bacdd65327d8b302eace2d9ebd209f -> xen-tested-master

