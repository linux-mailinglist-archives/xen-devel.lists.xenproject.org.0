Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D195EA84
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 09:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783333.1192647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUCv-0003G3-Ia; Mon, 26 Aug 2024 07:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783333.1192647; Mon, 26 Aug 2024 07:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUCv-0003Dr-FB; Mon, 26 Aug 2024 07:32:09 +0000
Received: by outflank-mailman (input) for mailman id 783333;
 Mon, 26 Aug 2024 07:32:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siUCt-0003Dh-IZ; Mon, 26 Aug 2024 07:32:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siUCt-0006wG-0b; Mon, 26 Aug 2024 07:32:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1siUCs-0002ky-JH; Mon, 26 Aug 2024 07:32:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1siUCs-00016C-In; Mon, 26 Aug 2024 07:32:06 +0000
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
	bh=KNL+JNy3CKpG11x2CxkZYxH7eOjNAE4zKbO8vY6pVTU=; b=vvAX+vF4zN5V3gAmux/Ivzjouz
	8EHLyQhukLfqxwd2NXgrWLxOeu4AwRM+QkiUkTkI8gLD4lcK2g4MYBkTOrc8IA1iA+KF3+/B7BYf+
	HTwUPei5D41bsREXK74uhRbApWqE9IANw30aWwAyg0F8e8ylU79Kvmp10KcW/BvYiUzw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187348-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187348: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1cc0fae8d9e2681fc6a33e5602ce8368809f9465
X-Osstest-Versions-That:
    ovmf=b158dad150bf02879668f72ce306445250838201
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Aug 2024 07:32:06 +0000

flight 187348 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187348/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1cc0fae8d9e2681fc6a33e5602ce8368809f9465
baseline version:
 ovmf                 b158dad150bf02879668f72ce306445250838201

Last test of basis   187222  2024-08-13 05:11:34 Z   13 days
Testing same since   187348  2024-08-26 05:41:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   b158dad150..1cc0fae8d9  1cc0fae8d9e2681fc6a33e5602ce8368809f9465 -> xen-tested-master

