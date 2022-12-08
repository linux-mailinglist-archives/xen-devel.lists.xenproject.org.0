Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE10646854
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 05:49:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456813.714646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p38pX-0005Jp-16; Thu, 08 Dec 2022 04:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456813.714646; Thu, 08 Dec 2022 04:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p38pW-0005HT-Ue; Thu, 08 Dec 2022 04:48:18 +0000
Received: by outflank-mailman (input) for mailman id 456813;
 Thu, 08 Dec 2022 04:48:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p38pU-0005HJ-QI; Thu, 08 Dec 2022 04:48:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p38pU-0005Bz-MQ; Thu, 08 Dec 2022 04:48:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p38pU-0004Rf-6X; Thu, 08 Dec 2022 04:48:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p38pU-0003F8-68; Thu, 08 Dec 2022 04:48:16 +0000
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
	bh=CZcNwTPE0rO1klDvL6j88o6uSfzpDg6WzBnrnF13m6g=; b=YzPT+p6GAcPSOpY4/NKOV+s2I9
	MvoNfp0HsV1xQqCLPKiO+cw9KxMFzjy94Alrt4Fwq904oDcGKO+PnlNNBEO8naUh45acIQiaoxBgf
	lSwxMWo+Jg9gqw5SrnXsC+8kt5ZMGQzijl1yTpmp8R+yVUDni5GTEaf552l7lYmPpz4w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175085-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175085: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d9e7f6fe49738421c02381425d289767d7055ef1
X-Osstest-Versions-That:
    ovmf=ca33daafc630a7952de482813dccd5202f005dbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Dec 2022 04:48:16 +0000

flight 175085 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175085/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d9e7f6fe49738421c02381425d289767d7055ef1
baseline version:
 ovmf                 ca33daafc630a7952de482813dccd5202f005dbf

Last test of basis   175064  2022-12-06 20:42:30 Z    1 days
Testing same since   175085  2022-12-08 03:10:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@quicinc.com>

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
   ca33daafc6..d9e7f6fe49  d9e7f6fe49738421c02381425d289767d7055ef1 -> xen-tested-master

