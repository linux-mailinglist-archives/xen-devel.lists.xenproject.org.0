Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258F6FD3C1
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 04:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532625.828853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwZL5-00079G-Ta; Wed, 10 May 2023 02:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532625.828853; Wed, 10 May 2023 02:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwZL5-000773-Pb; Wed, 10 May 2023 02:13:59 +0000
Received: by outflank-mailman (input) for mailman id 532625;
 Wed, 10 May 2023 02:13:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwZL3-00076t-PJ; Wed, 10 May 2023 02:13:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwZL3-0002eU-NO; Wed, 10 May 2023 02:13:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwZL3-0003VL-7t; Wed, 10 May 2023 02:13:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pwZL3-0008Lc-7P; Wed, 10 May 2023 02:13:57 +0000
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
	bh=YAafwJ9bByC9CX90S6jMx3uI1Bm/8d3VvqwfJo0Mnvg=; b=7AoXpFHzrVu8djY6S8TnXi+Aqk
	eqVnD3Q0w2/3z4qUFWvocFpfs7qhQ0uLF1xa03csBQKhCcZkZKNzDlvZ/TW3ZfcjVTmGH4rGp9WMr
	ubCDLGylchKWsiVAVxZB86fF/kQ4VilJhYtF3Il3f3QcABSWUxw2afTLby353lGej+W4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180595-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180595: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e97b9b4e5a4bd53fd5f18c44390b266a2a89881a
X-Osstest-Versions-That:
    ovmf=bee67e0c142af6599a85aa7640094816b8a24c4f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 May 2023 02:13:57 +0000

flight 180595 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180595/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e97b9b4e5a4bd53fd5f18c44390b266a2a89881a
baseline version:
 ovmf                 bee67e0c142af6599a85aa7640094816b8a24c4f

Last test of basis   180593  2023-05-09 22:10:44 Z    0 days
Testing same since   180595  2023-05-10 00:40:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   bee67e0c14..e97b9b4e5a  e97b9b4e5a4bd53fd5f18c44390b266a2a89881a -> xen-tested-master

