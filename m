Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B265EDEBA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413381.656991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY0b-0003ui-9a; Wed, 28 Sep 2022 14:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413381.656991; Wed, 28 Sep 2022 14:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY0b-0003sG-6k; Wed, 28 Sep 2022 14:25:57 +0000
Received: by outflank-mailman (input) for mailman id 413381;
 Wed, 28 Sep 2022 14:25:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odY0Z-0003s6-TE; Wed, 28 Sep 2022 14:25:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odY0Z-0007su-RV; Wed, 28 Sep 2022 14:25:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odY0Z-0005wV-8h; Wed, 28 Sep 2022 14:25:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1odY0Z-0002Oc-8I; Wed, 28 Sep 2022 14:25:55 +0000
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
	bh=8BZxG4WNtAsBjIeUJuS7G8z3yv9fA3Nxmo59n/PDlZ4=; b=Uzeb+3qnAEsdotyF6QGv2r6ryw
	CLtGOQwsQDIb3EDyursB2Fc4cFmOJKQeUuDkMhSevRWMpiqINUiUljdZb4IeVc1Vwaemh/XmkplUI
	HXfesz/90+nqblPlQyz21WvA2hWOQFdcIg6qR+U7HxJj7CG8ZTtaltm8mlKuxyQKgPtc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173354-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173354: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c0d567c3719675b9d8ecf07c31706d96467e31b
X-Osstest-Versions-That:
    ovmf=f4d539007c706ad9a563f368720edf0920da925d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Sep 2022 14:25:55 +0000

flight 173354 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173354/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c0d567c3719675b9d8ecf07c31706d96467e31b
baseline version:
 ovmf                 f4d539007c706ad9a563f368720edf0920da925d

Last test of basis   173341  2022-09-28 00:40:28 Z    0 days
Testing same since   173354  2022-09-28 10:12:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  VictorX Hsu <victorx.hsu@intel.com>

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
   f4d539007c..3c0d567c37  3c0d567c3719675b9d8ecf07c31706d96467e31b -> xen-tested-master

