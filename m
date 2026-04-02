Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AxGGP52zmk6nwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:02:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187438A28E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271968.1559916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Icf-0002Ur-8S; Thu, 02 Apr 2026 14:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271968.1559916; Thu, 02 Apr 2026 14:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Icf-0002Sb-5K; Thu, 02 Apr 2026 14:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1271968;
 Thu, 02 Apr 2026 14:02:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8Icd-0002SV-Sq
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:02:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Icb-005Qv4-9D
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:02:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce76df-e002-0a2a0a5209dd-0a2a450ba9a6-30
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:02:10 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce76e1-bca8-0a2a450b0019-67a8ac95e8e9-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:02:10 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id E4B67EC010A;
 Thu,  2 Apr 2026 10:02:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 02 Apr 2026 10:02:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 10:02:07 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775138528;
	 x=1775224928; bh=0aAFsg0zA/lQnvSnAk+SdaY5anWlYW6E61WO/iarBk4=; b=
	WVQRbvRwQCWebdVoTYV4PQ8PSMT5OkJOuQsMsXOUBItbgE3Ru6YVUTrQ4sVMgs/v
	CSHOobi+ljeAPttcunhJmW4dJpkOcsKDRu5YeaF/8XsHieii3dqTAqSpIm0D0YKj
	q9tQBC19Ff3/SfuUk+zUesG1uQvWAFBoRlbyrBvQYkGSFDP7eu3H9nJOBnIuH5JK
	vLSsXMVwwXGRWzR52knIbtLlqO4JI85kj3hbO2L40cKmP4Is3WCmlSalmSMKRsik
	io18o0JoiJF4XCFbZSAE9UQnuXhSLm87dnmdn8KSFCjBtfpqnbU8PlhIp6TLlvJ3
	v4VpkCEYnMHJqkLLOJPiIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775138528; x=1775224928; bh=0aAFsg0zA/lQnvSnAk+SdaY5anWlYW6E61W
	O/iarBk4=; b=rRYZT3eYIGy9zdLeQvsqTHUhqHYqBsMevGJsAAZRowTdUsw6YVy
	qJ20SCec1GiQwNwq76Q0015pD2P1+I5F8cxcTCAeT8gWNsCljZXaoCrhvuMmifC0
	j9qTUl4CYpcKP8P2epKOOvGpxNlNqQ45npEE1cV6twvvr7ljC+WmUSich3zXWQCi
	d72IxgpJDrzTBi7W2Joo+kif5FbPYNxhubiz38nmoPHy3Joop10nF6FIifrOyWle
	ahhhTh6GUdnowNfwlCJJfkJPUCtaup3k9S1+qpnlpaxA/rPIE06mWpdRlgPaS92y
	oo3vxK4SKAHoIxDRYgiQFVlbtf3tmHp5ymw==
X-ME-Sender: <xms:4HbOacSgJe2xA07fTdY1oIrOo5zOWUegrnZfSB7hsSoQX6eOAZMt7w>
    <xme:4HbOaQxMVFfni-yKbFzgPaSCPWF-_JtxFwy9B7Jbr-C7EsdCECHtnoB3G7zLKb0iP
    SnWdTkGzJsESnZTdGrSa-2_7banqKHCurgrgl5IuodAcqRV_Q>
X-ME-Received: <xmr:4HbOae02MdwSEmyoViDlRdtVDFvreOsoEG6iRy91gydgzj7B0ur5MNFO-t8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeivddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeffudduleff
    kefhjeelfeegkeegteeikeduteevleefudfhfeehueduhfdugeffnecuffhomhgrihhnpe
    igvghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestg
    hithhrihigrdgtohhm
X-ME-Proxy: <xmx:4HbOae5e6fnS5BsM0C0CBqfU8r5veiztvHMUtR5OZQ2n19YBuEklcA>
    <xmx:4HbOaRV1UKgCjtGxjN97nWSOmxQuEgzjzX3ikIS7Ta7UINTyoT09yw>
    <xmx:4HbOadAFZWcVTErXcGydV-JaAaZCdaXMoSweBew-HkNoc5mEwe6QAQ>
    <xmx:4HbOaQ5t5wzHQ64T0H6xKzeAOo5ek7AXDMC38rj7DIQyXmiKCu6R5g>
    <xmx:4HbOaXMzZyubR5x7pxAsRx2QuRznP11-BEW98z1dGeRwoKpzSf35kppY>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 16:02:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: IOMMU faults after S3
Message-ID: <ac523jvUdQ7hw0Ts@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <97bfb299-a465-48a3-a036-f217de683c2c@suse.com>
 <ac46HK_KiUaLdK4N@mail-itl>
 <0b284c32-4dd3-4663-881b-834c47070328@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZeCWVrsmPc3PCgY3"
Content-Disposition: inline
In-Reply-To: <0b284c32-4dd3-4663-881b-834c47070328@suse.com>
X-purgate-ID: tlsNG-42698a/1775138530-EF9412A1-A3C9AF4F/0/0
X-purgate-type: clean
X-purgate-size: 5075
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4187438A28E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZeCWVrsmPc3PCgY3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Apr 2026 16:02:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: IOMMU faults after S3

On Thu, Apr 02, 2026 at 12:23:08PM +0200, Jan Beulich wrote:
> On 02.04.2026 11:42, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Apr 02, 2026 at 10:47:53AM +0200, Jan Beulich wrote:
> >> On 02.04.2026 10:39, Jan Beulich wrote:
> >>> On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> The xl dmesg output (from MTL this time):
> >>>>
> >>>>     (XEN) [  123.477511] Entering ACPI S3 state.
> >>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, =
cpu_has_apic: 1
> >>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_=
deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> >>>
> >>> XEN_ARAT being off is the one odd aspect here. That'll want tracking =
down
> >>> separately. As per xen-cpuid output (below) ARAT is available.
> >>
> >> For this you may want to also add logging to intel_init_arat(): Since =
opt_arat
> >> can be false only due to command line option use, it can only be the f=
unction
> >> not being called (which looks impossible on plain staging code), or cp=
u_has_arat
> >> being false despite the xen-cpuid output that you supplied earlier (in=
explicable
> >> as well, at least for now).
> >=20
> > Hm, I got this:
> >=20
> >     (XEN) [   11.403340] intel_init_arat:674: opt_arat: 1, cpu_has_arat=
: 0
> >=20
> > so, cpu_has_arat=3D0 ...
> > next lines are those, to hint when it happened in the boot process:
> >=20
> >     (XEN) [   11.409754] mwait-idle: MWAIT substates: 0x11112020
> >     (XEN) [   11.416130] mwait-idle: v0.4.1 model 0xaa
> >     (XEN) [   11.422396] mwait-idle: lapic_timer_reliable_states 0x2
> >=20
> > Looks like calculate_host_policy() runs much later...
>=20
> Hmm, yes, and that's the problem. The reason I don't see this is that a n=
ewer
> version of [1] has this
>
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -628,6 +628,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	}
> =20
>  	/* Now the feature flags better reflect actual CPU features! */
> +	if (c =3D=3D &boot_cpu_data)
> +		calculate_host_policy();
> =20
>  	xstate_init(c);
> =20
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -384,7 +384,7 @@ void calculate_raw_cpu_policy(void)
>      /* Was already added by probe_cpuid_faulting() */
>  }
> =20
> -static void __init calculate_host_policy(void)
> +void __init calculate_host_policy(void)
>  {
>      struct cpu_policy *p =3D &host_cpu_policy;
> =20
> @@ -959,6 +959,7 @@ static void __init calculate_hvm_def_pol
> =20
>  void __init init_guest_cpu_policies(void)
>  {
> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() u=
ses. */
>      calculate_host_policy();
> =20
>      if ( IS_ENABLED(CONFIG_PV) )
>=20
> and of course I'm doing my work (and my analysis) with that in place.

FWIW, with this patch applied I get:
(XEN) [18446743899.051851] _disable_pit_irq:2649: using_pit: 0, cpu_has_api=
c: 1
(XEN) [18446743899.051865] _disable_pit_irq:2659: cpuidle_using_deep_cstate=
: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 1

And no IOMMU faults anymore.

> I may need to break this out and submit independently, but really the pro=
blem
> here is that the containing series has been sitting largely unreviewed (a=
nd
> hence not in a position to plausibly re-post) for almost 5 years. Andrew,
> (maybe also Roger) - I'm open to suggestions how to proceed. When your xs=
tate
> cleanup patches were helped to go in ahead of mine, you promised to help =
mine
> going in afterwards. Yet nothing has happened (and I'm tired of re-submit=
ting
> large pieces of work just for the sake of re-submitting, i.e. without hav=
ing
> has [sufficient] feedback on the earlier version).
>=20
> Jan
>=20
> [1] https://lists.xen.org/archives/html/xen-devel/2021-04/msg01336.html

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZeCWVrsmPc3PCgY3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOdt4ACgkQ24/THMrX
1yzHWggAhjmKXWAUnZLU2gP7Hf9Muj88OfxSbxUvk9QJGkt/LHnn9BWFw/Af5Vzd
2cb3s0Bhh3dNhZQCF7/Bqz2B1Ih3q8jH8x3pijIb3h5tBmenJadyPW58WEdSqZxg
7m6P7QUQkqQHNrzn/WTbIckUleDipk9Zxwqjhi1RKXZJBYmYabKMskdvd7A1t9of
jMlNIV1dQQIyRIhWMXAo3NzSnqRTykA//aMWXtsbGz2Yl4+PmdV8vV9aMAgUJVC9
xnnRQkbSGHDhVX2Lr/7AH2B8wvwFP5P+EDqcsvNpvHFvhbfLyLZZMe8C0eXCQ/p9
11aOidTUEDwE+q/RUN9MD4ClXDCmqQ==
=Rg5l
-----END PGP SIGNATURE-----

--ZeCWVrsmPc3PCgY3--

