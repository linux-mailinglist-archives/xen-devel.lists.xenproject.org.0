Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B345B65D2E5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 13:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471173.730910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD32b-0001Mk-3s; Wed, 04 Jan 2023 12:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471173.730910; Wed, 04 Jan 2023 12:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD32b-0001Ju-0J; Wed, 04 Jan 2023 12:38:45 +0000
Received: by outflank-mailman (input) for mailman id 471173;
 Wed, 04 Jan 2023 12:38:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pD32Z-0001Jk-TG; Wed, 04 Jan 2023 12:38:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pD32Z-0005N3-RN; Wed, 04 Jan 2023 12:38:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pD32Z-0004Wt-H5; Wed, 04 Jan 2023 12:38:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pD32Z-0007zx-GZ; Wed, 04 Jan 2023 12:38:43 +0000
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
	bh=Vp3xFGxDQtgtNhcfWty+Eg0d9+1Hfd1RyUmHsQqWqkE=; b=AuWm9LuPBA0/yGzwfBFfzNX3BM
	IMNYlKSeFP69dml0uTrWY9dyJweYsCoLZPP+FbSZ/Vj6Gi+lmY++TASV6CHgLmMEO+3PYEjNAuF+u
	p/IQcuKrRmvSkBZ4pNBGPx+EW2WmzOANn6osbfiRzROjYY9Ef2spJACZ4ngS8FXVXJC4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175567-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175567: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9ce09870e721efacc41fa7ee684e9e299f120350
X-Osstest-Versions-That:
    ovmf=992d5451d19b93635d52db293bab680e32142776
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Jan 2023 12:38:43 +0000

flight 175567 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175567/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9ce09870e721efacc41fa7ee684e9e299f120350
baseline version:
 ovmf                 992d5451d19b93635d52db293bab680e32142776

Last test of basis   175565  2023-01-04 06:42:15 Z    0 days
Testing same since   175567  2023-01-04 10:13:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Laszlo Ersek <lersek@redhat.com>

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
   992d5451d1..9ce09870e7  9ce09870e721efacc41fa7ee684e9e299f120350 -> xen-tested-master

