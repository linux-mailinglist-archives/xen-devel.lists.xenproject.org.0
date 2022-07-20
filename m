Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C257B4EE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 12:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371487.603432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7Mx-0003D6-02; Wed, 20 Jul 2022 10:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371487.603432; Wed, 20 Jul 2022 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7Mw-0003BL-TP; Wed, 20 Jul 2022 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 371487;
 Wed, 20 Jul 2022 10:55:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE7Mu-0003BB-Rk; Wed, 20 Jul 2022 10:55:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE7Mt-0006f3-Vp; Wed, 20 Jul 2022 10:55:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE7Mt-0003Nt-G7; Wed, 20 Jul 2022 10:55:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oE7Mt-0007EQ-Fg; Wed, 20 Jul 2022 10:55:51 +0000
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
	bh=RV9TIUosqom/DZJGMUjmaW6+n1wSY3WFZPa6wXBI0Rk=; b=ju7yXiwZnCJWEqPZ8Ld9AKLyQh
	vd6Kfhbg4E6dbeYAWYZCUPrEXXIT2/M3SoukFhMUJFiTBUii51AhnxLDb8E3kTAvSD4VEUOR34Wk0
	/1X8DAOaBNSnx/HFVD+kErlWcssOmESlz9NjfhwViUaJeoEla4Mq/aemRU08Iqn/2U18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171703-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171703: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=48249243777882d7d89ca0b86c89e355b5f941f3
X-Osstest-Versions-That:
    ovmf=24eac4caf31afae48349af44588a52783c1819b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jul 2022 10:55:51 +0000

flight 171703 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171703/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 48249243777882d7d89ca0b86c89e355b5f941f3
baseline version:
 ovmf                 24eac4caf31afae48349af44588a52783c1819b8

Last test of basis   171696  2022-07-19 22:40:31 Z    0 days
Testing same since   171703  2022-07-20 07:35:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
  Hongbin1 Zhang <hongbin1.zhang@intel.com>

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
   24eac4caf3..4824924377  48249243777882d7d89ca0b86c89e355b5f941f3 -> xen-tested-master

