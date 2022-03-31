Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D04ED919
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296901.505557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtUh-0007ja-EG; Thu, 31 Mar 2022 12:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296901.505557; Thu, 31 Mar 2022 12:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtUh-0007hC-B6; Thu, 31 Mar 2022 12:01:39 +0000
Received: by outflank-mailman (input) for mailman id 296901;
 Thu, 31 Mar 2022 12:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuZR=UK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nZtUg-0007h4-4h
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:01:38 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af6ea96-b0ea-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 14:01:27 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AD1F65C00EE;
 Thu, 31 Mar 2022 08:01:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 31 Mar 2022 08:01:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 08:01:31 -0400 (EDT)
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
X-Inumbo-ID: 4af6ea96-b0ea-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tx1mrRGfBWfU+0EvM
	EXhqZAK8HzQZbdRKM7Rc8ILzx0=; b=P8NLlaI32WzbDHdQxmKu4JM5tSE00ZfjE
	QSHC5TN+rE4CJPUV4GlttoexDCubRG+wgvhJ5eQ43vyFz30RfRupDp9IZF8oxh7v
	GRbUu4PKcPvASsoaCmqI5dCSv/gNFz+vYQptA9hNnPmybef+7Qg54CPAHPgmpWXJ
	TMjpPdNAJ3iDAmv44uTWPNSau8M8+5lRpwToeNFsa2tAVFXNtZ+PA32g4fJWaDjp
	2BNdXa6dyfnmrMineCPDe7mL/erbOwyTysi281YGIvr+RqBQO50AWAKY8sbMtNyO
	75DANWzXS/rBGBFIPEvaUgTcUy5wVQ7c/lyifA27BZnJrSCh8BLVA==
X-ME-Sender: <xms:HJhFYuCA_Fz0yxLh32WICUiaMnuq-Jgiq0UiDQdC3nlYSfl5Ccts5w>
    <xme:HJhFYog7wslneb6Upv5TpqL1uX_YD4eoXE26Uief41Z37MwDkeka5s-uPZXzxZZeL
    mUNL-ZzN7loaA>
X-ME-Received: <xmr:HJhFYhnh7zHtJpeq7Pg3oLm6We5jFOh-6Yfq9MyuBLnTnuUtQJnZ3ZyZhv6ArdEpKUefIJG0kj6HXlVuVYH156AhqJF_kKkoAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekgedt
    gfdvieehhfehtddvleeiieeuteevheetffejjeejvdeijeevhfeufeefgeenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:HJhFYsy5Tj1NLcA7x8lwIySrG-SopqNwOqqttG7T1i3Vyd-2q-bK6A>
    <xmx:HJhFYjQoxkH9gNRKhEhZCbO25Ok2wWXFZoumL1QVOO9MMsI5S3q8qA>
    <xmx:HJhFYnZyVLI0C0tHhVl2qWwUGVpC6dzD37T4n3Fl3RIb5_sk7oC_dw>
    <xmx:HJhFYmNXbyfu8gNqCY3LA7WeTj0bfracd_wvlhDvmgkNVmvyPshnfQ>
Date: Thu, 31 Mar 2022 14:01:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem
Message-ID: <YkWYGFJ/Cl+B2C37@mail-itl>
References: <YkUlLvnEDdc5hwN4@mail-itl>
 <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xoimVyVpapmBJn8n"
Content-Disposition: inline
In-Reply-To: <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>


--xoimVyVpapmBJn8n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 14:01:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem

On Thu, Mar 31, 2022 at 08:41:19AM +0200, Juergen Gross wrote:
> On 31.03.22 05:51, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I'm trying to make use of CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy to incr=
ease
> > domain memory beyond initial maxmem, but I hit few issues.
> >=20
> > A little context: domains in Qubes OS start with rather little memory
> > (400MB by default) but maxmem set higher (4GB by default). Then, there =
is
> > qmemman daemon, that adjust balloon targets for domains, based on (among
> > other things) demand reported by the domains themselves. There is also a
> > little swap, to mitigate qmemman latency (few hundreds ms at worst).
> > This initial memory < maxmmem in case of PVH / HVM makes use of PoD
> > which I'm trying to get rid of. But also, IIUC Linux will waste some
> > memory for bookkeeping based on maxmem, not actually usable memory.
> >=20
> > First issue: after using `xl mem-max`, `xl mem-set` still refuses to
> > increase memory more than initial maxmem. That's because xl mem-max does
> > not update 'memory/static-max' xenstore node. This one is easy to work
> > around.
> >=20
> > Then, the actual hotplug fails on the domU side with:
> >=20
> > [   50.004734] xen-balloon: vmemmap alloc failure: order:9, mode:0x4cc0=
(GFP_KERNEL|__GFP_RETRY_MAYFAIL), nodemask=3D(null),cpuset=3D/,mems_allowed=
=3D0
> > [   50.004774] CPU: 1 PID: 34 Comm: xen-balloon Not tainted 5.16.15-1.3=
7.fc32.qubes.x86_64 #1
> > [   50.004792] Call Trace:
> > [   50.004799]  <TASK>
> > [   50.004808]  dump_stack_lvl+0x48/0x5e
> > [   50.004821]  warn_alloc+0x162/0x190
> > [   50.004832]  ? __alloc_pages+0x1fa/0x230
> > [   50.004842]  vmemmap_alloc_block+0x11c/0x1c5
> > [   50.004856]  vmemmap_populate_hugepages+0x185/0x519
> > [   50.004868]  vmemmap_populate+0x9e/0x16c
> > [   50.004878]  __populate_section_memmap+0x6a/0xb1
> > [   50.004890]  section_activate+0x20a/0x278
> > [   50.004901]  sparse_add_section+0x70/0x160
> > [   50.004911]  __add_pages+0xc3/0x150
> > [   50.004921]  add_pages+0x12/0x60
> > [   50.004931]  add_memory_resource+0x12b/0x320
> > [   50.004943]  reserve_additional_memory+0x10c/0x150
> > [   50.004958]  balloon_thread+0x206/0x360
> > [   50.004968]  ? do_wait_intr_irq+0xa0/0xa0
> > [   50.004978]  ? decrease_reservation.constprop.0+0x2e0/0x2e0
> > [   50.004991]  kthread+0x16b/0x190
> > [   50.005001]  ? set_kthread_struct+0x40/0x40
> > [   50.005011]  ret_from_fork+0x22/0x30
> > [   50.005022]  </TASK>
> >=20
> > Full dmesg: https://gist.github.com/marmarek/72dd1f9dbdd63cfe479c94a3f4=
392b45
> >=20
> > After the above, `free` reports correct size (1GB in this case), but
> > that memory seems to be unusable really. "used" is kept low, and soon
> > OOM-killer kicks in.
> >=20
> > I know the initial 400MB is not much for a full Linux, with X11 etc. But
> > I wouldn't expect it to fail this way when _adding_ memory.
> >=20
> > I've tried also with initial 800MB. In this case, I do not get "alloc
> > failure" any more, but monitoring `free`, the extra memory still doesn't
> > seem to be used.
> >=20
> > Any ideas?
> >=20
>=20
> I can't reproduce that.
>=20
> I started a guest with 8GB of memory, in the guest I'm seeing:
>=20
> # uname -a
> Linux linux-d1cy 5.17.0-rc5-default+ #406 SMP PREEMPT Mon Feb 21 09:31:12
> CET 2022 x86_64 x86_64 x86_64 GNU/Linux
> # free
>         total     used      free   shared  buff/cache   available
> Mem:  8178260    71628   8023300     8560       83332     8010196
> Swap: 2097132        0   2097132
>=20
> Then I'm raising the memory for the guest in dom0:
>=20
> # xl list
> Name                ID   Mem VCPUs      State   Time(s)
> Domain-0             0  2634     8     r-----    1016.5
> Xenstore             1    31     1     -b----       0.9
> sle15sp1             3  8190     6     -b----     184.6
> # xl mem-max 3 10000
> # xenstore-write /local/domain/3/memory/static-max 10240000
> # xl mem-set 3 10000
> # xl list
> Name                ID   Mem VCPUs      State   Time(s)
> Domain-0             0  2634     8     r-----    1018.5
> Xenstore             1    31     1     -b----       1.0
> sle15sp1             3 10000     6     -b----     186.7
>=20
> In the guest I get now:
>=20
> # free
>         total     used     free   shared  buff/cache   available
> Mem: 10031700   110904  9734172     8560      186624     9814344
> Swap: 2097132        0  2097132
>=20
> And after using lots of memory via a ramdisk:
>=20
> # free
>         total     used     free   shared  buff/cache   available
> Mem: 10031700   116660  1663840  7181776     8251200     2635372
> Swap: 2097132        0  2097132
>=20
> You can see buff/cache is now larger than the initial total memory
> and free is lower than the added memory amount.

Hmm, I have a different behavior:

I'm starting with 800M

# uname -a
Linux personal 5.16.15-1.37.fc32.qubes.x86_64 #1 SMP PREEMPT Tue Mar 22 12:=
59:53 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
# free -m
              total        used        free      shared  buff/cache   avail=
able
Mem:            740         209         278           2         252        =
 415
Swap:          1023           0        1023

Then raising to ~2GB:

[root@dom0 ~]# xl list
Name                                        ID   Mem VCPUs	State	Time(s)
Domain-0                                     0  4082     6     r-----  1842=
71.3
(...)
personal                                    21   800     2     -b----      =
 4.8
[root@dom0 ~]# xl mem-max personal 2048
[root@dom0 ~]# xenstore-write /local/domain/$(xl domid personal)/memory/sta=
tic-max $((2048*1024))
[root@dom0 ~]# xl mem-set personal 2000
[root@dom0 ~]# xenstore-ls -fp /local/domain/$(xl domid personal)/memory
/local/domain/21/memory/static-max =3D "2097152"   (n0,r21)
/local/domain/21/memory/target =3D "2048001"   (n0,r21)
/local/domain/21/memory/videoram =3D "-1"   (n0,r21)

And then observe inside domU:
[root@personal ~]# free -m
              total        used        free      shared  buff/cache   avail=
able
Mem:           1940         235        1452           2         252        =
1585
Swap:          1023           0        1023

So far so good. But when trying to actually use it, it doesn't work:

[root@personal ~]# free -m
              total        used        free      shared  buff/cache   avail=
able
Mem:           1940         196        1240         454         503        =
1206
Swap:          1023         472         551

As you can see, all the new memory is still in "free", and swap is used
instead.


There is also /proc/meminfo (state before filling ramdisk), if that
would give some hints:
[root@personal ~]# cat /proc/meminfo
MemTotal:        1986800 kB
MemFree:         1487116 kB
MemAvailable:    1624060 kB
Buffers:           26236 kB
Cached:           207268 kB
SwapCached:            0 kB
Active:            74828 kB
Inactive:         258724 kB
Active(anon):       1008 kB
Inactive(anon):   101668 kB
Active(file):      73820 kB
Inactive(file):   157056 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:       1048572 kB
SwapFree:        1048572 kB
Dirty:               216 kB
Writeback:             0 kB
AnonPages:        100184 kB
Mapped:           117472 kB
Shmem:              2628 kB
KReclaimable:      24960 kB
Slab:              52136 kB
SReclaimable:      24960 kB
SUnreclaim:        27176 kB
KernelStack:        3120 kB
PageTables:         4364 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     2041972 kB
Committed_AS:     825816 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       10064 kB
VmallocChunk:          0 kB
Percpu:             1240 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:       79872 kB
DirectMap2M:     1132544 kB
DirectMap1G:     1048576 kB


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xoimVyVpapmBJn8n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJFmBkACgkQ24/THMrX
1yy4ZwgAiGCNQ7Q/hgojJHDYdzKarL5fGqdWsyi/Lo7HwGwxvzvoPs7h2ldxDB76
U6khXW26c3qw+3llChb68FtaQTsa48X7XU7f1V0SiiOJ+SuBed3EdbbzBo17dIlB
FXVH9aO8SXEJ6BeqaSiovd91fdV79gDAyKjmMzR0L9NLG7fzPUC32ImSHO2LT6fr
xK2kBUD+6GpjWko16A+LuPklhAt4CYlEAsbYhYMhV4J/3yvXgMcS+ZRef5Mwnqy9
PQZTYWRWUVRnkRAxltsEYCta59NXDNfDpYhG98Oqj+2YBbiTASyGTQWB2KZdkhrI
wiLYsb9orAXySLL2u5Wixaloq4gkeQ==
=O9jI
-----END PGP SIGNATURE-----

--xoimVyVpapmBJn8n--

