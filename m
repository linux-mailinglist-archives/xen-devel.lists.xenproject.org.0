Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92056D2C00
	for <lists+xen-devel@lfdr.de>; Sat,  1 Apr 2023 02:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517078.802126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piOvq-0000V0-92; Sat, 01 Apr 2023 00:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517078.802126; Sat, 01 Apr 2023 00:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piOvq-0000TH-66; Sat, 01 Apr 2023 00:17:22 +0000
Received: by outflank-mailman (input) for mailman id 517078;
 Sat, 01 Apr 2023 00:17:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piOvn-0000T7-Vr; Sat, 01 Apr 2023 00:17:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piOvn-000769-Ua; Sat, 01 Apr 2023 00:17:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piOvn-00051M-B9; Sat, 01 Apr 2023 00:17:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1piOvn-0005pD-Ah; Sat, 01 Apr 2023 00:17:19 +0000
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
	bh=y/9+DwORxecq4Ne3hKBud5y8i4JQb4mLTXawEpL15Lw=; b=L9jfMX5zu7wio3KGD+zg9xcer4
	GEEXTZae6k9z3ZZdHg2ZL70n3gRtH8K9RqeNwNh/DSsPA2FU+cFClRWIaGFr+JJSQ6RQfpunGVuER
	COdwMG1ybn3w/PY/n1dUdI4DOx+sBPm/kY4ija+aSUFbTIZ3RzTxRjmFpw62N9hRaSdk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180095-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180095: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eb6a74827200eedc81b8f45f332d6e9f3b3d2906
X-Osstest-Versions-That:
    ovmf=66f4b1b0d2e603c2b0a3f4149976cdc297a3606d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Apr 2023 00:17:19 +0000

flight 180095 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180095/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eb6a74827200eedc81b8f45f332d6e9f3b3d2906
baseline version:
 ovmf                 66f4b1b0d2e603c2b0a3f4149976cdc297a3606d

Last test of basis   180091  2023-03-31 17:40:47 Z    0 days
Testing same since   180095  2023-03-31 21:10:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Albecki, Mateusz <mateusz.albecki@intel.com>
  Mateusz Albecki <mateusz.albecki@intel.com>

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
   66f4b1b0d2..eb6a748272  eb6a74827200eedc81b8f45f332d6e9f3b3d2906 -> xen-tested-master

