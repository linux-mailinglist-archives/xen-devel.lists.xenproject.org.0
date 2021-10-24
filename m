Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20586438836
	for <lists+xen-devel@lfdr.de>; Sun, 24 Oct 2021 12:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215496.374741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meaRN-0006jA-Ap; Sun, 24 Oct 2021 10:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215496.374741; Sun, 24 Oct 2021 10:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meaRN-0006gt-6F; Sun, 24 Oct 2021 10:09:21 +0000
Received: by outflank-mailman (input) for mailman id 215496;
 Sun, 24 Oct 2021 10:09:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meaRM-0006gj-KO; Sun, 24 Oct 2021 10:09:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meaRM-0007OS-CO; Sun, 24 Oct 2021 10:09:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1meaRM-00074j-2Z; Sun, 24 Oct 2021 10:09:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1meaRM-0002go-1s; Sun, 24 Oct 2021 10:09:20 +0000
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
	bh=Sd+juyZDDlyRAElDV/XkKDy07SXKKqpiX3CRTJ2c59Y=; b=iAB5RBl0u5R0tYFUP37n0Pt4r8
	C4tGTTiAUnxcGAzLrWnEa6txh8XUble5km5WUm9GyGmOpqU2NayA2ScdQnSNxJhCUTqFCfsWkokqe
	T0OdGPWSwM5tT7N3En0nbHYR15nk7KJJP6Y1k7A/xjkBlIEZui2D0RpOpuF7BVdBB5SQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165836-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165836: all pass - PUSHED
X-Osstest-Versions-This:
    xen=23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
X-Osstest-Versions-That:
    xen=6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Oct 2021 10:09:20 +0000

flight 165836 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165836/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9
baseline version:
 xen                  6809998c5f8f1d2e26ac9e867af8ac71e7a66cf2

Last test of basis   165686  2021-10-20 09:20:50 Z    4 days
Testing same since   165836  2021-10-24 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Hongda Deng <hongda.deng@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Thomas Gleixner <tglx@linutronix.de>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   6809998c5f..23ec1ebc8a  23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9 -> coverity-tested/smoke

