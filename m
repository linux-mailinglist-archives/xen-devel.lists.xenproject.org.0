Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC054DF25
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 12:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350534.576909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mmy-0007oI-CB; Thu, 16 Jun 2022 10:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350534.576909; Thu, 16 Jun 2022 10:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mmy-0007lT-8u; Thu, 16 Jun 2022 10:31:48 +0000
Received: by outflank-mailman (input) for mailman id 350534;
 Thu, 16 Jun 2022 10:31:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1mmw-0007lJ-Tj; Thu, 16 Jun 2022 10:31:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1mmw-0008B7-R9; Thu, 16 Jun 2022 10:31:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o1mmw-0000F3-BN; Thu, 16 Jun 2022 10:31:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o1mmw-0001KV-Ax; Thu, 16 Jun 2022 10:31:46 +0000
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
	bh=GDsQTEfGlVxzgDpAQbuf2Yrap7eRmaN8WWjyAteZKuY=; b=f3w4IwaND7i5xmUGWpmNN51xSa
	iDbR327xZdC08MDSTOYNSuA+MuBgikZZ0o40xFavYYpIxPl3sU/+iA4Eb2qp7g+WCjzp5YVoEmS49
	+N1PTvaLs8HR8/jJLuWCpO5GsDuL0jeiRCYW8ofMk4qkZu5W278lE9Q6zUMwP4VQPDrA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171192-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171192: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=05e57cc9ced67d2cd633c2bdcf70b5e1352bf635
X-Osstest-Versions-That:
    ovmf=6676162f64ad39949ed44f17ce40e5c49ab33e31
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Jun 2022 10:31:46 +0000

flight 171192 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171192/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 05e57cc9ced67d2cd633c2bdcf70b5e1352bf635
baseline version:
 ovmf                 6676162f64ad39949ed44f17ce40e5c49ab33e31

Last test of basis   171158  2022-06-14 03:11:59 Z    2 days
Testing same since   171192  2022-06-16 08:10:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   6676162f64..05e57cc9ce  05e57cc9ced67d2cd633c2bdcf70b5e1352bf635 -> xen-tested-master

