Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFN0C08Jn2neYgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 15:38:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96D198D28
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 15:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240787.1542058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFfe-0008N5-1F; Wed, 25 Feb 2026 14:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240787.1542058; Wed, 25 Feb 2026 14:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFfd-0008Kv-UW; Wed, 25 Feb 2026 14:15:21 +0000
Received: by outflank-mailman (input) for mailman id 1240787;
 Wed, 25 Feb 2026 14:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5s2=A5=bounce.vates.tech=bounce-md_30504962.699f03f1.v1-bb8b06444c3d4478bbb10018a210ef0e@srs-se1.protection.inumbo.net>)
 id 1vvFfc-0008Kp-OQ
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 14:15:20 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672a1816-1254-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 15:15:15 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fLc754YW4z705b0c
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 14:15:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb8b06444c3d4478bbb10018a210ef0e; Wed, 25 Feb 2026 14:15:13 +0000
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
X-Inumbo-ID: 672a1816-1254-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772028913; x=1772298913;
	bh=JGWN5jkvYY71URPpUEe8IqNYzfuwlhJJo5SoK8DxtuE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mrQYZ+wLz3+s8KQfcz1wlvRqwPY2981AKwC5KfmyCxtxLLBEWuSKhx9f08TbbkDq1
	 NfCSFzyiuwObIT3eL2UWvi8przDLX3Mx5rWiy8Vm9IvxmVXwW9AXdeQVbITL7HxC3+
	 y2kFoO7OS9kGPJ0iaTgNigdjwvvMyUOcReCLts+Gkfo1yls+lGxrCDjYlnvL/YUTai
	 QWx1fu5KWOeqW7PueZgH+AYVj4WAQUMhQgH3JO8tI8qYLRtgr+iiLoCcAOxhiiyUSZ
	 cSNF5PZdvcOrDYyKbsS8Em3H3k1bAJrHEDVbT0v5ObehW43sBC2AuSHEAvI2Mv2Bm1
	 8tJXBz6pyh92g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772028913; x=1772289413; i=anthony.perard@vates.tech;
	bh=JGWN5jkvYY71URPpUEe8IqNYzfuwlhJJo5SoK8DxtuE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AcQKiMCxQUIAeBH7dfLDpDZq/kNVQUxxH+imVfuCGpYYGYnOA0XEj6Y/0gE8frYsC
	 JraFLRnt5w8o+slNa6aqblHfTyK8m4DQWFTemrAnLSgTPLPojmiw/ZKzgrynbRo2De
	 5mys8E34LNI8ee3Lrj0FWf0pyfJqKg/DE2j4Df4T96XUmstTOBCGkbdIpCfEb8fjhG
	 Esbnxy0zrFDpZUO7CmLWwdf5xlWKU695JzuDxkwjoKbFBgT6JemD2PsCVhcTZ1N9FK
	 HZerd7EA+dDIetd8cS52ITLEWdbIVF0AJfJnOhkp4sPytYG/oh0AqWmAYJApDUxZH8
	 whUbyP6XOadAw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=205/5]=20accel/xen:=20Build=20without=20target-specific=20knowledge?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772028911983
To: "=?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, "Pierrick Bouvier" <pierrick.bouvier@linaro.org>, "Paolo Bonzini" <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony@xenproject.org>, "Paul Durrant" <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-Id: <aZ8D77iyFtqyGF18@l14>
References: <20260225051303.91614-1-philmd@linaro.org> <20260225051303.91614-6-philmd@linaro.org>
In-Reply-To: <20260225051303.91614-6-philmd@linaro.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb8b06444c3d4478bbb10018a210ef0e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260225:md
Date: Wed, 25 Feb 2026 14:15:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:url,vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[nongnu.org,vger.kernel.org,linaro.org,redhat.com,lists.xenproject.org,kernel.org,xenproject.org,xen.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CF96D198D28
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:13:03AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is

You mean Xen    ^ here ?

> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

In anycase, it seems to works fine for me:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



