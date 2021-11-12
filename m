Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E644E49A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225103.388764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTq2-0006fj-1n; Fri, 12 Nov 2021 10:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225103.388764; Fri, 12 Nov 2021 10:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTq1-0006d2-U8; Fri, 12 Nov 2021 10:31:17 +0000
Received: by outflank-mailman (input) for mailman id 225103;
 Fri, 12 Nov 2021 10:31:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlTpz-0006cs-RX; Fri, 12 Nov 2021 10:31:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlTpz-0005xI-IZ; Fri, 12 Nov 2021 10:31:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlTpz-0005Rn-8x; Fri, 12 Nov 2021 10:31:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mlTpz-0007Bt-8S; Fri, 12 Nov 2021 10:31:15 +0000
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
	bh=7JcLTbHerWqu0a6RjSSLS0+4GBw2WyzvidnVOhmDjS8=; b=3K+Z1gXAR198Av42fCOHKfbR28
	P/scXGs8bcDnM97FoYYQghvtL2nfp6cCbwI3zFmCSnpvHCpxBP8DqUQIZ19QCXW5HNC7fLs+vtPac
	CFryroJK/cZN7Jk3RPDZ+/vRva7M4dlpex0/sP1P6gIBcl7gqPD8OKKBZjVi3LxxAsTw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166123: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4c495e5e3d387b26e1f22d708ff707eee6898c17
X-Osstest-Versions-That:
    ovmf=a92559671a3bbdbc154429cf66edf4f490bbe218
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Nov 2021 10:31:15 +0000

flight 166123 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166123/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4c495e5e3d387b26e1f22d708ff707eee6898c17
baseline version:
 ovmf                 a92559671a3bbdbc154429cf66edf4f490bbe218

Last test of basis   166120  2021-11-11 23:10:10 Z    0 days
Testing same since   166123  2021-11-12 07:27:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Peter Grehan <grehan@freebsd.org>

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
   a92559671a..4c495e5e3d  4c495e5e3d387b26e1f22d708ff707eee6898c17 -> xen-tested-master

