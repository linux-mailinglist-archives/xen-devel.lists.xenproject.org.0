Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2EA96CD76
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 05:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790891.1200671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm3P6-0008LX-0v; Thu, 05 Sep 2024 03:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790891.1200671; Thu, 05 Sep 2024 03:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm3P5-0008J3-UR; Thu, 05 Sep 2024 03:43:27 +0000
Received: by outflank-mailman (input) for mailman id 790891;
 Thu, 05 Sep 2024 03:43:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm3P5-0008It-DY; Thu, 05 Sep 2024 03:43:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm3P5-0006do-8Z; Thu, 05 Sep 2024 03:43:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sm3P5-00052G-0a; Thu, 05 Sep 2024 03:43:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sm3P5-0005DX-01; Thu, 05 Sep 2024 03:43:27 +0000
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
	bh=drcnLnm0qPX/ExrWU4Oe/iVBQHqiTKoKqAHE3NR32nA=; b=uvb2DNrxL2OFgwdZWolA2w6Adz
	P68S6pAmX8lMNdc6cDQKTqbHHiGfKplj3mxaSEpI7svI9RxfnFfQ2YuanTSludVtxqOsdxpkxNFZE
	Orcbuy8DwwAAksx68651xCQE94Ibt1+Eie3NffxDsla56MGZv35IrUWfJb8DxlgJcuZA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187499-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187499: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2ddce71142a6243aa4dc64242553d6591eb58def
X-Osstest-Versions-That:
    ovmf=99d60cbd3990fe8f5b86eaab40876fbbf9d99084
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Sep 2024 03:43:27 +0000

flight 187499 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187499/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2ddce71142a6243aa4dc64242553d6591eb58def
baseline version:
 ovmf                 99d60cbd3990fe8f5b86eaab40876fbbf9d99084

Last test of basis   187491  2024-09-04 10:44:58 Z    0 days
Testing same since   187499  2024-09-05 02:00:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   99d60cbd39..2ddce71142  2ddce71142a6243aa4dc64242553d6591eb58def -> xen-tested-master

