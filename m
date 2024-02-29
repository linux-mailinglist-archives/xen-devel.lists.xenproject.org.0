Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6506886C8DD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686991.1069648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffCY-0007eg-8h; Thu, 29 Feb 2024 12:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686991.1069648; Thu, 29 Feb 2024 12:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffCY-0007d9-5p; Thu, 29 Feb 2024 12:07:50 +0000
Received: by outflank-mailman (input) for mailman id 686991;
 Thu, 29 Feb 2024 12:07:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rffCX-0007cz-Cm; Thu, 29 Feb 2024 12:07:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rffCX-0003AV-AR; Thu, 29 Feb 2024 12:07:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rffCW-0000Jv-U6; Thu, 29 Feb 2024 12:07:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rffCW-000084-Tb; Thu, 29 Feb 2024 12:07:48 +0000
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
	bh=yPPhfimd4iuXzQnW/0qmbjTybdHpCtS6YNnCcUoH6mI=; b=iyZvDbCYxJZGwdXY/c3kDw4E9a
	gixvKrZS8ClWXiadv3XIh4Z6D/DzVHECakZI/v4xnL5QVNDkiqZFMENNWcHCMcBS3Kt4kRcK30Xm9
	0UOQS24QYuJtNdsfbcT8BZtnHkh043wAECxqzuPPXePLcYCeZdGLI6+fdxB1bFvPUm7s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184818-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184818: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8
X-Osstest-Versions-That:
    ovmf=d9a6e7b0b8a67392a57788d97634256546207a64
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Feb 2024 12:07:48 +0000

flight 184818 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184818/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8
baseline version:
 ovmf                 d9a6e7b0b8a67392a57788d97634256546207a64

Last test of basis   184815  2024-02-29 03:41:16 Z    0 days
Testing same since   184818  2024-02-29 10:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Laszlo Ersek <lersek@redhat.com>

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
   d9a6e7b0b8..dc7cfa9bab  dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8 -> xen-tested-master

