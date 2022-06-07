Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF7539640
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339960.564901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6ZH-0003dO-M6; Tue, 31 May 2022 18:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339960.564901; Tue, 31 May 2022 18:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6ZH-0003ag-IN; Tue, 31 May 2022 18:26:11 +0000
Received: by outflank-mailman (input) for mailman id 339960;
 Tue, 31 May 2022 18:26:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nw6ZF-0003aN-ST; Tue, 31 May 2022 18:26:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nw6ZF-0001lH-PS; Tue, 31 May 2022 18:26:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nw6ZF-0007mE-CO; Tue, 31 May 2022 18:26:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nw6ZF-0008AT-Bv; Tue, 31 May 2022 18:26:09 +0000
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
	bh=2J24G2R9G+nejzBfSvqcmHDi0b0e3ZjnF2gjf54l+4Q=; b=Ajh8ByoXvD9FHDzgUwCOgXCSEU
	YvksVdhRCFig2Brnv1xnii+idlZg+5ftbOEnngC1cI0e+JJ3Il1zjN3rKWAXF4lzXWvsibgqbBUIp
	zBg5R5yfnpiQ/5w5tct+9exIQGRwiQlWZeqF9+pQyxTVJQSPiTIJuGX8RuPPyTUYHs50=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170789-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 170789: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=37ea4e513a2ce0cd22f9c9a32b18d5c022e38e12
X-Osstest-Versions-That:
    xtf=bc0abf2a5498d4691538bf34496ca0f0f189951b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 May 2022 18:26:09 +0000

flight 170789 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170789/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  37ea4e513a2ce0cd22f9c9a32b18d5c022e38e12
baseline version:
 xtf                  bc0abf2a5498d4691538bf34496ca0f0f189951b

Last test of basis   168044  2022-02-07 11:41:42 Z  113 days
Testing same since   170789  2022-05-31 17:41:55 Z    0 days    1 attempts

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
   bc0abf2..37ea4e5  37ea4e513a2ce0cd22f9c9a32b18d5c022e38e12 -> xen-tested-master

