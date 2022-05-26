Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5D534EFC
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 14:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337616.562269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuCQ5-00048X-EP; Thu, 26 May 2022 12:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337616.562269; Thu, 26 May 2022 12:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuCQ5-00045n-BG; Thu, 26 May 2022 12:16:49 +0000
Received: by outflank-mailman (input) for mailman id 337616;
 Thu, 26 May 2022 12:16:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nuCQ3-00045d-EH; Thu, 26 May 2022 12:16:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nuCQ3-0000IY-C9; Thu, 26 May 2022 12:16:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nuCQ2-0003pJ-PB; Thu, 26 May 2022 12:16:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nuCQ2-0001ap-Om; Thu, 26 May 2022 12:16:46 +0000
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
	bh=MUTzg/V+m7JwgtoM9fwjNWnOcrNoexO1m6XPTMkZS8s=; b=pkcjMAMWI0fnDDcof7nuZF5Uo6
	9f2/yTzInjsUmXvFSbYAAJZUDHtElGaEw/hCATaOiD3yrvOcrcdIM351ZDDP2FcnWNr2SbYhc0VU8
	kpgFJU1Z8G9nUeyplHPmy2s9EivfhFJUfb0IsWRCdmG0MUYWs4tGsO/2nCZ77gGWJpIY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170746: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=16779ede2d366bfc6b702e817356ccf43425bcc8
X-Osstest-Versions-That:
    ovmf=07c0c2eb0a5970db614ebce1060fc79d6904bdfd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 May 2022 12:16:46 +0000

flight 170746 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170746/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 16779ede2d366bfc6b702e817356ccf43425bcc8
baseline version:
 ovmf                 07c0c2eb0a5970db614ebce1060fc79d6904bdfd

Last test of basis   170733  2022-05-25 17:10:19 Z    0 days
Testing same since   170746  2022-05-26 10:11:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jehl Theo <theojehl76@gmail.com>
  Rebecca Cran <quic_rcran@quicinc.com>
  Theo Jehl <theojehl76@gmail.com>

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
   07c0c2eb0a..16779ede2d  16779ede2d366bfc6b702e817356ccf43425bcc8 -> xen-tested-master

