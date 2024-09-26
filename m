Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459759877B5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805741.1216938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strWx-0006hQ-Hj; Thu, 26 Sep 2024 16:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805741.1216938; Thu, 26 Sep 2024 16:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strWx-0006fH-Cy; Thu, 26 Sep 2024 16:39:51 +0000
Received: by outflank-mailman (input) for mailman id 805741;
 Thu, 26 Sep 2024 16:39:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1strWw-0006f7-CY; Thu, 26 Sep 2024 16:39:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1strWw-0002dO-5H; Thu, 26 Sep 2024 16:39:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1strWv-0000lq-Pj; Thu, 26 Sep 2024 16:39:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1strWv-00037s-PK; Thu, 26 Sep 2024 16:39:49 +0000
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
	bh=xLI62+UcR1JQTBjNg0kA7rzHAuJYlvZ/ErIdOubZkRg=; b=WLZFHgrOJB+W6Btowk0on0qE3V
	0bgApC6t1cXwt3USMhTbBUyT72sDc7/cPrjwFv0dpE09CCmVWNvXvJSXcEqKjIot5cvSIeIWLgP6A
	LLA4ye0zO5TNz+nDKL9UBSd6x5x9+dk0vZKiH0jLiR/JLG9alR9tGt5bX8RaAUw/MGb0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187866-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187866: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2936b7d1628c8c6f7cc838af5f9ab1562dfb5122
X-Osstest-Versions-That:
    ovmf=39462fcd99349732ef561cda71c4c633b8ce8246
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Sep 2024 16:39:49 +0000

flight 187866 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187866/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2936b7d1628c8c6f7cc838af5f9ab1562dfb5122
baseline version:
 ovmf                 39462fcd99349732ef561cda71c4c633b8ce8246

Last test of basis   187858  2024-09-25 16:11:33 Z    1 days
Testing same since   187866  2024-09-26 14:12:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

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
   39462fcd99..2936b7d162  2936b7d1628c8c6f7cc838af5f9ab1562dfb5122 -> xen-tested-master

