Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7F7FCE8A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 06:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643689.1004105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8DWK-0004LW-NQ; Wed, 29 Nov 2023 05:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643689.1004105; Wed, 29 Nov 2023 05:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8DWK-0004JR-Kp; Wed, 29 Nov 2023 05:54:00 +0000
Received: by outflank-mailman (input) for mailman id 643689;
 Wed, 29 Nov 2023 05:53:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8DWI-0004JH-VD; Wed, 29 Nov 2023 05:53:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8DWI-00029D-Nh; Wed, 29 Nov 2023 05:53:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8DWI-00034z-Gr; Wed, 29 Nov 2023 05:53:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8DWI-0003eI-GH; Wed, 29 Nov 2023 05:53:58 +0000
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
	bh=zkVeLj8dZJcXxIKDNaRRssl1W/pTVkpkh5Jy/wYwG9E=; b=4/iplCuWUoOgAYcrmknTQX4o7y
	7JIY19pfZMzSFlZ2BNfCwdl2+wMdKiWTaKkHZpXS+PdEfvQ31S/qQrumt4yq3zD/OjfUXCJaESdbE
	ISmXlIGgwr2nLhykoZW1dsYSFK/auSPFZZoP2EKs0g9F9VN8U9w/E4U7oPsa8E08GNu8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183923-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183923: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=88580a79d49f923ed9347d6161a5cff28a46f627
X-Osstest-Versions-That:
    ovmf=cdf36b1e36805884a8dc115b1316ac09ce77feee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Nov 2023 05:53:58 +0000

flight 183923 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183923/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 88580a79d49f923ed9347d6161a5cff28a46f627
baseline version:
 ovmf                 cdf36b1e36805884a8dc115b1316ac09ce77feee

Last test of basis   183914  2023-11-28 21:42:52 Z    0 days
Testing same since   183923  2023-11-29 01:56:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gao Cheng <gao.cheng@intel.com>

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
   cdf36b1e36..88580a79d4  88580a79d49f923ed9347d6161a5cff28a46f627 -> xen-tested-master

