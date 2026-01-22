Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC+PNKRgcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:38:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A326B7F9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211626.1523128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyFP-0008Vn-9h; Thu, 22 Jan 2026 17:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211626.1523128; Thu, 22 Jan 2026 17:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyFP-0008TU-74; Thu, 22 Jan 2026 17:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1211626;
 Thu, 22 Jan 2026 17:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ssfy=73=bounce.vates.tech=bounce-md_30504962.69725ab5.v1-b2c0c61efb054c5696f9501df7702039@srs-se1.protection.inumbo.net>)
 id 1viyFO-0008TO-0D
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:13:30 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa33115a-f7b5-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:13:27 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dxnhP5Y46zK5ybkq
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 17:13:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b2c0c61efb054c5696f9501df7702039; Thu, 22 Jan 2026 17:13:25 +0000
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
X-Inumbo-ID: aa33115a-f7b5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769102005; x=1769372005;
	bh=uz+MY3DtvcsrfvLcOLdKtowImdvCiK+vynqKmiZyT84=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YsMBCDlXt8F02s/TRqHDCJz4DRcgixBaMA98TDNs4vRK87tGZYpjNJFSRYqz+wxtM
	 /CZMXsxTydgZMAfkttpKFyh7AKr8Rton9BTp3+wTvGNF3A0t2cpCUQMyk9SXAWpo7Y
	 B/EE3U3XU+jhMXq4tLE1oEAontjuKgGkwirTwZS79AXchaJMmpAqGuoGacBHChK17P
	 jyeMfx6wW2g/ETb/1vwZZFJmiWwIzJ9f9sQUC52imA8pDIcBcQtq5MpKK0wDriRDl8
	 PYZVvTgoSygUrl1SHdjgfYi4Qj8cb1FXG+tSxLG/rtlJro9Sc2Wbg1WvHp5hELjUsx
	 KJxSspKc2WTew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769102005; x=1769362505; i=teddy.astie@vates.tech;
	bh=uz+MY3DtvcsrfvLcOLdKtowImdvCiK+vynqKmiZyT84=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vSknfBb12gVZjCnkogbFR0tmYnGq9LfBmp98z9lwupYTLU9W78Az+Hw46o8nFMqQm
	 zdSG9YLS3VsPaxdgI+S28jB1wbgg7tL3Wv8lESYQHoTCYncpxtOjX4K2hWxGVxTDNG
	 mVtVon53ZQZkkKGju4PNdRJPFg3eECvzMTcf1n3T7ywiMXQR6E8zcI1mMxzrX3VuJH
	 OSASryr9igaDfpgG9gFU6l0DORUkljNNJrZNDJVPqCqh15+DQ4SxxgA0U6Ue0OZfuY
	 2xzdI++hjdYO5l60vr2mZcLRd4ufV1DHwdfgL6xiEZqbY+yOEq3KKAnBf3vQwRs4su
	 2oKKMRIWISUeQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/4]=20x86:=20Reject=20CPU=20policies=20with=20vendors=20other=20than=20the=20host's?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769102004290
Message-Id: <5a96fb6d-ce8b-409e-9050-3499ac90eb65@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com> <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b2c0c61efb054c5696f9501df7702039?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 17:13:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:url,vates.tech:mid,mandrillapp.com:dkim,amd.com:email,keepachangelog.com:url,changelog.md:url];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_SPAM(0.00)[0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81A326B7F9
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 17:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
> While in principle it's possible to have a vendor virtualising another,
> this is fairly tricky in practice and comes with the world's supply of
> security issues.
> 
> Reject any CPU policy with vendors not matching the host's.
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   CHANGELOG.md         | 4 ++++
>   xen/lib/x86/policy.c | 3 ++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 18f3d10f20..eae2f961c7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,10 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>      - Xenoprofile support.  Oprofile themselves removed support for Xen =
in 2014
>        prior to the version 1.0 release, and there has been no developmen=
t since
>        before then in Xen.
> +   - Cross-vendor support.  Refuse to start domains whose CPU vendor dif=
fers> +     from the host so that security mitigations stay consistent. 
Cross-vendor
> +     setups have been unreliable and not practical since 2017 with the a=
dvent of
> +     speculation security.
>   

I don't really like the wording, it sounds like guest will suddenly stop 
to work for some reason. AFAIK, in the Xen Project only suspend/resume 
logic is going to be affected, and we probably want to reflect on that 
instead.

>    - Removed xenpm tool on non-x86 platforms as it doesn't actually provi=
de
>      anything useful outside of x86.
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785..4c0c5386ea 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_po=
licy *host,
>   #define FAIL_MSR(m) \
>       do { e.msr =3D (m); goto out; } while ( 0 )
>   
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    if ( (guest->basic.max_leaf >  host->basic.max_leaf) ||
> +         (guest->x86_vendor     !=3D host->x86_vendor) )
>           FAIL_CPUID(0, NA);
>   
>       if ( guest->feat.max_subleaf > host->feat.max_subleaf )



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



