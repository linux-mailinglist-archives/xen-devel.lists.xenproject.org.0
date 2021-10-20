Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8F435113
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 19:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214024.372432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFCt-0004s5-PE; Wed, 20 Oct 2021 17:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214024.372432; Wed, 20 Oct 2021 17:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFCt-0004pW-Lf; Wed, 20 Oct 2021 17:16:51 +0000
Received: by outflank-mailman (input) for mailman id 214024;
 Wed, 20 Oct 2021 17:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdFCs-0004pM-K8; Wed, 20 Oct 2021 17:16:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdFCs-000262-7X; Wed, 20 Oct 2021 17:16:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdFCs-0007Uz-02; Wed, 20 Oct 2021 17:16:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mdFCr-0003e6-Vo; Wed, 20 Oct 2021 17:16:49 +0000
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
	bh=lGjVA4dEyyLY/QzEoiOnREoSVG3pAJq2DV4EFETrMP4=; b=kWjnK1PWT94LoTo0SZonnMzzSl
	uVWPPLAf6vsd4Lf5MV+JHl41mtMQvjgyQWTHF4LWVoyFeVC306gOmx7vbHHgKHodixxSioLX0jk73
	UU9X55qaFvZ2G9y4F4UZetBb2rp/mw19pf+90iUnhKhBd+NgEVwGkHSGewHbZRaVRRx4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165690-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165690: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6893865b3010bb6192f732643c4b8ba026726d07
X-Osstest-Versions-That:
    ovmf=4fdf843c75d297fe892f989009b3d3e397ccfd55
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Oct 2021 17:16:49 +0000

flight 165690 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165690/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6893865b3010bb6192f732643c4b8ba026726d07
baseline version:
 ovmf                 4fdf843c75d297fe892f989009b3d3e397ccfd55

Last test of basis   165688  2021-10-20 10:13:27 Z    0 days
Testing same since   165690  2021-10-20 13:40:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   4fdf843c75..6893865b30  6893865b3010bb6192f732643c4b8ba026726d07 -> xen-tested-master

