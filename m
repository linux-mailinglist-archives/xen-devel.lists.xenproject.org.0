Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89CB57EC3C
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 08:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373609.605877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF8Fi-0004Iu-Ba; Sat, 23 Jul 2022 06:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373609.605877; Sat, 23 Jul 2022 06:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF8Fi-0004H3-7Z; Sat, 23 Jul 2022 06:04:38 +0000
Received: by outflank-mailman (input) for mailman id 373609;
 Sat, 23 Jul 2022 06:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF8Fg-0004Gt-N3; Sat, 23 Jul 2022 06:04:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF8Fg-0008Be-KW; Sat, 23 Jul 2022 06:04:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oF8Fg-0000JX-9k; Sat, 23 Jul 2022 06:04:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oF8Fg-0006TF-9C; Sat, 23 Jul 2022 06:04:36 +0000
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
	bh=/lAVp0DxzPsVE6+JLgR7qp/jAeoNZohZBX93dPSrGuc=; b=2ZcEwWCaJ/TRgnAW9lXMBpgeUt
	6xSBUZut2GXNf7/Q7DIOW+wjq1eFUECvKG+oMPZgqJQJGNn7YJzDY8+4Z0M7nOuJRV67pv1+adFsr
	FuXj7JeY9e5XjI6JOt1CC0k7cABIx7F/w0+4f9gUpyt8YEEdEsfffRE11toUp8tjJcsk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171790-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171790: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bf1ff540d9271c64f0c5323c79b20b21990626fe
X-Osstest-Versions-That:
    ovmf=5a3641bfcdcf99fd76817833488f2af8abb69383
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Jul 2022 06:04:36 +0000

flight 171790 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171790/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bf1ff540d9271c64f0c5323c79b20b21990626fe
baseline version:
 ovmf                 5a3641bfcdcf99fd76817833488f2af8abb69383

Last test of basis   171781  2022-07-22 19:41:47 Z    0 days
Testing same since   171790  2022-07-23 02:40:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mateusz Albecki <mateusz.albecki@intel.com>

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
   5a3641bfcd..bf1ff540d9  bf1ff540d9271c64f0c5323c79b20b21990626fe -> xen-tested-master

