Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AD3997D0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 04:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136340.252837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1locd9-0003LQ-FU; Thu, 03 Jun 2021 01:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136340.252837; Thu, 03 Jun 2021 01:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1locd9-0003Hk-8I; Thu, 03 Jun 2021 01:58:43 +0000
Received: by outflank-mailman (input) for mailman id 136340;
 Thu, 03 Jun 2021 01:58:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1locd7-0003Ha-Di; Thu, 03 Jun 2021 01:58:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1locd7-0001jH-8f; Thu, 03 Jun 2021 01:58:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1locd6-0002W3-Vm; Thu, 03 Jun 2021 01:58:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1locd6-0001SM-VJ; Thu, 03 Jun 2021 01:58:40 +0000
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
	bh=JcG++BQsGh3DtKzXFAkRXWMk1bAc7fY4K1zb+0EzUBE=; b=T6yqgdFi45RSTK14Fdd7Cyi57o
	+5OZFBb8sr3T1HbAEA5l2y7j2LAnBkoautuqrkHkDw3V7J5IkK7iwuCzNfyweXLWlMuucqxgNuQbL
	RnkCjwjbF5GK5tmtXJhnmf4svOhQC876hEJb77QcqrBnZsf8i6L/2xIzsD1Dra+ku6bA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162341-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162341: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=75e9154f818a58ffc3a28db9f8c97279e723f02d
X-Osstest-Versions-That:
    ovmf=1f515342d8d83ef0fff0c3f4ac67232dd8c97565
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Jun 2021 01:58:40 +0000

flight 162341 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162341/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 75e9154f818a58ffc3a28db9f8c97279e723f02d
baseline version:
 ovmf                 1f515342d8d83ef0fff0c3f4ac67232dd8c97565

Last test of basis   162338  2021-06-02 12:41:10 Z    0 days
Testing same since   162341  2021-06-02 19:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   1f515342d8..75e9154f81  75e9154f818a58ffc3a28db9f8c97279e723f02d -> xen-tested-master

