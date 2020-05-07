Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDB1C94FB
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 17:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWiNd-0005CW-ID; Thu, 07 May 2020 15:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aphx=6V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jWiNc-0005CR-4t
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 15:24:08 +0000
X-Inumbo-ID: ca563e30-9076-11ea-9f3b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca563e30-9076-11ea-9f3b-12813bfff9fa;
 Thu, 07 May 2020 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0r/0VbGtJ55PRX+KBwV+FN6AMsWKsMkkCymabN1qhco=; b=vCJD8S9Bz+uMQFWtW8ZXES6BE
 SC0GsjB4k0nCuOv9yUpLnT1RVOVFQ1KD73eWQDd3t8Kwcq0bvtiKhe0S5DIQtjCG8gnxKzm8THtus
 sW1eH0tLY02beC1g6trMg7ccu9JmSDue+E1eFNgEqjtg17YqT2EvwcblunuDaHvSLMi60=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWiNa-0000tv-6u; Thu, 07 May 2020 15:24:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWiNZ-0004lB-NQ; Thu, 07 May 2020 15:24:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jWiNZ-0001V3-Mn; Thu, 07 May 2020 15:24:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150063-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150063: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8293e6766a884918a6b608c64543caab49870597
X-Osstest-Versions-That: ovmf=f159102a130fac9b416418eb9b6fa35b63426ca5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 May 2020 15:24:05 +0000
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

flight 150063 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150063/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8293e6766a884918a6b608c64543caab49870597
baseline version:
 ovmf                 f159102a130fac9b416418eb9b6fa35b63426ca5

Last test of basis   150050  2020-05-05 20:40:09 Z    1 days
Testing same since   150063  2020-05-07 05:27:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Eric Dong <eric.dong@intel.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Krzysztof Koch <krzysztof.koch@arm.com>
  Kun Qin <kuqin@microsoft.com>
  Leo Duran <leo.duran@amd.com>
  Nikita Leshenko <nikita.leshchenko@oracle.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Wei6 Xu <wei6.xu@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   f159102a13..8293e6766a  8293e6766a884918a6b608c64543caab49870597 -> xen-tested-master

