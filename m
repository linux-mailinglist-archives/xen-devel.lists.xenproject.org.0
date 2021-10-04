Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E9421AE8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 01:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201783.356405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXpz-00080k-I3; Mon, 04 Oct 2021 23:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201783.356405; Mon, 04 Oct 2021 23:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXXpz-0007xd-EE; Mon, 04 Oct 2021 23:57:39 +0000
Received: by outflank-mailman (input) for mailman id 201783;
 Mon, 04 Oct 2021 23:57:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXXpy-0007xV-7c
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 23:57:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXXpy-0007MK-5m
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 23:57:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXXpy-0000qr-4j
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 23:57:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mXXpw-0007EX-9S; Tue, 05 Oct 2021 00:57:36 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=wiPgQbXcvgN21haKZ+QwoJo2Mo+inINXjEusETAl+Os=; b=xk1/BC1eRYN34Ji9ZdQ5fQHL/U
	g+xkJwTCw8SyvJ0FaTOiCZFgZXspu0+/gJw3jzo8olp8BYPGw9131Q9HmefKsSF0jYxYYoe2l47Oe
	GgsQfQwlKCOjNQeIuGiWUXJq1hCcy3Z5Hb6eRPvfWiYq9RkpIgjL/YEVEhSvcWseootg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24923.38127.990669.853370@mariner.uk.xensource.com>
Date: Tue, 5 Oct 2021 00:57:35 +0100
To: xen-devel@lists.xenproject.org,
    jbeulich@suse.com,
    julien.grall.oss@gmail.com,
    iwj@xenproject.org,
    sstabellini@kernel.org,
    dpsmith@apertussolutions.com
Subject: Re: [adhoc test] 165359: tolerable truncated
In-Reply-To: <E1mXTS5-00046z-9X@osstest.test-lab.xenproject.org>
References: <E1mXTS5-00046z-9X@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

iwj@xenbits.xen.org writes ("[adhoc test] 165359: tolerable truncated"):
> [adhoc play] <testing.git master not a tty>
> harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
> 165359: tolerable truncated
...
> Tests which did not succeed, but are not blocking:
>  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail  like 165218
>  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail  like 165218

This means that the kernel patch fixed the problem.  Nothing went
wrong here other than that arm64 doesn't support save/restore and
migraiton.

Ian.

