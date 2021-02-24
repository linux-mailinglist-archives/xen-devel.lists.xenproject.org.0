Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C3324511
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 21:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89501.168642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF0b9-0002oc-GK; Wed, 24 Feb 2021 20:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89501.168642; Wed, 24 Feb 2021 20:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF0b9-0002o7-B5; Wed, 24 Feb 2021 20:17:27 +0000
Received: by outflank-mailman (input) for mailman id 89501;
 Wed, 24 Feb 2021 20:17:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF0b7-0002nz-Il; Wed, 24 Feb 2021 20:17:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF0b7-0005dN-8A; Wed, 24 Feb 2021 20:17:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lF0b7-00039C-0F; Wed, 24 Feb 2021 20:17:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lF0b6-0003py-W2; Wed, 24 Feb 2021 20:17:24 +0000
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
	bh=X5Qkz5en2msTIF9l44TpCLZ3RWAjRJGFLTVFuA70oJg=; b=KZ+1wgOrmApcWgq0HsehrmEqC6
	zYu8zN+qhV5l4758KLiKn5WbfhAySCU5TaX2Osetc+DGom/1sCyoCyiRroxYh0yPP9BV56B6YASZZ
	RokB5Sfmu2e2jnLpdWoFlYGNuL/mQj7nfHVGpRgsjUZmuCcMuDFbJfh01rChCWGAR2gI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159640-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159640: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=35f87da8a2debd443ac842db0a3794b17914a8f4
X-Osstest-Versions-That:
    ovmf=739a506b18c4f694b8d5d2f3424a329c45d737ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 20:17:24 +0000

flight 159640 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159640/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 35f87da8a2debd443ac842db0a3794b17914a8f4
baseline version:
 ovmf                 739a506b18c4f694b8d5d2f3424a329c45d737ba

Last test of basis   159619  2021-02-24 08:09:48 Z    0 days
Testing same since   159640  2021-02-24 17:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Fan Wang <fan.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>

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
   739a506b18..35f87da8a2  35f87da8a2debd443ac842db0a3794b17914a8f4 -> xen-tested-master

