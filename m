Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF19917BF5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748550.1156299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOfc-0000De-H8; Wed, 26 Jun 2024 09:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748550.1156299; Wed, 26 Jun 2024 09:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOfc-0000BQ-EU; Wed, 26 Jun 2024 09:10:28 +0000
Received: by outflank-mailman (input) for mailman id 748550;
 Wed, 26 Jun 2024 09:10:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMOfa-0000BG-PR; Wed, 26 Jun 2024 09:10:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMOfa-0002qF-Iv; Wed, 26 Jun 2024 09:10:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMOfa-0001ph-5n; Wed, 26 Jun 2024 09:10:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMOfa-0007fG-5R; Wed, 26 Jun 2024 09:10:26 +0000
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
	bh=Y6tziryg9+GjHtGa+SZ6jsoli3aAaaCTu/WgNkUr+i4=; b=FZLGMgtUU+IpAz8QwkZ5AOGfln
	u9VBltM0eIRVE3KE7zdHf81rad9SIs9Av5VhmveXIEgtY9jlTwd24GpPzJWyK5EVXiZe0UYMrkF+1
	vIab0y9MctB0R55hhIO+ZlxiaEP6uEPgMy+0IchoT+ocn6YcK4ZB6lzrGuatHptYt8kc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186511-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186511: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=78bccfec9ce5082499db035270e7998d5330d75c
X-Osstest-Versions-That:
    ovmf=e21bfae345f9eee1c3f585013ca50ad6ab4f86a1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2024 09:10:26 +0000

flight 186511 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186511/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 78bccfec9ce5082499db035270e7998d5330d75c
baseline version:
 ovmf                 e21bfae345f9eee1c3f585013ca50ad6ab4f86a1

Last test of basis   186509  2024-06-26 04:41:07 Z    0 days
Testing same since   186511  2024-06-26 07:13:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   e21bfae345..78bccfec9c  78bccfec9ce5082499db035270e7998d5330d75c -> xen-tested-master

