Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38E1CB96A
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 23:05:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXABD-0006WC-DV; Fri, 08 May 2020 21:05:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqRt=6W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jXABC-0006W5-7r
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 21:05:10 +0000
X-Inumbo-ID: 93f94b26-916f-11ea-a071-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93f94b26-916f-11ea-a071-12813bfff9fa;
 Fri, 08 May 2020 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QNvYtdR5Uc2Ft2Ku/DDJcDjBPZj6mPOwKe96P4gCJgk=; b=riT0xJmPahodlWBrjYIwvUGgF
 7HEJ9tBy13GEwl8yE+9QSv/4yYEerIM4gmBUc5YGjxcrRaNeiCaN5rZxUByid5nH//5r1Dfr89sfz
 GsZNH5a0iuNYRYpPEnEhetMowR+iih5BVyU1bgtanlw76OT5RXANxIA+TSMEau5G+xptA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXAB1-0001qf-K5; Fri, 08 May 2020 21:04:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jXAB1-0003iV-8m; Fri, 08 May 2020 21:04:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jXAB1-0007NA-89; Fri, 08 May 2020 21:04:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150082-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150082: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3a3713e62cfad00d78bb938b0d9fb1eedaeff314
X-Osstest-Versions-That: ovmf=8293e6766a884918a6b608c64543caab49870597
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 May 2020 21:04:59 +0000
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

flight 150082 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150082/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3a3713e62cfad00d78bb938b0d9fb1eedaeff314
baseline version:
 ovmf                 8293e6766a884918a6b608c64543caab49870597

Last test of basis   150063  2020-05-07 05:27:13 Z    1 days
Testing same since   150082  2020-05-08 04:09:39 Z    0 days    1 attempts

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
   8293e6766a..3a3713e62c  3a3713e62cfad00d78bb938b0d9fb1eedaeff314 -> xen-tested-master

