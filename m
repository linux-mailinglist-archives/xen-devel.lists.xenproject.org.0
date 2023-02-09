Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A668FE42
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 05:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492137.761569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPyHY-000681-Dg; Thu, 09 Feb 2023 04:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492137.761569; Thu, 09 Feb 2023 04:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPyHY-00066A-Ar; Thu, 09 Feb 2023 04:11:36 +0000
Received: by outflank-mailman (input) for mailman id 492137;
 Thu, 09 Feb 2023 04:11:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPyHW-00065y-9z; Thu, 09 Feb 2023 04:11:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPyHW-0007BT-3h; Thu, 09 Feb 2023 04:11:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPyHV-0000qH-QH; Thu, 09 Feb 2023 04:11:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pPyHV-0006O3-Po; Thu, 09 Feb 2023 04:11:33 +0000
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
	bh=geHwqx8olYO4+gBygvy8X7JzjHS604izARRh0neb1s0=; b=QWxNZJSVSGjP4M1Qa/gfnLd8Bt
	5RTywPfzdwIO0Nsl4M9EDerzdW81iQO7JtjopganIyOw9+HRrZMd5hBl0bMWdA2y101HOrM84I+L8
	VEA7xmDHKtfmaCSNQrDf6l7Xd0zq1Vrh97c8mj+LanUPSVD5C5FK4RPwd9+XxcM/yIMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176694-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176694: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f6ce1a5cd8932844ec24701d158254ccf75b6159
X-Osstest-Versions-That:
    ovmf=b59e6fdae2545b45c36c8c5373f4b858fb83c8cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Feb 2023 04:11:33 +0000

flight 176694 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176694/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f6ce1a5cd8932844ec24701d158254ccf75b6159
baseline version:
 ovmf                 b59e6fdae2545b45c36c8c5373f4b858fb83c8cd

Last test of basis   176670  2023-02-08 20:40:45 Z    0 days
Testing same since   176694  2023-02-09 02:10:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Deric Cole <deric.cole@intel.com>

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
   b59e6fdae2..f6ce1a5cd8  f6ce1a5cd8932844ec24701d158254ccf75b6159 -> xen-tested-master

