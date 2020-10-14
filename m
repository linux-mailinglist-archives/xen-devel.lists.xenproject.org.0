Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6028E390
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6793.17893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj09-0008Vo-Ik; Wed, 14 Oct 2020 15:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6793.17893; Wed, 14 Oct 2020 15:47:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj09-0008VP-FY; Wed, 14 Oct 2020 15:47:41 +0000
Received: by outflank-mailman (input) for mailman id 6793;
 Wed, 14 Oct 2020 15:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSj07-0008VG-5d
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:47:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3539e143-e524-4c35-a476-6f05c7665c87;
 Wed, 14 Oct 2020 15:47:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92CB0AB95;
 Wed, 14 Oct 2020 15:47:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSj07-0008VG-5d
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:47:39 +0000
X-Inumbo-ID: 3539e143-e524-4c35-a476-6f05c7665c87
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3539e143-e524-4c35-a476-6f05c7665c87;
	Wed, 14 Oct 2020 15:47:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602690457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yc+pGlsZ5yS30nxUbESq/MRMz8cRyLt/HITnSenioFs=;
	b=RWLc8V0j2WsyfZJHPpAysrWjMyLRjBMcKgZf3qHxs+nszsn1FA8gEDtyaC21F2VluXU2oL
	NeeE3FIzXnbrqBYg89+BLQElPBTebVRiNOH3JXq8LhT47ZWybip/Kq1ik2Mr7BKVNY4Dha
	1pBFYBRSHuiiIcs9NXCy9RnzxDF32lE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92CB0AB95;
	Wed, 14 Oct 2020 15:47:37 +0000 (UTC)
Subject: Re: [PATCH 1/2] x86/intel: insert Ice Lake X (server) model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, jun.nakajima@intel.com,
 kevin.tian@intel.com
References: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca9a1cce-1e51-0f55-4527-42f48bc7d6ab@suse.com>
Date: Wed, 14 Oct 2020 17:47:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 05:02, Igor Druzhinin wrote:
> LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
> to Ice Lake desktop according to External Design Specification vol.2.

Could you tell me where this is publicly available? Even after spending
quite a bit of time on searching for it, I can't seem to be able to
find it. And the SDM doesn't have enough information (yet).

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -183,6 +183,7 @@ static void do_get_hw_residencies(void *arg)
>      /* Ice Lake */
>      case 0x7D:
>      case 0x7E:
> +    case 0x6A:
>      /* Kaby Lake */
>      case 0x8E:
>      case 0x9E:

Here and below please honor the (partial) sorting that's in effect.

Jan

