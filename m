Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70424588242
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 21:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379449.612905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIxDC-0005sY-CS; Tue, 02 Aug 2022 19:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379449.612905; Tue, 02 Aug 2022 19:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIxDC-0005pX-8t; Tue, 02 Aug 2022 19:05:50 +0000
Received: by outflank-mailman (input) for mailman id 379449;
 Tue, 02 Aug 2022 19:05:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIxDA-0005pN-Rg; Tue, 02 Aug 2022 19:05:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIxDA-0004yJ-Ps; Tue, 02 Aug 2022 19:05:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIxDA-0001Yk-9Q; Tue, 02 Aug 2022 19:05:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oIxDA-0007FG-8z; Tue, 02 Aug 2022 19:05:48 +0000
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
	bh=G0yQMWxMARXtWPxXqtsB+5smEw2HMNJVKmv3ze0eyLc=; b=isz4RuWVWNvvtNcQ/htUlICLAt
	p3d9pEdjtHACjf1GRJTilly7Cs9wyFtMG3f2J4rQkDShwWWpbH8onzJ8VZV2hi9ZwbYv/26buLnpr
	QqU37rTpyRNPz95Xzk/iA1Nag0zls88/nQzu3W4bu2E6FwG5a77WjSnwEUAfnNHz7/Gw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172085-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172085: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a551de0d9310ed930cf090348c58fdec75044a53
X-Osstest-Versions-That:
    ovmf=19cbfaa4319edabf5feb4e9d867f042c2d5e72b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Aug 2022 19:05:48 +0000

flight 172085 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172085/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a551de0d9310ed930cf090348c58fdec75044a53
baseline version:
 ovmf                 19cbfaa4319edabf5feb4e9d867f042c2d5e72b6

Last test of basis   172071  2022-08-01 20:40:27 Z    0 days
Testing same since   172085  2022-08-02 17:10:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Edward Pickup <edward.pickup@arm.com>

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
   19cbfaa431..a551de0d93  a551de0d9310ed930cf090348c58fdec75044a53 -> xen-tested-master

