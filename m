Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CEB50662
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 21:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117281.1463441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw3ww-0000V3-Ei; Tue, 09 Sep 2025 19:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117281.1463441; Tue, 09 Sep 2025 19:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw3ww-0000Sm-Bm; Tue, 09 Sep 2025 19:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1117281;
 Tue, 09 Sep 2025 19:24:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uw3wu-0000Sg-T9
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 19:24:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw3wu-001o0z-1N;
 Tue, 09 Sep 2025 19:24:16 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw3wu-001ySm-1O;
 Tue, 09 Sep 2025 19:24:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=o8GkZMK2wln4XOREy7mW4l9UCuLVh1sS+K5XuYxbV3g=; b=
	YecagZUQH9PKGz3m4rHjW3VIo0wGcFIwK1qfwtcxFSGSZhJ/2ALUMqWjkIbB3U00tIyi3Cam5T8eC
	UT0aljAQKYARlxj5mPNb9BqZfxSNXV1eAYa8lIh2P1NqTVubGW3Ip9NBA4A/kfk3j0w2j1ZSfZQ3d
	aMLuIglpb5AxhWNU8=;
From: dmukhin@xen.org
Date: Tue, 9 Sep 2025 12:24:15 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Create initrd fragments explicitly as root
Message-ID: <aMB+370CnYTctHNU@kraken>
References: <20250909171527.1813097-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909171527.1813097-1-andrew.cooper3@citrix.com>

On Tue, Sep 09, 2025 at 06:15:27PM +0100, Andrew Cooper wrote:
> We have a mix of root and non-root containers, and are trying to become
> rootless.  This can cause the local CPIO fragements to end up being user:user
> in the test environment.
> 
> Nothing seems to go wrong so far, but it's a trap waiting to happen.
> 
> Make everything consistently root for the initrds, irrespective of the
> rootness of the container the test is running in.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

