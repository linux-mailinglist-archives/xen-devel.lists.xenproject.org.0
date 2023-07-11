Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C709074E642
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 07:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561536.877992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ5gh-00056j-0u; Tue, 11 Jul 2023 05:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561536.877992; Tue, 11 Jul 2023 05:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ5gg-000550-TA; Tue, 11 Jul 2023 05:13:22 +0000
Received: by outflank-mailman (input) for mailman id 561536;
 Tue, 11 Jul 2023 05:13:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ5gf-00054q-7v; Tue, 11 Jul 2023 05:13:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ5gf-0004EB-68; Tue, 11 Jul 2023 05:13:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ5ge-0008U1-Sr; Tue, 11 Jul 2023 05:13:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qJ5ge-00021o-SK; Tue, 11 Jul 2023 05:13:20 +0000
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
	bh=Y+zGYVCJH41xS6aBeKkrKZKsFO2m9wiZL78gcSilbMs=; b=0Q3YJFAnhW8A3CtnYqvWIada51
	R3+fwp1dkH/Tgr6WfN9vzvAe4xMemVrg8e7VisjDf0sR+PesVtq4xndJp+TkIRxbPvIhHeh/86/b2
	r30sAmyt3Mm/Zq9TFgZ7sG970PMQ7aPByWSa5flzzht/rFe53bqYbNnvmBeATRkJsVRM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181757-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181757: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=964a4f032dcd15d7b0d9246625b13b71182e4eae
X-Osstest-Versions-That:
    ovmf=63923a5642e86f386a5c719a90cfc6a929ea9cb0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Jul 2023 05:13:20 +0000

flight 181757 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181757/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 964a4f032dcd15d7b0d9246625b13b71182e4eae
baseline version:
 ovmf                 63923a5642e86f386a5c719a90cfc6a929ea9cb0

Last test of basis   181751  2023-07-10 12:40:43 Z    0 days
Testing same since   181757  2023-07-11 03:12:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   63923a5642..964a4f032d  964a4f032dcd15d7b0d9246625b13b71182e4eae -> xen-tested-master

