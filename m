Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53A2630BE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 17:41:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2Cr-0001Iv-Ek; Wed, 09 Sep 2020 15:40:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kG2Cq-0001Iq-2V
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 15:40:20 +0000
X-Inumbo-ID: 06248502-560e-4aaa-9f0f-4b64b209bbcb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06248502-560e-4aaa-9f0f-4b64b209bbcb;
 Wed, 09 Sep 2020 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=i16AXMH0BuQq4LMCot2zQaSUll8/5DRxxpu6yjm0EvI=; b=Ckm3VUEwIK1tb9WqWLkcV7bDzO
 Zhi3mbHz6xh/bKixwdVMJMHkizk+V74+S1qDIFfOua9uWgZJC67klMMmNZ36apf2YypMeuBt8pUm/
 euYgdlTDMJYJiU6S0Iz1ckpmTQ0Ldm+n8taVCO6ndFJGVqQDFwUQyUxBVC1PaM4ahdLo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG2Co-0003Wp-E1; Wed, 09 Sep 2020 15:40:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kG2Co-000678-6c; Wed, 09 Sep 2020 15:40:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kG2Co-0002Ek-68; Wed, 09 Sep 2020 15:40:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154021-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154021: all pass - PUSHED
X-Osstest-Versions-This: ovmf=317d84abe3bfbdff10ae1cc4f38b49307838c6c4
X-Osstest-Versions-That: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 15:40:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154021 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154021/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 317d84abe3bfbdff10ae1cc4f38b49307838c6c4
baseline version:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00

Last test of basis   152863  2020-08-26 16:09:47 Z   13 days
Failing since        152915  2020-08-27 18:09:42 Z   12 days  212 attempts
Testing same since   153990  2020-09-09 01:40:04 Z    0 days   10 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Bob Feng <bob.c.feng@intel.com>
  Guo Dong <guo.dong@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Paul <paul.grimes@amd.com>
  Paul G <paul.grimes@amd.com>
  Qi Zhang <qi1.zhang@intel.com>
  Shenglei Zhang <shenglei.zhang@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>
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
   63d92674d2..317d84abe3  317d84abe3bfbdff10ae1cc4f38b49307838c6c4 -> xen-tested-master

