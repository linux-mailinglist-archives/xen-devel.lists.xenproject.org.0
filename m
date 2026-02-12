Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CmbGGb1jWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:44:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9512F13E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229370.1535341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYrl-0004Fu-AR; Thu, 12 Feb 2026 15:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229370.1535341; Thu, 12 Feb 2026 15:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYrl-0004Ds-63; Thu, 12 Feb 2026 15:44:29 +0000
Received: by outflank-mailman (input) for mailman id 1229370;
 Thu, 12 Feb 2026 15:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8H5=AQ=bounce.vates.tech=bounce-md_30504962.698df554.v1-fc5e567fc2294e1f9457945a1f3e5574@srs-se1.protection.inumbo.net>)
 id 1vqYrj-0004Dm-P4
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:44:27 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e3915f-0829-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 16:44:22 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fBfjw4qZQzPm0pyQ
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 15:44:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fc5e567fc2294e1f9457945a1f3e5574; Thu, 12 Feb 2026 15:44:20 +0000
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
X-Inumbo-ID: b2e3915f-0829-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770911060; x=1771181060;
	bh=Q5ghv+I1XhWpNNj+huOmGZQuMdeAGane7kLnRjHTz8w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U3a8NcsBvA89mA7G4i8+I1PhLPlfMLY90Gi+US2gM/l1diZdpOibbpLKIeZdP5Zbj
	 P++Ux8F4pN0BRv7plHwCv3+LmXblnh9AXKL72PF5IhGiu9GLpnvukjQDf5LGWVeyql
	 FKi/R4p/skwRgnPgbzS6MZ6C2zlbyxRAkFM23TmvgcZt9phqGNYCbaMccvs99XvIG7
	 e14Wjx1jC8xrGH4hftWr1y+vzYXFVxAU/ReMtT9YKyVSawjFDz2dwgM6lbR9svao0O
	 36eXsKEWZI3tc//LQvQv8oMmopkSNB00sWdsG7nivsZZ2YXpTeAp10KKO8bNqgErtw
	 dzi+p3PyDAMOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770911060; x=1771171560; i=teddy.astie@vates.tech;
	bh=Q5ghv+I1XhWpNNj+huOmGZQuMdeAGane7kLnRjHTz8w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EPNGfiVnFpaHnuOmbeiCbRb4F7E5OstOnJxi5NvNHj5aMXzxq+a+yUXpdeCEqnzU4
	 16A6EoafxsaempndyL3atNuryExGWbWgnWz346NsPOyx54c0qBbYAyedBGWIVmUt98
	 y7NHXAoxR9dUqgU9kVBlxlLfOdP3cgN5IpNfcXUgmvBQWDBa6juEE9/aEai69F8G88
	 JezMVCFmb0gZiRMzAudTKFIY8HhYdnrKr2HuhwANBF+tMorYn5dHimjTz2JvwYo52L
	 9pAleSHsxvXNIEcBcLNdo/2CYCAcoxFKTXmpYwTlB4QSYMKvqF5G+9laTZkmhsmD9V
	 do/4HqI2AxIAg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770911059944
Message-Id: <6f0d897a-2e65-47ec-a97e-24b8c19b19fc@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <489a4decf4367a9983a63fb4987d8c5f6267ed9f.1770632848.git.teddy.astie@vates.tech> <7064136b-38f1-4bbe-9ff4-14774c88f016@suse.com> <f2a9028f-6bc6-40f8-a9ef-26800c9e4c59@vates.tech> <4553d4f8-89a9-4ef0-9b56-f3a04d8d7d67@suse.com>
In-Reply-To: <4553d4f8-89a9-4ef0-9b56-f3a04d8d7d67@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fc5e567fc2294e1f9457945a1f3e5574?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260212:md
Date: Thu, 12 Feb 2026 15:44:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BDB9512F13E
X-Rspamd-Action: no action

Le 12/02/2026 =C3=A0 11:30, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.02.2026 11:19, Teddy Astie wrote:
>> Le 09/02/2026 =C3=A0 15:21, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 09.02.2026 11:31, Teddy Astie wrote:
>>>> @@ -93,6 +96,7 @@ void show_help(void)
>>>>                "                                           units defau=
lt to \"us\" if unspecified.\n"
>>>>                "                                           truncates u=
n-representable values.\n"
>>>>                "                                           0 lets the =
hardware decide.\n"
>>>> +            " get-intel-temp        [cpuid]       get Intel CPU tempe=
rature of <cpuid> or all\n"
>>>
>>> Sorry, thinking about it only now: Do we really want to build in the ve=
ndor
>>> name to a command? "get-temp" would allow for adding an AMD implementat=
ion
>>> later on?
>>
>> AMD CPUs expose a PCI device that can be interacted with to get
>> temperatures; which is then exposed in hwmon interface of Linux. That
>> wouldn't be practical to implement hwmon interfaces in xenpm.
> 
> You understand though that AMD only was an example (the most natural one)=
?
> 

Yes, though having a generic name (e.g get-cpu-temp) could suggest that 
it is expected to work for all vendors; while it will here only work for 
Intel.

>>>> @@ -1354,6 +1358,131 @@ void enable_turbo_mode(int argc, char *argv[])
>>>>                    errno, strerror(errno));
>>>>    }
>>>>    
>>>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool packa=
ge, int *temp)
>>>> +{
>>>> +    xc_resource_entry_t entries[] =3D {
>>>> +        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THER=
M_STATUS },
>>>> +        { .idx =3D MSR_TEMPERATURE_TARGET },
>>>> +    };
>>>> +    struct xc_resource_op ops =3D {
>>>> +        .cpu =3D cpu,
>>>> +        .entries =3D entries,
>>>> +        .nr_entries =3D ARRAY_SIZE(entries),
>>>> +    };
>>>> +    int tjmax;
>>>> +
>>>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>>>> +
>>>> +    switch ( ret )
>>>> +    {
>>>> +    case -1:
>>>> +        /* xc_resource_op returns -1 in out of memory scenarios */
>>>> +        errno =3D -ENOMEM;
>>>
>>> And xc_resource_op() doesn't itself set / inherit a properly set errno?
>>> We don't want to override what the C library may have set.
>>
>> I'm not sure what to do then. I guess we want to reset errno before
>> entering xc_resource_op (so we won't report stale errno), but we would
>> still need to consider cases where xc_resource_op returns failure
>> without errno having being set ?
> 
> Should xc_resource_op() perhaps better be corrected to behave consistentl=
y
> wrt the setting of errno?
> 

that could be something to consider

>>>> +    case 1:
>>>> +    {
>>>> +        /*
>>>> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume =
it's 100
>>>> +         * which is correct aside a few selected Atom CPUs. Check Lin=
ux
>>>> +         * kernel's coretemp.c for more information.
>>>> +         */
>>>> +        static bool has_reported_once =3D false;
>>>> +
>>>> +        if ( !has_reported_once )
>>>> +        {
>>>> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported,=
 assume "
>>>> +                            "tjmax =3D 100, readings may be incorrect=
.\n");
>>>> +            has_reported_once =3D true;
>>>> +        }
>>>> +
>>>> +        tjmax =3D 100;
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    case 2:
>>>> +        tjmax =3D (entries[1].val >> 16) & 0xff;
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        if ( ret > 0 )
>>>> +        {
>>>> +            fprintf(stderr, "Got unexpected xc_resource_op return val=
ue: %d", ret);
>>>> +            errno =3D -EINVAL;
>>>> +        }
>>>> +        else
>>>> +            errno =3D ret;
>>>
>>> Why would this be? How do you know "ret" holds a value suitable for put=
ting
>>> in errno?
>>
>> Aside -1 in out of memory situations when xc_resource_op returns -1, in
>> other failure cases, it returns a hypercall (e.g multicall_op) return
>> code, which is supposed to match a errno.
> 
> As above - generally all layers want to deal with errno in a consistent
> manner. If bugs in lower layers are too intrusive to fix right away, such
> workarounds will at least want commenting upon (so it is easy to determin=
e
> at what point they can be removed again).
> 

I think once xc_resource_op returns consistent values, things would be 
simpler to deal with here.

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



