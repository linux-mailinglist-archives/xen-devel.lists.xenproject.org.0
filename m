Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E633A8A312
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954172.1348510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iOt-0008KG-CG; Tue, 15 Apr 2025 15:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954172.1348510; Tue, 15 Apr 2025 15:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iOt-0008IA-9g; Tue, 15 Apr 2025 15:40:39 +0000
Received: by outflank-mailman (input) for mailman id 954172;
 Tue, 15 Apr 2025 15:40:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4iOr-0008I4-Iw
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:40:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4iOr-00H5jS-06;
 Tue, 15 Apr 2025 15:40:37 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4iOq-00DJjT-2E;
 Tue, 15 Apr 2025 15:40:36 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=VRE2875+eLZAsKvYAKdlozdNKJiqhiNllfbaU8bSgY8=; b=6aA8shFXeiHgn+th/VeLFkrAjg
	cWJ2VB8vsShqWgmhI3abHEjrvG2gIf4MsRAn4RCoB/oNRXKp8AvXIFdYNHpR9+xBLepuuMJQh20iL
	igh6x+buuVbBT0MOZJ8j+iWUlPFuJmGXA2LebYqnw8mC1Dfa2lifMfLlVa/70TiynJ3A=;
Date: Tue, 15 Apr 2025 17:40:34 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Build with --prefix=/usr rather than setting
 LD_LIBRARY_PATH
Message-ID: <Z_598uOF2pBy87jj@l14>
References: <20250415135426.2442073-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415135426.2442073-1-andrew.cooper3@citrix.com>

On Tue, Apr 15, 2025 at 02:54:26PM +0100, Andrew Cooper wrote:
> This also moves executables too.  I'm not sure why xilinx-smoke-dom0-x86_64.sh
> was overriding PATH too, as /usr/local is clearly in PATH for all other tests,
> but drop that too.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

