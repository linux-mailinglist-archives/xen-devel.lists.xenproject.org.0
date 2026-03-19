Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAL3AKb5u2llqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:27:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950472CBF4C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257108.1551543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DO7-0003zP-GO; Thu, 19 Mar 2026 13:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257108.1551543; Thu, 19 Mar 2026 13:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DO7-0003xN-Dq; Thu, 19 Mar 2026 13:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1257108;
 Thu, 19 Mar 2026 13:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYDz=BT=bounce.vates.tech=bounce-md_30504962.69bbf96e.v1-a9c5733f900f4ba888e7f2319c6e5b29@srs-se1.protection.inumbo.net>)
 id 1w3DO6-0003xG-9s
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:26:10 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa94aae-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:26:08 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fc60G4Y6hzP0KHBq
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 13:26:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a9c5733f900f4ba888e7f2319c6e5b29; Thu, 19 Mar 2026 13:26:06 +0000
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
X-Inumbo-ID: 2fa94aae-2397-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773926766; x=1774196766;
	bh=ajKGarEyu8cTzFCIHiU/jBefMz7iBdwgCIu6aoXvaCY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d9S2dEvGwj+1o9gmIvasD0kGpvS/k/NsGZwetSTNeXDlWoe4BatB20yrbd/Pwl6uU
	 hVFIFXPPSfvWsHhl1yhXU36K1Ac12iFcWywYVjTrP1vvLwhSDrAXRLnACzaoa0D3IA
	 OmFlhqHU8mtefL60nZo8XwJ/u0Iqo0RaKcfTPsdTZ5PhMSjwT/li2GbWw8QiB4KMgu
	 OtXXbV4UKNi4PJ0xHgc2H8oYatqiBfSnzi7tuF/6JWlWO9rLFUokPvbdPz9gosiBFI
	 H5QWoPmqlabiwWJC+9iKHSoC7q29lYztNREPc1muuxdch6/1L3wXt+bv6epfKyPemK
	 Xl6pe9K1NJ1iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773926766; x=1774187266; i=thierry.escande@vates.tech;
	bh=ajKGarEyu8cTzFCIHiU/jBefMz7iBdwgCIu6aoXvaCY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IkPzM3vt5mlLjztKsiWgZ/JrqTXz6gZS2jzdsyKfWb+CrHrc2KoKQr6LATFwA3P/z
	 iX1XnlxFMl/I0L0MwQZ27y5h/AVhZdE+0BnHS/jc98XYzgI7HlMz4d/rwjMYKz7Nhf
	 gTS0WXvhbqLta/Qyyo84ZvUDdS4dYUrEKGVaZ31XnRsGoIKCcVtY+lIc9ip7YaZe/7
	 5GngUO9zyMCXMPrUw3cLXYo4HBhIwutKnU0Wu+A6eo4UUMwfiC4AeXiU3GPuPz2fzf
	 n+oyx0zL6uvP2WcuhAHFPPGoQqB7eTLJwNRoce7GozUcs2FR5h2um7MLdMauvJ2R4Y
	 RgLTv1K11yliw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20install.sh:=20Preserve=20directory=20symlinks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773926766018
Message-Id: <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech> <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com>
In-Reply-To: <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a9c5733f900f4ba888e7f2319c6e5b29?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 13:26:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,install.sh:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.823];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 950472CBF4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/26 10:31, Jan Beulich wrote:
> On 13.03.2026 18:25, Thierry Escande wrote:
>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>> symlinks. Using the tar option --keep-directory-symlink preserves these
>> symlinks.
>>
>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>> ---
>>  install.sh | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/install.sh b/install.sh
>> index 3e11c4d46f..5d0b7a4933 100644
>> --- a/install.sh
>> +++ b/install.sh
>> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>>  echo "Installing Xen from '$src' to '$dst'..."
>>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>>  
>> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
>> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
> 
> How compatible (between flavors of tar as well as between versions of GNU
> tar) is use of this option?

It's supported by GNU tar since version 1.27 (from ~12 years ago) but it
seems to be the only implementation that supports it. BSD and busybox
don't support it. I didn't check for other implementations.

I can add a flavor/version check if that makes sense.

Regards,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


