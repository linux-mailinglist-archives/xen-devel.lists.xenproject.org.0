Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEA331969
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95136.179527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJNZN-0002Kp-I4; Mon, 08 Mar 2021 21:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95136.179527; Mon, 08 Mar 2021 21:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJNZN-0002KM-ED; Mon, 08 Mar 2021 21:37:41 +0000
Received: by outflank-mailman (input) for mailman id 95136;
 Mon, 08 Mar 2021 21:37:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJNZM-0002Jv-Fa; Mon, 08 Mar 2021 21:37:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJNZM-0005XA-9M; Mon, 08 Mar 2021 21:37:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJNZL-0006SA-PT; Mon, 08 Mar 2021 21:37:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lJNZL-00029e-Ox; Mon, 08 Mar 2021 21:37:39 +0000
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
	bh=mpVinR/g6zpu4u7sPjtzVFzLtslWRE/fWg2UkNcasME=; b=ymEoCnV3Kx2gnX+hDv416dYnoo
	Su29Gme8uamAeJahecoTwovcyzWvzVHnBvwjZ9dU1ckYr5ymf1d79OppzIvt5GW7Lt/Mq7g57ejev
	VH4bK5s8zUSMsQk9DgBoG/Q6t3FudCsROfp8W3ac53NLi7tikx4uJjWiklv9M4NYVc4c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159872-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159872: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=94fa95c8746c553324e8b69ea4a74af670075324
X-Osstest-Versions-That:
    ovmf=d28a68153492ce3e64fb0535674e11e7f46a88a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Mar 2021 21:37:39 +0000

flight 159872 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159872/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 94fa95c8746c553324e8b69ea4a74af670075324
baseline version:
 ovmf                 d28a68153492ce3e64fb0535674e11e7f46a88a8

Last test of basis   159866  2021-03-08 06:03:25 Z    0 days
Testing same since   159872  2021-03-08 13:11:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Rebecca Cran <rebecca@nuviainc.com>

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
   d28a681534..94fa95c874  94fa95c8746c553324e8b69ea4a74af670075324 -> xen-tested-master

