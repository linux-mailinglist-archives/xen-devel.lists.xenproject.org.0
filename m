Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A97447C3C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 09:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223126.385677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0KS-0005QR-JE; Mon, 08 Nov 2021 08:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223126.385677; Mon, 08 Nov 2021 08:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0KS-0005O8-Fp; Mon, 08 Nov 2021 08:48:36 +0000
Received: by outflank-mailman (input) for mailman id 223126;
 Mon, 08 Nov 2021 08:48:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk0KQ-0005Ny-FO; Mon, 08 Nov 2021 08:48:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk0KQ-00037R-BJ; Mon, 08 Nov 2021 08:48:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mk0KQ-0004hu-0I; Mon, 08 Nov 2021 08:48:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mk0KP-00080N-W4; Mon, 08 Nov 2021 08:48:33 +0000
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
	bh=2kyqxfP2rSPq/RBjE73FEoqXphPOzt52/qIIcTqQABw=; b=4ukhKSnLnLBJte/4g86JqMEhSt
	y+x+923jg/7Ym7fGcxEhSSbZRrIiXQSAnk4YxiFsX9yoypJcmEmzon13N1Gkg/fnGYCCBYJuyVztY
	jKEtqFPh3OgiVkxLw+tfZonoOuwdNYxlHfB4CQjcurZZKDxqkfj4La/yAF/ydUgs911U=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166081: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d79df34bebdd87aa01ccf78f541b4ae4c9f68f74
X-Osstest-Versions-That:
    ovmf=4050c873b51f59cb6fcd7665029f931e727e0e4f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Nov 2021 08:48:33 +0000

flight 166081 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166081/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d79df34bebdd87aa01ccf78f541b4ae4c9f68f74
baseline version:
 ovmf                 4050c873b51f59cb6fcd7665029f931e727e0e4f

Last test of basis   166063  2021-11-05 20:10:06 Z    2 days
Testing same since   166081  2021-11-08 03:41:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuwei Chen <yuwei.chen@intel.com>

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
   4050c873b5..d79df34beb  d79df34bebdd87aa01ccf78f541b4ae4c9f68f74 -> xen-tested-master

