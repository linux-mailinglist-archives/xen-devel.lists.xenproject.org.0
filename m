Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F1191469
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:30:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlRr-0005oV-Vh; Tue, 24 Mar 2020 15:26:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H+Hk=5J=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGlRp-0005oQ-QZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:26:33 +0000
X-Inumbo-ID: d756795c-6de3-11ea-8451-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d756795c-6de3-11ea-8451-12813bfff9fa;
 Tue, 24 Mar 2020 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DID5VvPZlsM/bMJBi12T2+9irPyUAxjwOMSlvSkbYi0=; b=RFc5to1g9cZF0y/RggnaYWelT
 F2b3sOacZ68TuoqH1I/pkEdTibDzxOGeNzQZhK9swrdgces/vnsUl2SOYgewvVkJ7A8OvPBLetE4b
 99jwuSC1flnepOW4pfe+a4bAyp9SjMdtAbPv0dhBIl9GuZfxp3Xxzj0Jy4L6GaMSkAOI4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGlRo-000828-Eh; Tue, 24 Mar 2020 15:26:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGlRo-00034g-0l; Tue, 24 Mar 2020 15:26:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGlRo-0005JO-0D; Tue, 24 Mar 2020 15:26:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=2f524a745e23e1b4c73ea22b058492bfe4af84c2
X-Osstest-Versions-That: ovmf=0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Mar 2020 15:26:32 +0000
Subject: [Xen-devel] [ovmf test] 148946: all pass - PUSHED
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

flight 148946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/148946/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2f524a745e23e1b4c73ea22b058492bfe4af84c2
baseline version:
 ovmf                 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc

Last test of basis   148761  2020-03-19 17:39:22 Z    4 days
Testing same since   148946  2020-03-24 02:46:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fan, ZhijuX <zhijux.fan@intel.com>
  Zhiju.Fan <zhijux.fan@intel.com>

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
   0c8ea9fe1a..2f524a745e  2f524a745e23e1b4c73ea22b058492bfe4af84c2 -> xen-tested-master

