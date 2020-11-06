Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198012A9A72
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 18:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20975.47105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb5FM-00036m-8h; Fri, 06 Nov 2020 17:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20975.47105; Fri, 06 Nov 2020 17:09:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb5FM-00036M-5F; Fri, 06 Nov 2020 17:09:56 +0000
Received: by outflank-mailman (input) for mailman id 20975;
 Fri, 06 Nov 2020 17:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kb5FL-00035N-L4
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 17:09:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53aab237-3d43-4cb7-8945-2d62725d293d;
 Fri, 06 Nov 2020 17:09:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb5FE-00008h-DV; Fri, 06 Nov 2020 17:09:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb5FE-0001IW-40; Fri, 06 Nov 2020 17:09:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kb5FE-0003FW-3X; Fri, 06 Nov 2020 17:09:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kb5FL-00035N-L4
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 17:09:55 +0000
X-Inumbo-ID: 53aab237-3d43-4cb7-8945-2d62725d293d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 53aab237-3d43-4cb7-8945-2d62725d293d;
	Fri, 06 Nov 2020 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=1WGR7YjIkRyYDoYKqqtjiyaJWz5v/tRhOT0hMjcOHfo=; b=laN5cohs7+KrkzRGGxRaFtuMB6
	ACEIH35vRkH9K3Q9uUrBhL7aZcLPgFjTV9yyZg1ID/jQ49nPWaazlVXLXHszXL8jdog23TUn5uwbp
	Fbv7oPH4nfmMGIfovSaL46h/Pz0uA9U15x2IJxjILb0rwNsenEv2e+tNRj76tzs4cgQk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb5FE-00008h-DV; Fri, 06 Nov 2020 17:09:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb5FE-0001IW-40; Fri, 06 Nov 2020 17:09:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb5FE-0003FW-3X; Fri, 06 Nov 2020 17:09:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156467-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156467: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=09af9bd9be2d3e31bba979f8cf6446017b0b863e
X-Osstest-Versions-That:
    ovmf=8d5708833509ece6ac63084dc07c8ac53c4d4c1a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Nov 2020 17:09:48 +0000

flight 156467 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156467/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 09af9bd9be2d3e31bba979f8cf6446017b0b863e
baseline version:
 ovmf                 8d5708833509ece6ac63084dc07c8ac53c4d4c1a

Last test of basis   156400  2020-11-04 12:10:58 Z    2 days
Testing same since   156407  2020-11-05 09:30:19 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   8d57088335..09af9bd9be  09af9bd9be2d3e31bba979f8cf6446017b0b863e -> xen-tested-master

