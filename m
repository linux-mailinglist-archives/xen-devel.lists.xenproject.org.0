Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E2194E52
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 02:14:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHdWS-00007S-Jq; Fri, 27 Mar 2020 01:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lxlP=5M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jHdWQ-00007N-Be
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 01:10:54 +0000
X-Inumbo-ID: cb00c582-6fc7-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb00c582-6fc7-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 01:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+EwDfnDX/xZGLxEgFLsEFdesTF6a4uCEl9yXpUDR7MY=; b=tij6KHH5vhlNR1anMcR/COWm7
 8GuSGCmpxGd8dzmb9AYt0d1xr411HuUEYX8bXIZ0VIahTbgTH0qCM1xROaWVy2kkAsk/BepZcmUmP
 hEaeTQrgDGj3dUQRWGB5JAGZ38Rs8+8Z6H7egoOFfRSLTnWTasESlOto6xMd+n8ckutRo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHdWK-0001u2-4H; Fri, 27 Mar 2020 01:10:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHdWJ-0006ev-LQ; Fri, 27 Mar 2020 01:10:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jHdWJ-0007to-Kj; Fri, 27 Mar 2020 01:10:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149048-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=f52b30e73ddee9a3a609a6e5aa87e79cf4f50879
X-Osstest-Versions-That: ovmf=e24529a5c324b07dd0e555206b35d1a56be834a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Mar 2020 01:10:47 +0000
Subject: [Xen-devel] [ovmf test] 149048: all pass - PUSHED
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

flight 149048 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149048/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f52b30e73ddee9a3a609a6e5aa87e79cf4f50879
baseline version:
 ovmf                 e24529a5c324b07dd0e555206b35d1a56be834a6

Last test of basis   149012  2020-03-25 10:14:16 Z    1 days
Testing same since   149048  2020-03-26 08:15:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@linaro.org>

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
   e24529a5c3..f52b30e73d  f52b30e73ddee9a3a609a6e5aa87e79cf4f50879 -> xen-tested-master

