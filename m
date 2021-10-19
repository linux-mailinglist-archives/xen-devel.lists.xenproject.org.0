Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D6433831
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 16:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213313.371492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpto-0002I2-EI; Tue, 19 Oct 2021 14:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213313.371492; Tue, 19 Oct 2021 14:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpto-0002FQ-BA; Tue, 19 Oct 2021 14:15:28 +0000
Received: by outflank-mailman (input) for mailman id 213313;
 Tue, 19 Oct 2021 14:15:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>) id 1mcptm-0002FK-NI
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 14:15:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-00038f-Dx; Tue, 19 Oct 2021 14:15:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-0000A9-7H; Tue, 19 Oct 2021 14:15:25 +0000
Received: from iwj by osstest.test-lab.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mcptl-0002fM-6i; Tue, 19 Oct 2021 14:15:25 +0000
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
To: jgross@suse.com,iwj@xenproject.org,xen-devel@lists.xenproject.org
Subject: [adhoc test] 165675: truncated
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-Id: <E1mcptl-0002fM-6i@osstest.test-lab.xenproject.org>
From: iwj@xenbits.xen.org
Date: Tue, 19 Oct 2021 14:15:25 +0000

[adhoc play] <testing.git (HEAD detached at 14a279c4) /dev/pts/3>
harness 14a279c4: osstest: explicitly enable building qemu-traditional
165675: truncated

flight 165675 xen-unstable play [play]
http://logs.test-lab.xenproject.org/osstest/logs/165675/

Perfect :-)
All tests in this flight passed as required
baseline version:
 flight               165635

jobs:
 build-amd64                                                  truncated


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


