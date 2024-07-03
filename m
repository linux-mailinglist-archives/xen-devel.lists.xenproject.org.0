Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D8592525C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 06:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752702.1160898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOrg2-0005Uh-23; Wed, 03 Jul 2024 04:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752702.1160898; Wed, 03 Jul 2024 04:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOrg1-0005S3-Vj; Wed, 03 Jul 2024 04:33:05 +0000
Received: by outflank-mailman (input) for mailman id 752702;
 Wed, 03 Jul 2024 04:33:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOrg1-0005Rt-7y; Wed, 03 Jul 2024 04:33:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOrg1-0003GS-4X; Wed, 03 Jul 2024 04:33:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOrg0-000852-PL; Wed, 03 Jul 2024 04:33:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sOrg0-0006my-Om; Wed, 03 Jul 2024 04:33:04 +0000
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
	bh=whqg78idX2bkclxHqfkO6SvTY0utz1bWB6k5w6xfK0U=; b=J5v7Rb0MgQkZAvsp+6vZDtRGMy
	eomxBup7i5Kn7YJI36IAlYSFa1HASvh9rLkZuwNiY+tmUZLW634HdXeIuTE9aulaWet5cXI8T0lo8
	O469VckBH+o+KSpvDLO6GSjvZkJ05haz3WaqL9Xky8cIPhJ5vdFnHLkF4YkM+DyKnH/U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186636-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186636: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f174696fd8fbd9cc29c9f172e8e83fe6da5b070
X-Osstest-Versions-That:
    ovmf=6b256cef01825fd597ce31ec9343ea280c6114c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Jul 2024 04:33:04 +0000

flight 186636 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186636/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f174696fd8fbd9cc29c9f172e8e83fe6da5b070
baseline version:
 ovmf                 6b256cef01825fd597ce31ec9343ea280c6114c9

Last test of basis   186632  2024-07-02 16:11:10 Z    0 days
Testing same since   186636  2024-07-03 03:11:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>

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
   6b256cef01..4f174696fd  4f174696fd8fbd9cc29c9f172e8e83fe6da5b070 -> xen-tested-master

