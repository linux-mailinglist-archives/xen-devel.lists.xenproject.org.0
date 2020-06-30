Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE56C20EDFC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 08:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq9LZ-0007az-1r; Tue, 30 Jun 2020 06:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETQf=AL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jq9LX-0007ac-91
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 06:02:19 +0000
X-Inumbo-ID: 3df482a8-ba97-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3df482a8-ba97-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 06:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PmlWXP1COLyczFfArJg3FSAnbEmzpnz680fkDjIgmIQ=; b=HorUBTpAjOYJQk/WZNidZYxgp
 NUXZ4NsYYzQvWMTERU8J46iMcgZchZD3EwnXioidQe2dOM9pdusZeXOoMc+T3obgoGnqZQAtNamPO
 HdL1Yn0nLLviadCkp49x0mVHhfmaa8nMne+jithPxzWXhyNKPfkMuAvCybXIK+lYfp7yU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jq9LQ-0000Ry-JA; Tue, 30 Jun 2020 06:02:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jq9LP-0001Mh-VP; Tue, 30 Jun 2020 06:02:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jq9LP-0002eS-Uk; Tue, 30 Jun 2020 06:02:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151465-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151465: all pass - PUSHED
X-Osstest-Versions-This: ovmf=00217f1919270007d7a911f89b32e39b9dcaa907
X-Osstest-Versions-That: ovmf=0f01cec52f4794777feb067e4fa0bfcedfdc124e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jun 2020 06:02:11 +0000
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

flight 151465 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151465/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 00217f1919270007d7a911f89b32e39b9dcaa907
baseline version:
 ovmf                 0f01cec52f4794777feb067e4fa0bfcedfdc124e

Last test of basis   151451  2020-06-29 10:12:21 Z    0 days
Testing same since   151465  2020-06-30 01:43:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tomas Pilar <tomas.pilar@arm.com>

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
   0f01cec52f..00217f1919  00217f1919270007d7a911f89b32e39b9dcaa907 -> xen-tested-master

