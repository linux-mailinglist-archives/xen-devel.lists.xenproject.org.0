Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C728D34B92E
	for <lists+xen-devel@lfdr.de>; Sat, 27 Mar 2021 20:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102278.195859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQEwt-0005w2-Kv; Sat, 27 Mar 2021 19:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102278.195859; Sat, 27 Mar 2021 19:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQEwt-0005va-H4; Sat, 27 Mar 2021 19:50:19 +0000
Received: by outflank-mailman (input) for mailman id 102278;
 Sat, 27 Mar 2021 19:50:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQEwr-0005vS-RH; Sat, 27 Mar 2021 19:50:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQEwr-0000CY-NJ; Sat, 27 Mar 2021 19:50:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQEwr-0004k5-By; Sat, 27 Mar 2021 19:50:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lQEwr-0004cU-BW; Sat, 27 Mar 2021 19:50:17 +0000
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
	bh=mk+HFt76kt32O3KQPxwy5gu33pidnTiHFuOcKbRHcKY=; b=u5eysJ8gOmVrCHFeXlWA2lu4yb
	TaUGN7hDj/piB6NSDjV93GJbpkPP3g3sO+vmv2hviFYgwopUvAShfqrIHkDL5nPLH9ZUO8cjeWxbq
	A1LZJ7KdfrTKBmFesDmpgC8NygwnNKVfPpjJL9Ht5pQfrBfMJWhl40IOfbyd4ek3E+3I=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160456-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160456: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b33cf5bfcb4c941370739dfbbe1532ff508fd29d
X-Osstest-Versions-That:
    ovmf=4bf2a5b045ebf8b5e90d9210ad5190699bddb592
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Mar 2021 19:50:17 +0000

flight 160456 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160456/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b33cf5bfcb4c941370739dfbbe1532ff508fd29d
baseline version:
 ovmf                 4bf2a5b045ebf8b5e90d9210ad5190699bddb592

Last test of basis   160425  2021-03-25 20:38:30 Z    1 days
Testing same since   160456  2021-03-26 20:57:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   4bf2a5b045..b33cf5bfcb  b33cf5bfcb4c941370739dfbbe1532ff508fd29d -> xen-tested-master

