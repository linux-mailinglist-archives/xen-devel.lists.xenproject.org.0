Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED801B5581
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 09:20:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRW9d-0000N4-Gj; Thu, 23 Apr 2020 07:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HETR=6H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRW9c-0000Mv-6j
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 07:20:12 +0000
X-Inumbo-ID: de2347c2-8532-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de2347c2-8532-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4y4ZGDiTEzJr3n0xuSrTaLw8Pvygwy5yikW2bKcOlm0=; b=goMFy2cNqqR3sYapl8Ubo034y
 4SuzkXgWFXXAbL0a2/FR4OoJTWtSBFahkcjDmlNt4SsoXY9Wo9wH5hq3QGr25Vhjh0vVorxfe8uuJ
 7pWWswB9J8UmIBRhbySl0f57z1aT0bPTqfJIHn38i9LsXmvMcpOFL3p9Qds0+Mf4+cUt8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRW9a-00049z-RO; Thu, 23 Apr 2020 07:20:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRW9a-0007V9-Ap; Thu, 23 Apr 2020 07:20:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRW9a-0000tb-AG; Thu, 23 Apr 2020 07:20:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149742-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149742: all pass - PUSHED
X-Osstest-Versions-This: ovmf=93f6df5f3b2553b8f5188d2a6ba70f3f5cfab0bb
X-Osstest-Versions-That: ovmf=c6a60cf4b99069f55325675c7c7e98b510f4b224
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Apr 2020 07:20:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149742 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149742/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 93f6df5f3b2553b8f5188d2a6ba70f3f5cfab0bb
baseline version:
 ovmf                 c6a60cf4b99069f55325675c7c7e98b510f4b224

Last test of basis   149735  2020-04-22 11:21:30 Z    0 days
Testing same since   149742  2020-04-22 23:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   c6a60cf4b9..93f6df5f3b  93f6df5f3b2553b8f5188d2a6ba70f3f5cfab0bb -> xen-tested-master

