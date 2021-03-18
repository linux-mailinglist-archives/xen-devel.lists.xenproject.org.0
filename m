Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347BD33FE48
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 05:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98816.187684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMkT4-0001CB-Gp; Thu, 18 Mar 2021 04:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98816.187684; Thu, 18 Mar 2021 04:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMkT4-0001Bl-BN; Thu, 18 Mar 2021 04:41:06 +0000
Received: by outflank-mailman (input) for mailman id 98816;
 Thu, 18 Mar 2021 04:41:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkT2-0001Bd-VM; Thu, 18 Mar 2021 04:41:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkT2-0007zh-QU; Thu, 18 Mar 2021 04:41:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkT2-0006wd-Cp; Thu, 18 Mar 2021 04:41:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMkT2-0003m6-CK; Thu, 18 Mar 2021 04:41:04 +0000
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
	bh=H4hmkS2/xGxD4KUEE9Ldvtk0k3oQ8sZRYLpEJX2lVtU=; b=5IJkHkQRgiGY5rQflvjfxwn7Mh
	YtykLxkQ+O6xl9slB0umLMF/BSFxCk+xNo3IN8UaiFTFVJ1yKjzCG3u2kwwio5xemI+qPO+0vCQYA
	vCLVR8tkCo9OYUSUAcxgCy45LjmfMY6/Q8U7J6tVWlRtacdNku+0z/NKadAr68Y8R4xk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160117: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=030ba3097a6e7d08b99f8a9d19a322f61409c1f6
X-Osstest-Versions-That:
    ovmf=e4ff3773b711527ff46759759f34ea1cb9ff2a45
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Mar 2021 04:41:04 +0000

flight 160117 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160117/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 030ba3097a6e7d08b99f8a9d19a322f61409c1f6
baseline version:
 ovmf                 e4ff3773b711527ff46759759f34ea1cb9ff2a45

Last test of basis   160114  2021-03-17 11:39:41 Z    0 days
Testing same since   160117  2021-03-17 20:41:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>

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
   e4ff3773b7..030ba3097a  030ba3097a6e7d08b99f8a9d19a322f61409c1f6 -> xen-tested-master

