Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2549483FF8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 11:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253143.434222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4h9E-0002y0-Gb; Tue, 04 Jan 2022 10:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253143.434222; Tue, 04 Jan 2022 10:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4h9E-0002vB-CH; Tue, 04 Jan 2022 10:34:32 +0000
Received: by outflank-mailman (input) for mailman id 253143;
 Tue, 04 Jan 2022 10:34:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n4h9D-0002v1-1g; Tue, 04 Jan 2022 10:34:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n4h9C-0000mF-Us; Tue, 04 Jan 2022 10:34:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n4h9C-0005dj-OO; Tue, 04 Jan 2022 10:34:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n4h9C-0004OX-O0; Tue, 04 Jan 2022 10:34:30 +0000
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
	bh=lxPSM4InMaKAIjkF5qP4tqEk2xf6kUtdslh0FMhrO/Q=; b=WQqy+cmM8N5IdD2BmjCOkuamiV
	tNm7Y3hrqIqFdY1ro3x0ZyhZiaIXWt+gqLstngDvZzm34b7TNowZuoKEI+54X5ijt2EAyjrcEvYxk
	gjSi+0otTSff2mYcWyBhdfZUEtVRk88571zX2er0oZHQTQhfEqu7A/BIy9EJgyMf4IQc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167601-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167601: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=079a58276b98dc97ca363e3bc8b35cc7baa56d76
X-Osstest-Versions-That:
    ovmf=13d9e8ec98ee3f9f14a45471b38a22b9fd66d1ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jan 2022 10:34:30 +0000

flight 167601 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167601/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 079a58276b98dc97ca363e3bc8b35cc7baa56d76
baseline version:
 ovmf                 13d9e8ec98ee3f9f14a45471b38a22b9fd66d1ce

Last test of basis   167598  2022-01-04 02:41:30 Z    0 days
Testing same since   167601  2022-01-04 08:42:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.Yao@intel.com>

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
   13d9e8ec98..079a58276b  079a58276b98dc97ca363e3bc8b35cc7baa56d76 -> xen-tested-master

