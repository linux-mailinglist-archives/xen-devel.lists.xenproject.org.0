Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7EB8BDA6D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 06:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717862.1120359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Cty-0002Qa-VC; Tue, 07 May 2024 04:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717862.1120359; Tue, 07 May 2024 04:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Cty-0002PI-SW; Tue, 07 May 2024 04:58:06 +0000
Received: by outflank-mailman (input) for mailman id 717862;
 Tue, 07 May 2024 04:58:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Ctx-0002P8-9W; Tue, 07 May 2024 04:58:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Ctx-0004yw-63; Tue, 07 May 2024 04:58:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Ctw-0003pf-Q9; Tue, 07 May 2024 04:58:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s4Ctw-000204-Pj; Tue, 07 May 2024 04:58:04 +0000
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
	bh=4bwWf7J6xbuqf3yvZ3kxg/zWKPbWv8XpiaJez+sK0C0=; b=gg7MSryDmuMj9pAwU2j1cxd+EP
	Hh/nYguUYKaQoIv6rivBfGsDoIPVJ9ynUU5IKSA4Ao9sZ47/mcz8po+YfAUqMXVk/6ih7Y4gIATN6
	jip36OBnCyBmQYtY8JlQlecYtluZxODiHNuq0tVcsQmrudokD4L4oyiKic3dOy0mcPyE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185932-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185932: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c12bbc14900aa5c70eec8c0576757c2182db3d01
X-Osstest-Versions-That:
    ovmf=17f333f2a450656101aa4cb46d24b7cf4ee80ebf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 May 2024 04:58:04 +0000

flight 185932 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185932/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c12bbc14900aa5c70eec8c0576757c2182db3d01
baseline version:
 ovmf                 17f333f2a450656101aa4cb46d24b7cf4ee80ebf

Last test of basis   185931  2024-05-07 00:43:02 Z    0 days
Testing same since   185932  2024-05-07 02:44:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Xianglei Cai <xianglei.cai@intel.com>

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
   17f333f2a4..c12bbc1490  c12bbc14900aa5c70eec8c0576757c2182db3d01 -> xen-tested-master

