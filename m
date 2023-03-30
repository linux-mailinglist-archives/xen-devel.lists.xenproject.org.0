Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F946D13C7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 01:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516921.801825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi27J-0004gT-Js; Thu, 30 Mar 2023 23:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516921.801825; Thu, 30 Mar 2023 23:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi27J-0004dj-H4; Thu, 30 Mar 2023 23:55:41 +0000
Received: by outflank-mailman (input) for mailman id 516921;
 Thu, 30 Mar 2023 23:55:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi27I-0004dZ-6C; Thu, 30 Mar 2023 23:55:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi27I-00084E-42; Thu, 30 Mar 2023 23:55:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi27H-0004kI-Ls; Thu, 30 Mar 2023 23:55:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pi27H-0003Oj-LT; Thu, 30 Mar 2023 23:55:39 +0000
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
	bh=sjOvP4UB6Gx0pvmtoYRsLEHBRdDPpyLMsoQgxNfgGyc=; b=4KaWygFMzNLnrhwjGS7xscGezJ
	Efz1YtYOYVBcNZ7nBqdNSR4mVpWDWJgnxyiMpY6LjwSY21u+egTyVJ27X5OUfmc7nBDrJOPWwCB3A
	es9RWAgl0MxSSoYqSOFckOdnpNuVBxns1dhzYX5tIArwe1rvPk6opv2UJKf7KKbVhYQA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180074-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180074: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b08a19eae28e76fb5a296a604c27d06fab29b08a
X-Osstest-Versions-That:
    ovmf=e9e61671237e10f7d7672ff74e8907941a954c1d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Mar 2023 23:55:39 +0000

flight 180074 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180074/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b08a19eae28e76fb5a296a604c27d06fab29b08a
baseline version:
 ovmf                 e9e61671237e10f7d7672ff74e8907941a954c1d

Last test of basis   180070  2023-03-30 17:40:41 Z    0 days
Testing same since   180074  2023-03-30 20:41:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   e9e6167123..b08a19eae2  b08a19eae28e76fb5a296a604c27d06fab29b08a -> xen-tested-master

