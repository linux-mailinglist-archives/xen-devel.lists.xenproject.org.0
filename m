Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNtiBgA3tGnTiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:10:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83E286BAB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253887.1549849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1555-0002LJ-Nu; Fri, 13 Mar 2026 16:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253887.1549849; Fri, 13 Mar 2026 16:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1555-0002JT-LE; Fri, 13 Mar 2026 16:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1253887;
 Fri, 13 Mar 2026 16:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yb2q=BN=bounce.vates.tech=bounce-md_30504962.69b436be.v1-5c3b9378c03a49cd8354a292b2c09f88@srs-se1.protection.inumbo.net>)
 id 1w1554-0002JN-1J
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:09:42 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 075f3bc9-1ef7-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:09:36 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXTvf5xlMzlfk15
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:09:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5c3b9378c03a49cd8354a292b2c09f88; Fri, 13 Mar 2026 16:09:34 +0000
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
X-Inumbo-ID: 075f3bc9-1ef7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773418174; x=1773688174;
	bh=D0qC/theo3h956Bl6+OqebRtvIjKvfjXng6e2rmfBwo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OcRsO9LUc4pq48y8jnKm03pGxqlXTcH1nCx2QAuGee02qlHmFiIm3dKbknOYqNAjs
	 EZBo6cWyiSvRqgR/RoiSS8NY8sEd8Kr7LIaPY1c3pcSK2uGnQMfgP96m+XwoIUWl2U
	 DzyOBSAX6L+GKYoABMMlj+Em5FUYtdBLKNvhD0+tZ0lbxJs8dndUYi1t9zP+WarQd8
	 s5/gFnLPl6SE/KcLthwEvDvcIIjA5UAyfuLf4gQhc/bp7n+pdSLV93spW59QnLlsma
	 FdOPDCxaY1vEEh+IM3uwviPpjd3dCqP1mtvJdwek4dAlJQ5CeLcoWQ4THEzGFYYVfn
	 5E9T29EWe0mWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773418174; x=1773678674; i=anthony.perard@vates.tech;
	bh=D0qC/theo3h956Bl6+OqebRtvIjKvfjXng6e2rmfBwo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DluaJF2qBnK5kQMOlEDirGaXt00XUKDr0V6FFF6OSr8gLL6jfDx+F+bM16ls10oOA
	 lnr9I1GAp6/pccv1zddadC+uXyjaWrnx+Vg6NtJT4sfb7MROLozl8ZaQ3R4CF91wFz
	 gssPj5I3BNXn2XY/Yspn2m5uXawVtzxSpiygLAKCbOmgSAjySi1lkNhvbsJeRaT1Vw
	 QL4I/ND1KpqG2hcIGfoEu7GArZNk7Sd1a/bT/ZrD7wZ2cAPFWMoHU6+jHUu8JQkrX6
	 pbVcwtLYeix2XXEiWUArSh/NWIXFz179Rz6wly0ylTjEodRsnxvqVf82Ejt0l5q/y2
	 42hbfA4pAkGuQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2003/11]=20tools/xenstored:=20rework=20hard=5Fquotas=20and=20soft=5Fquotas=20arrays?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773418174127
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abQ2vcxWKW1j_KeJ@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-4-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-4-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5c3b9378c03a49cd8354a292b2c09f88?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:09:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.836];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BA83E286BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:00PM +0100, Juergen Gross wrote:
> Instead of having one array for hard quotas and one for soft quotas,
> split them differently: have one array with the quota names and
> descriptions, and one with the quota values (soft and hard) and the
> maximum value so far.
> 
> This is in preparation of supporting per-domain quotas, as the layout
> of the second array elements will be reused in the domain data.
> 
> While at it add an accessor for getting a soft quota value, as this
> will be needed for per-domain quotas, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


