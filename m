Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7686FE328
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 19:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532966.829310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnTS-0005ai-LD; Wed, 10 May 2023 17:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532966.829310; Wed, 10 May 2023 17:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnTS-0005YV-Ib; Wed, 10 May 2023 17:19:34 +0000
Received: by outflank-mailman (input) for mailman id 532966;
 Wed, 10 May 2023 17:19:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwnTR-0005YL-9Z; Wed, 10 May 2023 17:19:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwnTR-00005V-84; Wed, 10 May 2023 17:19:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwnTQ-0007TI-Tw; Wed, 10 May 2023 17:19:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pwnTQ-0003xN-TM; Wed, 10 May 2023 17:19:32 +0000
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
	bh=a+uRgkP7C1QrVdjsIrUSkGKrMopYVdx2rI43qyIQrF0=; b=Gc7C4+sghQPftkfr+G7l27jjJl
	UBZNO2Lur9D1RZETV3f2RPpCc+cmDJ/ZHCMpakWKJ1VcdInvRgdfGITVdezjmGmia14e/kdGXxtYz
	crxdlKhtvOtgZfWpt+bz4NIjif1QtKzw4AFb7Rb4P9VAKooJUH3MnQ9KKrwtRAtquliw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180604-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180604: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6fb2760dc8939b16a906b8e6bb224764907168f3
X-Osstest-Versions-That:
    ovmf=e6447d2a08f5ca585816d093e79a01dad3781f98
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 May 2023 17:19:32 +0000

flight 180604 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180604/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6fb2760dc8939b16a906b8e6bb224764907168f3
baseline version:
 ovmf                 e6447d2a08f5ca585816d093e79a01dad3781f98

Last test of basis   180603  2023-05-10 13:12:05 Z    0 days
Testing same since   180604  2023-05-10 15:12:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>

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
   e6447d2a08..6fb2760dc8  6fb2760dc8939b16a906b8e6bb224764907168f3 -> xen-tested-master

