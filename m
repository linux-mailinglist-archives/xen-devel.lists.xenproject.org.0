Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0199B340
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 13:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817651.1231524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szZvU-0001oU-J9; Sat, 12 Oct 2024 11:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817651.1231524; Sat, 12 Oct 2024 11:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szZvU-0001mS-F9; Sat, 12 Oct 2024 11:04:48 +0000
Received: by outflank-mailman (input) for mailman id 817651;
 Sat, 12 Oct 2024 11:04:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szZvS-0001mI-Sj; Sat, 12 Oct 2024 11:04:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szZvS-0007bn-Pe; Sat, 12 Oct 2024 11:04:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szZvS-00014J-5O; Sat, 12 Oct 2024 11:04:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1szZvS-0006ZD-4r; Sat, 12 Oct 2024 11:04:46 +0000
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
	bh=Kq09A4dA6IX++VBpxo4RKQpuuAk+aXOhhdHbC1EPaSc=; b=CAOLmmTsYwuhsjSDIO09e+s+ou
	NO0kLP7Rv5b3K//D8u8VHJjvw5Q9YESCBhS564DQK08ezlmtvloRV7nLoBGxdFQRLYmDslRg2EVI4
	AaIntQGIqsT0b22O1i8WyX5V32uRAeIBgRiaB/TXDNUc8QqP5PnzW3SQyKqRNege8ZBc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188065-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188065: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fcd9570c8d8164b42f907137a3a6e78977cc860a
X-Osstest-Versions-That:
    ovmf=d2a41d1a7a555e54336e03731c801eb93fba801d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Oct 2024 11:04:46 +0000

flight 188065 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188065/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fcd9570c8d8164b42f907137a3a6e78977cc860a
baseline version:
 ovmf                 d2a41d1a7a555e54336e03731c801eb93fba801d

Last test of basis   188049  2024-10-11 01:41:45 Z    1 days
Testing same since   188065  2024-10-12 09:13:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   d2a41d1a7a..fcd9570c8d  fcd9570c8d8164b42f907137a3a6e78977cc860a -> xen-tested-master

