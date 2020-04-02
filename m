Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1883D19CD89
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 01:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK9QW-0002Fs-R3; Thu, 02 Apr 2020 23:39:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9JfQ=5S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jK9QV-0002Fn-I1
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 23:39:11 +0000
X-Inumbo-ID: 265014ec-753b-11ea-bc79-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 265014ec-753b-11ea-bc79-12813bfff9fa;
 Thu, 02 Apr 2020 23:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBBeFo9lJQw6RQPgOhwz+K7RdAx3dVmfwjRWw/yfAgA=; b=DgHqo6OHv+xzn+uQaC2WRgGho
 yS6FJmyriUzf8K/qKGasgHHNkvm3EAFfxhSpmhXMK8BBbsNAlDcUQC88CsZ5NcwELjlDjDjidPcOM
 E7pw/u/7OdZyDZW4aAxUcP2UWBYGtb7ggyI0r6okL9os9g+lsEgdAPknMsQBjI+8hSyGs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jK9QT-0001w4-7X; Thu, 02 Apr 2020 23:39:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jK9QS-0002Dd-SI; Thu, 02 Apr 2020 23:39:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jK9QS-0001ve-Rc; Thu, 02 Apr 2020 23:39:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149325-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149325: all pass - PUSHED
X-Osstest-Versions-This: ovmf=4deef2d865efdc61d1a53ad7bd48f9dd42560b45
X-Osstest-Versions-That: ovmf=e210fc130e5c9738909dca432bbf8bf277ba6e37
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Apr 2020 23:39:08 +0000
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

flight 149325 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149325/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4deef2d865efdc61d1a53ad7bd48f9dd42560b45
baseline version:
 ovmf                 e210fc130e5c9738909dca432bbf8bf277ba6e37

Last test of basis   149292  2020-04-01 15:23:22 Z    1 days
Testing same since   149325  2020-04-02 09:40:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Maciej Rabeda <maciej.rabeda@linux.intel.com>

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
   e210fc130e..4deef2d865  4deef2d865efdc61d1a53ad7bd48f9dd42560b45 -> xen-tested-master

