Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998323E9A9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 11:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3yEU-0001oj-SG; Fri, 07 Aug 2020 09:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l16/=BR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k3yET-0001oe-09
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 09:00:09 +0000
X-Inumbo-ID: 65eaaea1-c3c9-4d95-ba4f-f9e50b9ed558
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65eaaea1-c3c9-4d95-ba4f-f9e50b9ed558;
 Fri, 07 Aug 2020 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s51XE3ddaoYXVBREoTTdiJ84Ux9ukeDufU0lMiwEsns=; b=hvVofteG/JPFR9mScBcE/5hYA
 zcjDN36c4qOonoh4eZEe5T9BL5hTZntNN4K98kH0lOdjd/RoaW9RJ0JAbgF6qB8JDidDlFkIKZJO0
 aRdy32pjWGFYzTtHt4aQrcPHMB9FmRPimC7I0DHR5ljrALMAmWgXpIO8JDZ50xypmp16A=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3yEQ-0003PX-Uy; Fri, 07 Aug 2020 09:00:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3yEQ-0006rt-JN; Fri, 07 Aug 2020 09:00:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k3yEQ-0004fi-Ip; Fri, 07 Aug 2020 09:00:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152504: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8834e10b30125daa47da9f6c5c1a41b4eafbae7f
X-Osstest-Versions-That: ovmf=e188ecc8b4aed8fdd26b731d43883861f5e5e7b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Aug 2020 09:00:06 +0000
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

flight 152504 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152504/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8834e10b30125daa47da9f6c5c1a41b4eafbae7f
baseline version:
 ovmf                 e188ecc8b4aed8fdd26b731d43883861f5e5e7b4

Last test of basis   152495  2020-08-05 17:41:20 Z    1 days
Testing same since   152504  2020-08-06 12:15:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Peter Grehan <grehan@freebsd.org>
  Rebecca Cran <rebecca@bsdio.com>

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
   e188ecc8b4..8834e10b30  8834e10b30125daa47da9f6c5c1a41b4eafbae7f -> xen-tested-master

