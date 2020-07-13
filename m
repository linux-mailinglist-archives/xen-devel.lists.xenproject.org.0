Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581221E1E5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 23:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jv5lL-0005ZH-Hv; Mon, 13 Jul 2020 21:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fjqj=AY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jv5lK-0005ZC-1S
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 21:13:22 +0000
X-Inumbo-ID: ae122124-c54d-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae122124-c54d-11ea-bb8b-bc764e2007e4;
 Mon, 13 Jul 2020 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=laf81dCMnqLhyWOADgLo3ZfPx6gkEFZUfMZWpMJL9zM=; b=XNiV4cccs/BbiTIm0b+lBxZKA
 /wL/qnjRRrm4XZ6pXSqB/WVWFkWE8vaKWVxcwkyxe5qVN167wHBERUII/tzQ6Cj5NkoXyNHcq3EUy
 582f432C/ci3BbDfeQslB+WbJWizvidY9llaf2N68dbzNFcl3p8TpjaeP2DhF1taxZr4Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-00080l-W1; Mon, 13 Jul 2020 21:13:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-0004EU-LD; Mon, 13 Jul 2020 21:13:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jv5lI-0005t4-Kf; Mon, 13 Jul 2020 21:13:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151867-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151867: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d9a4084544134eea50f62e88d79c466ae91f0455
X-Osstest-Versions-That: ovmf=f45e3a4afa65a45ea1a956a7c5e7410ff40190d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Jul 2020 21:13:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151867 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151867/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d9a4084544134eea50f62e88d79c466ae91f0455
baseline version:
 ovmf                 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1

Last test of basis   151821  2020-07-11 06:33:51 Z    2 days
Testing same since   151867  2020-07-13 16:09:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>

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
   f45e3a4afa..d9a4084544  d9a4084544134eea50f62e88d79c466ae91f0455 -> xen-tested-master

