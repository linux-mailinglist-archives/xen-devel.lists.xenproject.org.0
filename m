Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB831CDF9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85942.160896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3C0-000381-7y; Tue, 16 Feb 2021 16:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85942.160896; Tue, 16 Feb 2021 16:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3C0-00037Z-4L; Tue, 16 Feb 2021 16:27:16 +0000
Received: by outflank-mailman (input) for mailman id 85942;
 Tue, 16 Feb 2021 16:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-00037F-OO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-0004US-NY
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-0005hn-Mh
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC3Bv-0000p7-Cb; Tue, 16 Feb 2021 16:27:11 +0000
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
	bh=RlSG4wixyrZiUAKT77HPortKpgXFhVgri9OD3UR4GQk=; b=ts4PJI3MlfiAVx0YV76qGLiNV3
	3b7c5GX2w8/Ud/H2+1ACet2PuE4tfKs+L1sRF4mWw+zkt4wTC8N7K8KxFNeLZw+0PDG5NezKUFSKi
	jdWRBgbB/+1apH7rlL7o7Y8an47ynN+Nr8QGusmDSPFGVgMPKJWNQi08kTVqpYsl8e2A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.62047.178128.680533@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:27:11 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/10] tools: Check for abi-dumper in ./configure
In-Reply-To: <20210212153953.4582-9-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-9-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 08/10] tools: Check for abi-dumper in ./configure"):
> This will be optional.  No functional change.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

