Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFBF9604B2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 10:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783688.1192949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sirla-0000sc-Oz; Tue, 27 Aug 2024 08:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783688.1192949; Tue, 27 Aug 2024 08:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sirla-0000q6-Lj; Tue, 27 Aug 2024 08:41:30 +0000
Received: by outflank-mailman (input) for mailman id 783688;
 Tue, 27 Aug 2024 08:41:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sirlY-0000pw-S6; Tue, 27 Aug 2024 08:41:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sirlY-00024J-IR; Tue, 27 Aug 2024 08:41:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sirlY-0007Zb-5H; Tue, 27 Aug 2024 08:41:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sirlY-0003eJ-4r; Tue, 27 Aug 2024 08:41:28 +0000
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
	bh=ITYQwq/rdTUNmrvJrk1UJh/nKQOezEzyGsx5nL2S5xQ=; b=Cn2PEJWPJPT5JtYKduw3j09pfd
	A81jUYGMVIkTj0HMdEu3fQjEqBhKfgE2VF8pI/IIbiAmBiOPoukh92C4jPaUkyGSaZ8yu8aMtj1eh
	wPznAl+9+G9/CBohYc4Bpf39yE2E6ufsHGuYgQ5b+pwgl7dyLkDId21TTBvqUnj04ZjA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187361-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187361: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5a06afa7dd8ba8e99178fec9525be9e3fd2a4d3a
X-Osstest-Versions-That:
    ovmf=0e8af8803489a10d4edc61a94f1c6e03965c16f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 08:41:28 +0000

flight 187361 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187361/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5a06afa7dd8ba8e99178fec9525be9e3fd2a4d3a
baseline version:
 ovmf                 0e8af8803489a10d4edc61a94f1c6e03965c16f5

Last test of basis   187356  2024-08-27 02:11:16 Z    0 days
Testing same since   187361  2024-08-27 06:16:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   0e8af88034..5a06afa7dd  5a06afa7dd8ba8e99178fec9525be9e3fd2a4d3a -> xen-tested-master

