Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B459977731
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 05:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797913.1207980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sowei-0006gC-Sm; Fri, 13 Sep 2024 03:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797913.1207980; Fri, 13 Sep 2024 03:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sowei-0006eA-Pl; Fri, 13 Sep 2024 03:07:32 +0000
Received: by outflank-mailman (input) for mailman id 797913;
 Fri, 13 Sep 2024 03:07:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soweh-0006e0-Kk; Fri, 13 Sep 2024 03:07:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soweh-0003Pf-DR; Fri, 13 Sep 2024 03:07:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soweh-00082R-0q; Fri, 13 Sep 2024 03:07:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soweh-000107-0H; Fri, 13 Sep 2024 03:07:31 +0000
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
	bh=8fexl8FjrIZwrlMDxwyGqrLpbMedwZQPbKpWDzqiE18=; b=SB76+Ek+e9zlvGgoi0/VKWPhlO
	T2/CN5KlhO5bTDhVp5Epwvp2rOrTHbpp8/dsiC+hXKv5isXn+h+fE2UHeTqdwc7rKe7PiOX+m7kJ9
	h2H17kCykmC4ieJzrVBn99GQz+M6ioldOyLzb3bq35BjJX3j1cJkCQzNeD9h15X8+Jc8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187684-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187684: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6706fe6e239253e45b28147e06f71dd68a374007
X-Osstest-Versions-That:
    ovmf=bb403511d412959aaa3733a8235257190d63b3ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 03:07:31 +0000

flight 187684 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187684/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6706fe6e239253e45b28147e06f71dd68a374007
baseline version:
 ovmf                 bb403511d412959aaa3733a8235257190d63b3ad

Last test of basis   187683  2024-09-12 21:41:30 Z    0 days
Testing same since   187684  2024-09-13 00:45:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   bb403511d4..6706fe6e23  6706fe6e239253e45b28147e06f71dd68a374007 -> xen-tested-master

