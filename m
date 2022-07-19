Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C257912E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 05:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370292.601961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDdeD-0000Xq-1k; Tue, 19 Jul 2022 03:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370292.601961; Tue, 19 Jul 2022 03:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDdeC-0000US-Uv; Tue, 19 Jul 2022 03:11:44 +0000
Received: by outflank-mailman (input) for mailman id 370292;
 Tue, 19 Jul 2022 03:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDdeB-0000UG-Hh; Tue, 19 Jul 2022 03:11:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDdeB-00051D-Et; Tue, 19 Jul 2022 03:11:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDdeB-0000Ch-0w; Tue, 19 Jul 2022 03:11:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oDdeB-0007WU-0P; Tue, 19 Jul 2022 03:11:43 +0000
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
	bh=+uhPXi5UiKrhT400j8X4MzCYPP3/ptAipKsX3ixNTmw=; b=RK/ytLt47Yc5QVM/NUCRe+xlcg
	yx8JkVtq2JMJZKw53ZlMlmJsBOp4P1d5RP5qVVgjENnlCBtfezIoroWsdV8JJE5CA6AtZZYjhIdd6
	OVnp72xco3ZVP+SSbgMFKshrVz8Qxqjhup2Zqm26YHSGVP1uG7m0iu0uKIP3HwabVMO8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171677-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171677: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e21b2039112eeba9a93fdd7b70329a07a79c8f0e
X-Osstest-Versions-That:
    ovmf=586b4a104bfeae277ce16687f852c4f26c4a3b73
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jul 2022 03:11:43 +0000

flight 171677 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171677/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e21b2039112eeba9a93fdd7b70329a07a79c8f0e
baseline version:
 ovmf                 586b4a104bfeae277ce16687f852c4f26c4a3b73

Last test of basis   171675  2022-07-18 21:11:53 Z    0 days
Testing same since   171677  2022-07-19 01:11:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  James Lu <james.lu@intel.com>

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
   586b4a104b..e21b203911  e21b2039112eeba9a93fdd7b70329a07a79c8f0e -> xen-tested-master

