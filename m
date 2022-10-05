Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526B5F503F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 09:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415851.660520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofyeC-0001YP-7B; Wed, 05 Oct 2022 07:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415851.660520; Wed, 05 Oct 2022 07:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofyeC-0001WR-4P; Wed, 05 Oct 2022 07:16:52 +0000
Received: by outflank-mailman (input) for mailman id 415851;
 Wed, 05 Oct 2022 07:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofyeA-0001WH-PD; Wed, 05 Oct 2022 07:16:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofyeA-0001pj-O4; Wed, 05 Oct 2022 07:16:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofyeA-0002zH-B9; Wed, 05 Oct 2022 07:16:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofyeA-0002Ub-Af; Wed, 05 Oct 2022 07:16:50 +0000
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
	bh=RqYGZgtpMePSsKNPW0vucrIPCcFXIRv6u+HlSE4sMqE=; b=NI7MnvWLyGVBrmvour1DlqB49l
	wEmsbkdrn2JTkkeezdWLAy0pYsnkkrw6aOryQTPrnPDkgv9d2PvV2GByzC8NoXkAz9D7xfwUTgxAy
	g0SniTO8gmQ+QZ0I1kSKallJOGtDOMw27PP4wtw9o+6oyR0B9Ptoaae2pcuFmvvPZg3E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173424-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173424: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1bd2ff18664b9564a5802d0ac153b5023f2fa41e
X-Osstest-Versions-That:
    ovmf=f931506815548cee5a3929856bfc98266c39999c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Oct 2022 07:16:50 +0000

flight 173424 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173424/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1bd2ff18664b9564a5802d0ac153b5023f2fa41e
baseline version:
 ovmf                 f931506815548cee5a3929856bfc98266c39999c

Last test of basis   173420  2022-10-04 19:41:57 Z    0 days
Testing same since   173424  2022-10-05 04:40:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   f931506815..1bd2ff1866  1bd2ff18664b9564a5802d0ac153b5023f2fa41e -> xen-tested-master

