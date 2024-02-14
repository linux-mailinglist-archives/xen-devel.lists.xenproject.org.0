Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B596854355
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 08:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680202.1058140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9VY-0004GV-SE; Wed, 14 Feb 2024 07:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680202.1058140; Wed, 14 Feb 2024 07:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9VY-0004FQ-Od; Wed, 14 Feb 2024 07:16:40 +0000
Received: by outflank-mailman (input) for mailman id 680202;
 Wed, 14 Feb 2024 07:16:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra9VW-0004FE-Tm; Wed, 14 Feb 2024 07:16:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra9VW-00043T-PR; Wed, 14 Feb 2024 07:16:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ra9VW-0006PO-D1; Wed, 14 Feb 2024 07:16:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ra9VW-0001jG-CZ; Wed, 14 Feb 2024 07:16:38 +0000
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
	bh=Yt9u5lkIi0gpspp0qBhz20NjS3a78si62busT+qKfKc=; b=beZzzP+G0ztTKmSwWaIAfvYqxi
	bPR6ZCampret/Gg5acgLHzCnIwha0GivIzTgqObt0muicoXYXwVBVeF0vYJvjrWEgcA/IT3oAwIPX
	saoa0Xzpu7oa3LJ61arf/Tq0hyuCRiCxdmyAIfoVUV8XAVn4hD1xTDwSYNzt4y8rx0cg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184663-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184663: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5fd3078a2e08f607dc86a16c1b184b6e30a34a49
X-Osstest-Versions-That:
    ovmf=a1c426e8440b55ee12d92cefa7114fd6f7b599cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Feb 2024 07:16:38 +0000

flight 184663 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184663/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5fd3078a2e08f607dc86a16c1b184b6e30a34a49
baseline version:
 ovmf                 a1c426e8440b55ee12d92cefa7114fd6f7b599cb

Last test of basis   184661  2024-02-14 02:46:55 Z    0 days
Testing same since   184663  2024-02-14 05:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Doug Flick <dougflick@microsoft.com>
  Doug Flick [MSFT] <doug.edk2@gmail.com>

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
   a1c426e844..5fd3078a2e  5fd3078a2e08f607dc86a16c1b184b6e30a34a49 -> xen-tested-master

