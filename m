Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1611B431C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 13:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRDQ0-0007xG-8i; Wed, 22 Apr 2020 11:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GuZW=6G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRDPy-0007xB-GQ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 11:19:50 +0000
X-Inumbo-ID: 2b0dc236-848b-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b0dc236-848b-11ea-9e09-bc764e2007e4;
 Wed, 22 Apr 2020 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AqOxmstzLKpNFy3WEwwajuEeQ7vUM5/UPPJOFcxe2bw=; b=XQJGfqRuEGuLMcrDp+umcD3t6
 M9dNnjAArYZrU3QyRqpHaDCcO+5bgg5dkYHutZBf99TjnvGzboyu7IPYfCZ+5mNcjnNFTzp2xrwFk
 hoHSHG0NHOFZkdrBxjWpZGyvvasXfR8p0rcUZANjL0LHJ4MBXDNthbTtTb8jS0hm8JbKo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRDPs-00049q-Eb; Wed, 22 Apr 2020 11:19:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRDPs-0008SA-1i; Wed, 22 Apr 2020 11:19:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRDPs-0004vH-14; Wed, 22 Apr 2020 11:19:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149725-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149725: all pass - PUSHED
X-Osstest-Versions-This: ovmf=b447a20bdfb2ff24ba048bb3026c902c4768a7e9
X-Osstest-Versions-That: ovmf=6e3c834ae47d1201c4ddcc6a6adc5e44718c7617
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Apr 2020 11:19:44 +0000
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

flight 149725 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149725/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b447a20bdfb2ff24ba048bb3026c902c4768a7e9
baseline version:
 ovmf                 6e3c834ae47d1201c4ddcc6a6adc5e44718c7617

Last test of basis   149708  2020-04-21 10:39:57 Z    1 days
Testing same since   149725  2020-04-21 20:09:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Hao A Wu <hao.a.wu@intel.com>
  Samer El-Haj-Mahmoud <samer@elhajmahmoud.com>

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
   6e3c834ae4..b447a20bdf  b447a20bdfb2ff24ba048bb3026c902c4768a7e9 -> xen-tested-master

