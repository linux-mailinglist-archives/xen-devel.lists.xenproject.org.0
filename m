Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076A1F1346
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:11:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBvw-0000tH-MS; Mon, 08 Jun 2020 07:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Py4y=7V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jiBvw-0000tC-4K
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:11:00 +0000
X-Inumbo-ID: 31622794-a957-11ea-96fb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31622794-a957-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ro5kyLqKFxon7E+ohRMnBdYEG3ywjT8M+mRM2Z1flRE=; b=PhuBr11iHjwrG/2x5XQRU2k+8
 mOTOdEKe89uZU8rtBLdt87cJmqX9FKlAisZ/jRe7py4bTOisqG09vmDCPHVjY9TFOF6l9sMJGR7Td
 IzNJIY9Z260y3TfUIW3N9p12+muimZvCPll+sYi0AoGrs8vuhv8uMVUEaVm60T3mBqh4I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiBvp-0000NW-Oc; Mon, 08 Jun 2020 07:10:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiBvp-0003w7-D2; Mon, 08 Jun 2020 07:10:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jiBvp-0004pn-CV; Mon, 08 Jun 2020 07:10:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150917-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150917: all pass - PUSHED
X-Osstest-Versions-This: ovmf=6ff7c838d09224dd4e4c9b5b93152d8db1b19740
X-Osstest-Versions-That: ovmf=cfd73e0065f523e1d56bb32b5c9d48e162c903f8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jun 2020 07:10:53 +0000
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

flight 150917 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150917/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ff7c838d09224dd4e4c9b5b93152d8db1b19740
baseline version:
 ovmf                 cfd73e0065f523e1d56bb32b5c9d48e162c903f8

Last test of basis   150911  2020-06-07 20:10:10 Z    0 days
Testing same since   150917  2020-06-08 01:40:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>

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
   cfd73e0065..6ff7c838d0  6ff7c838d09224dd4e4c9b5b93152d8db1b19740 -> xen-tested-master

