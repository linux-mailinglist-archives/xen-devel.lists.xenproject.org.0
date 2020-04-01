Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE919A2D5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 02:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJREe-0007qR-7e; Wed, 01 Apr 2020 00:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JcEj=5R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJREc-0007qM-9H
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 00:27:58 +0000
X-Inumbo-ID: a2a300b4-73af-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2a300b4-73af-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 00:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ev8MWHVBObLDhZn6nEqWqmhVHAvsP8A4hmeOZueiCmc=; b=csgTaNEfoDT84ksFpt2HAZdl3
 Q5Uz5MpYEMEiJ6ZTnuQRzwtOi8UAVzRH+o57Ra+5/f86FcXxqe30F139m7Y8mL3zI6C1NtAeVPYCi
 YsDeERQ2gx+4fUnAYd6FSkvmKtvqCwJcO0YQbG9rMA4CWWDrt1SUZHmCSghF6BZ2n8AfQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJREb-000358-3J; Wed, 01 Apr 2020 00:27:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJREa-0002FN-QR; Wed, 01 Apr 2020 00:27:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJREa-0004vz-P0; Wed, 01 Apr 2020 00:27:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149242-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149242: all pass - PUSHED
X-Osstest-Versions-This: ovmf=8c944c938359cffda4c889259b3d2aba69e9ee7b
X-Osstest-Versions-That: ovmf=3000c2963db319d055f474c394b062af910bbb2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Apr 2020 00:27:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149242 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149242/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c944c938359cffda4c889259b3d2aba69e9ee7b
baseline version:
 ovmf                 3000c2963db319d055f474c394b062af910bbb2f

Last test of basis   149207  2020-03-30 12:11:22 Z    1 days
Testing same since   149242  2020-03-31 09:59:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fan, ZhijuX <zhijux.fan@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Liran Alon <liran.alon@oracle.com>
  Maciej Rabeda <maciej.rabeda@linux.intel.com>
  Pete Batard <pete@akeo.ie>
  Zhiju.Fan <zhijux.fan@intel.com>

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
   3000c2963d..8c944c9383  8c944c938359cffda4c889259b3d2aba69e9ee7b -> xen-tested-master

