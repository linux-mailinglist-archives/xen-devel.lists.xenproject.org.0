Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380182E14C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 21:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667575.1038983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPTGQ-0005uc-TD; Mon, 15 Jan 2024 20:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667575.1038983; Mon, 15 Jan 2024 20:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPTGQ-0005sw-QF; Mon, 15 Jan 2024 20:08:54 +0000
Received: by outflank-mailman (input) for mailman id 667575;
 Mon, 15 Jan 2024 20:08:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPTGP-0005sm-13; Mon, 15 Jan 2024 20:08:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPTGO-0003Ag-Lu; Mon, 15 Jan 2024 20:08:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPTGO-0008Kd-Dz; Mon, 15 Jan 2024 20:08:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPTGO-0001wi-8r; Mon, 15 Jan 2024 20:08:52 +0000
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
	bh=cbFUBkARNreVKinGkIzAjkwOi4Blz1owxJylmSbOu1I=; b=D+qvsBPxMncMrzXZTc5TuSaWb1
	mkvVgwh+XyBj/aav3xPA5sospHzgBBUyNrhuPTWDbHGZEnOq0h+ByfS1JoS4D+MsN0BGlKjwx5/x3
	D9GXoUCsuD5bcxkxyajGoUyGyl2CPpWK/ySh/tBqRLCkMU6U/a5sPlagoWQsgBqXZOlw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184361-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184361: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=82e149f2bf796a5a0492d764897ada261d266653
X-Osstest-Versions-That:
    ovmf=195e59bd0c60523caa415f429517e46ff7065600
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 20:08:52 +0000

flight 184361 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184361/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 82e149f2bf796a5a0492d764897ada261d266653
baseline version:
 ovmf                 195e59bd0c60523caa415f429517e46ff7065600

Last test of basis   184356  2024-01-15 12:11:01 Z    0 days
Testing same since   184361  2024-01-15 16:12:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Thomas Barrett <tbarrett@crusoeenergy.com>

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
   195e59bd0c..82e149f2bf  82e149f2bf796a5a0492d764897ada261d266653 -> xen-tested-master

