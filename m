Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8442FBB05
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70511.126576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqb-0005hX-Vx; Tue, 19 Jan 2021 15:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70511.126576; Tue, 19 Jan 2021 15:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sqb-0005h7-SR; Tue, 19 Jan 2021 15:23:09 +0000
Received: by outflank-mailman (input) for mailman id 70511;
 Tue, 19 Jan 2021 15:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rdq3=GW=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1l1sqa-0005h2-Lc
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:23:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7966859b-2c65-4635-9330-8b64605bb0b9;
 Tue, 19 Jan 2021 15:23:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5392E22D2A;
 Tue, 19 Jan 2021 15:23:06 +0000 (UTC)
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
X-Inumbo-ID: 7966859b-2c65-4635-9330-8b64605bb0b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1611069786;
	bh=pqyZ0jdGM2NW4JqDQHaY/YHHjqBTFdzRAExrriAwkf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E93roEyk0HlKAwPu8VnBBSpf9m7sK2vnrtivH4G7zrhcNzqWOCv5vJECButDO1tLe
	 Km5YMNt5EO3+cnrS7Ydo2Qw32jytvvsI25+W5xRrnTweCo6GYrDDEgiIzcDAdwOBLO
	 zWH0R/Qur3RBxtFnIFYxKJorEOZkbYMYssXaC4Lc=
Date: Tue, 19 Jan 2021 16:23:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arthur Borsboom <arthurborsboom@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
Message-ID: <YAb5WHSglwumI77O@kroah.com>
References: <20210119105727.95173-1-roger.pau@citrix.com>
 <20210119123622.zweul6uqfg54erj3@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210119123622.zweul6uqfg54erj3@Air-de-Roger>

On Tue, Jan 19, 2021 at 01:36:22PM +0100, Roger Pau Monné wrote:
> Forgot to Cc stable for the Fixes tag. Doing it now.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

