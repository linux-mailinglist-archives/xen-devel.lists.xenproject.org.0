Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836C9460E5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 17:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771262.1181830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZubl-0006f5-Ek; Fri, 02 Aug 2024 15:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771262.1181830; Fri, 02 Aug 2024 15:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZubl-0006cE-BJ; Fri, 02 Aug 2024 15:54:21 +0000
Received: by outflank-mailman (input) for mailman id 771262;
 Fri, 02 Aug 2024 15:54:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZubj-0006c4-Jd; Fri, 02 Aug 2024 15:54:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZubj-0000N3-8j; Fri, 02 Aug 2024 15:54:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZubi-0000aT-Vn; Fri, 02 Aug 2024 15:54:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZubi-0003sz-VP; Fri, 02 Aug 2024 15:54:18 +0000
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
	bh=3bVXN8GglNXLUbQHjdQJOBdilBPOTh0SBO/VNHMo4G8=; b=x3aR2tUX4j6Qjflt9+bZYB7YAQ
	whzds52/qkIKcNjfBthhoWElrxNMMe7511FKek7kmkZOs2AoQp6RMdy0MIw9/knxzszWB17AevF5/
	azzaVNjaI4qbZ5JbZ4R/qZdd2Ni3zzfbqhF917mRFoxVU/F8D0LGLrTNrbAaNgI8XM3Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187124-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187124: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f203a6db92eedf03ac544ed270404cb29d3dea7f
X-Osstest-Versions-That:
    ovmf=24a375fcdd26ce5a36bde69b92f638420fddf9c8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Aug 2024 15:54:18 +0000

flight 187124 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187124/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f203a6db92eedf03ac544ed270404cb29d3dea7f
baseline version:
 ovmf                 24a375fcdd26ce5a36bde69b92f638420fddf9c8

Last test of basis   187122  2024-08-02 10:13:19 Z    0 days
Testing same since   187124  2024-08-02 13:11:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aithal Srikanth <sraithal@amd.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   24a375fcdd..f203a6db92  f203a6db92eedf03ac544ed270404cb29d3dea7f -> xen-tested-master

