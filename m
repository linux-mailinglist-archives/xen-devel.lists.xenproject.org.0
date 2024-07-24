Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4A93AC41
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 07:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763712.1174011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUe1-0001l6-SH; Wed, 24 Jul 2024 05:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763712.1174011; Wed, 24 Jul 2024 05:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUe1-0001iX-PN; Wed, 24 Jul 2024 05:34:33 +0000
Received: by outflank-mailman (input) for mailman id 763712;
 Wed, 24 Jul 2024 05:34:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWUe0-0001iN-I2; Wed, 24 Jul 2024 05:34:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWUe0-0005pD-Bf; Wed, 24 Jul 2024 05:34:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWUdz-0004KJ-RM; Wed, 24 Jul 2024 05:34:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWUdz-0000HV-Qx; Wed, 24 Jul 2024 05:34:31 +0000
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
	bh=Ow9NqmeKBXSrkgIY1ygwokILrj+3EMF9iKmwOlPtiM0=; b=W8YMVqPl3/lWRFgRqyoLO0ilv/
	Jw9k2ohuxiO1R5Y2dFYh0kuKflE/SXmzGwqhd2Kak+/7e8+6PeMZgquQqqCv61tEtSAgm/NilgnzQ
	2+RDUkvF4t3g9SgjQxSCIvGYe12N7XWmJsrn7NgPQMABdV4mxOGN4QQ8xI6sJJyAVyOQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186975-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186975: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9bc7a361200215fc5065dfaa6d90d4eb50fec00c
X-Osstest-Versions-That:
    ovmf=f5901ff2a472a5418ee6ff790c3b86cf9c3f54f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jul 2024 05:34:31 +0000

flight 186975 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186975/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9bc7a361200215fc5065dfaa6d90d4eb50fec00c
baseline version:
 ovmf                 f5901ff2a472a5418ee6ff790c3b86cf9c3f54f1

Last test of basis   186972  2024-07-23 17:11:27 Z    0 days
Testing same since   186975  2024-07-24 03:15:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   f5901ff2a4..9bc7a36120  9bc7a361200215fc5065dfaa6d90d4eb50fec00c -> xen-tested-master

