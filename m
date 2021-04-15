Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B535FEBE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 02:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110864.211817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWpdu-0007yB-RW; Thu, 15 Apr 2021 00:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110864.211817; Thu, 15 Apr 2021 00:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWpdu-0007xm-Ny; Thu, 15 Apr 2021 00:13:58 +0000
Received: by outflank-mailman (input) for mailman id 110864;
 Thu, 15 Apr 2021 00:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wfo=JM=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWpds-0007xh-C3
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 00:13:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8be4a69a-a7d0-4898-8068-3a3ac8b4b033;
 Thu, 15 Apr 2021 00:13:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5001AE04;
 Thu, 15 Apr 2021 00:13:53 +0000 (UTC)
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
X-Inumbo-ID: 8be4a69a-a7d0-4898-8068-3a3ac8b4b033
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618445633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0T+v6zL6GfHaLMvhXPI6g3D1DcmeL+8iTKHc7zBAv4=;
	b=iMxp4QmmGUM4z1OoLri/WglYFabgdfxgioiakrx2M/0rdCb5Mo3wGvGBhkunyzebdZgNPB
	XfOK4xlQOLNpZkHxBM4XiMIxYd1/XhK//r8n2Qgt6rbQsHK51HvCNrv4HTNBgO2NPEo7uR
	uJ63a/QzBkRVN6g4MHe4LPW6zvEBn/k=
Message-ID: <697db332afe1a229102ebc814139d90cda543446.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Steven Rostedt
	 <rostedt@goodmis.org>, Giuseppe Eletto <giuseppe.eletto@edu.unito.it>
Cc: linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Enrico Bini <enrico.bini@unito.it>
Date: Thu, 15 Apr 2021 02:13:52 +0200
In-Reply-To: <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <20210413114614.4971caff@gandalf.local.home>
	 <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3iO7aY7vV/PXkZmNNrYm"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-3iO7aY7vV/PXkZmNNrYm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 11:07 +0100, Andrew Cooper wrote:
> On 13/04/2021 16:46, Steven Rostedt wrote:
> In a Xen system, dom0 is just a VM, and particularly on larger servers,
> may not be as many vcpus as the system has logical threads.
>=20
> This causes major problems for `perf` support under Xen, which assumes
> that the kernel's idea of CPUs matches that of the system.
>=20
Yeah, but we wouldn't need anything like that, in this case.

> When rendering a trace including Xen data, Xen can provide the real
> system CPUs, and dom0 wants to be rendered as a VM under Xen, similar
> to
> trace-Fedora21 in your screenshot above.=C2=A0 (Obviously, if you're doin=
g
> nested virt, things need to start nesting.)
>=20
Exactly!

So, basically, events captured with trace-cmd on Dom0 will end up in a,
say, trace-dom0.dat file. It will contain ftrace event records, each
one with a timestamp and the ID of the CPU where it occurred. Of
course, in this case, that ID would be the ID of one of the Dom0 vCPUs
(seen from inside Dom0 itself).

And the same for all the trace files collected inside any other guest.

In KVM, vCPUs are Linux task. In fact, in Steve's screenshot [1], you
can see a task called 'CPU 0/KVM', with PID 2356. Note, however, that
with the KVM-Combo view active, there's a special 'CPU 0/KVM-2356' plot
in the graph. That shows _when_ that particular task, which is vCPU 0
of the KVM VM, runs. It's special because it has a 'CPU 0' plot "glued"
to it. In that plot we see the tasks (and the events) that were running
inside the VM, on vCPU 0.

[1] http://rostedt.org/private/kernelshark-kvm.png

So, if task A run from time t1 to time t2 on vCPU 0 of the Fedora21 KVM
guest, which in turn was running on physical CPU 3, we will see a non-
white (magenta, in the screenshot) box between t1 and t2 in the 'CPU
0/KVM-2356'. And we will see a non-white box on the 'CPU 0' plot which
is "glued" to 'CPU 0/KVM-2356' (it will be of whatever color KS decides
decide to use for task A, say, blue).

If at time t2 task B starts to run on vCPU 0 of Fedora21, and runs
until t3, we'll still see the magenta box on the 'CPU 0/KVM-2356',
between t2 and t3, while on the 'CPU 0' plot glued to it, we'll see a
box of whatever color is chosen for B (say, yellow).

Note that you don't see, from just this plots, _where_ task 2356 is
running, as in on which physical CPU. That will be visible in the CPU
plots, which do not appear in Steve's screenshot. Basically, if 2356
(i.e., the task corresponding to vCPU 0 of the Fedora21 VM) was running
on physical CPU 3 between t1 and t3, we'll see a magenta box, between
t1 and t3, on the plot called 'CPU 3 (and this is a "single plot",
i.e., one that does not have any other plot "glued" to it, e.g., like
the ones that are visible in Giuseppe's screenshot).

In the case of Xen, it's not that different. vCPUs are modeled and
considered by the plugin as if they where Linux tasks. In fact, you see
in Giuseppe's screenshot [2] that the 'Task' column contains strings
such as "d0/v5" or "idle/v4".

[2]
https://raw.githubusercontent.com/giuseppe998e/kernelshark-xentrace-plugin/=
master/.github/img/ks-xentrace.png

We needed to come up with a PID, as KS not only wants to print it in
the relevant column, but it uses it for associating colors to tasks
(i.e., colors to vCPUs, in our case). Currently, the value stored in
that PID field is computed as a combination of domain ID and vCPU ID.

If d0v5 runs on CPU 6 from t1 to t3, we'll see a, let's say, green box
between t1 and t3 on the CPU plot CPU 6. And this is something that
Giuseppe's plugin can already tell (show! :-D) us.

If task A runs on vCPU 5 of Dom0 from t1 to t2 and that task B runs
there from t2 to t3 there will be events about that in our
trace-dom0.dat file (collected via trace-cmd), and the CPU-ID of these
events will be 5.

A "Xen-Combo" plugin will have to have a way to know that events from
the trace-dom0.dat file which have a CPU-IDs equal to 5 should be
matched with task 'd0/v5' from the trace.xen file (collected via
xentrace).

It will therefore draw, in addition to the CPU plots that are already
there in the current version of the plugin (what plots one wants to
visualize is configurable, BTW) some special plots, one for each vCPU
running on the system, including the ones of dom0 (or, at least, one
for each vCPUs of each domain for which we have a trace file).

Among these special plots, there will be a 'd0/v5' plot which will have
a green box between t1 and t3. And "glued" on top of it, there will be
a 'CPU 5' plot which will have, say, a blue box between t1 and t2 and a
yellow box between t2 and t3.

As for the KVM case, the CPU plots will tell you on what physical CPU
d0v5 runs. While the special 'CPU 5' plot that is "glued" to the
'd0/v5' one will tell you what tasks run on vCPU 5 of Dom0, at any
given point in time.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-3iO7aY7vV/PXkZmNNrYm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3hUAACgkQFkJ4iaW4
c+7SkA/9HYRblHFkv8mNdeY+Y6xmNYvgNgGyKZog4mklvUA+eHKz16TF1phxAgai
hLiQlvJvXO6QMqssbE12jd57Hklp2qO3OnJSueFlMc0KUjiqupzWkccMzWp9pX3k
hgFuAtPhlZSy4RK14cdwfzUJyloaVh+C0sJh1mCVBwBa8veGv3zx+MsRDoMq9T1K
OKouHcMnz3Af/uOVhumnLjeKDupxdPRV6JIWX1MEBPMVouUPHXzPpuGw9D1qT9Wv
DiEsKV8IkNhTPveSa1tiMWFbAwjBYIFFhOPXZyARphXMTR1iSBLZpqq432nuBFDt
cSm3MG2MUbX+B+wq608/apbZTCZtEwN8Z26/yN31n+mSME5dk7aV5VqUoXkdwtpJ
f5dnhJybIzGYf5VgYSggNPV6L3m+3OFsv2fiq/74xQP75AVdopTNKYTOu20cGEfc
IJXki4s5AI67TFIgYuAjurk5zLaRKohhj89ndp5tyPNEQj6k5qAaLZu75xlyPFbq
V+6IVhKdmS6XGNhSty2NCNQoIOGtIOF5zjAn3ygSTHYfXdMnQj6sk8R54VT+Tn5Z
sV1nEGruY4RaWYT83RXOBfWMNX1HchqMUwlFCP6tdYNer7LrxAdMAmaeVbaoQwQ+
f1GFvYiF7Nsl6vn2IavyVhuo6Xqwf5A9vEq1Teq6wJw+Uq6EC/0=
=OL5f
-----END PGP SIGNATURE-----

--=-3iO7aY7vV/PXkZmNNrYm--


