Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A905631CD56
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 16:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85890.160737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2jN-0006zF-Gk; Tue, 16 Feb 2021 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85890.160737; Tue, 16 Feb 2021 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2jN-0006yp-CZ; Tue, 16 Feb 2021 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 85890;
 Tue, 16 Feb 2021 15:57:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2jM-0006yg-9z
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2jM-0003Ov-8L
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2jM-0002yD-6d
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:57:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2jI-0000hF-Rr; Tue, 16 Feb 2021 15:57:36 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=6ipkBe/QGkaONQoMmbhX9lP8UodzZGUN7veOmeNVZDY=; b=tmYlvbG+HQBbPN0JkBCHbr1GN5
	C61AcwEgG/0+21PGjQeAWTgoutTrOQiOaTGaP9tKZEggj/Vd1wUK7vG+0raj3/n+l2gJ8u7TLYTZ2
	JRFlYye1xewKFFFEVT00MvH9jV8PmGm8ZJAu2IrZ5trgo5tEw3RUQOg264excsj9OpN8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.60272.652150.820628@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 15:57:36 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 02/10] tools/libxg: Fix uninitialised variable in write_x86_cpu_policy_records()
In-Reply-To: <20210212153953.4582-3-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 02/10] tools/libxg: Fix uninitialised variable in write_x86_cpu_policy_records()"):
> Fixes: f6b2b8ec53d ("libxc/save: Write X86_{CPUID,MSR}_DATA records")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

