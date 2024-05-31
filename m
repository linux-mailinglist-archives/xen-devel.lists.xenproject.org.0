Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF278D593A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 06:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733224.1139345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCtbD-0004zD-Pg; Fri, 31 May 2024 04:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733224.1139345; Fri, 31 May 2024 04:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCtbD-0004ww-Mj; Fri, 31 May 2024 04:10:39 +0000
Received: by outflank-mailman (input) for mailman id 733224;
 Fri, 31 May 2024 04:10:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCtbC-0004wm-Ci; Fri, 31 May 2024 04:10:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCtbC-0006Vu-9U; Fri, 31 May 2024 04:10:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCtbB-0005cW-Ux; Fri, 31 May 2024 04:10:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCtbB-0002pS-UK; Fri, 31 May 2024 04:10:37 +0000
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
	bh=PvbGnXC7+2ebYeWHR8EmOL5NHxT+Hb1cJyXAqlR1uVQ=; b=1//p1yg5aKthFmDG8u/CcrLtsm
	vvdqIhBL7zUaOKuBtXJp7WILo3k2Fn4/mPhtc378p+HgvV+Qp4Yw9oa1mqWXQPJ1QcvkB9M//T3FZ
	uUxaGpfZ/imAC1VXR1qdYLBI4suzATsZerA7DIgLhy/n/5ZH5j09HeE1m38//recu/I4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186205-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186205: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5f68a363d0d95bd0d383861ae21886d9824a8cd4
X-Osstest-Versions-That:
    ovmf=a8dc6bf73f789f38f2930641b20dfd6d9e38f411
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 31 May 2024 04:10:37 +0000

flight 186205 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186205/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5f68a363d0d95bd0d383861ae21886d9824a8cd4
baseline version:
 ovmf                 a8dc6bf73f789f38f2930641b20dfd6d9e38f411

Last test of basis   186203  2024-05-30 23:12:41 Z    0 days
Testing same since   186205  2024-05-31 02:11:12 Z    0 days    1 attempts

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
   a8dc6bf73f..5f68a363d0  5f68a363d0d95bd0d383861ae21886d9824a8cd4 -> xen-tested-master

