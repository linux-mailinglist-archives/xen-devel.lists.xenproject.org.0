Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2868A97A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 11:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489475.757807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOFji-0007MY-DT; Sat, 04 Feb 2023 10:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489475.757807; Sat, 04 Feb 2023 10:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOFji-0007Kf-AW; Sat, 04 Feb 2023 10:25:34 +0000
Received: by outflank-mailman (input) for mailman id 489475;
 Sat, 04 Feb 2023 10:25:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOFjh-0007KV-12; Sat, 04 Feb 2023 10:25:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOFjg-0001xR-VW; Sat, 04 Feb 2023 10:25:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOFjg-0004hY-Ev; Sat, 04 Feb 2023 10:25:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pOFjg-0005Se-EU; Sat, 04 Feb 2023 10:25:32 +0000
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
	bh=T+mupwooxKkUQ8L9IqjcLKH4RiZehVVdJbMrV9SBAEM=; b=058SsWO5j+BvymblKmHSlRkUll
	Dkr2PJa2SdEltx430X5wEBm4UiKeW3swrdkONBWwc4VWdi++d1KyvgEc3izLDA/xCMrPuZI/rc2KE
	D7g1p1dc/Ha0gBxGa9G6KVBBniJuBU4O9wOJAHluxUcDsWeYDQlrq0mabksP6WKXscK0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176359-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176359: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4d37059d8e1eeda124270a158416795605327cbd
X-Osstest-Versions-That:
    ovmf=7623b4bf6a4541b1bc5ad1978f27a55f2fb62c5f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 10:25:32 +0000

flight 176359 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176359/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4d37059d8e1eeda124270a158416795605327cbd
baseline version:
 ovmf                 7623b4bf6a4541b1bc5ad1978f27a55f2fb62c5f

Last test of basis   176356  2023-02-04 01:55:46 Z    0 days
Testing same since   176359  2023-02-04 04:40:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   7623b4bf6a..4d37059d8e  4d37059d8e1eeda124270a158416795605327cbd -> xen-tested-master

