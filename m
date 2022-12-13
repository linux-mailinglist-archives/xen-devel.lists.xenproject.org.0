Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007564BC53
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 19:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461073.719107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5AJM-0000Oh-Gn; Tue, 13 Dec 2022 18:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461073.719107; Tue, 13 Dec 2022 18:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5AJM-0000Lw-DH; Tue, 13 Dec 2022 18:47:28 +0000
Received: by outflank-mailman (input) for mailman id 461073;
 Tue, 13 Dec 2022 18:47:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5AJL-0000Lm-0n; Tue, 13 Dec 2022 18:47:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5AJK-00009Q-VK; Tue, 13 Dec 2022 18:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5AJK-0003ge-HM; Tue, 13 Dec 2022 18:47:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5AJK-0000BM-Gv; Tue, 13 Dec 2022 18:47:26 +0000
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
	bh=vW0ZhJrTaMBMi2Sqn2GRLKhBeyQx82rii9Pc2OpimyI=; b=6xurJQyVY4j62fjMO80awV7mBy
	XSeol8hv+d4uy3UWAB0+VJ6f+cwGuykFNdvhjmaiTBNxWvDdX2Z7C8HeqqLxFdWU/8DcURjyMhRSB
	lScyjAf6RRK0OOVIevrXFf8OphHKSs/TyGtqkHFh4mbKidlaJBKihg7o5E8dxROms3LY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175176: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1fd8d08970a9ee7d350c7dd42bffb0cb96426041
X-Osstest-Versions-That:
    ovmf=11ce7a2de7549306a853cc3fe3abe6ef8f874b40
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Dec 2022 18:47:26 +0000

flight 175176 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175176/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1fd8d08970a9ee7d350c7dd42bffb0cb96426041
baseline version:
 ovmf                 11ce7a2de7549306a853cc3fe3abe6ef8f874b40

Last test of basis   175172  2022-12-13 14:40:49 Z    0 days
Testing same since   175176  2022-12-13 17:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   11ce7a2de7..1fd8d08970  1fd8d08970a9ee7d350c7dd42bffb0cb96426041 -> xen-tested-master

