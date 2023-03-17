Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EE6BF604
	for <lists+xen-devel@lfdr.de>; Sat, 18 Mar 2023 00:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511304.790306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdJCq-0005nv-IY; Fri, 17 Mar 2023 23:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511304.790306; Fri, 17 Mar 2023 23:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdJCq-0005l0-F6; Fri, 17 Mar 2023 23:09:52 +0000
Received: by outflank-mailman (input) for mailman id 511304;
 Fri, 17 Mar 2023 23:09:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdJCp-0005kq-6u; Fri, 17 Mar 2023 23:09:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdJCp-00074v-5p; Fri, 17 Mar 2023 23:09:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdJCo-0008G1-Rw; Fri, 17 Mar 2023 23:09:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pdJCo-00048A-RS; Fri, 17 Mar 2023 23:09:50 +0000
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
	bh=oWqWUEoI5Z1c90QdfsiIwpmI3kquvzU+w3RpeGvPBTE=; b=yPKt9pzQqC0MxtNjcZSNK/XsGx
	ndKM1rx9p7Qw6+LMk6rYtFMfMYRy+V5cnW/J50Npu03NxSf+E+f7GoMrLxVJeafDYIDum3UmHnSkW
	9Ba5yDO5Ahk0C1d1BTUmW5B+ya5AkYiZ6FtrW0LxXbup+aLnH0CpdS4Bv3wKiTr/8Fa8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179730-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179730: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b17a3a133b18fb41493fba7d86e9b5804ea6a8cf
X-Osstest-Versions-That:
    ovmf=410ca0ff94a42ee541dd6ceab70ea974eeb7e500
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Mar 2023 23:09:50 +0000

flight 179730 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179730/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b17a3a133b18fb41493fba7d86e9b5804ea6a8cf
baseline version:
 ovmf                 410ca0ff94a42ee541dd6ceab70ea974eeb7e500

Last test of basis   179713  2023-03-17 08:15:15 Z    0 days
Testing same since   179730  2023-03-17 18:22:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@quicinc.com>

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
   410ca0ff94..b17a3a133b  b17a3a133b18fb41493fba7d86e9b5804ea6a8cf -> xen-tested-master

