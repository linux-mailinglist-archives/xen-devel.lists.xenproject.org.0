Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21C960EC7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784132.1193528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixXy-0003zg-QL; Tue, 27 Aug 2024 14:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784132.1193528; Tue, 27 Aug 2024 14:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixXy-0003yB-Nc; Tue, 27 Aug 2024 14:51:50 +0000
Received: by outflank-mailman (input) for mailman id 784132;
 Tue, 27 Aug 2024 14:51:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sixXx-0003xz-4o; Tue, 27 Aug 2024 14:51:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sixXw-0000B4-WB; Tue, 27 Aug 2024 14:51:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sixXw-0002s0-L0; Tue, 27 Aug 2024 14:51:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sixXw-0000wl-KV; Tue, 27 Aug 2024 14:51:48 +0000
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
	bh=gsgKy7MCu9W/EqYKdbaiAlAZmvV6yqADW8Z9w1/T1n8=; b=30VcbefmeVD3LSfcEhdpdEjIpq
	ubMPNjP1t45tlCPk1Fcc6/TUYDbCE3x50DoyBrUsPfkrGyERUsre8Ie3jCvZvIU2GjntNMK1cIN/c
	nrvZCjsFnpHaVzO24BMtJXGil9LDjYF9ZQoQHyzqpKNYVfJZUSDsklsBVN+B/spHVQ34=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187363-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187363: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=efaf8931bbfa33a81b8792fbf9e2ccc239d53204
X-Osstest-Versions-That:
    ovmf=ccda91c28628aa70bca614f1f7b71ad7b5ca61e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 14:51:48 +0000

flight 187363 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187363/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 efaf8931bbfa33a81b8792fbf9e2ccc239d53204
baseline version:
 ovmf                 ccda91c28628aa70bca614f1f7b71ad7b5ca61e0

Last test of basis   187362  2024-08-27 09:15:18 Z    0 days
Testing same since   187363  2024-08-27 13:15:02 Z    0 days    1 attempts

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
   ccda91c286..efaf8931bb  efaf8931bbfa33a81b8792fbf9e2ccc239d53204 -> xen-tested-master

