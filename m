Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C2472D12
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 14:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246035.424381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlDK-0003MW-RS; Mon, 13 Dec 2021 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246035.424381; Mon, 13 Dec 2021 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlDK-0003Jf-NG; Mon, 13 Dec 2021 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 246035;
 Mon, 13 Dec 2021 13:17:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwlDJ-0003JF-Dh; Mon, 13 Dec 2021 13:17:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwlDJ-0004ol-76; Mon, 13 Dec 2021 13:17:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mwlDI-0003Dt-UD; Mon, 13 Dec 2021 13:17:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mwlDI-0000SA-Tk; Mon, 13 Dec 2021 13:17:56 +0000
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
	bh=ubtvlIEAFX4HoFEXaZZAtwZ0fRDMoFesrK8qcPcQIGA=; b=3fz+cVwuu/1fRGlq9IIypGs8Ey
	cEOd0dZ9jXHB6+BXnU/8ysaz62KtwlkMKx1pXaI5EMH2UqCqIwSC11v08G2BCqZXawG9ewQPYecZz
	mMy6LPZl8jpJZlKdXCeLkj0FeIcZjcoQr5B0ndDpbohXehnRjLTVbtEpSmGg7Tr6dCvU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167392-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167392: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1203eba58ecfcddf9a9ae164ccf32ca29037af82
X-Osstest-Versions-That:
    ovmf=2686468c437f23e5dbd0a517b04852c3c1f84f39
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Dec 2021 13:17:56 +0000

flight 167392 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167392/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1203eba58ecfcddf9a9ae164ccf32ca29037af82
baseline version:
 ovmf                 2686468c437f23e5dbd0a517b04852c3c1f84f39

Last test of basis   167391  2021-12-13 09:41:34 Z    0 days
Testing same since   167392  2021-12-13 11:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>

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
   2686468c43..1203eba58e  1203eba58ecfcddf9a9ae164ccf32ca29037af82 -> xen-tested-master

