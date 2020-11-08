Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CDE2AA88F
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 01:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21520.47841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbYWy-0007n4-W0; Sun, 08 Nov 2020 00:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21520.47841; Sun, 08 Nov 2020 00:26:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbYWy-0007mi-Sj; Sun, 08 Nov 2020 00:26:04 +0000
Received: by outflank-mailman (input) for mailman id 21520;
 Sun, 08 Nov 2020 00:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbYWx-0007m9-MW
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 00:26:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc81f1c-9db6-4b4f-9753-f6149f45a29a;
 Sun, 08 Nov 2020 00:25:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbYWr-0003vK-3l; Sun, 08 Nov 2020 00:25:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbYWq-0004E3-S4; Sun, 08 Nov 2020 00:25:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbYWq-0004GN-Rb; Sun, 08 Nov 2020 00:25:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=h6fj=EO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbYWx-0007m9-MW
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 00:26:03 +0000
X-Inumbo-ID: 0cc81f1c-9db6-4b4f-9753-f6149f45a29a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0cc81f1c-9db6-4b4f-9753-f6149f45a29a;
	Sun, 08 Nov 2020 00:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=izeQwlWS8UvaOMwiy86qNmLXkcV3BdwiHO56Va8Xn9k=; b=LtV3X/2eIlL4mFfkh5zAjqdkF/
	+zZ+yBXQZuy4RQnRWXRS+KSPULd7xVk3sRXugUo3y2pTNcZ6CitcVhfg1RT6euRFsiqBfCbz+EF86
	YkcNIsQEx7wkVWgDmyPdkv9n8rG6gypVAOpriASSsnVrg78xgNWsA43H1yyT3zkGid7k=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbYWr-0003vK-3l; Sun, 08 Nov 2020 00:25:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbYWq-0004E3-S4; Sun, 08 Nov 2020 00:25:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbYWq-0004GN-Rb; Sun, 08 Nov 2020 00:25:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156541-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 156541: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=848c3f2dd42711c4d9fc01839d6630c115daa22f
X-Osstest-Versions-That:
    xtf=f11bbff0c02e3a0b0ca01f0f3458678b7ad5173f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Nov 2020 00:25:56 +0000

flight 156541 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156541/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  848c3f2dd42711c4d9fc01839d6630c115daa22f
baseline version:
 xtf                  f11bbff0c02e3a0b0ca01f0f3458678b7ad5173f

Last test of basis   156531  2020-11-06 16:10:06 Z    1 days
Testing same since   156541  2020-11-07 19:44:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   f11bbff..848c3f2  848c3f2dd42711c4d9fc01839d6630c115daa22f -> xen-tested-master

