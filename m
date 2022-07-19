Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CF57A8A0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 22:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371175.603023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDuD4-0005KG-Bi; Tue, 19 Jul 2022 20:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371175.603023; Tue, 19 Jul 2022 20:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDuD4-0005IU-8x; Tue, 19 Jul 2022 20:52:50 +0000
Received: by outflank-mailman (input) for mailman id 371175;
 Tue, 19 Jul 2022 20:52:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDuD2-0005IF-Vw; Tue, 19 Jul 2022 20:52:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDuD2-0000Aw-V0; Tue, 19 Jul 2022 20:52:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDuD2-0003n1-I4; Tue, 19 Jul 2022 20:52:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oDuD2-0006BO-Ha; Tue, 19 Jul 2022 20:52:48 +0000
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
	bh=q8SIdDtSPYqz+GrNan5sb6dvYvakENIQQmSlEIHln/o=; b=3VadKrYxrAykd4PWzAHHY1de6E
	oh/SYusmsPWb7bCU9M2Ok4hKE1l0yXO1jM3sboiMJ1x+glajvzsnUENObrNnHRaElVGVS+Q7pHLSJ
	l/rx0nG2+GqpYSBG/tNiQ9RgVkN7yc34JQJ/VlbGWb0MNESfEQFW9szua5gOsLr+GGGg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171691-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171691: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=671b0cea510ad6de02ee9d6dbdf8f9bbb881f35d
X-Osstest-Versions-That:
    ovmf=19a87683654a4969a9f86a3d02199c253c789970
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jul 2022 20:52:48 +0000

flight 171691 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171691/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 671b0cea510ad6de02ee9d6dbdf8f9bbb881f35d
baseline version:
 ovmf                 19a87683654a4969a9f86a3d02199c253c789970

Last test of basis   171689  2022-07-19 16:41:40 Z    0 days
Testing same since   171691  2022-07-19 19:12:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Saloni Kasbekar <saloni.kasbekar@intel.com>

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
   19a8768365..671b0cea51  671b0cea510ad6de02ee9d6dbdf8f9bbb881f35d -> xen-tested-master

