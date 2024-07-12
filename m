Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E092F46C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 05:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757757.1166894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS71f-0002kN-QF; Fri, 12 Jul 2024 03:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757757.1166894; Fri, 12 Jul 2024 03:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS71f-0002it-NQ; Fri, 12 Jul 2024 03:32:51 +0000
Received: by outflank-mailman (input) for mailman id 757757;
 Fri, 12 Jul 2024 03:32:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS71e-0002ij-9M; Fri, 12 Jul 2024 03:32:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS71e-0007i3-7C; Fri, 12 Jul 2024 03:32:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS71d-0003Wk-Ss; Fri, 12 Jul 2024 03:32:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sS71d-0002do-SA; Fri, 12 Jul 2024 03:32:49 +0000
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
	bh=7sxcDMPffcDgWsQo3cdldRa1IFOtxQqtFjMUneZHohc=; b=b7xp1rq6vur+D7rH1AUt3Hxza7
	ckf7+mGe95jmn4/pYri49Uem8CPBwFpVarLeG6DMV+zBYsmaT/o4Eh3+02mnrOIChAgpqI+wH/gCA
	BExYJRGnm4rHhCprAaBGd1QJiUD2oHNaG2sHA7B6cj6lk3WnGR2xaaPwCRFcIc7rquu8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186770-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186770: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f122c6f639cd3babedc0dd9b38b279d94b087c7a
X-Osstest-Versions-That:
    ovmf=5c86b0b57c153bde28f925de80cc011dd4ff1f9d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jul 2024 03:32:49 +0000

flight 186770 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186770/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f122c6f639cd3babedc0dd9b38b279d94b087c7a
baseline version:
 ovmf                 5c86b0b57c153bde28f925de80cc011dd4ff1f9d

Last test of basis   186768  2024-07-11 22:11:19 Z    0 days
Testing same since   186770  2024-07-12 02:11:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   5c86b0b57c..f122c6f639  f122c6f639cd3babedc0dd9b38b279d94b087c7a -> xen-tested-master

