Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2061B6B19
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 04:12:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRnnm-0005qY-T5; Fri, 24 Apr 2020 02:10:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzFP=6I=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRnnl-0005qT-1z
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 02:10:49 +0000
X-Inumbo-ID: cd5292d8-85d0-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5292d8-85d0-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9DOIxZLG8hCICvTA1wUX0g2FpSRn0N30cLqN7SGTwE=; b=Oco6dWvYry7F1YfupKA1Nu9bj
 GANMR+qxRku0RMtVsGiq/ZeABlZd0okhKz9M0rqHSt80fXWuOtlVh05sYR0NVhLVf8JtDP7JvHRM9
 MbCxREz0L2JLlpeXHifvf/b1a9A/8KRsXOv3/cwbW1qZ+a3y4PiHU//JfrS9rL/6zgy9E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRnnf-0002Nt-4R; Fri, 24 Apr 2020 02:10:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRnne-0003dg-QW; Fri, 24 Apr 2020 02:10:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRnne-0006Hc-Ph; Fri, 24 Apr 2020 02:10:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149766-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149766: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d5339c04d7cd47c061ec146a7b062052e3dc56ca
X-Osstest-Versions-That: ovmf=3a3a3af4a29ee36b1db11842d40b74f2de892a35
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Apr 2020 02:10:42 +0000
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

flight 149766 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149766/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d5339c04d7cd47c061ec146a7b062052e3dc56ca
baseline version:
 ovmf                 3a3a3af4a29ee36b1db11842d40b74f2de892a35

Last test of basis   149747  2020-04-23 07:21:34 Z    0 days
Testing same since   149766  2020-04-23 14:40:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>

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
   3a3a3af4a2..d5339c04d7  d5339c04d7cd47c061ec146a7b062052e3dc56ca -> xen-tested-master

