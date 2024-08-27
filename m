Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E596191C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 23:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784366.1193721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj3bQ-0002nY-DJ; Tue, 27 Aug 2024 21:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784366.1193721; Tue, 27 Aug 2024 21:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj3bQ-0002ly-AC; Tue, 27 Aug 2024 21:19:48 +0000
Received: by outflank-mailman (input) for mailman id 784366;
 Tue, 27 Aug 2024 21:19:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj3bP-0002lo-51; Tue, 27 Aug 2024 21:19:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj3bO-0007Rw-Tr; Tue, 27 Aug 2024 21:19:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj3bO-00061b-HA; Tue, 27 Aug 2024 21:19:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sj3bO-0002PZ-Gb; Tue, 27 Aug 2024 21:19:46 +0000
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
	bh=ysZ8wpqKR8z6yYwhRzEglC277VmFSkovYwO2CLpLAMU=; b=iskbSQDAeWf/XkjGDgaG42Tob2
	JezRj2DlSw+CQg8pK9rDKrAdMCd6Opx87byI/Uf20AkBcUfBQnochqHrJ/9Zx+cHQu6LJ2JYj+oNM
	/ObV4rjn1OM49jHEamrmUWk0QxN/D0u3HlJHNY7evccAPu8RonkuunELSldvEWaGrHqI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187367-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187367: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a0594ca403e77f68b317cc15b9b5c6b39e36e0fb
X-Osstest-Versions-That:
    ovmf=b2a431868c4ae0ad99def0a504d2fe097e16cd4f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 21:19:46 +0000

flight 187367 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187367/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a0594ca403e77f68b317cc15b9b5c6b39e36e0fb
baseline version:
 ovmf                 b2a431868c4ae0ad99def0a504d2fe097e16cd4f

Last test of basis   187364  2024-08-27 16:43:23 Z    0 days
Testing same since   187367  2024-08-27 19:13:21 Z    0 days    1 attempts

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
   b2a431868c..a0594ca403  a0594ca403e77f68b317cc15b9b5c6b39e36e0fb -> xen-tested-master

