Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5396EED4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 11:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791632.1201549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smUzK-0000Ic-EV; Fri, 06 Sep 2024 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791632.1201549; Fri, 06 Sep 2024 09:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smUzK-0000FM-Bg; Fri, 06 Sep 2024 09:10:42 +0000
Received: by outflank-mailman (input) for mailman id 791632;
 Fri, 06 Sep 2024 09:10:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smUzI-0000F7-ND; Fri, 06 Sep 2024 09:10:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smUzI-000762-Im; Fri, 06 Sep 2024 09:10:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smUzI-0003EA-5K; Fri, 06 Sep 2024 09:10:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smUzI-0000yZ-4m; Fri, 06 Sep 2024 09:10:40 +0000
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
	bh=3xRXdoy1ZqtozYa88rQD7EayJWCXVDKLqGr97cdwtLI=; b=Bm5v31pExi+YEo7RzW/cGwyF0s
	hZrwrjb5ihf3AlxZ0eRXdiPOFna6PSZxvb0YK4br/NaMVtEbIkAzk/cwWZwC1l44+WgiLfBIf7xtX
	B1h0VaGaRaYziqrld4VCNG7ahtxm+1yIGsM3XTribfk77sUOuNWINozurBn3qfg3Z3kY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187521-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187521: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=253b3d678aa541b24a2e05f2279975de06abfeec
X-Osstest-Versions-That:
    ovmf=9dabe005f0cd422068fbb6cb915cf8180c55918d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 09:10:40 +0000

flight 187521 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187521/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 253b3d678aa541b24a2e05f2279975de06abfeec
baseline version:
 ovmf                 9dabe005f0cd422068fbb6cb915cf8180c55918d

Last test of basis   187517  2024-09-06 05:41:51 Z    0 days
Testing same since   187521  2024-09-06 07:41:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ragavarshini B <ragavarshinib@ami.com>
  ragavarshinib <ragavarshinib@ami.com>

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
   9dabe005f0..253b3d678a  253b3d678aa541b24a2e05f2279975de06abfeec -> xen-tested-master

