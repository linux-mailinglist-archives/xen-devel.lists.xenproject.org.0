Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C400931332B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 14:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82864.153233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l96Wt-0002VT-Pa; Mon, 08 Feb 2021 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82864.153233; Mon, 08 Feb 2021 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l96Wt-0002V2-MF; Mon, 08 Feb 2021 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 82864;
 Mon, 08 Feb 2021 13:24:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l96Ws-0002Uu-Lh; Mon, 08 Feb 2021 13:24:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l96Ws-0004KJ-Dv; Mon, 08 Feb 2021 13:24:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l96Ws-0003UP-6c; Mon, 08 Feb 2021 13:24:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l96Ws-0000KK-67; Mon, 08 Feb 2021 13:24:38 +0000
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
	bh=uuIqbcshItmYOSTgBEQ0jiL30QutDp0qB/bUjXlOGyI=; b=FaYDD+8QdM9KyygwZyQlWrcs2Y
	aC0hsXYIGdW4CPPUIU4gHfDXBBSK2JK0z9jNPQiq1LgzAMA4LF/OGouUK69VzWS7l1U0qTV0UZs09
	OyHxTf9J5kE5qxUb5FgtvghU6N3LZU9WEqj4U57MiWDUllDloIDMrT1jBEe8oz6LbUTY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159136: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    ovmf=43a113385e370530eb52cf2e55b3019d8d4f6558
X-Osstest-Versions-That:
    ovmf=0d96664df322d50e0ac54130e129c0bf4f2b72df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 13:24:38 +0000

flight 159136 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159136/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate              starved n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate             starved n/a

version targeted for testing:
 ovmf                 43a113385e370530eb52cf2e55b3019d8d4f6558
baseline version:
 ovmf                 0d96664df322d50e0ac54130e129c0bf4f2b72df

Last test of basis   159040  2021-02-05 11:11:01 Z    3 days
Testing same since   159088  2021-02-07 01:54:46 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Liming Gao <gaoliming@byosoft.com.cn>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         starved 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          starved 


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
   0d96664df3..43a113385e  43a113385e370530eb52cf2e55b3019d8d4f6558 -> xen-tested-master

