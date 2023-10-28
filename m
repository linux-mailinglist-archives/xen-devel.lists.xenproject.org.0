Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A193B7DA960
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 22:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624826.973543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwqOL-0002pJ-Hy; Sat, 28 Oct 2023 20:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624826.973543; Sat, 28 Oct 2023 20:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwqOL-0002nW-Eu; Sat, 28 Oct 2023 20:58:45 +0000
Received: by outflank-mailman (input) for mailman id 624826;
 Sat, 28 Oct 2023 20:58:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwqOK-0002nM-AY; Sat, 28 Oct 2023 20:58:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwqOK-0002HD-0S; Sat, 28 Oct 2023 20:58:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwqOJ-0002YL-Ob; Sat, 28 Oct 2023 20:58:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwqOJ-0008Oh-O7; Sat, 28 Oct 2023 20:58:43 +0000
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
	bh=PHywyW6Hd8FUIylmhalIGnrZA0P12BblLZafCB8w294=; b=QPFoHLmRFQ9VPvh80Mb2/guCR/
	5zJtnbAZXTVX3SBS1lJ8p0ih6P4QisCSsHVr753qG2iQ+KwnoI+5qKnA0T0WkGdSeTgchHT/4Ewce
	9B+eIW70wKhFQhqTPruavLZ4WsPB15S3Wzt84HsIatv+viJBmtlhIzuxvVWe0puVx2LY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183582-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183582: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f3ee7fbafc8e83c20f273f4db6c24fe240f6a94
X-Osstest-Versions-That:
    ovmf=7806713f00e92b37799ef920daae3ebf14c5b07f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Oct 2023 20:58:43 +0000

flight 183582 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183582/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f3ee7fbafc8e83c20f273f4db6c24fe240f6a94
baseline version:
 ovmf                 7806713f00e92b37799ef920daae3ebf14c5b07f

Last test of basis   183571  2023-10-28 15:12:46 Z    0 days
Testing same since   183582  2023-10-28 19:11:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gary Lin <glin@suse.com>

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
   7806713f00..4f3ee7fbaf  4f3ee7fbafc8e83c20f273f4db6c24fe240f6a94 -> xen-tested-master

