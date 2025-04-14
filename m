Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5814A889DE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951024.1347170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ned-00047t-DD; Mon, 14 Apr 2025 17:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951024.1347170; Mon, 14 Apr 2025 17:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ned-00045l-9e; Mon, 14 Apr 2025 17:31:31 +0000
Received: by outflank-mailman (input) for mailman id 951024;
 Mon, 14 Apr 2025 17:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4Neb-00045f-QM
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4Neb-00EzGF-0o;
 Mon, 14 Apr 2025 17:31:29 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4Nea-00Gisf-38;
 Mon, 14 Apr 2025 17:31:29 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=7vBP87AQHBwF7BZkrDZvb3KzLzNDnmDw0FEyopppzy8=; b=u2shGrhqytdDlaSKPhYkGCW7G+
	jNhWzD+Yr9wq/1rqnuNgArvPIn1ESQsrAhJgUovazEDmyCWuoeY6q0LP5nHLC+KpTGnnHYPGfSS66
	guwavqjwlFPWnDUYMlVR2paxyraybC74wlxriFCZw4UQFk+048ryyhLdvgcTZIVGiyu8=;
Date: Mon, 14 Apr 2025 19:31:27 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 5/6] CI: save toolstack artifact as cpio.gz
Message-ID: <Z_1GbyULSIjE6vj3@l14>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414110903.2355303-6-andrew.cooper3@citrix.com>

On Mon, Apr 14, 2025 at 12:09:02PM +0100, Andrew Cooper wrote:
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> This avoids the need to re-compress it in every test job.  This saves minutes
> of wallclock time.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

