Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACD28F4C9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7431.19412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4JU-0005rR-GY; Thu, 15 Oct 2020 14:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7431.19412; Thu, 15 Oct 2020 14:33:04 +0000
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
	id 1kT4JU-0005qb-Cv; Thu, 15 Oct 2020 14:33:04 +0000
Received: by outflank-mailman (input) for mailman id 7431;
 Thu, 15 Oct 2020 14:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kT4JS-0005pI-B5
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:33:02 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea68783-2e07-4701-adb8-2daf48d18d26;
 Thu, 15 Oct 2020 14:32:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4JL-0006S5-Qs; Thu, 15 Oct 2020 14:32:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4JJ-0005FT-AB; Thu, 15 Oct 2020 14:32:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4JJ-00024q-9k; Thu, 15 Oct 2020 14:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kT4JS-0005pI-B5
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:33:02 +0000
X-Inumbo-ID: eea68783-2e07-4701-adb8-2daf48d18d26
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eea68783-2e07-4701-adb8-2daf48d18d26;
	Thu, 15 Oct 2020 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=MhROGmAGfqMP7RpVMQFYiq/GjI4lFXEkmt14cQb0Rz8=; b=Ebo2pB5CFDzWXSvCvuMsME8kKv
	T+EyFvP+DPOx0XbGDn5QokYtM1jlWI0kb4LazP3LwQC5mkHeObzY+vNv2ujdwmRxex1d87yJroJhR
	kM1wDRCdxYA3El5ygGl4srxm/37GeEPQsGIxcYEj5VNnhNpGqr7t8DaEQR6iSM/Lo4TI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4JL-0006S5-Qs; Thu, 15 Oct 2020 14:32:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4JJ-0005FT-AB; Thu, 15 Oct 2020 14:32:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4JJ-00024q-9k; Thu, 15 Oct 2020 14:32:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155837-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155837: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=19c87b7d446c3273e84b238cb02cd1c0ae69c43e
X-Osstest-Versions-That:
    ovmf=b9b7406c43e9d29bde3e9679c1b039cb91109097
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 14:32:53 +0000

flight 155837 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155837/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 19c87b7d446c3273e84b238cb02cd1c0ae69c43e
baseline version:
 ovmf                 b9b7406c43e9d29bde3e9679c1b039cb91109097

Last test of basis   155825  2020-10-15 01:10:19 Z    0 days
Testing same since   155837  2020-10-15 07:14:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Laszlo Ersek <lersek@redhat.com>

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
   b9b7406c43..19c87b7d44  19c87b7d446c3273e84b238cb02cd1c0ae69c43e -> xen-tested-master

