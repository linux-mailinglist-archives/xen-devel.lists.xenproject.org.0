Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D2436631
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 17:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214524.373097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZwI-0003ue-7D; Thu, 21 Oct 2021 15:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214524.373097; Thu, 21 Oct 2021 15:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdZwI-0003rD-2X; Thu, 21 Oct 2021 15:25:06 +0000
Received: by outflank-mailman (input) for mailman id 214524;
 Thu, 21 Oct 2021 15:25:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdZwG-0003r3-Gl; Thu, 21 Oct 2021 15:25:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdZwG-0003Oi-CS; Thu, 21 Oct 2021 15:25:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdZwG-0000cp-4N; Thu, 21 Oct 2021 15:25:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mdZwG-0002Cx-3t; Thu, 21 Oct 2021 15:25:04 +0000
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
	bh=EWVvrz+Cop1Y1MUEiVNlOOXDEWF2gI5psnZa6CXWNM4=; b=bs+/l/KvtDY0f9HtoqpsH60p/l
	PJTdQrOp8mZp/HEyf8A+GM02lKHyzfkY5rz5ks86uIy96LhIaL67T+1v1FknayoizROSmbErEwupP
	qgUM7IQoNFYM7X/IYJpyqZ9Hx+SepnLNk0O2Cq4kmN4DuwvVC7zDzs/1L1tdvM+zJyvU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165701-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165701: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=305fd6bee0bfe1602163d1f8841954f84aa31b68
X-Osstest-Versions-That:
    ovmf=6893865b3010bb6192f732643c4b8ba026726d07
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Oct 2021 15:25:04 +0000

flight 165701 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165701/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 305fd6bee0bfe1602163d1f8841954f84aa31b68
baseline version:
 ovmf                 6893865b3010bb6192f732643c4b8ba026726d07

Last test of basis   165690  2021-10-20 13:40:00 Z    1 days
Testing same since   165701  2021-10-21 03:40:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  IanX Kuo <ianx.kuo@intel.com>

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
   6893865b30..305fd6bee0  305fd6bee0bfe1602163d1f8841954f84aa31b68 -> xen-tested-master

