Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E9C93CE42
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 08:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765259.1175845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEhs-00072v-R1; Fri, 26 Jul 2024 06:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765259.1175845; Fri, 26 Jul 2024 06:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEhs-000701-OS; Fri, 26 Jul 2024 06:45:36 +0000
Received: by outflank-mailman (input) for mailman id 765259;
 Fri, 26 Jul 2024 06:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXEhr-0006zp-Ke; Fri, 26 Jul 2024 06:45:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXEhr-0002lc-B4; Fri, 26 Jul 2024 06:45:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXEhq-00069A-Uv; Fri, 26 Jul 2024 06:45:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXEhq-0000iV-UC; Fri, 26 Jul 2024 06:45:34 +0000
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
	bh=D8+r94At0UXF/58tnMeT76BHuFTzQaDWxdZyAHr0/Ew=; b=5X7wwHV3dryYj58NDGipYuhurg
	w0eKDoBWOVpL6Kntruh9ejyEOw/r/M8mgGjLditdyq+btFTCkojrJ2e5hSYQadOfrUts+26HGrmqL
	VLlpNkT9PSQQWEyhXFnoaPLnftCd3ZthYuzEBoGGUT5LGZ6WRXeQOF6vHE+GCYrrSQyY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187012-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187012: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ffc09b51cb7cc47bc80730d6c9e14563140dd052
X-Osstest-Versions-That:
    ovmf=b1bce5e5649840159d54eb8bffa4fa3d4fae8ee6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jul 2024 06:45:34 +0000

flight 187012 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187012/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ffc09b51cb7cc47bc80730d6c9e14563140dd052
baseline version:
 ovmf                 b1bce5e5649840159d54eb8bffa4fa3d4fae8ee6

Last test of basis   187008  2024-07-25 14:43:33 Z    0 days
Testing same since   187012  2024-07-26 03:15:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dmitry Antipov <dmanti@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   b1bce5e564..ffc09b51cb  ffc09b51cb7cc47bc80730d6c9e14563140dd052 -> xen-tested-master

