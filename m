Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44269B1C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 21:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn6Aq-00010E-Bt; Mon, 15 Jul 2019 18:58:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kIu=VM=amazon.com=prvs=0922a7db1=foersleo@srs-us1.protection.inumbo.net>)
 id 1hn6Ao-000109-JV
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 18:58:06 +0000
X-Inumbo-ID: 798af344-a732-11e9-8980-bc764e045a96
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 798af344-a732-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1563217084; x=1594753084;
 h=from:to:subject:date:message-id:mime-version;
 bh=k/flfjG0FayrtPYbhQBVcb6nP0rthih0ik5ZM+T07V8=;
 b=cgx8+wDKzrY0Ez822BosFguQX1qMs3tb/8rwA7R0A1z5A2UXEyKL+lym
 1/qGuXFx0T2mq4hvWlZ2VoKeIeikoHQXDc6rnssRVmJQR84t6GIxZbHYr
 8yrDZ20m6LPQQk371FXRuIbNzgwhAOSs+HN0qnGocVH9kY4lUnd5Q+TYx c=;
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.62,493,1554768000"; 
 d="asc'?scan'208";a="816329311"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 15 Jul 2019 18:58:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 19A1EA1E6A
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 18:58:02 +0000 (UTC)
Received: from EX13D17EUC004.ant.amazon.com (10.43.164.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 15 Jul 2019 18:58:01 +0000
Received: from EX13D17EUC001.ant.amazon.com (10.43.164.233) by
 EX13D17EUC004.ant.amazon.com (10.43.164.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 15 Jul 2019 18:58:00 +0000
Received: from EX13D17EUC001.ant.amazon.com ([10.43.164.233]) by
 EX13D17EUC001.ant.amazon.com ([10.43.164.233]) with mapi id 15.00.1367.000;
 Mon, 15 Jul 2019 18:57:59 +0000
From: "Foerster, Leonard" <foersleo@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhiw==
Date: Mon, 15 Jul 2019 18:57:59 +0000
Message-ID: <1563217075.6815.14.camel@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.236]
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] Design session report: Live-Updating Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0914059614764590351=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0914059614764590351==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-h0++1JnVSmJ+emITSOmh"

--=-h0++1JnVSmJ+emITSOmh
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Here is the summary/notes from the Xen Live-Update Design session last week=
.
I tried to tie together the different topics we talked about into some sect=
ions.

https://cryptpad.fr/pad/#/2/pad/edit/fCwXg1GmSXXG8bc4ridHAsnR/

--
Leonard

LIVE UPDATING XEN - DESING SESSION

Brief project overview:
	-> We want to build Xen Live-update
	-> early prototyping phase
	IDEA: change running hypervisor to new one without guest disruptions
	-> Reasons:
		* Security - we might need an updated versions for vulnerability mitigati=
on
		* Development cycle acceleration - fast switch to hypervisor during devel=
opment
		* Maintainability - reduce version diversity in the fleet
	-> We are currently eyeing a combination of guest transparent live migrati=
on
		and kexec into a new xen build
	-> For more details: https://xensummit19.sched.com/event/PFVQ/live-updatin=
g-xen-amit-shah-david-woodhouse-amazon

Terminology:
	Running Xen -> The xen running on the host before update (Source)
	Target Xen -> The xen we are updating *to*

Design discussions:

Live-update ties into multiple other projects currently done in the Xen-pro=
ject:

	* Secret free Xen: reduce the footprint of guest relevant data in Xen
		-> less state we might have to handle in the live update case
	* dom0less: bootstrap domains without the involvement of dom0
		-> this might come in handy to at least setup and continue dom0 on target=
 xen
		-> If we have this this might also enable us to de-serialize the state fo=
r
			other guest-domains in xen and not have to wait for dom0 to do this

We want to just keep domain and hardware state
	-> Xen is supposedly completely to be exchanged
	-> We have to keep around the IOMMU page tables and do not touch them
		-> this might also come in handy for some newer UEFI boot related issues?
		-> We might have to go and re-inject certain interrupts
	-> do we need to dis-aggregate xenheap and domheap here?
		-> We are currently trying to avoid this

A key cornerstone for Live-update is guest transparent live migration
	-> This means we are using a well defined ABI for saving/restoring domain =
state
		-> We do only rely on domain state and no internal xen state
	-> The idea is to migrate the guest not from one machine to another (in sp=
ace)
		but on the same machine from one hypervisor to another (in time)
	-> In addition we want to keep as much as possible in memory unchanged and=
 feed
		this back to the target domain in order to save time
	-> This means we will need additional info on those memory areas and have =
to
		be super careful not to stomp over them while starting the target xen
	-> for live migration: domid is a problem in this case
		-> randomize and pray does not work on smaller fleets
		-> this is not a problem for live-update
		-> BUT: as a community we shoudl make this restriction go away

Exchanging the Hypervisor using kexec
	-> We have patches on upstream kexec-tools merged that enable multiboot2 f=
or Xen
	-> We can now load the target xen binary to the crashdump region to not st=
omp
		over any valuable date we might need later
	-> But using the crashdump region for this has drawbacks when it comes to =
debugging
		and we might want to think about this later
		-> What happens when live-update goes wrong?
		-> Option: Increase Crashdump region size and partition it or have a sepa=
rate
			reserved live-update region to load the target xen into=A0
		-> Separate region or partitioned region is not a priority for V1 but sho=
uld
			be on the road map for future versions

Who serializes and deserializes domain state?
	-> dom0: This should work fine, but who does this for dom0 itself?
	-> Xen: This will need some more work, but might covered mostly by the dom=
0less effort on the arm side
		-> this will need some work for x86, but Stefano does not consider this a=
 lot of work
	-> This would mean: serialize domain state into multiboot module and set d=
omains
		up after kexecing xen in the dom0less manner
		-> make multiboot module general enough so we can tag it as boot/resume/c=
reate/etc.
			-> this will also enable us to do per-guest feature enablement
			-> finer granular than specifying on cmdline
			-> cmdline stuff is mostly broken, needs to be fixed for nested either w=
ay
			-> domain create flags is a mess

Live update instead of crashdump?
	-> Can we use such capabilities to recover from a crash be "restarting" xe=
n on a crash?
		-> live updating into (the same) xen on crash
	-> crashing is a good mechanism because it happens if something is really =
broken and
		most likely not recoverable
	-> Live update should be a conscious process and not something you do as r=
eaction to a crash
		-> something is really broken if we crash
		-> we should not proactively restart xen on crash
			-> we might run into crash loops
	-> maybe this can be done in the future, but it is not changing anything f=
or the design
		-> if anybody wants to wire this up once live update is there, that shoul=
d not be too hard
		-> then you want to think about: scattering the domains to multiple other=
 hosts to not keep
			them on broken machines

We should use this opportunity to clean up certain parts of the code base:
	-> interface for domain information is a mess
		-> HVM and PV have some shared data but completely different ways of acce=
ssing it

Volume of patches:
	-> Live update: still developing, we do not know yet
	-> guest transparent live migration:
		-> We have roughly 100 patches over time
		-> we believe most of this has just to be cleaned up/squashed and
			will land us at a reasonable much lower number
		-> this also needs 2-3 dom0 kernel patches

Summary of action items:
	-> coordinate with dom0less effort on what we can use and contribute there
	-> fix the domid clash problem
	-> Decision on usage of crash kernel area
	-> fix live migration patch set to include yet unsupported backends
		-> clean up the patch set
		-> upstream it

Longer term vision:

* Have a tiny hypervisor between Guest and Xen that handles the common case=
s
	-> this enables (almost) zero downtime for the guest
	-> the tiny hypervisor will maintain the guest while the underlying xen is=
 kexecing into new build

* Somebody someday will want to get rid of the long tail of old xen version=
s in a fleet
	-> live patch old running versions with live update capability?
	-> crashdumping into a new hypervisor?
		-> "crazy idea" but this will likely come up at some point
--=-h0++1JnVSmJ+emITSOmh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJdLMyzAAoJEAKptHJhFcQmLSMQAIe0B5pLu+C23ex0df+pjEwP
bQ+QTTq4/3LLM+Pb9cspPYzgIVmptp/mpKP95rGaqxM8NsSzx6T6efGhGDaxjrd8
A0YwX8CctnCzlynAoLy8ldC7gUo839zZuAf7vr/gawScyGN9+DIzFwNpSOXru6mz
prX2AlYH4Nx0xWH0iIVH7iBjeGrbJ9NMlXeMQc2vuI8k9oMveEz92yJeZVmwsWOH
I272WKb9t/ATY86AEwvxA4HBmioDejdZNd9Ff7t+DkdKAOGXatJF19ARdCCStqCY
Q1Intjejkeg4sbJDI8JrIQ2N+iqEQ+mGOwK6VDcIe5Ro79EoDYZsT4sur7LfC+Xz
XI2z++wIbkGNukUUGTrgBplcpjsEwovuDF4ktxIp/UOAcPIVTpiElXu75y4cLQFP
p1m6sIZBCickqathtw2PpEat8bY5fG/+3B5VNIk/CzdUMxfMGmJfabGm+e1S9GuT
lDEoXF4NjdwuK/okDeCDmaZRlGuD4Kf+AewarrP1mwLltxtr6yo75IVY+wjdqZUr
1+eTdolmgDtI+frG0m+147wc5BWSrfMD0OcJZRKj48PSUoPKdb7FzM8sx8c7KXXf
ysyK/XWL2hCFfrjQvJmxuL4eu6yfFwL9jwsQzIbh1OWo5RJuZKq2LjqLaPXn3za3
vRyc6yBnQVdq2lM9V8po
=Uh6I
-----END PGP SIGNATURE-----

--=-h0++1JnVSmJ+emITSOmh--


--===============0914059614764590351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0914059614764590351==--

