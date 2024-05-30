Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950D8D51F3
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732976.1139058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCklJ-0006mw-8S; Thu, 30 May 2024 18:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732976.1139058; Thu, 30 May 2024 18:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCklJ-0006j8-4S; Thu, 30 May 2024 18:44:29 +0000
Received: by outflank-mailman (input) for mailman id 732976;
 Thu, 30 May 2024 18:44:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCklI-0006ij-Ap; Thu, 30 May 2024 18:44:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCklI-0005cY-9C; Thu, 30 May 2024 18:44:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCklI-0000oM-02; Thu, 30 May 2024 18:44:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCklH-0001fy-Vs; Thu, 30 May 2024 18:44:27 +0000
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
	bh=q9yDaERmEMOH1yhX1uwdFx+vQ72Xo5QZ8bUZANGtRfI=; b=MgghIaa8peuPaVnWoP1FBzHY/u
	sdfVNmQOpIG6nHLoBfoqOMeDuGys6UJJ4G+yilitRtRFvK1rM16fYrlN2GU50XocbAqO2d35xpGQA
	g6+83SgzTfKFKOMNrVgwhF1L+99KkCQ1o4qCAfDySlcHSNUsFZqdeq1UtNL3w2+jHeKg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186199-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186199: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7848481160b270ebc59d68ecbc8d2722e3aed8c
X-Osstest-Versions-That:
    ovmf=9518d77eb869034a141799b3d28cac20ecb60fe0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 18:44:27 +0000

flight 186199 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186199/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7848481160b270ebc59d68ecbc8d2722e3aed8c
baseline version:
 ovmf                 9518d77eb869034a141799b3d28cac20ecb60fe0

Last test of basis   186198  2024-05-30 12:41:14 Z    0 days
Testing same since   186199  2024-05-30 17:14:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
  dependabot[bot] <support@github.com>

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
   9518d77eb8..e784848116  e7848481160b270ebc59d68ecbc8d2722e3aed8c -> xen-tested-master

