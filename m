Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIBaCYNGtGk4kAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 18:16:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED4287F65
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 18:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254263.1550192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w167H-0007iL-Av; Fri, 13 Mar 2026 17:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254263.1550192; Fri, 13 Mar 2026 17:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w167H-0007gd-8A; Fri, 13 Mar 2026 17:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1254263;
 Fri, 13 Mar 2026 17:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w9UI=BN=bounce.vates.tech=bounce-md_30504962.69b4464e.v1-e5ac64dadfbf4569aed401b63a593563@srs-se1.protection.inumbo.net>)
 id 1w167F-0007gX-KN
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 17:16:01 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3f5306-1f00-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 18:16:00 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXWNH0c8PzPm0Pr9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 17:15:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e5ac64dadfbf4569aed401b63a593563; Fri, 13 Mar 2026 17:15:58 +0000
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
X-Inumbo-ID: 4e3f5306-1f00-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773422159; x=1773692159;
	bh=tE2e4A6RQlJDuxiYQ0qjv7al0p4qz5Tb+9MzYknAow4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kQU2lD8pLnpvWn0ZlG0FHsHEbmgOcPtgMAyN5cUPSXMLkYBG5X0N7/nhq4pMtOobk
	 8gxjywqf+6lRFXBHUvBcQCMvH3bbgf2pJpEyw5fj+SFTNUgBBQsN7nESN3Dcs8L7f1
	 ADpPiS+8u7GF/uWr91FSnuLhxT96F27UQKdJ6q+cFrhUYun7RVZzZ/5rING+qLtSeR
	 tLveZ2ejNDecdxnmoEkpDEfdm+sT2O/qFy5PTtw+ytZ502RszolvGgYoioKU13N2G3
	 w6VFpGTO60ukRiED1+eaCS7ZDstiz3zXm/L9KFPqxcrB7SnlVso0GABJwSbtETQj7N
	 O58r7rzJJ8YFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773422159; x=1773682659; i=anthony.perard@vates.tech;
	bh=tE2e4A6RQlJDuxiYQ0qjv7al0p4qz5Tb+9MzYknAow4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZC02SthzFFBOu+pYTdYuHbdN2th0x0Q0YG/6m52QfkWP3IZfpcGBjXrG3XfhtOGsV
	 GzN+rbk6gk2yR96dYtV6fbsPMMJ60C4RahHPFUn65pFinULlA6ah8SCzaByaZUYXPH
	 x09hd4WY68Axm2lnps0dl36I+BlS2FLLu+2QDfvX2rhfb80gFcfH+YBbrXXnt9BcbH
	 3+skf5rE83jPVP7AO54bXTs8Ujdb5ahzOE2jFC6Jeo7j4cbVhNGhWB5JYAiqMRmWAK
	 fcGrwGFci1j9Cp9ub3Szip82tnQ+Gev8a73OCE9BU6lMsWqjweGmZGxnYrUOa50u/i
	 qppGhfiA1D0mg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2005/11]=20tools/xenstored:=20split=20acc[]=20array=20in=20struct=20domain?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773422158432
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abRGTofDcyVxRarZ@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-6-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-6-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e5ac64dadfbf4569aed401b63a593563?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 17:15:58 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:dkim,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.857];
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
X-Rspamd-Queue-Id: C7ED4287F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:02PM +0100, Juergen Gross wrote:
> Prepare using per-domain quota by splitting the acc[] array in struct
> domain into an array with the current accounting data, and an array
> of type struct quota for the per-domain quota and the seen max value
> of the domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


