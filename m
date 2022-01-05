Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DB485C06
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 00:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253775.435026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5FH3-00075B-WF; Wed, 05 Jan 2022 23:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253775.435026; Wed, 05 Jan 2022 23:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5FH3-00072T-Sc; Wed, 05 Jan 2022 23:00:53 +0000
Received: by outflank-mailman (input) for mailman id 253775;
 Wed, 05 Jan 2022 23:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EwN/=RV=strugglers.net=andy@srs-se1.protection.inumbo.net>)
 id 1n5FH2-00072K-6t
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 23:00:52 +0000
Received: from mail.bitfolk.com (mail.bitfolk.com [2001:ba8:1f1:f019::25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51b658b1-6e7b-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 00:00:49 +0100 (CET)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>) id 1n5FGw-0004AB-Ov
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 23:00:46 +0000
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
X-Inumbo-ID: 51b658b1-6e7b-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UI0+crhMl9UEvPrUEUCWxxX/naCj/g/TKMb43aQZfEE=; b=CqKwgCzlQJHI4QkcGgQqCwiIUH
	YQiAVlDwjqL6BiD0n/8vqhaILM/0zLc8/fQE5aGJcwmQfqYymY9qKkoXoRs3wUUzMuEmOrlsjVPD7
	3h3KfxAN6+KPqs9pXUiCH10lFieFGFwOaI15r/ZKgQ4VNG7pS06EcNUNKez/6RTdkVjJxv/GpHwoL
	wE5lBTSgjjzvq+3akn/5+vS1Uj7Ps+6YV2ww3mnundxlh/OeraYVc4rmZBBy9TjK8AxFpiuNjHHrU
	buAhcWGLFedVErl5oqffJYY+D05EdEDFn2bqZmoBid7ubCG4LGDEpMfTR124cmVYtJRdhylX4zqwE
	g637/nhg==;
Date: Wed, 5 Jan 2022 23:00:46 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: Re: qemu-xen is unavailable
Message-ID: <20220105230046.xcmhjrsky6pumpzk@bitfolk.com>
References: <8b68322f-1da7-962d-8f64-dea1e11525@trent.utfs.org>
 <f0877063-56ff-1c72-ae51-fa6ffea453ab@trent.utfs.org>
 <CAFLBxZZsCuqNrc=1dBVL_6V3rBv_iaN5btmbkcDxK4Bq1faRhg@mail.gmail.com>
 <YdXHDCUqpqV+E2hO@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdXHDCUqpqV+E2hO@perard>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hello,

On Wed, Jan 05, 2022 at 04:27:56PM +0000, Anthony PERARD wrote:
> The bug here is that libxl shouldn't print this message for PVH guest
> because it's confusing.

It also does it for PV guests, again if no qemu is installed (or
needed). I squash it by adding:

device_model_version="qemu-xen"
device_model_override="/bin/true"

do the domU config files.

Cheers,
Andy

