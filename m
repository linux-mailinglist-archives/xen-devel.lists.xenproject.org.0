Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B47A6ED4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 00:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605049.942670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qijW3-0000Ud-SX; Tue, 19 Sep 2023 22:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605049.942670; Tue, 19 Sep 2023 22:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qijW3-0000Sx-PA; Tue, 19 Sep 2023 22:48:23 +0000
Received: by outflank-mailman (input) for mailman id 605049;
 Tue, 19 Sep 2023 22:48:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qijW2-0000Sn-Ia; Tue, 19 Sep 2023 22:48:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qijW2-0001Pu-Cp; Tue, 19 Sep 2023 22:48:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qijW2-0004jM-4k; Tue, 19 Sep 2023 22:48:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qijW2-0004ue-4I; Tue, 19 Sep 2023 22:48:22 +0000
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
	bh=9Q8DK5c4kk9LmjFFil6RhFfj4gXKisOYupT3Bt+I+g0=; b=N36m63p/Za/KGqh9gsLzDK7ppv
	C7dQaIZWBSriCT8YEYVf6tOiJu0mosZAzZZWxbUb/ZZ9sS0op/Oz1mX7fxAW7NxDjM3Ex9EN96jbk
	/ZOhcvvfL3GN6sx7KU9NEHsOAA3OJkhFKEVchF8VjY5v4HJZES4UxufqDGHQe1+u6TKY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183072: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eb485b6438f488db5300b56949d9dad460c9f2d4
X-Osstest-Versions-That:
    ovmf=7275993dc64481b1c21d7d70af434bfaafe86e81
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Sep 2023 22:48:22 +0000

flight 183072 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183072/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eb485b6438f488db5300b56949d9dad460c9f2d4
baseline version:
 ovmf                 7275993dc64481b1c21d7d70af434bfaafe86e81

Last test of basis   183063  2023-09-19 16:10:46 Z    0 days
Testing same since   183072  2023-09-19 20:45:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>
  Peter Maydell <peter.maydell@linaro.org>

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
   7275993dc6..eb485b6438  eb485b6438f488db5300b56949d9dad460c9f2d4 -> xen-tested-master

