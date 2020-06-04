Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84721EDA20
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 02:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jge2Y-0003Cc-QP; Thu, 04 Jun 2020 00:47:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmD4=7R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jge2X-0003CX-Ng
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 00:47:25 +0000
X-Inumbo-ID: f4d4dfea-a5fc-11ea-ade3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4d4dfea-a5fc-11ea-ade3-12813bfff9fa;
 Thu, 04 Jun 2020 00:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxch3F3T3jroPzPBnscaEsJ5/G/fsUmzIBEqKuEiyCc=; b=NtPDq4+uGCBVyrcj6h6CquMfj
 yJNSBAXRrbz7PvPZzTK+aNXBDFXSvZ/fL1Qa4OkdkQjgr5fWtBb9FtDQXNPP7CZ2t//fo6507a7Tw
 w6/0EJIQ8R5Jkw/XwxCnaVLebcbRukTucD3h0vEDjzd1UOf/0vVqMIM0gdM8y5eaTi93M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jge2W-0003h8-88; Thu, 04 Jun 2020 00:47:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jge2W-0005MZ-02; Thu, 04 Jun 2020 00:47:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jge2V-0002Wl-Va; Thu, 04 Jun 2020 00:47:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150667-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 150667: all pass - PUSHED
X-Osstest-Versions-This: xtf=cce0ffab7cc43c810580889a197662d77f2d8ebd
X-Osstest-Versions-That: xtf=9d934985adb9eb8290e62df187e044105c9dd6b8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jun 2020 00:47:23 +0000
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

flight 150667 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150667/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  cce0ffab7cc43c810580889a197662d77f2d8ebd
baseline version:
 xtf                  9d934985adb9eb8290e62df187e044105c9dd6b8

Last test of basis   147207  2020-02-17 18:39:34 Z  107 days
Testing same since   150667  2020-06-03 21:09:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Pawel Wieczorkiewicz <wipawel@amazon.de>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   9d93498..cce0ffa  cce0ffab7cc43c810580889a197662d77f2d8ebd -> xen-tested-master

