Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0657C941
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372644.604491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETdb-00083b-SP; Thu, 21 Jul 2022 10:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372644.604491; Thu, 21 Jul 2022 10:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETdb-00080e-PF; Thu, 21 Jul 2022 10:42:35 +0000
Received: by outflank-mailman (input) for mailman id 372644;
 Thu, 21 Jul 2022 10:42:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oETda-00080Q-EG; Thu, 21 Jul 2022 10:42:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oETda-0007vu-CB; Thu, 21 Jul 2022 10:42:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oETda-0007XJ-1j; Thu, 21 Jul 2022 10:42:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oETda-0000qK-0g; Thu, 21 Jul 2022 10:42:34 +0000
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
	bh=5lcaE83GUshn0Lkh+WmC7BzxDjWE2nrgsMsNCsISVGg=; b=jJH4yIFKfXRe6/XlLVDWC1V3Ml
	XQtrNCGyvZY6cuuAcvgQy6H0OIFxJrOGxY4lR5HrDhISioLcelEJicnIsChQYZC7EB/t3rELWyFHo
	9N3JMnNnYKXtRQ3D2+H8sl0qPXDk0UVL1RqieHpcJqUwfDgHfdOc6VWZSGT5P/+4wsTY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171717-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171717: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7ef91af84c04b1e5a17631bd1811c9bc1945dfdc
X-Osstest-Versions-That:
    ovmf=3b8cee1781c4149c7a762b8a1c8115b635cf4cad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Jul 2022 10:42:34 +0000

flight 171717 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171717/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7ef91af84c04b1e5a17631bd1811c9bc1945dfdc
baseline version:
 ovmf                 3b8cee1781c4149c7a762b8a1c8115b635cf4cad

Last test of basis   171710  2022-07-20 19:10:52 Z    0 days
Testing same since   171717  2022-07-21 06:42:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Miki Shindo <miki.shindo@intel.com>
  Shindo, Miki <miki.shindo@intel.com>

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
   3b8cee1781..7ef91af84c  7ef91af84c04b1e5a17631bd1811c9bc1945dfdc -> xen-tested-master

