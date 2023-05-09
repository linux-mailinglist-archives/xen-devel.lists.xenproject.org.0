Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097A6FD322
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 01:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532595.828811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwX9u-0000yv-F0; Tue, 09 May 2023 23:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532595.828811; Tue, 09 May 2023 23:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwX9u-0000wn-Bp; Tue, 09 May 2023 23:54:18 +0000
Received: by outflank-mailman (input) for mailman id 532595;
 Tue, 09 May 2023 23:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwX9s-0000wd-QC; Tue, 09 May 2023 23:54:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwX9s-0007yj-Nj; Tue, 09 May 2023 23:54:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pwX9s-00006h-8p; Tue, 09 May 2023 23:54:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pwX9s-0003DJ-8L; Tue, 09 May 2023 23:54:16 +0000
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
	bh=ifVGkEf6VcLqpZy3zfIP5aNNJt6tyNuS0G67L+zfzc0=; b=W/YaJSN2MSNPWDl3EoipsDrDnv
	z37QwZAWSssf84zTBx4C/f8Ylbuh97yc2J579Elzh+TafVhUpC3WHcEqR+un0qxSz/HkPokcsO6i0
	3mI2kN0cpMak263X4/3SixtYN6RtmJ27vIi3SkDgK8b5t6yFlkF8vdHZQxaUV99o0XKo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180593-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180593: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bee67e0c142af6599a85aa7640094816b8a24c4f
X-Osstest-Versions-That:
    ovmf=5215cd5baf6609e54050c69909273b7f5161c59e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 May 2023 23:54:16 +0000

flight 180593 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180593/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bee67e0c142af6599a85aa7640094816b8a24c4f
baseline version:
 ovmf                 5215cd5baf6609e54050c69909273b7f5161c59e

Last test of basis   180581  2023-05-08 19:13:38 Z    1 days
Testing same since   180593  2023-05-09 22:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Michael Brown <mcb30@ipxe.org>

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
   5215cd5baf..bee67e0c14  bee67e0c142af6599a85aa7640094816b8a24c4f -> xen-tested-master

