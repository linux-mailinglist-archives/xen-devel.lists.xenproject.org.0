Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD91724811
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 17:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544112.849648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Yq1-0005jl-2T; Tue, 06 Jun 2023 15:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544112.849648; Tue, 06 Jun 2023 15:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Yq0-0005i5-VM; Tue, 06 Jun 2023 15:43:12 +0000
Received: by outflank-mailman (input) for mailman id 544112;
 Tue, 06 Jun 2023 15:43:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6Ypz-0005hv-8v; Tue, 06 Jun 2023 15:43:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6Ypy-0007Ks-Vh; Tue, 06 Jun 2023 15:43:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6Ypy-0003nG-Ka; Tue, 06 Jun 2023 15:43:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6Ypy-0006Sl-Js; Tue, 06 Jun 2023 15:43:10 +0000
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
	bh=l0hSMazes7cAPvCAggqaNOeG0l4Dnong16f9GR7VAII=; b=NiBqalFXl02kRFIdCdSp2aU4PP
	70ETn3sNegvaNU4h4FXjWeD7sUrfSjj2DWRf2fA0Gd/YmbU5fmiGED+z5vod53iTh1F0CvBgNeCWz
	Q/YJ7T8eq+aF1f8fVm6MhHdeoI5ryNOvZQxDM8XPjPlWH5ZV1yeXdySeMjARP+l4nZbE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181213-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181213: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4bd0849d81b48233196092868081315ec4d9233d
X-Osstest-Versions-That:
    ovmf=c1dd400a13d1a5e862809c55f6760ba3a944a609
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jun 2023 15:43:10 +0000

flight 181213 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181213/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4bd0849d81b48233196092868081315ec4d9233d
baseline version:
 ovmf                 c1dd400a13d1a5e862809c55f6760ba3a944a609

Last test of basis   181127  2023-06-03 00:10:43 Z    3 days
Testing same since   181213  2023-06-06 11:11:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Peter Grehan <grehan@freebsd.org>

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
   c1dd400a13..4bd0849d81  4bd0849d81b48233196092868081315ec4d9233d -> xen-tested-master

