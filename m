Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21128798241
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597788.932147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUpd-0001gW-BN; Fri, 08 Sep 2023 06:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597788.932147; Fri, 08 Sep 2023 06:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUpd-0001et-8D; Fri, 08 Sep 2023 06:19:05 +0000
Received: by outflank-mailman (input) for mailman id 597788;
 Fri, 08 Sep 2023 06:19:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeUpc-0001ej-C3; Fri, 08 Sep 2023 06:19:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeUpc-000344-9V; Fri, 08 Sep 2023 06:19:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeUpb-00052e-VX; Fri, 08 Sep 2023 06:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qeUpb-0000y0-V2; Fri, 08 Sep 2023 06:19:03 +0000
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
	bh=ju0fX1V9DY1mg5K4ETELj8iggYEJXKKEFYpQfaqJp5Q=; b=pnGUXbr812uy+hjIisyaps7mio
	pPYao08tf81PunQB+cYsGkcUO+nOsPaL3bUIhPwnqIk6034o9wPW1NUQQYFJ8/KU+VOc9cYmfRE76
	rAGJ4TkUsqyy7Izni6t0LPDR6DhXp8ra6GNBZyvq7z/C9OZIpnmBOeEcp8yM6n7O5Yr0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182727-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182727: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=634192665ea22eb610ad54f10bad8143ef77076d
X-Osstest-Versions-That:
    ovmf=b29150aa3e9157908052c212d3afacbff8dbab1b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Sep 2023 06:19:03 +0000

flight 182727 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182727/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 634192665ea22eb610ad54f10bad8143ef77076d
baseline version:
 ovmf                 b29150aa3e9157908052c212d3afacbff8dbab1b

Last test of basis   182722  2023-09-07 16:10:41 Z    0 days
Testing same since   182727  2023-09-08 03:42:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   b29150aa3e..634192665e  634192665ea22eb610ad54f10bad8143ef77076d -> xen-tested-master

