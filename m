Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB62B093F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 16:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25953.54042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdF0N-0006Fl-5M; Thu, 12 Nov 2020 15:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25953.54042; Thu, 12 Nov 2020 15:59:23 +0000
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
	id 1kdF0N-0006FM-22; Thu, 12 Nov 2020 15:59:23 +0000
Received: by outflank-mailman (input) for mailman id 25953;
 Thu, 12 Nov 2020 15:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdF0L-0006Eh-2g
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:59:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e30beb5-231d-4b6f-a00b-3171aeed4471;
 Thu, 12 Nov 2020 15:59:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdF0E-0001hJ-IF; Thu, 12 Nov 2020 15:59:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdF0E-0005Jh-Ak; Thu, 12 Nov 2020 15:59:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdF0E-0002sT-8N; Thu, 12 Nov 2020 15:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdF0L-0006Eh-2g
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:59:21 +0000
X-Inumbo-ID: 2e30beb5-231d-4b6f-a00b-3171aeed4471
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2e30beb5-231d-4b6f-a00b-3171aeed4471;
	Thu, 12 Nov 2020 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=WOcKC4Vo+oZ3kPa4sE3xpHjlUYpfGp8FxCLcCygvW9U=; b=hoke+t52phOw/YwxAtLOAN8kLv
	lYAKe4ZN5IyCpSBlRcONvu+IVJJtb7yV9apUZCwxvb62/WMiD1o3xdDKMcV0l4hj29WV3PmNVUuBX
	Iguw05+0Qv/tp1r8RWMcRVsdCC2bPUxgVhMonIxz5js9uGXP3A3rzJTZeDRzcUjLeyr8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdF0E-0001hJ-IF; Thu, 12 Nov 2020 15:59:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdF0E-0005Jh-Ak; Thu, 12 Nov 2020 15:59:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdF0E-0002sT-8N; Thu, 12 Nov 2020 15:59:14 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156684-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156684: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1c48866e041d2afaabb170086c5bb0c69a4653d3
X-Osstest-Versions-That:
    ovmf=8c610e6075f2a200400970698a810a57ad49220e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Nov 2020 15:59:14 +0000

flight 156684 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156684/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1c48866e041d2afaabb170086c5bb0c69a4653d3
baseline version:
 ovmf                 8c610e6075f2a200400970698a810a57ad49220e

Last test of basis   156632  2020-11-10 17:53:05 Z    1 days
Testing same since   156684  2020-11-11 12:14:13 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Albecki, Mateusz <mateusz.albecki@intel.com>
  Eric Dong <eric.dong@intel.com>
  Fan Wang <fan.wang@intel.com>
  Fu Siyuan <siyuan.fu@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Mateusz Albecki <mateusz.albecki@intel.com>
  Ray Ni <ray.ni@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Ting Ye <ting.ye@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Wang Fan <fan.wang@intel.com>
  Wu Jiaxin <jiaxin.wu@intel.com>
  Ye Ting <ting.ye@intel.com>

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
   8c610e6075..1c48866e04  1c48866e041d2afaabb170086c5bb0c69a4653d3 -> xen-tested-master

