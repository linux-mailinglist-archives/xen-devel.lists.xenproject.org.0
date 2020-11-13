Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8E2B1A06
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 12:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26398.54739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdXEs-0000T5-Ch; Fri, 13 Nov 2020 11:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26398.54739; Fri, 13 Nov 2020 11:27:34 +0000
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
	id 1kdXEs-0000Sf-95; Fri, 13 Nov 2020 11:27:34 +0000
Received: by outflank-mailman (input) for mailman id 26398;
 Fri, 13 Nov 2020 11:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RH3y=ET=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdXEq-0000SY-MD
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:27:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33315b81-0e95-43f5-9b35-fdafbd1ca51c;
 Fri, 13 Nov 2020 11:27:31 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdXEo-0007O7-VC; Fri, 13 Nov 2020 11:27:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdXEo-0000pW-OV; Fri, 13 Nov 2020 11:27:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdXEo-0001KG-O1; Fri, 13 Nov 2020 11:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RH3y=ET=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdXEq-0000SY-MD
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:27:32 +0000
X-Inumbo-ID: 33315b81-0e95-43f5-9b35-fdafbd1ca51c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 33315b81-0e95-43f5-9b35-fdafbd1ca51c;
	Fri, 13 Nov 2020 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=T1QE0mMsHqyQE+mb3VTnPTrgHqCGBc6KTAtVF8B0Upk=; b=V+ysMDhGysyCynpKEf8SMxMeDO
	5EiVJVG2RNb5gfOO4Z8Ot4WpDgX3lUyZ9YWSCoRgCEgaWubLgIranMpq/kN7Jcmt7stxx6gClylTT
	S1pY8Af53ZDYJ3Qj04Kxw97KVQQiNZuRmut5YI1C6TmeWHQBKp26PXgORzdy1G08XC40=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdXEo-0007O7-VC; Fri, 13 Nov 2020 11:27:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdXEo-0000pW-OV; Fri, 13 Nov 2020 11:27:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdXEo-0001KG-O1; Fri, 13 Nov 2020 11:27:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156720-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156720: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=544cb0132dc1778b9e791202995533523fa6cccd
X-Osstest-Versions-That:
    ovmf=1c48866e041d2afaabb170086c5bb0c69a4653d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Nov 2020 11:27:30 +0000

flight 156720 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156720/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 544cb0132dc1778b9e791202995533523fa6cccd
baseline version:
 ovmf                 1c48866e041d2afaabb170086c5bb0c69a4653d3

Last test of basis   156684  2020-11-11 12:14:13 Z    1 days
Testing same since   156720  2020-11-12 16:00:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  gechao <gechao@greatwall.com.cn>

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
   1c48866e04..544cb0132d  544cb0132dc1778b9e791202995533523fa6cccd -> xen-tested-master

