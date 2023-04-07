Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13F6DA8C9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 08:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519032.806173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkfLY-0002s1-AF; Fri, 07 Apr 2023 06:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519032.806173; Fri, 07 Apr 2023 06:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkfLY-0002oz-7Q; Fri, 07 Apr 2023 06:13:16 +0000
Received: by outflank-mailman (input) for mailman id 519032;
 Fri, 07 Apr 2023 06:13:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkfLW-0002op-KR; Fri, 07 Apr 2023 06:13:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkfLW-0002qS-I8; Fri, 07 Apr 2023 06:13:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkfLW-00053Z-8K; Fri, 07 Apr 2023 06:13:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pkfLW-0008Dr-7o; Fri, 07 Apr 2023 06:13:14 +0000
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
	bh=c+I7dqIwebt0T0UMEaeP/okWDXEJV3ElKrkGLAFpFH0=; b=2Xnty8S/E/qJ1q6RDGTAIu0cF7
	yM247on3NHUUx9Ku8pKdmrx+38db/GKAb/94f5ifC0V5yE9hPopqC/W0pU1nIoeVuPYU8PxN/UYhx
	ip554JRqYMswqEOQurlyzTmxC3NbRiFj3HKN11DWXlRhFgY04aK1WVTjOESwVW8tD3IA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180175-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180175: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdf6ff1719a9453351baec4bd32fcfc30e9ceeac
X-Osstest-Versions-That:
    ovmf=3e3be2cbc286e773ed5bd3afd5942440546888de
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Apr 2023 06:13:14 +0000

flight 180175 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180175/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdf6ff1719a9453351baec4bd32fcfc30e9ceeac
baseline version:
 ovmf                 3e3be2cbc286e773ed5bd3afd5942440546888de

Last test of basis   180166  2023-04-06 07:10:40 Z    0 days
Testing same since   180175  2023-04-07 04:13:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

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
   3e3be2cbc2..cdf6ff1719  cdf6ff1719a9453351baec4bd32fcfc30e9ceeac -> xen-tested-master

