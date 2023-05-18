Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB470780C
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 04:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536170.834345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzTLj-0000IR-4P; Thu, 18 May 2023 02:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536170.834345; Thu, 18 May 2023 02:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzTLi-0000Ey-Vx; Thu, 18 May 2023 02:26:38 +0000
Received: by outflank-mailman (input) for mailman id 536170;
 Thu, 18 May 2023 02:26:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzTLh-0000Ef-Cl; Thu, 18 May 2023 02:26:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzTLh-0005eL-BS; Thu, 18 May 2023 02:26:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzTLh-0002SZ-09; Thu, 18 May 2023 02:26:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pzTLg-0002tu-Vy; Thu, 18 May 2023 02:26:36 +0000
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
	bh=o1NmDYarkwOvbQow3pnBfAcVHJ1Dk0cmFwGWPhtgjFw=; b=TAkEpKCIOY13AxQf2bgGQXTY0T
	4cIJKLoumlSf4QokDNy0K4h8VdmwV2WEuEE4sndj/r67HyL7qZ6QhTPU2z9eq1YQAOadmGlDN4sRe
	fpBOwgCBp099NMs6JXBdDw+OeYgUTkoNgOuNdgRkAKrzZU2Qxc0Xe+11u266xdzlU7RQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180695-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180695: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0abfb0be6cf78a8e962383e85cec57851ddae5bc
X-Osstest-Versions-That:
    ovmf=cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 May 2023 02:26:36 +0000

flight 180695 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180695/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0abfb0be6cf78a8e962383e85cec57851ddae5bc
baseline version:
 ovmf                 cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e

Last test of basis   180675  2023-05-15 21:40:50 Z    2 days
Testing same since   180695  2023-05-18 00:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Warkentin <andrei.warkentin@intel.com>
  Gerd Hoffmann <kraxel@redhat.com>

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
   cafb4f3f36..0abfb0be6c  0abfb0be6cf78a8e962383e85cec57851ddae5bc -> xen-tested-master

