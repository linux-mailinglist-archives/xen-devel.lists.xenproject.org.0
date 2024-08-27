Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C5960850
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783839.1193118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuCQ-0004cX-IM; Tue, 27 Aug 2024 11:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783839.1193118; Tue, 27 Aug 2024 11:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuCQ-0004Za-FM; Tue, 27 Aug 2024 11:17:22 +0000
Received: by outflank-mailman (input) for mailman id 783839;
 Tue, 27 Aug 2024 11:17:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siuCP-0004ZQ-Kq; Tue, 27 Aug 2024 11:17:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siuCP-0004tv-CG; Tue, 27 Aug 2024 11:17:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siuCO-0004dS-MI; Tue, 27 Aug 2024 11:17:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1siuCO-0002Uw-M0; Tue, 27 Aug 2024 11:17:20 +0000
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
	bh=yqkXvS4PlIoTpBeX0jLBfHMcP5rHF50zbcFN22/EM+Y=; b=AJ3ExVa8oKeg1XjDVZUKHP3xoV
	j9Po9w/RUsXTePiIO5Sc1nu6GHxBg7EIS7orgh5sjp7Fr69T3/yNcO5gPzapTmjgvb5YIEmc0GcT2
	329DsRfAJitI3BNfXYrw1u2Fm7SvUetMm6GxD7I8kUulkXUCjBZY+tJL31r7dFYwdf/Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187362-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187362: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ccda91c28628aa70bca614f1f7b71ad7b5ca61e0
X-Osstest-Versions-That:
    ovmf=5a06afa7dd8ba8e99178fec9525be9e3fd2a4d3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 11:17:20 +0000

flight 187362 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187362/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ccda91c28628aa70bca614f1f7b71ad7b5ca61e0
baseline version:
 ovmf                 5a06afa7dd8ba8e99178fec9525be9e3fd2a4d3a

Last test of basis   187361  2024-08-27 06:16:29 Z    0 days
Testing same since   187362  2024-08-27 09:15:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael G.A. Holland <michael.holland@intel.com>

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
   5a06afa7dd..ccda91c286  ccda91c28628aa70bca614f1f7b71ad7b5ca61e0 -> xen-tested-master

