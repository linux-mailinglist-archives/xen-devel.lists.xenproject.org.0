Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KICNGj7y1GkjywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 14:02:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C53AE148
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 14:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274956.1560923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA57Y-0007yq-Pv; Tue, 07 Apr 2026 12:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274956.1560923; Tue, 07 Apr 2026 12:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA57Y-0007x0-NG; Tue, 07 Apr 2026 12:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1274956;
 Tue, 07 Apr 2026 12:01:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA57X-0007wu-8b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:01:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA57W-002MDO-K5
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:01:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4f212-5cb7-0a2a0a5109dd-0a2a450c90bc-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 14:01:26 +0200
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d4f214-f40c-0a2a450c0019-67a8ac938ad1-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 14:01:24 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id E0F16EC00B5;
 Tue,  7 Apr 2026 08:01:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 07 Apr 2026 08:01:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 08:01:22 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775563283;
	 x=1775649683; bh=z5aLCYLbZ8fU3DExyhdRa3/7HUN/hueZnJV+G8fOiAk=; b=
	ZmuaKoqwSVmpcprE+UiBNIBttTiTSyc9ThC3T4N+ziBjSNoez2Zvehw/MJoC/5qJ
	XyaeZTe1aYKgP4pXS8jn/jV6nnJx6BShvoEE1zshmm5R7JRD8jZvqLZd+Q575EE7
	kuHZakmMDqIBqTwxE7b81WeTkI/irCUzTFc2TfjRPIZAiO+rdqHGSSzMUnigFEx5
	4HIEP5JwMhUJpuOhbUq10SRnInt6RKuIHtAtVOucR57z8L1Tavp3aE6k8BLhIv+L
	BamhXDRkmU6SLsF0T8ItNKj4FvM7ZKK5pQu0p8KBeWIAjgn/ZwiZaxkCpokhmUHL
	zArOSij9x5He2e/T8J2Tzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775563283; x=1775649683; bh=z5aLCYLbZ8fU3DExyhdRa3/7HUN/hueZnJV
	+G8fOiAk=; b=qb+03fIukE6OW9cxM27tSmx36a6LZOHSdE011leX+w81sYkUh66
	0KijykIEyCyZF9NPfJVQVWbyrdrqzQVsvxGkT9nU9mimdihT+Kpkn7KhshNzbG33
	FDvTFoWCuJD8PxpMZCFS17jYcYmiZ3ZbdR9p9zGtxDvt3c0rLkzLav0CJv5CBndb
	yLYEid9SOK6sPPuq/Agad3RmdHAU8GFViLqs0l70SG6S/yvvZ7EIZKRFNlIGj/lW
	ZBfbe6c7UZQIgCE+AcZD5JyJu00xOSP+cUbupKqUKiHHpVbGEB4854WSQFKxXru8
	jmRMyojoEsReoHbRPuECwGYiLqpwPAUiJRg==
X-ME-Sender: <xms:E_LUaQPH0rnbH4ZFkBAuqYRKPx5kfCoAFVK7JzSK3NkP7zuZUEvIMw>
    <xme:E_LUad8ufvGyfl0M3Dv2Qp7NxC6awOO454Pt6SDIcVmYchYIxpMDT6tBBBU2OADjA
    neroBIOufgq0R8AVhsQFv9Ea6dDTsA2sLOMsbHUkNlQe2pW6g>
X-ME-Received: <xmr:E_LUacRcVDYXI7ehfo2zYZh-_EptgLFKGoHy-KVPwWQZQ1X0aY_szao90fBCmM6LQTqswZrom0xlUQoqwMzBNbq3s5AnXULAWIY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvtdehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehledvvddu
    vedvleeggedvvdetleethfehveefffetgfekiedtfeeiudejffeugeenucffohhmrghinh
    epshgrnhguphhilhgvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjghhr
    ohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrih
    igrdgtohhm
X-ME-Proxy: <xmx:E_LUaXmlE0NHt9H48LRM4OLgDBqb9xa6M0LCxS_o9-1N53J7KQ86GA>
    <xmx:E_LUaURg1VxJCXr1fcOB92DAV33FUHq_XLFPQzDKxb6Q_MEtT8GydQ>
    <xmx:E_LUadNinUA9zU7Mha86ERqy0JLPdzFCFwjkYkWs8WriVzGYFTkg_w>
    <xmx:E_LUaVW5O4YrGjnO-trHPU6gBH5cBSU0mhDISDMD00l6r6gt72_cDw>
    <xmx:E_LUaWs7bCkLdTGdSMb6Ey_ei76Tn2qaZcGLcaVMVcE61O1B6CW6PGgb>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 14:01:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <adTyEazLcZEpWuvy@mail-itl>
References: <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
 <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
 <acZ8ez4dmQay1JSw@mail-itl>
 <ac5l-HgbDRcVkiWb@mail-itl>
 <ac_Gu2lm4Jnoz7WN@mail-itl>
 <b6e53859-70fd-49b0-a7f0-eb53386349df@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bQ5tYmjyiuSDb3TB"
Content-Disposition: inline
In-Reply-To: <b6e53859-70fd-49b0-a7f0-eb53386349df@suse.com>
X-purgate-ID: tlsNG-d25034/1775563285-FDD53A3D-8C6BA6C1/0/0
X-purgate-type: clean
X-purgate-size: 5634
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[messagingengine.com:query timed out,invisiblethingslab.com:query timed out];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 177C53AE148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bQ5tYmjyiuSDb3TB
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="JAoCyMYCO6UJ7qb2"
Content-Disposition: inline
Date: Tue, 7 Apr 2026 14:01:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?


--JAoCyMYCO6UJ7qb2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 08:14:42AM +0200, Jan Beulich wrote:
> On 03.04.2026 15:55, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Apr 02, 2026 at 03:02:15PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> Some further observation, this time regarding timers:
> >>
> >> In the meantime Roger suggested it might be about C-states. So, I just
> >> tried booting with max_cstate=3D0. I got this:
> >=20
> > We had a design session on this issue, and managed to find (thanks Roge=
r!)
> > that adding:
> >=20
> >     tsc_mode=3D'always_emulate'
> >=20
> > to the domU config fixes the issue. Now, the question is how to fix it
> > properly...
>=20
> Seeing also the remarks on Matrix, what we will hence need to figure is w=
hat
> TSC parameters (of the system and/or the VM) change across suspend. As per
> Matrix everything looked at so far was apparently stable.

I added some more logging (based on=20
https://sandpile.org/x86/msr.htm | grep TSC) - see attached debug patch.
The output before and after S3:

    =3D=3D> msr-before.txt <=3D=3D
    (XEN) [  118.910886] MSR 00000010: 000000cd6d18d6c1
    (XEN) [  118.911110] MSR 0000003b: 0000000000000000
    (XEN) [  118.911331] MSR c0000103: 0000000000000000
    (XEN) [  118.911559] Fixup #GP[0000]: ffff82d04029ad8d [arch/x86/cpu/in=
tel.c#debug_tsc+0x76/0x84] -> ffff82d04029ad83
    (XEN) [  118.912029] MSR 000006e0: 0000000000000000
    (XEN) [  118.912253] MSR 000000e7: 000000064cf8ec5e
    (XEN) [  118.912473] MSR 000000e8: 000000065d09c019
    (XEN) [  118.912687] MSR 0000064e: 000000052ec83116


    =3D=3D> msr-after.txt <=3D=3D
    (XEN) [  146.396099] MSR 00000010: 00000012fac68ccd
    (XEN) [  146.396329] MSR 0000003b: 0000000000000000
    (XEN) [  146.396553] MSR c0000103: 0000000000000000
    (XEN) [  146.396777] Fixup #GP[0000]: ffff82d04029ad8d [arch/x86/cpu/in=
tel.c#debug_tsc+0x76/0x84] -> ffff82d04029ad83
    (XEN) [  146.397248] MSR 000006e0: 0000000000000000
    (XEN) [  146.397470] MSR 000000e7: 00000001e41a578a
    (XEN) [  146.397690] MSR 000000e8: 000000017dc5b211
    (XEN) [  146.397909] MSR 0000064e: 000000014eddbe8f

Nothing interesting here...

What other values would make sense to compare?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JAoCyMYCO6UJ7qb2
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=0001-DEBUG-TSC.patch
Content-Transfer-Encoding: quoted-printable

=46rom 2d1bd9c15e605136c7817fe824a7c429cbfb137d Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
 <marmarek@invisiblethingslab.com>
Date: Tue, 7 Apr 2026 13:55:41 +0200
Subject: [PATCH] DEBUG TSC

---
 xen/arch/x86/cpu/intel.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 51a3d1c4b5f3..846c6a704a3f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -4,6 +4,7 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/string.h>
+#include <xen/keyhandler.h>
=20
 #include <asm/apic.h>
 #include <asm/i387.h>
@@ -675,3 +676,30 @@ void __init intel_init_arat(void)
     if ( opt_arat && cpu_has_arat )
         setup_force_cpu_cap(X86_FEATURE_XEN_ARAT);
 }
+
+static void cf_check debug_tsc(unsigned char key)
+{
+    uint64_t val;
+    int msr_idx[] =3D { 0x10,         // TSC
+                      0x3b,         // TSC_ADJUST
+                      0xc0000103,   // TSC_AUX
+                      0xc0000104,   // TSC_RATIO
+                      0x06e0,       // TSC_DEADLINE
+                      0xe7,         // MPERF
+                      0xe8,         // APERF
+                      0x64e,        // PPERF
+                      0 };
+
+    for ( int i =3D 0; msr_idx[i]; i++ )
+    {
+        if ( !rdmsr_safe(msr_idx[i], &val) )
+            printk("MSR %08x: %016lx\n", msr_idx[i], val);
+    }
+}
+
+static int __init cf_check register_debug_tsc(void)
+{
+    register_keyhandler('1', debug_tsc, "Extra TSC debug", false);
+    return 0;
+}
+__initcall(register_debug_tsc);
--=20
2.53.0


--JAoCyMYCO6UJ7qb2--

--bQ5tYmjyiuSDb3TB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnU8hAACgkQ24/THMrX
1ywuIAgAm1QhozTGwws97jc5c+BB2Y8ViruL769uzkNd24Hr1BZJBtDsOSlVwQWW
Oz25zIA47k2toJD+veU4KYTNgWUW/OACkiQMW/0F2ozYIRXqBSYmwDOip+jFQaMo
LoOh+G6KUKmLLsjbdrrPMr+rB1kl8Udl/Qcdct69/GOp/iEQFIS91suQjN2VlSiJ
ojNyhyTpPWuIwUrs/83f3MPz1jr+JMHN476L6fyhftMf5SayguMtDDHRIQlnzK4w
5r44nVFvHT914TomqGePOgoINLGSkPgVbAcr7gnbzFlJAkfASQNvwU14MimmGyFn
ZKhKNw0bfgdBhix6X/HR9GxFfaUkZg==
=sP3B
-----END PGP SIGNATURE-----

--bQ5tYmjyiuSDb3TB--

