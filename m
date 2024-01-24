Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C2839E7C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 02:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670693.1043645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSSWm-00075z-Bz; Wed, 24 Jan 2024 01:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670693.1043645; Wed, 24 Jan 2024 01:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSSWm-00072T-81; Wed, 24 Jan 2024 01:58:08 +0000
Received: by outflank-mailman (input) for mailman id 670693;
 Wed, 24 Jan 2024 01:58:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSSWk-00072I-QL; Wed, 24 Jan 2024 01:58:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSSWk-0007dc-G1; Wed, 24 Jan 2024 01:58:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSSWk-0004Aq-6V; Wed, 24 Jan 2024 01:58:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSSWk-0003H0-5w; Wed, 24 Jan 2024 01:58:06 +0000
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
	bh=zJSZg2fK47cFa1bOXDAHCTrnItQX6S36LPyDPfy9Z0Q=; b=xMLdx18zYlawXfu9ldA944G7Jt
	mg8lmthlocQp13h/Z5RYpvOoM4MhXTjmO2KnCdCZhX8VAYt/x/mN4L2NtAVhu8OoRqxdM+JkdN/Ri
	/TpSQOcqJznEcgIm4/bJd2427oCMIN0h2aHUorGlx3qQep3SpcFmN92gaAqPqTF64wnQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184442-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184442: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7f72c2829fa29d2b4451c9a60e904df4c6a5df6c
X-Osstest-Versions-That:
    ovmf=417ebe6d1d6052b6cf023332da07558363d7fd08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jan 2024 01:58:06 +0000

flight 184442 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184442/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f72c2829fa29d2b4451c9a60e904df4c6a5df6c
baseline version:
 ovmf                 417ebe6d1d6052b6cf023332da07558363d7fd08

Last test of basis   184441  2024-01-23 21:14:28 Z    0 days
Testing same since   184442  2024-01-23 23:41:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  devel@edk2.groups.io <devel@edk2.groups.io>
  Qing Huang <qing.huang@intel.com>

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
   417ebe6d1d..7f72c2829f  7f72c2829fa29d2b4451c9a60e904df4c6a5df6c -> xen-tested-master

