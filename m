Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E282BF3B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666849.1037774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFlP-0000I3-L2; Fri, 12 Jan 2024 11:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666849.1037774; Fri, 12 Jan 2024 11:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFlP-0000FI-IM; Fri, 12 Jan 2024 11:31:51 +0000
Received: by outflank-mailman (input) for mailman id 666849;
 Fri, 12 Jan 2024 11:31:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOFlO-0000F8-7l; Fri, 12 Jan 2024 11:31:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOFlN-0007nD-VC; Fri, 12 Jan 2024 11:31:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rOFlN-0002w0-GD; Fri, 12 Jan 2024 11:31:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rOFlN-0003wd-Fj; Fri, 12 Jan 2024 11:31:49 +0000
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
	bh=c18MW270tHyQnYsl8fxHQm/gIw101O6THwUjyYcl1BM=; b=1O4JJgzdq2eQReX1yY6X5gtoQ3
	5egCTA4l4KrrtZDUAEZbOvSbtVQq3WWEfWBwQer4wjYt1HA+sAYAkYjv8xRfnXVlZT7rmZHqI/CKC
	vuumjLznS9zCudy1p9wHs5zanuXx8ngH2KbzZUMpuP4unBL24HOwJ9P6GAvcLon//Pv8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184331-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184331: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cfe48465724293abd0a7d92c2a72f8ee3cf15628
X-Osstest-Versions-That:
    ovmf=2bce85bd862e54cede2b59b48972c9f05e2e733d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jan 2024 11:31:49 +0000

flight 184331 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184331/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cfe48465724293abd0a7d92c2a72f8ee3cf15628
baseline version:
 ovmf                 2bce85bd862e54cede2b59b48972c9f05e2e733d

Last test of basis   184328  2024-01-12 01:43:23 Z    0 days
Testing same since   184331  2024-01-12 06:14:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhi Jin <zhi.jin@intel.com>

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
   2bce85bd86..cfe4846572  cfe48465724293abd0a7d92c2a72f8ee3cf15628 -> xen-tested-master

