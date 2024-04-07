Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5089AED5
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 08:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701546.1095936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtLpL-0000uP-Hl; Sun, 07 Apr 2024 06:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701546.1095936; Sun, 07 Apr 2024 06:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtLpL-0000tU-En; Sun, 07 Apr 2024 06:16:27 +0000
Received: by outflank-mailman (input) for mailman id 701546;
 Sun, 07 Apr 2024 06:16:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtLpK-0000tK-CZ; Sun, 07 Apr 2024 06:16:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtLpK-0006zh-1Z; Sun, 07 Apr 2024 06:16:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtLpJ-00066e-PZ; Sun, 07 Apr 2024 06:16:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rtLpJ-0003Qw-PB; Sun, 07 Apr 2024 06:16:25 +0000
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
	bh=ZRVe2WVFZrkvTi9G+JDEQvY21iQ1qQdDwcZzaZC8fes=; b=LQsAPROAx4lbGepwZC8bXm2W5f
	YIiY3TsO4gmviDy3Lb0rPV041Ue/LAydiJAm1C/Mb4CL2PYqLe1Ufj20o+d37FN36SQ77jJc1jhUq
	wEzfFmF+mz5/aSFBC/K/wzOHInDZWUlJxX6QeHZnEPP/j75x07Ijujhwk5/1Qg55Okf0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185264-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185264: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c98c14576f1a93519402a8e2f4736b479ad6007c
X-Osstest-Versions-That:
    ovmf=ee28bea4c0779d3874dbe0a5d6ade549295d7d8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Apr 2024 06:16:25 +0000

flight 185264 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185264/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c98c14576f1a93519402a8e2f4736b479ad6007c
baseline version:
 ovmf                 ee28bea4c0779d3874dbe0a5d6ade549295d7d8b

Last test of basis   185263  2024-04-07 03:14:06 Z    0 days
Testing same since   185264  2024-04-07 04:44:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Ruffin <v-chruffin@microsoft.com>

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
   ee28bea4c0..c98c14576f  c98c14576f1a93519402a8e2f4736b479ad6007c -> xen-tested-master

