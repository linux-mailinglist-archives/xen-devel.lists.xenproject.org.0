Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D015999B0D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 05:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816597.1230735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz64o-0007cl-4O; Fri, 11 Oct 2024 03:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816597.1230735; Fri, 11 Oct 2024 03:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz64o-0007aL-16; Fri, 11 Oct 2024 03:12:26 +0000
Received: by outflank-mailman (input) for mailman id 816597;
 Fri, 11 Oct 2024 03:12:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sz64m-0007aB-B4; Fri, 11 Oct 2024 03:12:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sz64m-0002oI-90; Fri, 11 Oct 2024 03:12:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sz64l-0002m2-Tw; Fri, 11 Oct 2024 03:12:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sz64l-0001dP-Ra; Fri, 11 Oct 2024 03:12:23 +0000
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
	bh=XoLdPZd6f7PnYQ0IKB9ek40P+kmB4THtRi2hUCHJ6ew=; b=yLAWOWvdTcOkn0kyT4lv7CLm3e
	nYYvEhfbRRDX0YIeabrsEmdDiz5zSQsOmnDpajgIk6sYXxH+EgsAG09pJgPse9l+Rcm2mZNoJHwjC
	uL9SJuVT2qUbl/WDqAvTO2fdqoYWwSEbY+KdnfKCCJ3grNSLrLRmKH0S668rmnTjnbW0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188049-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188049: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d2a41d1a7a555e54336e03731c801eb93fba801d
X-Osstest-Versions-That:
    ovmf=0bae161fed39d8996693e586b77f31094b61b9d7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Oct 2024 03:12:23 +0000

flight 188049 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188049/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d2a41d1a7a555e54336e03731c801eb93fba801d
baseline version:
 ovmf                 0bae161fed39d8996693e586b77f31094b61b9d7

Last test of basis   188039  2024-10-10 06:13:22 Z    0 days
Testing same since   188049  2024-10-11 01:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>
  Rebecca Cran <rebecca@os.amperecomputing.com>

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
   0bae161fed..d2a41d1a7a  d2a41d1a7a555e54336e03731c801eb93fba801d -> xen-tested-master

