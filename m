Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D291C8180
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 07:25:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWZ2N-0003xn-Pg; Thu, 07 May 2020 05:25:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aphx=6V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jWZ2M-0003xi-TX
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 05:25:34 +0000
X-Inumbo-ID: 2c927518-9023-11ea-9edf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c927518-9023-11ea-9edf-12813bfff9fa;
 Thu, 07 May 2020 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuD1ErAqNR2kCDx9Srm+tHDg3JUhN5r/9xJanYeWR+s=; b=fTa30iTI6cm68MzCtDnmPt2kA
 5Bsu7ApXn8UZe529lUVeT980nTGNfiR9KAUUb8Ay6F2832KFxpfXh9+859yPPDMUu8RZurgjazLko
 y6rhnBVPQYVKWDDWPGQYmzh+FX5lLhdY11YhMSm/WBDBS5ZpSfrsQIrsmlF2m/02RzSNQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWZ2L-0005oK-A6; Thu, 07 May 2020 05:25:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWZ2K-00010Y-KF; Thu, 07 May 2020 05:25:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jWZ2K-0001XA-JU; Thu, 07 May 2020 05:25:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150050-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150050: all pass - PUSHED
X-Osstest-Versions-This: ovmf=f159102a130fac9b416418eb9b6fa35b63426ca5
X-Osstest-Versions-That: ovmf=de15e7c2651ada46cc649c5b3c8c0c145354ac04
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 May 2020 05:25:32 +0000
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

flight 150050 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150050/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f159102a130fac9b416418eb9b6fa35b63426ca5
baseline version:
 ovmf                 de15e7c2651ada46cc649c5b3c8c0c145354ac04

Last test of basis   150045  2020-05-05 16:09:42 Z    1 days
Testing same since   150050  2020-05-05 20:40:09 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   de15e7c265..f159102a13  f159102a130fac9b416418eb9b6fa35b63426ca5 -> xen-tested-master

