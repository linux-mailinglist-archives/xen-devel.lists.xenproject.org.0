Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBD5ED335
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 05:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413106.656611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odNKm-0002HF-3b; Wed, 28 Sep 2022 03:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413106.656611; Wed, 28 Sep 2022 03:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odNKl-0002F0-W0; Wed, 28 Sep 2022 03:02:03 +0000
Received: by outflank-mailman (input) for mailman id 413106;
 Wed, 28 Sep 2022 03:02:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odNKk-0002Eq-5m; Wed, 28 Sep 2022 03:02:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odNKk-0001MY-41; Wed, 28 Sep 2022 03:02:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odNKj-0004vs-Mg; Wed, 28 Sep 2022 03:02:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1odNKj-0007xA-MI; Wed, 28 Sep 2022 03:02:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=0+xWkE8mDFoiYBuHVN5myvrZUjRSU1nvRF4e8HSsOQA=; b=Fwdhs/8Yh9k2GjTZ/VKCZkOF1K
	NWvM2EFyL6pFRe1HNMtcJ0mc3Hsr/OPuog3JpYY6K01z9+kAZxx36gUP5Co7xfUwjf0li+ali5SKw
	haNFOu2Rb1TcX3rTGSE5YRAaiQZexJuKivjX+RWsfNPKnhPKpkXkEWRc7PT06B7cUYYY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173341-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173341: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f4d539007c706ad9a563f368720edf0920da925d
X-Osstest-Versions-That:
    ovmf=b3dd9cb836e2aed68198aa79a1ca6afdb25adf80
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Sep 2022 03:02:01 +0000

flight 173341 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173341/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f4d539007c706ad9a563f368720edf0920da925d
baseline version:
 ovmf                 b3dd9cb836e2aed68198aa79a1ca6afdb25adf80

Last test of basis   173323  2022-09-27 03:13:30 Z    0 days
Testing same since   173341  2022-09-28 00:40:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   b3dd9cb836..f4d539007c  f4d539007c706ad9a563f368720edf0920da925d -> xen-tested-master

