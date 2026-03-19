Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPkgF+D6u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:32:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97D2CC090
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257167.1551625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DTn-0001Xm-Lk; Thu, 19 Mar 2026 13:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257167.1551625; Thu, 19 Mar 2026 13:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DTn-0001VK-Iz; Thu, 19 Mar 2026 13:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1257167;
 Thu, 19 Mar 2026 13:32:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+00E=BT=bounce.vates.tech=bounce-md_30504962.69bbfacb.v1-ca5698857e7d42dea41dce3c5d105453@srs-se1.protection.inumbo.net>)
 id 1w3DTl-0001Uk-S8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:32:01 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff6ef31b-2397-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:31:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fc66z11p2zP0Jw5X
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 13:31:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ca5698857e7d42dea41dce3c5d105453; Thu, 19 Mar 2026 13:31:55 +0000
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
X-Inumbo-ID: ff6ef31b-2397-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773927115; x=1774197115;
	bh=9p5tJHoQx4Uw1ylTQt9FJyHIksG7rvfPVCHL0TVAkwE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RdCjAnHuWJapLMvmG0U3hiv5SVNyxnE0binYuSGwMoQk4EGMngP0+m6tD+Jb7mOtP
	 3hSAz2AXumwjwiIG+RQ35LDDhcMMRXgCzhBhGgDDoYZ9K8aQWTsAmFqJidOs+oWgS/
	 kOgeS9hI5MSIozLUXwSrfJxyfaIQq5cLwVY90dBplGblu7CnZVu6u/REbApyrvG/ME
	 rPa4+0D025F040xb/qHFsAV6ix2prW2widtKlsSCXj/idQaHjCfnc/lkTTOiPVUfUr
	 5u4SZWRdlVz5Ni0ZWoAMGoGFuMTISeV8RvsXFCNLr4XrJTpa9uVWnuyLwQQuqEKRaw
	 Cic+6tR4v8xBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773927115; x=1774187615; i=anthony.perard@vates.tech;
	bh=9p5tJHoQx4Uw1ylTQt9FJyHIksG7rvfPVCHL0TVAkwE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fcelPUD6yd7JiqsAZPLDLZlFa3hSvV72lnt9awJv5k7jKfnddTYNB+47Fv6aWgrSD
	 z46DZ4kNQIC6djp4YST1/6mYToeOCrQm/ASonwKU6nURWcn7Ookl8YyLWPBaRWw6ht
	 o0Tz0IogcWn/Bn4HcS9qlOPe47R2jr7SCJ6hU7sz27GgZ45d04bORi+nwREeLD1MQ/
	 CVUnRNlSXZHeVtakAk/b59Ggg4FFqg2nkYZxbd7M/8xH1tnXgsofYtkCPnRBE/4uYe
	 tSdu5qGyQNhH/xsiSi2WGnNDOrXrdyh/XR57gvYTGaS10Q1wH9sFaAo5yCpLBnOMlD
	 5RIVybI24D2Tw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2001/11]=20tools/libs/store:=20add=20get-=20and=20set-quota=20related=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773927114457
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abv6ymdE8bYOIW_f@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-2-jgross@suse.com> <abQd82Z8x3_9CY2Q@l14> <c7870ce3-fc52-4bda-997f-4791fe3020a1@suse.com>
In-Reply-To: <c7870ce3-fc52-4bda-997f-4791fe3020a1@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ca5698857e7d42dea41dce3c5d105453?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 13:31:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.834];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BC97D2CC090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 08:51:21AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 13.03.26 15:23, Anthony PERARD wrote:
> > On Thu, Mar 05, 2026 at 02:51:58PM +0100, Juergen Gross wrote:
> > > diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> > > index 8f4b90a3cf..dda37f7526 100644
> > > --- a/tools/libs/store/xs.c
> > > +++ b/tools/libs/store/xs.c
> > > @@ -1456,6 +1456,117 @@ bool xs_set_features_domain(struct xs_handle =
*h, unsigned int domid,
> > >   =09return xs_bool(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL));
> > >   }
> > > +char **xs_get_quota_names(struct xs_handle *h, unsigned int *num)
> > > +{
> > > +=09struct xsd_sockmsg msg =3D { .type =3D XS_GET_QUOTA };
> > > +=09struct iovec iov[1];
> > > +=09char **quota;
> > > +=09char *reply;
> > > +=09char *c;
> > > +=09unsigned int i;
> > > +
> > > +=09iov[0].iov_base =3D &msg;
> > > +=09iov[0].iov_len  =3D sizeof(msg);
> > > +
> > > +=09reply =3D xs_talkv(h, iov, ARRAY_SIZE(iov), NULL);
> > > +=09if (!reply)
> > > +=09=09return NULL;
> > > +
> > > +=09*num =3D 1;
> > > +=09for (c =3D reply; *c; c++)
> > > +=09=09if (*c =3D=3D ' ')
> > > +=09=09=09(*num)++;
> > > +
> > > +=09quota =3D malloc(*num * sizeof(char *) + strlen(reply) + 1);
> > > +=09c =3D (char *)(quota + *num);
> > > +=09strcpy(c, reply);
> > > +=09for (i =3D 0; i < *num; i++) {
> > > +=09=09quota[i] =3D c;
> > > +=09=09c =3D strchr(c, ' ');
> > > +=09=09if (c) {
> > 
> > If `c` is NULL, it's likely that this is the last iteration of the `for=
`
> > loop. But just in case, should we prevent the code from doing another
> > round and prevent `strchr(NULL, ' ')`? (Or just check that `c` is !NULL=
,
> > and let the loop finish set NULL for the remaining slot in `quota`)
> 
> Not sure this is really needed. *num is set just a few lines further up
> using the same way to count the number of strings. Do we really need to d=
o
> consistency checks of intermediate results in such a short function?

I guess it's ok.

> > 
> > > +=09=09=09*c =3D 0;
> > > +=09=09=09c++;
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09return quota;
> > > +}
> > > +
> > > +bool xs_get_global_quota(struct xs_handle *h, char *quota,
> > > +=09=09=09 unsigned int *value)
> > > +{
> > > +=09struct xsd_sockmsg msg =3D { .type =3D XS_GET_QUOTA };
> > > +=09struct iovec iov[2];
> > > +
> > > +=09iov[0].iov_base =3D &msg;
> > > +=09iov[0].iov_len  =3D sizeof(msg);
> > > +=09iov[1].iov_base =3D quota;
> > > +=09iov[1].iov_len  =3D strlen(quota) + 1;
> > > +
> > > +=09return xs_uint(xs_talkv(h, iov, ARRAY_SIZE(iov), NULL), value);
> > > +}
> > > +
> > > +bool xs_set_global_quota(struct xs_handle *h, char *quota,
> > > +=09=09=09 unsigned int value)
> > > +{
> > > +=09struct xsd_sockmsg msg =3D { .type =3D XS_SET_QUOTA };
> > > +=09char val_str[MAX_STRLEN(value)];
> > 
> > MAX_STRLEN doesn't have a great name, I wounder what is was :-). And
> > it's not about a maximum size of payload that could go on xs wire or
> > something, it's actually the maximum string size that can take a
> > numerical value, when converted to charaters.
> 
> Unfortunately the MAX_STRLEN() macro is defined in a public header file.
> I could define another macro with a different name doing the same and
> use that here, but MAX_STRLEN() would still be there.
> 
> What is your preference?

Well, it's probably better to leave it like that. Having two different
macro names might be more confusing than useful. And I see that the
macro is only defined three time in the repo. Next time I'll stumble on
MAX_STRLEN, I'll know what it mean.

Cheers,,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



