Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A692EB228
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 19:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62148.109880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqoe-0000r8-SQ; Tue, 05 Jan 2021 18:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62148.109880; Tue, 05 Jan 2021 18:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqoe-0000qc-Nk; Tue, 05 Jan 2021 18:12:20 +0000
Received: by outflank-mailman (input) for mailman id 62148;
 Tue, 05 Jan 2021 18:12:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwqoe-0000qU-5a; Tue, 05 Jan 2021 18:12:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwqod-0006qD-UY; Tue, 05 Jan 2021 18:12:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwqod-00026T-KK; Tue, 05 Jan 2021 18:12:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwqod-0005p2-Jk; Tue, 05 Jan 2021 18:12:19 +0000
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
	bh=SAyZVCdNJH0hw6Kokz3W0BDIlZyqFOrjeWklKf42lLs=; b=rbuIQbWlfaXvrHSfaWPflD5hiX
	wRbApzyROvbfrgErzhw3vdPe2EUP8k/OuMt+a0NxwOvkD4k07Z4RpyyTQXCcvnNV0rxlPR0RamzGl
	c/EZuM4RQyUKAWVKRBCSf1ZyQeXODhsYax1E2xp8VJ8IliSPICGcycetdmsa5iSsWKtU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158165-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158165: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ad1bd63b28ca103eba21e383c4375a3a91080cf
X-Osstest-Versions-That:
    ovmf=4e511554872c318f8bce196f1cddf69432886bfa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Jan 2021 18:12:19 +0000

flight 158165 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158165/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ad1bd63b28ca103eba21e383c4375a3a91080cf
baseline version:
 ovmf                 4e511554872c318f8bce196f1cddf69432886bfa

Last test of basis   158141  2021-01-05 01:54:39 Z    0 days
Testing same since   158165  2021-01-05 14:39:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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
   4e51155487..4ad1bd63b2  4ad1bd63b28ca103eba21e383c4375a3a91080cf -> xen-tested-master

