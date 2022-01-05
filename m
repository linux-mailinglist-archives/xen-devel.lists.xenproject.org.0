Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594048598C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 20:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253730.434983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5CMG-0003uR-L1; Wed, 05 Jan 2022 19:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253730.434983; Wed, 05 Jan 2022 19:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5CMG-0003pR-Fj; Wed, 05 Jan 2022 19:54:04 +0000
Received: by outflank-mailman (input) for mailman id 253730;
 Wed, 05 Jan 2022 19:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYRH=RV=nerdbynature.de=lists@srs-se1.protection.inumbo.net>)
 id 1n5CME-0003jo-Ai
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 19:54:02 +0000
Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37649cdb-6e61-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 20:53:58 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 7A3E35F842;
 Wed,  5 Jan 2022 20:53:55 +0100 (CET)
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
X-Inumbo-ID: 37649cdb-6e61-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=nerdbynature.de; i=@nerdbynature.de; q=dns/txt; s=key1;
 t=1641412435; h=date : from : to : cc : subject : in-reply-to :
 message-id : references : mime-version : content-type : from;
 bh=NrfXCL70RMGr1WI4xzy3UpaaOm+6gYgZxADFi/RQYts=;
 b=CiCGJXyp2T8Nf3wzOtfdQOVPxX9oMh7ysw/YpVTms6zsH8YZi2okaxy9lu6RmZfK1abm6
 VGVuZG3ePzjAPxLBQ==
Authentication-Results: mail.nerdbynature.de; dmarc=fail (p=none dis=none) header.from=nerdbynature.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nerdbynature.de;
 i=@nerdbynature.de; q=dns/txt; s=key0; t=1641412435; h=date : from :
 to : cc : subject : in-reply-to : message-id : references :
 mime-version : content-type : from;
 bh=NrfXCL70RMGr1WI4xzy3UpaaOm+6gYgZxADFi/RQYts=;
 b=F9as2zUStnIRoooO8+VAewEiARrERAkXZurpuNdh5oiPBJhVCFXfY+8Br/00R/u3yP03a
 RIQisRzUuWks/APtX/+ztVOvGFJTV5/o0PsS8P44QoFr1cXNRtz4SmsbHRexzunTQN8cI29
 OTrfFpNTcWjpP+gjRnthBCKt9NzwkAiCO2moXep5Y0X043jT703dW92i80j0emv1xpxEVeh
 /M842Yyk81SEriEb3uO/z6sPTcqEMf/yP7c+sADLT56EUE1Sm6iu8zLzK3mgos8Fv7lV11M
 T5M3JRMt/X97Nsj7p18Bmce7hoGOqsPNsjUFckPWXOu49zWxUUUk9Vg1ZssA==
Date: Wed, 5 Jan 2022 20:53:55 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-users <xen-users@lists.xenproject.org>, xen-devel@lists.xenproject.org, 
    George Dunlap <dunlapg@umich.edu>
Subject: Re: qemu-xen is unavailable
In-Reply-To: <YdXHDCUqpqV+E2hO@perard>
Message-ID: <c7950789-69cd-868c-3a34-f7fae209565a@nerdbynature.de>
References: <8b68322f-1da7-962d-8f64-dea1e11525@trent.utfs.org> <f0877063-56ff-1c72-ae51-fa6ffea453ab@trent.utfs.org> <CAFLBxZZsCuqNrc=1dBVL_6V3rBv_iaN5btmbkcDxK4Bq1faRhg@mail.gmail.com> <YdXHDCUqpqV+E2hO@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jan 2022, Anthony PERARD wrote:
> Looking at the original email, the domain config file has type="pvh", so
> I don't think qemu is actually needed. And the domain is starting fine,
> so this message isn't really needed and would be a bug I guess.

Thanks for responding. Indeed, the "qemu" package is not installed on this 
machine, and looking closer, the Alpine folks did something to their 
Xen/Qemu packagesp[0][1]. I can't check right now but I'll test if the 
warning goes away with the "qemu" package installed.

Thanks again,
Christian.

[0] https://git.alpinelinux.org/aports/commit/?id=9f064ced3
[1] https://git.alpinelinux.org/aports/commit/?id=55d655af7

> I think it comes from libxl trying to figure out which QEMU to use even
> if it isn't going to be needed. And since there's no qemu to be found,
> the message is printed, even when qemu isn't needed.
> 
> I guess you have this message because you didn't install a qemu package
> (or qemu-xen), but you don't need the package as you are only starting a
> PVH guest.
> 
> The bug here is that libxl shouldn't print this message for PVH guest
> because it's confusing.
-- 
BOFH excuse #244:

Your cat tried to eat the mouse.

