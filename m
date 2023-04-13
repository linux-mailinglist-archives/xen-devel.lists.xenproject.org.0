Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8E6E1548
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520916.809049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2nb-0003b1-Ig; Thu, 13 Apr 2023 19:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520916.809049; Thu, 13 Apr 2023 19:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2nb-0003Xq-En; Thu, 13 Apr 2023 19:40:03 +0000
Received: by outflank-mailman (input) for mailman id 520916;
 Thu, 13 Apr 2023 19:40:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pn2na-0003NY-8k; Thu, 13 Apr 2023 19:40:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pn2na-0003rE-6T; Thu, 13 Apr 2023 19:40:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pn2nZ-0007jj-Ik; Thu, 13 Apr 2023 19:40:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pn2nZ-0002Lq-IH; Thu, 13 Apr 2023 19:40:01 +0000
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
	bh=70YuiFdaBmGYRLXWsf/sjI9TxOH8QbwNtHlLuyqweXg=; b=H6r8TCNAvn9kpkeOdPzX2Xl+tb
	lGcax7he2LMTMW0JPde6nDp+uS3RZz3iQPHitcBnwdrY4LoSed3aHJNo4cn2+iUcP3vF6HBOpbswX
	4wZ0AhCoswnmYEwAymz4mA3UrYKDMrGJiVRdKnm6HgqMH9ukE7++QhO3Q98djh+8gKKw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180248-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180248: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d795fb571b9b2c2ee67ceaef372d5cc461767859
X-Osstest-Versions-That:
    ovmf=42b0443599a69c703034079cf2bd389fa3a6bfde
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Apr 2023 19:40:01 +0000

flight 180248 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180248/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d795fb571b9b2c2ee67ceaef372d5cc461767859
baseline version:
 ovmf                 42b0443599a69c703034079cf2bd389fa3a6bfde

Last test of basis   180229  2023-04-13 06:12:19 Z    0 days
Testing same since   180248  2023-04-13 16:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>

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
   42b0443599..d795fb571b  d795fb571b9b2c2ee67ceaef372d5cc461767859 -> xen-tested-master

