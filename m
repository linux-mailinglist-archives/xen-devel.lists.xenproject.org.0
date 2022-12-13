Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37964BA83
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460936.718955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58gI-00060d-98; Tue, 13 Dec 2022 17:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460936.718955; Tue, 13 Dec 2022 17:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58gI-0005xv-5X; Tue, 13 Dec 2022 17:03:02 +0000
Received: by outflank-mailman (input) for mailman id 460936;
 Tue, 13 Dec 2022 17:03:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58gH-0005xk-G5; Tue, 13 Dec 2022 17:03:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58gH-00061s-Dz; Tue, 13 Dec 2022 17:03:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p58gH-0001CB-74; Tue, 13 Dec 2022 17:03:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p58gH-0002T3-6Y; Tue, 13 Dec 2022 17:03:01 +0000
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
	bh=wOTOpB8Zvxi1qreqa+bm1HjWITrijwdu5G+A+cp2m+Q=; b=K2tqitlrjupj1XKkUlGvc6e4Kk
	Ci3yB/0MzthsrRoTvdKdWdvHkL5zg0wtMLo/Y7RsUfCcLF+EH1U+lEpWyxSEtpdTw85b6ewZklwlY
	UmufQwKyPeY3SdchgQBR7vYTbpqBLdGGS7ywlq5nzBr8Cws22q009sVyqIvAlCkPiswY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175172-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175172: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=11ce7a2de7549306a853cc3fe3abe6ef8f874b40
X-Osstest-Versions-That:
    ovmf=5890a18409a0e67a491c600b930e6c904ad3b3fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Dec 2022 17:03:01 +0000

flight 175172 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175172/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 11ce7a2de7549306a853cc3fe3abe6ef8f874b40
baseline version:
 ovmf                 5890a18409a0e67a491c600b930e6c904ad3b3fd

Last test of basis   175151  2022-12-12 06:42:41 Z    1 days
Testing same since   175172  2022-12-13 14:40:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>

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
   5890a18409..11ce7a2de7  11ce7a2de7549306a853cc3fe3abe6ef8f874b40 -> xen-tested-master

