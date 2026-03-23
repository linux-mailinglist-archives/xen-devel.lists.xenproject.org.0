Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMRFO4w5wWm7RQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 14:01:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE92F261C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 14:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259322.1552633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4etf-0004cv-2j; Mon, 23 Mar 2026 13:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259322.1552633; Mon, 23 Mar 2026 13:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ete-0004bD-VN; Mon, 23 Mar 2026 13:00:42 +0000
Received: by outflank-mailman (input) for mailman id 1259322;
 Mon, 23 Mar 2026 13:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4j2=BX=bounce.vates.tech=bounce-md_30504962.69c13976.v1-cf35a5d89feb464f8c8ecfef9dd581a5@srs-se1.protection.inumbo.net>)
 id 1w4etd-0004b7-GI
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 13:00:41 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aac4b7b-26b8-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 14:00:40 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffYF25Jy8zPm0kGK
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:00:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cf35a5d89feb464f8c8ecfef9dd581a5; Mon, 23 Mar 2026 13:00:38 +0000
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
X-Inumbo-ID: 4aac4b7b-26b8-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774270838; x=1774540838;
	bh=Y0lQ7deiDHXJ97ld/mcVoxOualtAgacMfezryY/K2rg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VahbI6eEvddOKKbEhoxLW7o+KJG9ctA/XfnVuKbXXXjAa+BDaxvq3m5ugoLDS6UMa
	 6iO36GE9mklxj2vZnlAvj4lNYgvSA8cYB0YUfmeomIYHzscQRX0X4sGk54ZfATh3S0
	 B9Vo58lBAwVOvBkN4nsBtp6ARtK+B8ofudl9ZjTV+T1zidiZy1gkLYP2birnSz6iOg
	 w86hvnRqPIWsz3PXrJqfbWIDi/yZWtI+ykXjxu3kcLGjRLULeOmJaZnAYUd8g81Ycl
	 bAouOXNo/hdPPdKibmYUCH/kc6J+GpoFH/dg9MdB9/gXOgZhyYbCs/5ubrLsC0Cd3U
	 /DyGs4Yxp87dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774270838; x=1774531338; i=anthony.perard@vates.tech;
	bh=Y0lQ7deiDHXJ97ld/mcVoxOualtAgacMfezryY/K2rg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z/tk+E6geigTmC+AXlboU0ikIg6aZ4XSXzZOJjmTqpS5Cg5r9w4JkvyNtwt2jtWkH
	 14iiJkyxxjndXpTFHQSxF6MwQL/ihKeSaYeXZ9jByGIwfJdutFW97qir+4wRxrboMt
	 xTt6kyBEjYROY8ndyX6nGRlm1F1ILdS/oUG/jwiAhnnCPvEpPPAa4S5Aua8pPgQVF8
	 Sj07tFheY1ENPjegl/0rBGYxa2IZIZ4R84/GchmOQ9Z6YEVyfMherBgQkju/0LPuhK
	 JrcKBDyja6KDwOur5BBFoWceatlJjY224ljG5F6yDYd+amzAx4lYnr9yiSXYyEJn/N
	 lvf9sLSPrkYsw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2008/12]=20tools/xenstored:=20implement=20the=20GET/SET=5FQUOTA=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774270833297
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <acE5cC3MAk1yz2nW@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-9-jgross@suse.com>
In-Reply-To: <20260320150120.874878-9-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cf35a5d89feb464f8c8ecfef9dd581a5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 13:00:38 +0000
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
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 5AAE92F261C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:01:16PM +0100, Juergen Gross wrote:
> Add the implementation of the GET_QUOTA and SET_QUOTA wire commands.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - refuse quota value Q_VAL_DISABLED (Anthony Perard)
> - use talloc_strdup() (Anthony Perard)
> - drop comments in domain.h (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


