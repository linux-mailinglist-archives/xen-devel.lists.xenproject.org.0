Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D909D290B04
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 19:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8211.21892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTTzQ-0008SG-1q; Fri, 16 Oct 2020 17:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8211.21892; Fri, 16 Oct 2020 17:58:04 +0000
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
	id 1kTTzP-0008Rr-Uj; Fri, 16 Oct 2020 17:58:03 +0000
Received: by outflank-mailman (input) for mailman id 8211;
 Fri, 16 Oct 2020 17:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTTzO-0008Rm-Vm
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 17:58:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88b99e78-afd4-4626-bbca-2e5685717e4f;
 Fri, 16 Oct 2020 17:58:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTTzL-00031Y-TZ; Fri, 16 Oct 2020 17:57:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTTzL-0001zt-MN; Fri, 16 Oct 2020 17:57:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTTzL-0005OE-LU; Fri, 16 Oct 2020 17:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTTzO-0008Rm-Vm
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 17:58:03 +0000
X-Inumbo-ID: 88b99e78-afd4-4626-bbca-2e5685717e4f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 88b99e78-afd4-4626-bbca-2e5685717e4f;
	Fri, 16 Oct 2020 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=QoG77G68HBYAFzkcLUA8BNrjrZ7/WgLbZob3AU0yUPo=; b=Je3RM1ARdLoZjsZu+ZlGg7ZkTx
	L+QIuXMM9mLOMTjCynuXmGFw+16dcDMbXxznzZrYnaSAOA8JtErz04r5Ge9PwGLu0OdO38N/a+nyG
	7HfJ1BormhBRUvptVLv5K4iFGsf9GOPnUf/6xnMMmpo6mcx2dHt1qXkRraVuO9mGtbY4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTTzL-00031Y-TZ; Fri, 16 Oct 2020 17:57:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTTzL-0001zt-MN; Fri, 16 Oct 2020 17:57:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTTzL-0005OE-LU; Fri, 16 Oct 2020 17:57:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155891-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155891: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7d977040bd82b89d1fe5ef32d488bfd10db2dbc
X-Osstest-Versions-That:
    ovmf=d25fd8710d6c8fc11582210fb1f8480c0d98416b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Oct 2020 17:57:59 +0000

flight 155891 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155891/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7d977040bd82b89d1fe5ef32d488bfd10db2dbc
baseline version:
 ovmf                 d25fd8710d6c8fc11582210fb1f8480c0d98416b

Last test of basis   155881  2020-10-16 01:40:02 Z    0 days
Testing same since   155891  2020-10-16 10:41:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   d25fd8710d..a7d977040b  a7d977040bd82b89d1fe5ef32d488bfd10db2dbc -> xen-tested-master

