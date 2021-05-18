Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A130387171
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128698.241564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisdR-0002MI-3D; Tue, 18 May 2021 05:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128698.241564; Tue, 18 May 2021 05:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisdQ-0002Jj-Uc; Tue, 18 May 2021 05:51:16 +0000
Received: by outflank-mailman (input) for mailman id 128698;
 Tue, 18 May 2021 05:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lisdP-0002JZ-Mj; Tue, 18 May 2021 05:51:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lisdP-0003Cc-Ja; Tue, 18 May 2021 05:51:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lisdP-0007jn-4C; Tue, 18 May 2021 05:51:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lisdP-0005qK-3k; Tue, 18 May 2021 05:51:15 +0000
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
	bh=jfetwrJU6bfxQEej+U/c8REmJzV+OC1Yo7USGadVO28=; b=yQuQtQdOVgKXsiydSIUM4EuAPL
	d6YCfqR2YYTcz6mvElxchc5w95ebx1z9byuQBgBuj2EDGUfhuiBzpXQhcLWDuWM9JLcJAA15tfJJS
	CCV3+F+nufTXjaem5i4ZUFZOpAtB3+LPszfjroCfFfIkhXyHsL9sY6vxlSngpWQIDhRA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161987-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161987: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1fbf5e30ae8eb725f4e10984f7b0a208f78abbd0
X-Osstest-Versions-That:
    ovmf=d2e0c473e6f0d518e8acb187f99bb7e61f7df862
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 May 2021 05:51:15 +0000

flight 161987 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161987/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1fbf5e30ae8eb725f4e10984f7b0a208f78abbd0
baseline version:
 ovmf                 d2e0c473e6f0d518e8acb187f99bb7e61f7df862

Last test of basis   161979  2021-05-17 11:10:07 Z    0 days
Testing same since   161987  2021-05-18 01:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>

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
   d2e0c473e6..1fbf5e30ae  1fbf5e30ae8eb725f4e10984f7b0a208f78abbd0 -> xen-tested-master

