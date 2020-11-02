Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73012A32BB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 19:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17878.42640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZeOs-0002T9-Jr; Mon, 02 Nov 2020 18:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17878.42640; Mon, 02 Nov 2020 18:17:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZeOs-0002Sk-Gc; Mon, 02 Nov 2020 18:17:50 +0000
Received: by outflank-mailman (input) for mailman id 17878;
 Mon, 02 Nov 2020 18:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jo9=EI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kZeOq-0002Sf-Gi
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 18:17:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c51f87a7-a8e4-4aa0-ae1b-148342c08d89;
 Mon, 02 Nov 2020 18:17:47 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZeOo-0006Vk-N0; Mon, 02 Nov 2020 18:17:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZeOo-0006Ep-E6; Mon, 02 Nov 2020 18:17:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kZeOo-0000rW-Db; Mon, 02 Nov 2020 18:17:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7jo9=EI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kZeOq-0002Sf-Gi
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 18:17:48 +0000
X-Inumbo-ID: c51f87a7-a8e4-4aa0-ae1b-148342c08d89
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c51f87a7-a8e4-4aa0-ae1b-148342c08d89;
	Mon, 02 Nov 2020 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=xen3E4pcb4uCRimPPoNVOFSmHC8/As9wM+MeeXkA5jg=; b=G1GdXP9eQMHL+T4s0DwbBNXO3v
	xJ6+5t1Kr6KZdt2R8kYr3frG0GVfqhKo+Cp12ZP+7Tio04Zwrk+VrzE3vN9V+Dbj83Ooy9k50BQNV
	sAHWEdy/1oPzV64PkKhlp49HKiLQrBda16BB0jEjmE9WGuAys6nnhjRYvnJyAVelP2Kk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZeOo-0006Vk-N0; Mon, 02 Nov 2020 18:17:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZeOo-0006Ep-E6; Mon, 02 Nov 2020 18:17:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZeOo-0000rW-Db; Mon, 02 Nov 2020 18:17:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156359-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156359: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ffddac3e0f2e0af54b48a86848193a5ad30def10
X-Osstest-Versions-That:
    ovmf=2363c6926098ee5c75c8780d07f88f5c21010683
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Nov 2020 18:17:46 +0000

flight 156359 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156359/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ffddac3e0f2e0af54b48a86848193a5ad30def10
baseline version:
 ovmf                 2363c6926098ee5c75c8780d07f88f5c21010683

Last test of basis   156353  2020-11-02 01:40:58 Z    0 days
Testing same since   156359  2020-11-02 08:43:26 Z    0 days    1 attempts

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
   2363c69260..ffddac3e0f  ffddac3e0f2e0af54b48a86848193a5ad30def10 -> xen-tested-master

