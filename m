Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D379A011D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 08:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819543.1232917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0xFW-0005AZ-1l; Wed, 16 Oct 2024 06:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819543.1232917; Wed, 16 Oct 2024 06:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0xFV-00057k-Ul; Wed, 16 Oct 2024 06:11:09 +0000
Received: by outflank-mailman (input) for mailman id 819543;
 Wed, 16 Oct 2024 06:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0xFU-00057a-QN; Wed, 16 Oct 2024 06:11:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0xFU-000377-F6; Wed, 16 Oct 2024 06:11:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0xFU-0001H2-2b; Wed, 16 Oct 2024 06:11:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t0xFU-0002ua-1h; Wed, 16 Oct 2024 06:11:08 +0000
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
	bh=8RRCdcfppSu/0uauEgFCSglIgdL+g0rA55eDQz7X6XU=; b=eUfOFU/yQVEzopfmBVIPGSPEs9
	l1na/RnxGiUwVWhmtvnO6xWMi+kmu96cAjC0CBTpVDJG7ZPDWX7y5Rq/6rE7bzzNurNEYsGBbS8fI
	L0VO3NOepZTWJ1Mt3UHlcL44xj16GIu7O8mzCdujx60C2nS+N+GNynpHdBrqTXGbGY7E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188107-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188107: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a232e0cd2fe2bb882a5dd0cafe322a2899a44d51
X-Osstest-Versions-That:
    ovmf=92c1274467fff3209d3bd29c2ed994b7f2be3efe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Oct 2024 06:11:08 +0000

flight 188107 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188107/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a232e0cd2fe2bb882a5dd0cafe322a2899a44d51
baseline version:
 ovmf                 92c1274467fff3209d3bd29c2ed994b7f2be3efe

Last test of basis   188102  2024-10-16 00:43:29 Z    0 days
Testing same since   188107  2024-10-16 04:13:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   92c1274467..a232e0cd2f  a232e0cd2fe2bb882a5dd0cafe322a2899a44d51 -> xen-tested-master

