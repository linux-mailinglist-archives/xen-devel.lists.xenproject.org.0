Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CE7EBD28
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 07:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633498.988326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39ZC-00028O-C0; Wed, 15 Nov 2023 06:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633498.988326; Wed, 15 Nov 2023 06:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39ZC-00024Q-8E; Wed, 15 Nov 2023 06:40:02 +0000
Received: by outflank-mailman (input) for mailman id 633498;
 Wed, 15 Nov 2023 06:40:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r39ZA-0001v4-Ka; Wed, 15 Nov 2023 06:40:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r39ZA-0001cX-HU; Wed, 15 Nov 2023 06:40:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r39ZA-0007tk-5s; Wed, 15 Nov 2023 06:40:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r39ZA-0007Pb-5J; Wed, 15 Nov 2023 06:40:00 +0000
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
	bh=x+C1Qiy8se0nBAgFrS3s4sKbUju7/03IxD+RC27rxJU=; b=fKMWjekl3jGNeLZHKr5qW3gDaC
	WGpmBRjH1DYZIsdkgyiHwJY6s+oouMWsP/DazskEQ6WfvdKqbMka6ufSuuOAUxB/FV/Xq2fVUFeiI
	BGm5scH99MGAYcXdQQREU78D3gtdgRQ6BJVFg0gHK5ZN16TZCluKjsM27UhWLKHLf1Oc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183758-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183758: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3db76e6476e493d3cda45b81bba99a645180cf35
X-Osstest-Versions-That:
    ovmf=c9cce5a00591dc437c258f0365b5d434c628b1e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Nov 2023 06:40:00 +0000

flight 183758 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183758/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3db76e6476e493d3cda45b81bba99a645180cf35
baseline version:
 ovmf                 c9cce5a00591dc437c258f0365b5d434c628b1e0

Last test of basis   183741  2023-11-13 05:42:55 Z    2 days
Testing same since   183758  2023-11-15 04:11:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igor Kulchytskyy <igork@ami.com>

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
   c9cce5a005..3db76e6476  3db76e6476e493d3cda45b81bba99a645180cf35 -> xen-tested-master

