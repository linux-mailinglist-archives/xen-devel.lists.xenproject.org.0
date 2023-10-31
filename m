Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0B7DD4BD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 18:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625981.975829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsdc-0000MT-MX; Tue, 31 Oct 2023 17:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625981.975829; Tue, 31 Oct 2023 17:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsdc-0000JE-JC; Tue, 31 Oct 2023 17:34:48 +0000
Received: by outflank-mailman (input) for mailman id 625981;
 Tue, 31 Oct 2023 17:34:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxsdb-0000Ip-Kb; Tue, 31 Oct 2023 17:34:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxsdb-0002A2-Bo; Tue, 31 Oct 2023 17:34:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qxsdb-0001wX-3V; Tue, 31 Oct 2023 17:34:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qxsdb-00016g-2q; Tue, 31 Oct 2023 17:34:47 +0000
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
	bh=Jhao03QCYkMKJU8Y3w3dAYS62XaXGXVT8nXiHmwoz1k=; b=y7IVUV3iu6eP5QkjuG3F0HBHmb
	izlyA97SS4LqrsrjGsNMoMuL37Vt1qu7NrCkHPOFBiBetQdX/OX3IphcPDXlosEsKHUY03y3iKzjl
	4NMddiwh6mV4zuyFEdkw0Ziaggq9wSRStu99hcA9TpdK8EEkWO6E8ipgRHngt57baf5A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183639-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183639: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=36812d6c3e0c4402ea90e20566ac80de634d210b
X-Osstest-Versions-That:
    ovmf=a671a14e63fdaa9490e5c61cf11346416f1d1463
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Oct 2023 17:34:47 +0000

flight 183639 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183639/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 36812d6c3e0c4402ea90e20566ac80de634d210b
baseline version:
 ovmf                 a671a14e63fdaa9490e5c61cf11346416f1d1463

Last test of basis   183619  2023-10-30 12:41:05 Z    1 days
Testing same since   183639  2023-10-31 15:12:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Jinlong Xu <jinlong.xu@intel.com>
  Joey Vagedes <joeyvagedes@gmail.com>
  Joey Vagedes <joeyvagedes@microsoft.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   a671a14e63..36812d6c3e  36812d6c3e0c4402ea90e20566ac80de634d210b -> xen-tested-master

