Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA07D6E62
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622934.970237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveVu-0004ZH-4Y; Wed, 25 Oct 2023 14:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622934.970237; Wed, 25 Oct 2023 14:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveVu-0004WK-1Z; Wed, 25 Oct 2023 14:05:38 +0000
Received: by outflank-mailman (input) for mailman id 622934;
 Wed, 25 Oct 2023 14:05:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qveVs-0004Vw-ID; Wed, 25 Oct 2023 14:05:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qveVs-0002nK-Ah; Wed, 25 Oct 2023 14:05:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qveVr-0005MH-US; Wed, 25 Oct 2023 14:05:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qveVr-0005Fx-Tf; Wed, 25 Oct 2023 14:05:35 +0000
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
	bh=e2jUspQSdCMRX4UV/V1wgNCaCJKGwwSOy6ao8lYRvBA=; b=OnDry4POM3yoGyqbL058PTD7H0
	ZfTCwOomDOviEC7esD/1cw/THes7+LR64zjx1qyHLtejza64UYFXcSgXtZsBn0Ko9Qoi5ESJs/heU
	hDFhR3U8QBroUIw20y05T+6ModeZpF8x4ZJbZj0GTDGfGcyuREuJiXV4qpZE1p+uBGJI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183524-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183524: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1f21e11168dd6a071a92e41ecdffc7cd6e5f3f02
X-Osstest-Versions-That:
    ovmf=d85bf54b7f462eb0297351b5f8dfde09adf617fb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Oct 2023 14:05:35 +0000

flight 183524 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183524/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1f21e11168dd6a071a92e41ecdffc7cd6e5f3f02
baseline version:
 ovmf                 d85bf54b7f462eb0297351b5f8dfde09adf617fb

Last test of basis   183516  2023-10-24 17:13:56 Z    0 days
Testing same since   183524  2023-10-25 10:14:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>
  Abner Chang <abner.chang@amd.com>
  Ceping Sun <cepingx.sun@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Nickle Wang <nicklew@nvidia.com>

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
   d85bf54b7f..1f21e11168  1f21e11168dd6a071a92e41ecdffc7cd6e5f3f02 -> xen-tested-master

