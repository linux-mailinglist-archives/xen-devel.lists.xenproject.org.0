Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DC4538A9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 18:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226478.391435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2RO-0005sp-9V; Tue, 16 Nov 2021 17:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226478.391435; Tue, 16 Nov 2021 17:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2RO-0005pl-60; Tue, 16 Nov 2021 17:40:18 +0000
Received: by outflank-mailman (input) for mailman id 226478;
 Tue, 16 Nov 2021 17:40:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn2RM-0005Vt-R5
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:40:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn2RM-0000sd-Q9
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:40:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn2RM-0001Ib-PB
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:40:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn2RB-00023w-30; Tue, 16 Nov 2021 17:40:05 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=isZQIWBbsqhcfK2Q3o83TiEyt+fRhHKezNYlb/Z3N3M=; b=HHhA+S/o4KAVzoq4knCvLeG/oc
	6m7PFhCw0GTNyKgMcSd4RKBEHA8WlI5v237zR+DHnXv01SInSHxZ8w0Eg5uA5AaEHSJz47+8e+W4J
	bKyXPr9PXUWYfr4rtH76JE620mQ2tqVO8yFOCJ0MGDbVhhEAGL4hf0SmuDoQT83OULKg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24979.60654.749160.430862@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 17:39:58 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.16 RC3

Xen 4.16 RC3 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.16.0-rc3

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.16.0-rc3/xen-4.16.0-rc3.tar.gz
  https://downloads.xenproject.org/release/xen/4.16.0-rc3/xen-4.16.0-rc3.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

(We are getting late into the freeze.  Issues raised from now on may
need to be deferred for the next release.)

Ian.
Xen 4.16 Release Manager

