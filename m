Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92884C6E9D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280579.478571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgSQ-0002ki-F5; Mon, 28 Feb 2022 13:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280579.478571; Mon, 28 Feb 2022 13:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgSQ-0002iq-Bv; Mon, 28 Feb 2022 13:52:58 +0000
Received: by outflank-mailman (input) for mailman id 280579;
 Mon, 28 Feb 2022 13:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOgSO-0002ig-L2; Mon, 28 Feb 2022 13:52:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOgSO-0006Lv-I4; Mon, 28 Feb 2022 13:52:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOgSO-0002rw-23; Mon, 28 Feb 2022 13:52:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nOgSO-0002S7-1b; Mon, 28 Feb 2022 13:52:56 +0000
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
	bh=qtu9lSRUzzjRUVwCk1NIYZfnuS/0jPK5ItpkE6GPOsQ=; b=tvwtmi46JE+8+kXyan/qpXuVNV
	ED254znfZrDi1xPa3qhIbj4iOHug9Kka7ASHK4v3tYD7+F9EdnyExz/pLPdlXkDWGj7PznqmaTyTi
	cAhJa4lgAeV6DiPgQ/uN2aTBasLSPT+ArdGS94DfIagOI6GSywkt2t6jYXy2f7652LNI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168254-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168254: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b1b89f9009f2390652e0061bd7b24fc40732bc70
X-Osstest-Versions-That:
    ovmf=f1d1c337e7c0575da7fd248b2dd9cffc755940df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Feb 2022 13:52:56 +0000

flight 168254 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168254/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b1b89f9009f2390652e0061bd7b24fc40732bc70
baseline version:
 ovmf                 f1d1c337e7c0575da7fd248b2dd9cffc755940df

Last test of basis   168249  2022-02-28 03:11:49 Z    0 days
Testing same since   168254  2022-02-28 10:41:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>
  Tomas Pilar <quic_tpilar@quicinc.com>

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
   f1d1c337e7..b1b89f9009  b1b89f9009f2390652e0061bd7b24fc40732bc70 -> xen-tested-master

