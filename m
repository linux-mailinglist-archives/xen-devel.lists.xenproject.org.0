Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE31A1C69
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 09:13:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM4sz-0007Qb-3P; Wed, 08 Apr 2020 07:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MCEd=5Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jM4sy-0007QW-3O
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 07:12:32 +0000
X-Inumbo-ID: 4cf2822a-7968-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cf2822a-7968-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gjL2vQSGS7iPJ0/fOUmRM9Ceo7XeBTlARZjmpuEXGew=; b=B2C9m3K6moO0xkvq+8KXS6Guo
 J6A+0ncLGBYX5igwPlzS173uqX24B2JurRwwBnKLfvImIu3SHimwuUFdQKxf89kpNv6E8eJVzACEU
 1E0IUypp8GWQuX3y2kZQUeaJ/9cPHsqv6wCIIyMhg9To7lEhL2avwb4VepUd4Qo8lvqmE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jM4sr-0005VY-Uz; Wed, 08 Apr 2020 07:12:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jM4sr-0003o3-Kf; Wed, 08 Apr 2020 07:12:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jM4sr-0002zF-Jx; Wed, 08 Apr 2020 07:12:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149504: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3ab0dadd6618b7808a27e65d83aa3668462afcf2
X-Osstest-Versions-That: ovmf=9bb1f080c45f7253f9270662d55865a8718cebc8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Apr 2020 07:12:25 +0000
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

flight 149504 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149504/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3ab0dadd6618b7808a27e65d83aa3668462afcf2
baseline version:
 ovmf                 9bb1f080c45f7253f9270662d55865a8718cebc8

Last test of basis   149497  2020-04-07 19:10:25 Z    0 days
Testing same since   149504  2020-04-08 01:40:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>
  GuoMinJ <newexplorerj@gmail.com>

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
   9bb1f080c4..3ab0dadd66  3ab0dadd6618b7808a27e65d83aa3668462afcf2 -> xen-tested-master

