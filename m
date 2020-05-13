Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA11D0581
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 05:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYi1x-0003O4-Nc; Wed, 13 May 2020 03:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Rkd=63=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYi1w-0003Nz-KF
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 03:26:00 +0000
X-Inumbo-ID: 73ddd552-94c9-11ea-a32d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73ddd552-94c9-11ea-a32d-12813bfff9fa;
 Wed, 13 May 2020 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9sNziLhxj8nr7Rcvw33DcqLhDXwvR5l/ByZj8olgza0=; b=OGRHRBMsAFBf68mevNtmPvE36
 DqJFoC/aUPPMo+eRt4nClQ30Ochv3UlfzeHowTeKzNgB5eWSEacM3tgIbH3OZJ8r6MzgI1orTWjNt
 OT4z0KKUW7H77bVO3v3gpxy6iWHhWzVkKbpzyxHvJ7R0N1s/4f8YdPuQlIs7Ccws8dox4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYi1p-0002DN-Vd; Wed, 13 May 2020 03:25:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYi1p-0005cl-LC; Wed, 13 May 2020 03:25:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYi1p-0006K3-JB; Wed, 13 May 2020 03:25:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150152: all pass - PUSHED
X-Osstest-Versions-This: ovmf=88899a372cfc44f8612315f4b43a084d1814fe69
X-Osstest-Versions-That: ovmf=9378310dd877b99be1da398f39e82e0501aca372
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 May 2020 03:25:53 +0000
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

flight 150152 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150152/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 88899a372cfc44f8612315f4b43a084d1814fe69
baseline version:
 ovmf                 9378310dd877b99be1da398f39e82e0501aca372

Last test of basis   150141  2020-05-11 19:39:25 Z    1 days
Testing same since   150152  2020-05-12 19:39:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>

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
   9378310dd8..88899a372c  88899a372cfc44f8612315f4b43a084d1814fe69 -> xen-tested-master

