Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FD7B5969
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 19:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611758.951303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnMzl-0001kC-BY; Mon, 02 Oct 2023 17:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611758.951303; Mon, 02 Oct 2023 17:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnMzl-0001iU-84; Mon, 02 Oct 2023 17:46:13 +0000
Received: by outflank-mailman (input) for mailman id 611758;
 Mon, 02 Oct 2023 17:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnMzj-0001iK-CG; Mon, 02 Oct 2023 17:46:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnMzj-0004VO-8o; Mon, 02 Oct 2023 17:46:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnMzi-0001wX-Q0; Mon, 02 Oct 2023 17:46:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qnMzi-0007JT-PY; Mon, 02 Oct 2023 17:46:10 +0000
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
	bh=lfS1GQAueqNkOglQOX1IWw9edPK1QVepbkXKS/vH1ro=; b=V03awb19dIYpLEK/tmDo3QmYgQ
	Rp/FUcj5DoDuiS2cfz0VRP8lZ6UKl9IPd92P+7+bGjL/X5WMAUwegPimpfL5xHzx4GgML2rakVxeB
	T+N9LzhKa6i0uWEyKRHf5O7znBS/2V+hOViQsajTd0uF7rltJCquIEjUfJlKLb3sF23g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183239: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1a66bd51ca21f341281d8e3157d3d3f4a94fd26c
X-Osstest-Versions-That:
    ovmf=f6a314e5b5dc9697308740b2ac391a3c21b26403
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Oct 2023 17:46:10 +0000

flight 183239 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1a66bd51ca21f341281d8e3157d3d3f4a94fd26c
baseline version:
 ovmf                 f6a314e5b5dc9697308740b2ac391a3c21b26403

Last test of basis   183238  2023-10-02 13:14:03 Z    0 days
Testing same since   183239  2023-10-02 16:12:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   f6a314e5b5..1a66bd51ca  1a66bd51ca21f341281d8e3157d3d3f4a94fd26c -> xen-tested-master

