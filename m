Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENdlDWOtjWmz5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:37:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0C12C907
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228643.1534779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTnM-00054B-H0; Thu, 12 Feb 2026 10:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228643.1534779; Thu, 12 Feb 2026 10:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTnM-00051Z-Da; Thu, 12 Feb 2026 10:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1228643;
 Thu, 12 Feb 2026 10:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dPsv=AQ=bounce.vates.tech=bounce-md_30504962.698da927.v1-4effd200d4e64029b1b1b96a0c77e9ae@srs-se1.protection.inumbo.net>)
 id 1vqTnK-00051S-9u
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:19:34 +0000
Received: from mail132-5.atl131.mandrillapp.com
 (mail132-5.atl131.mandrillapp.com [198.2.132.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b9d01d7-07fc-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 11:19:21 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-5.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fBWVv5fM0zG0CJtv
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 10:19:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4effd200d4e64029b1b1b96a0c77e9ae; Thu, 12 Feb 2026 10:19:19 +0000
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
X-Inumbo-ID: 4b9d01d7-07fc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770891559; x=1771161559;
	bh=OAK8E+uWN2N6eP/o8FIa5Egn7ZKGqrRAkCdePJxkJlI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ADsUKPBkIfXpf/LA5yCiBF4HUMSBwajPGyV2MT2scwTsH0oXRz/H4pvKuJLK2HQqD
	 xPyOLsfhS30eoeZefs588ENSXvIe3318CSn0mXKSxkKU9ZM5TnsxN0EsRgL/10h6CV
	 xGlOrDYgn35miWW39PnPCFYcIaO89YikZtRoyx18hLmYH4XbVycZJlXTnZaOaHbZ0X
	 U5Aw8a1rra8iVKyiKeMiEw+XxS1hP+ViRLkB1smoJ6z60IX+ryOdlfqr1ZfnLEhvDm
	 sEP8n5meQP4tpz+oc1UG3rXPehlczVoLAmhQU2SOWukZ8in1q54r8n35lNfQ70HDDk
	 SMe94Qjbym/Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770891559; x=1771152059; i=teddy.astie@vates.tech;
	bh=OAK8E+uWN2N6eP/o8FIa5Egn7ZKGqrRAkCdePJxkJlI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FCqv1SxF5ebM52kJDAlHNcNFDTjYDS0cIUkXN9BdQ5nhHybjyj5ZVSYiF4tLX30yx
	 N6/IH8vvWJFW9azBBJbwJHyoaiPtd1de+M329LSb4tT207kBUoXxEGhszJteZJgBJO
	 sFma/bJ99ey8SC2E6pCVK5cxT9XMaTzAIdrCRBgD8c0kcb3MR/ThdKzeGA6nU2SI50
	 XyCb1CsmadTyV6HkXML4vasnNggl7O3W7JlYwuGQ/gjl2WqmCsBUk9pX2y8ZLyZYYf
	 rIkk/lx4cX4jkMWADQ8bB/qL6i9uh5xGvwbteH6IgQxW/omsX6GdD75uGFKP8bXP/V
	 i5X7+l1zAgBEg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770891558847
Message-Id: <f2a9028f-6bc6-40f8-a9ef-26800c9e4c59@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <489a4decf4367a9983a63fb4987d8c5f6267ed9f.1770632848.git.teddy.astie@vates.tech> <7064136b-38f1-4bbe-9ff4-14774c88f016@suse.com>
In-Reply-To: <7064136b-38f1-4bbe-9ff4-14774c88f016@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4effd200d4e64029b1b1b96a0c77e9ae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260212:md
Date: Thu, 12 Feb 2026 10:19:19 +0000
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
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:url,vates.tech:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 99F0C12C907
X-Rspamd-Action: no action

Le 09/02/2026 =C3=A0 15:21, Jan Beulich a =C3=A9crit=C2=A0:
> On 09.02.2026 11:31, Teddy Astie wrote:
>> @@ -93,6 +96,7 @@ void show_help(void)
>>               "                                           units default =
to \"us\" if unspecified.\n"
>>               "                                           truncates un-r=
epresentable values.\n"
>>               "                                           0 lets the har=
dware decide.\n"
>> +            " get-intel-temp        [cpuid]       get Intel CPU tempera=
ture of <cpuid> or all\n"
> 
> Sorry, thinking about it only now: Do we really want to build in the vend=
or
> name to a command? "get-temp" would allow for adding an AMD implementatio=
n
> later on?
> 

AMD CPUs expose a PCI device that can be interacted with to get 
temperatures; which is then exposed in hwmon interface of Linux. That 
wouldn't be practical to implement hwmon interfaces in xenpm.

>> @@ -1354,6 +1358,131 @@ void enable_turbo_mode(int argc, char *argv[])
>>                   errno, strerror(errno));
>>   }
>>   
>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package=
, int *temp)
>> +{
>> +    xc_resource_entry_t entries[] =3D {
>> +        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_=
STATUS },
>> +        { .idx =3D MSR_TEMPERATURE_TARGET },
>> +    };
>> +    struct xc_resource_op ops =3D {
>> +        .cpu =3D cpu,
>> +        .entries =3D entries,
>> +        .nr_entries =3D ARRAY_SIZE(entries),
>> +    };
>> +    int tjmax;
>> +
>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>> +
>> +    switch ( ret )
>> +    {
>> +    case -1:
>> +        /* xc_resource_op returns -1 in out of memory scenarios */
>> +        errno =3D -ENOMEM;
> 
> And xc_resource_op() doesn't itself set / inherit a properly set errno?
> We don't want to override what the C library may have set.
> 

I'm not sure what to do then. I guess we want to reset errno before 
entering xc_resource_op (so we won't report stale errno), but we would 
still need to consider cases where xc_resource_op returns failure 
without errno having being set ?

>> +        return -1;
>> +
>> +    case 0:
>> +        /* This CPU isn't online or can't query this MSR */
>> +        errno =3D -ENODATA;
>> +        return -1;
> 
> Here we "synthesize" an error, so errno indeed needs setting. However,
> doesn't errno want setting to positive E... values?
> 

Ah right, I overlooked that

>> +    case 1:
>> +    {
>> +        /*
>> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it=
's 100
>> +         * which is correct aside a few selected Atom CPUs. Check Linux
>> +         * kernel's coretemp.c for more information.
>> +         */
>> +        static bool has_reported_once =3D false;
>> +
>> +        if ( !has_reported_once )
>> +        {
>> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, a=
ssume "
>> +                            "tjmax =3D 100, readings may be incorrect.\=
n");
>> +            has_reported_once =3D true;
>> +        }
>> +
>> +        tjmax =3D 100;
>> +        break;
>> +    }
>> +
>> +    case 2:
>> +        tjmax =3D (entries[1].val >> 16) & 0xff;
>> +        break;
>> +
>> +    default:
>> +        if ( ret > 0 )
>> +        {
>> +            fprintf(stderr, "Got unexpected xc_resource_op return value=
: %d", ret);
>> +            errno =3D -EINVAL;
>> +        }
>> +        else
>> +            errno =3D ret;
> 
> Why would this be? How do you know "ret" holds a value suitable for putti=
ng
> in errno?
> 

Aside -1 in out of memory situations when xc_resource_op returns -1, in 
other failure cases, it returns a hypercall (e.g multicall_op) return 
code, which is supposed to match a errno.

But actually here, it would want to be -ret (due to errno wanting to be 
positive, and ret being negative)

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



