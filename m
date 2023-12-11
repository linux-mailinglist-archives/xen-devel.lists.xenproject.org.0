Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3480C130
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 07:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651478.1017155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCZXi-0000rW-G5; Mon, 11 Dec 2023 06:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651478.1017155; Mon, 11 Dec 2023 06:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCZXi-0000pP-DB; Mon, 11 Dec 2023 06:13:26 +0000
Received: by outflank-mailman (input) for mailman id 651478;
 Mon, 11 Dec 2023 06:13:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCZXg-0000pF-C6; Mon, 11 Dec 2023 06:13:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCZXg-0002r0-0v; Mon, 11 Dec 2023 06:13:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCZXf-0004Kl-IZ; Mon, 11 Dec 2023 06:13:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rCZXf-00013E-HK; Mon, 11 Dec 2023 06:13:23 +0000
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
	bh=loL26wD9AmFMJvxtSJQwIYLrs3sDh5WeXEug3EXsaAA=; b=lQ5MexGvFJTBovO/jbUVBXtnh+
	mCz3UeCKpESiCQGYb3MhfNNa7XQI76bSEn0/vz8p5XjMCqQROpzQUZ3V2kQhDICaMft2yeB0sERWR
	2xXq/AV0mdSmJXuU9p8tQae8J0qgiGapf/ig20vWzov8UCqTmKGX4VTxy5wCg+JXw0Hw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184087-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184087: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb13a4adabcf0e5a1608583c386472773dca5726
X-Osstest-Versions-That:
    ovmf=85a5141a320980e1479343a62731517e197f784e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Dec 2023 06:13:23 +0000

flight 184087 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184087/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb13a4adabcf0e5a1608583c386472773dca5726
baseline version:
 ovmf                 85a5141a320980e1479343a62731517e197f784e

Last test of basis   184042  2023-12-09 01:56:02 Z    2 days
Testing same since   184087  2023-12-11 03:43:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhiphambka@gmail.com>

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
   85a5141a32..bb13a4adab  bb13a4adabcf0e5a1608583c386472773dca5726 -> xen-tested-master

