Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49213099F3
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 03:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79139.144131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l62H1-0004gK-LZ; Sun, 31 Jan 2021 02:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79139.144131; Sun, 31 Jan 2021 02:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l62H1-0004fs-DL; Sun, 31 Jan 2021 02:15:35 +0000
Received: by outflank-mailman (input) for mailman id 79139;
 Sun, 31 Jan 2021 02:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZXz=HC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l62H0-0004fn-61
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 02:15:34 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1b18c0e-2dce-4cd0-94ae-fac34c78167e;
 Sun, 31 Jan 2021 02:15:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 08DEB5C00FF;
 Sat, 30 Jan 2021 21:15:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 30 Jan 2021 21:15:31 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC651240057;
 Sat, 30 Jan 2021 21:15:29 -0500 (EST)
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
X-Inumbo-ID: f1b18c0e-2dce-4cd0-94ae-fac34c78167e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZyXCdf
	QJVtXGtyqXbNHNMRlxjZ1mi7dGaQMR+CIG4nU=; b=BghAuJ+XxYUrZyenjnxR7D
	DfbuHwoEyEh6CnwJXkEbgbJedh/wHymu2ed5qIZPdwv592H9oquHhQdMyg9uWaXV
	rT6PjtIetNR0smoQqLyoP3IVGOd4mWrQYeZw5nhlhxcN/m+Ehmi2NdbpDMMuBVgZ
	x1reAlM09MUUHpi2tnVaqyeFj4r3vEcZfIddBX754K2kFWY0M3T1YBwg7IvpkIf5
	RHegoO0RQISeBQQz9JI/a5jDcSnMnCOUHigMZYd/R6PfAQz6aHtxPznAYLTRunxT
	4BAjeSDBJzbIPy04HI+/cS4ln0egqgqGz8PmUkCe0DSC6PqoZ2pNokgn8CNpvG6w
	==
X-ME-Sender: <xms:whIWYCXX5qU5hlAqPOsBQYviuBJHg8A_F00ky-bFoVOs7MkVpjFqmg>
    <xme:whIWYOn0przwv3uW2f-MZwZmwrrL48tx6vdRZs7EjaDTLuaI9fryoD7mA7pz1W-Yc
    FCSYCC_Tn311Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:whIWYGb1Sx8pUzF81sXKTk8US3KJ4USYYme4NecuST3Fk1QXwSmdnw>
    <xmx:whIWYJWMvIQYt3okT0u6FH5jEe81AiaROvtJCiC6B1X7yNxFuQZbUQ>
    <xmx:whIWYMl9NfY-vdAdjMPID2nvZoG5bFSpw_T-7c3Y5flqUeM-GdbiMQ>
    <xmx:wxIWYBwb3bfMsp_MbaLGG1QNp-l1kwY9wCvg-QGBAlnRFJq_lci6mA>
Date: Sun, 31 Jan 2021 03:15:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <20210131021526.GB6354@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Tue, Sep 29, 2020 at 05:27:48PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.09.20 17:16, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> > > > > > [Adding Juergen]
> > > > > >=20
> > > > > > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> > > > > > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> > > > > > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > In my test setup (inside KVM with nested virt enabled), I=
 rather
> > > > > > > > > frequently get Xen crash on resume from S3. Full message =
below.
> > > > > > > > >=20
> > > > > > > > > This is Xen 4.13.0, with some patches, including "sched: =
fix
> > > > > > > > > resuming
> > > > > > > > > from S3 with smt=3D0".
> > > > > > > > >=20
> > > > > > > > > Contrary to the previous issue, this one does not happen =
always -
> > > > > > > > > I
> > > > > > > > > would say in about 40% cases on this setup, but very rare=
ly on
> > > > > > > > > physical
> > > > > > > > > setup.
> > > > > > > > >=20
> > > > > > > > > This is _without_ core scheduling enabled, and also with =
smt=3Doff.
> > > > > > > > >=20
> > > > > > > > > Do you think it would be any different on xen-unstable? I=
 cat
> > > > > > > > > try, but
> > > > > > > > > it isn't trivial in this setup, so I'd ask first.
> > > > > > > > >=20
> > > > > > Well, Juergen has fixed quite a few issues.
> > > > > >=20
> > > > > > Most of them where triggering with core-scheduling enabled, and=
 I don't
> > > > > > recall any of them which looked similar or related to this.
> > > > > >=20
> > > > > > Still, it's possible that the same issue causes different sympt=
oms, and
> > > > > > hence that maybe one of the patches would fix this too.
> > > > >=20
> > > > > I've tested on master (d094e95fb7c), and reproduced exactly the s=
ame crash
> > > > > (pasted below for the completeness).
> > > > > But there is more: additionally, in most (all?) cases after resum=
e I've got
> > > > > soft lockup in Linux dom0 in smp_call_function_single() - see bel=
ow. It
> > > > > didn't happened before and the only change was Xen 4.13 -> master.
> > > > >=20
> > > > > Xen crash:
> > > > >=20
> > > > > (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' =
failed at credit2.c:2133
> > > >=20
> > > > Juergen, any idea about this one? This is also happening on the cur=
rent
> > > > stable-4.14 (28855ebcdbfa).
> > > >=20
> > >=20
> > > Oh, sorry I didn't come back to this issue.
> > >=20
> > > I suspect this is related to stop_machine_run() being called during
> > > suspend(), as I'm seeing very sporadic issues when offlining and then
> > > onlining cpus with core scheduling being active (it seems as if the
> > > dom0 vcpu doing the cpu online activity sometimes is using an old
> > > vcpu state).
> >=20
> > Note this is default Xen 4.14 start, so core scheduling is _not_ active:
>=20
> The similarity in the two failure cases is that multiple cpus are
> affected by the operations during stop_machine_run().
>=20
> >=20
> >      (XEN) Brought up 2 CPUs
> >      (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> >      (XEN) Adding cpu 0 to runqueue 0
> >      (XEN)  First cpu on runqueue, activating
> >      (XEN) Adding cpu 1 to runqueue 1
> >      (XEN)  First cpu on runqueue, activating
> >=20
> > > I wasn't able to catch the real problem despite of having tried lots
> > > of approaches using debug patches.
> > >=20
> > > Recently I suspected the whole problem could be somehow related to
> > > RCU handling, as stop_machine_run() is relying on tasklets which are
> > > executing in idle context, and RCU handling is done in idle context,
> > > too. So there might be some kind of use after free scenario in case
> > > some memory is freed via RCU despite it still being used by a tasklet.
> >=20
> > That sounds plausible, even though I don't really know this area of Xen.
> >=20
> > > I "just" need to find some time to verify this suspicion. Any help do=
ing
> > > this would be appreciated. :-)
> >=20
> > I do have a setup where I can easily-ish reproduce the issue. If there
> > is some debug patch you'd like me to try, I can do that.
>=20
> Thanks. I might come back to that offer as you are seeing a crash which
> will be much easier to analyze. Catching my error case is much harder as
> it surfaces some time after the real problem in a non destructive way
> (usually I'm seeing a failure to load a library in the program which
> just did its job via exactly the library claiming not being loadable).

Hi,

I'm resurrecting this thread as it was recently mentioned elsewhere. I
can still reproduce the issue on the recent staging branch (9dc687f155).

It fails after the first resume (not always, but frequent enough to
debug it). At least one guest needs to be running - with just (PV) dom0
the crash doesn't happen (at least for the ~8 times in a row I tried).
If the first resume works, the second (almost?) always will fail but
with a different symptoms - dom0 kernel lockups (at least some of its
vcpus). I haven't debugged this one yet at all.

Any help will be appreciated, I can apply some debug patches, change
configuration etc.

In the meantime I tried to collect more info with the patch below, but I
can't make much of it. Here is what I've got:

(XEN) c2r(sched_unit_master(unit)) =3D 1, c2rqd(sched_unit_master(unit)) =
=3D ffff8301ba6d0230, sched_unit_master(unit) =3D 1, svc->rqd->id =3D 0, sv=
c->rqd =3D ffff8301ba6d0050,=20
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2294
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=3Dy  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040246642>] credit2.c#csched2_unit_wake+0x205/0=
x207
(XEN) RFLAGS: 0000000000010083   CONTEXT: hypervisor
(XEN) rax: ffff8301ba6d0230   rbx: ffff8301ba6b7b50   rcx: 0000000000000001
(XEN) rdx: 000000317a159000   rsi: 000000000000000a   rdi: ffff82d0404686b8
(XEN) rbp: ffff8300be877df0   rsp: ffff8300be877dd0   r8:  0000000000000000
(XEN) r9:  0000000000000004   r10: 0000000000000001   r11: 0000000000000001
(XEN) r12: ffff8301ba6b7be0   r13: ffff82d040453d00   r14: 0000000000000001
(XEN) r15: 0000013446313336   cr0: 000000008005003b   cr4: 00000000000006e0
(XEN) cr3: 00000000be866000   cr2: 0000000000000000
(XEN) fsb: 00000000000b8000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040246642> (credit2.c#csched2_unit_wake+0x205=
/0x207):
(XEN)  f3 00 00 e9 7a ff ff ff <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 =
53 48
(XEN) Xen stack trace from rsp=3Dffff8300be877dd0:
(XEN)    ffff8301ba6a2000 ffff8301ba6b7b50 ffff8301ba6b7b50 ffff8301ba6d0230
(XEN)    ffff8300be877e40 ffff82d04024f968 0000000000000202 ffff8301ba6d0230
(XEN)    ffff82d0405a05c0 ffff83010a6f1fd0 ffff8301ba6a2000 0000000000000000
(XEN)    0000000000000000 ffff82d0405a05c0 ffff8300be877e50 ffff82d04020548a
(XEN)    ffff8300be877e70 ffff82d04020552b ffff8301ba6a21b8 ffff82d0405801b0
(XEN)    ffff8300be877e88 ffff82d04022ba4e ffff82d0405801a0 ffff8300be877eb8
(XEN)    ffff82d04022bd2f 0000000000000000 0000000000007fff ffff82d040586f00
(XEN)    ffff82d0405801b0 ffff8300be877ef0 ffff82d0402f0412 ffff82d0402f039e
(XEN)    ffff8301ba6a2000 ffff8301ba708000 0000000000000000 ffff8301ba6bb000
(XEN)    ffff8300be877e18 ffff8881072a76e0 ffffc90003f3ff08 0000000000000003
(XEN)    0000000000000000 0000000000002401 ffffffff827594c8 0000000000000246
(XEN)    0000000000000003 0000000000002401 0000000000002401 0000000000000000
(XEN)    ffffffff810010ea 0000000000002401 0000000000000010 deadbeefdeadf00d
(XEN)    0000010000000000 ffffffff810010ea 000000000000e033 0000000000000246
(XEN)    ffffc90003f3fcb8 000000000000e02b 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000e01000000000 ffff8301ba6fb000
(XEN)    0000000000000000 00000000000006e0 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d040246642>] R credit2.c#csched2_unit_wake+0x205/0x207
(XEN)    [<ffff82d04024f968>] F vcpu_wake+0x105/0x52c
(XEN)    [<ffff82d04020548a>] F vcpu_unpause+0x13/0x15
(XEN)    [<ffff82d04020552b>] F domain.c#continue_hypercall_tasklet_handler=
+0x9f/0xb9
(XEN)    [<ffff82d04022ba4e>] F tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d04022bd2f>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0402f0412>] F domain.c#idle_loop+0x74/0xdd
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2294

And the patch:

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index eb5e5a78c5e7..475f0acf2dc5 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2268,10 +2268,28 @@ csched2_unit_wake(const struct scheduler *ops, stru=
ct sched_unit *unit)
     }
=20
     /* Add into the new runqueue if necessary */
-    if ( svc->rqd =3D=3D NULL )
+    if ( svc->rqd =3D=3D NULL ) {
+        printk(XENLOG_DEBUG "assigning cpu %d to runqueue\n", cpu);
         runq_assign(unit);
-    else
+        printk(XENLOG_DEBUG "assigned cpu %d to runqueue %d\n",
+                cpu,
+                svc->rqd ? svc->rqd->id : -1);
+    } else {
+        if (c2rqd(sched_unit_master(unit)) !=3D svc->rqd) {
+            printk(XENLOG_DEBUG "c2r(sched_unit_master(unit)) =3D %d, "
+                                "c2rqd(sched_unit_master(unit)) =3D %p, "
+                                "sched_unit_master(unit) =3D %d, "
+                                "svc->rqd->id =3D %d, "
+                                "svc->rqd =3D %p, "
+                                "\n",
+                c2r(sched_unit_master(unit)),
+                c2rqd(sched_unit_master(unit)),
+                sched_unit_master(unit),
+                svc->rqd->id,
+                svc->rqd);
+        }
         ASSERT(c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd );
+    }
=20
     now =3D NOW();
=20



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAWEr8ACgkQ24/THMrX
1yw3rQf+M6Spe30K4QuqiaV8gWulDeJ61mdRER7bXIBGX9SKY87Pxyddn2zwKqPy
LyGQOGs0+bzKNR1gcZWQ7kHq5FG1BU1fZ9ekiwLNlFtxoxOEl8rhA9QdMKRdaSOc
VFEiOvUZsTFztRRvCdfLhCn/reSFXzzoDvIuLTclbBy7NSj6ZbwrGeV25ydwQxzs
h76Ue2dMXYvJRsOBIxHVYR4WlOpV2zHyG23kK1xR7AQg/Ag/ZcGPYkwIwUBjgAsn
wDkQX6rJFD/xxwwuT29MG9NJ5wMVYjyEqwAEWOt8OxNLldwtVgyDRRu1Aw3oF22Z
6nOycoW7EuHK7QxCji/vBKwzQTEyxA==
=bUBT
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

