Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E787462B968
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 11:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444251.699260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovFqR-0006KU-Ad; Wed, 16 Nov 2022 10:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444251.699260; Wed, 16 Nov 2022 10:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovFqR-0006Ho-6n; Wed, 16 Nov 2022 10:40:39 +0000
Received: by outflank-mailman (input) for mailman id 444251;
 Wed, 16 Nov 2022 10:40:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovFqP-0006Hb-GB; Wed, 16 Nov 2022 10:40:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovFqP-0000O0-CV; Wed, 16 Nov 2022 10:40:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovFqO-0008AB-Rv; Wed, 16 Nov 2022 10:40:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ovFqO-00072G-RS; Wed, 16 Nov 2022 10:40:36 +0000
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
	bh=0LDVr2SiyOEBdIUSYKSYCWFyLzVUraSYQQp4fe7yBkY=; b=pnM01ql0oD7lehD1pogqf8mLuu
	mlxIARts95je0Djqq/8/utN80hgqyivrW6MjNESWlGZ9KmeQkipJ2xcvRc0YJiK+SYe6Are37MOrj
	hQWnu9sznejJovEgsRnPYioVazi9OqxCgQXAdwcFnODaRO1w5M7fJbW7LdO7zGQANJMc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174785-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174785: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=93629f2c7cf05ebc0f458eacc42a33147096f9d1
X-Osstest-Versions-That:
    ovmf=0cb30c3f5e9b2be5157224afdf75fa16bc09b9c7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Nov 2022 10:40:36 +0000

flight 174785 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174785/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 93629f2c7cf05ebc0f458eacc42a33147096f9d1
baseline version:
 ovmf                 0cb30c3f5e9b2be5157224afdf75fa16bc09b9c7

Last test of basis   174763  2022-11-14 05:14:03 Z    2 days
Testing same since   174785  2022-11-16 01:55:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   0cb30c3f5e..93629f2c7c  93629f2c7cf05ebc0f458eacc42a33147096f9d1 -> xen-tested-master

