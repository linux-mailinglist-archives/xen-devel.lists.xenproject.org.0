Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EEE2AA7C1
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 20:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21455.47757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbU5h-0008ES-HV; Sat, 07 Nov 2020 19:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21455.47757; Sat, 07 Nov 2020 19:41:37 +0000
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
	id 1kbU5h-0008E3-EN; Sat, 07 Nov 2020 19:41:37 +0000
Received: by outflank-mailman (input) for mailman id 21455;
 Sat, 07 Nov 2020 19:41:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbU5f-0008Dy-OT
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 19:41:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3f61fd5-358c-475f-ae99-c9dfa7244a65;
 Sat, 07 Nov 2020 19:41:34 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbU5e-0005tJ-8i; Sat, 07 Nov 2020 19:41:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbU5d-0000UP-VC; Sat, 07 Nov 2020 19:41:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbU5d-0000nC-Ug; Sat, 07 Nov 2020 19:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbU5f-0008Dy-OT
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 19:41:35 +0000
X-Inumbo-ID: f3f61fd5-358c-475f-ae99-c9dfa7244a65
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3f61fd5-358c-475f-ae99-c9dfa7244a65;
	Sat, 07 Nov 2020 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=+UWCzJHN6n6NXxK0GzKSPtGb9FRjBIEYifOz9T99NAE=; b=w43dxZVkb34hP8zKhpbyGvyDJA
	JXu/KTqxV8mxDjcV66kn77Fwz9TQ2rmMIKOB+a8xwkdnYoxsqSdpHCOsUcpgf1dnT94GkM1Mga1gz
	ztw2Xu/qHMX7pN6hROVscI2sNOVgpry2yqYsn+qmJmXhA/JkVu/yPpbIblqS78wyXGE8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbU5e-0005tJ-8i; Sat, 07 Nov 2020 19:41:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbU5d-0000UP-VC; Sat, 07 Nov 2020 19:41:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbU5d-0000nC-Ug; Sat, 07 Nov 2020 19:41:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 156531: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=f11bbff0c02e3a0b0ca01f0f3458678b7ad5173f
X-Osstest-Versions-That:
    xtf=79d9c62fb0e89dabcda6ba265ed89607be2dedc5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Nov 2020 19:41:33 +0000

flight 156531 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156531/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  f11bbff0c02e3a0b0ca01f0f3458678b7ad5173f
baseline version:
 xtf                  79d9c62fb0e89dabcda6ba265ed89607be2dedc5

Last test of basis   155660  2020-10-10 17:41:44 Z   28 days
Testing same since   156531  2020-11-06 16:10:06 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   79d9c62..f11bbff  f11bbff0c02e3a0b0ca01f0f3458678b7ad5173f -> xen-tested-master

