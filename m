Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9D49D5217
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 18:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841651.1257142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEBGk-0001At-JJ; Thu, 21 Nov 2024 17:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841651.1257142; Thu, 21 Nov 2024 17:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEBGk-00018m-FU; Thu, 21 Nov 2024 17:47:06 +0000
Received: by outflank-mailman (input) for mailman id 841651;
 Thu, 21 Nov 2024 17:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPai=SQ=bounce.vates.tech=bounce-md_30504962.673f7213.v1-a95a4a8b39304e3ba3aaa3fbb27082e6@srs-se1.protection.inumbo.net>)
 id 1tEBGj-00018g-Lf
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 17:47:05 +0000
Received: from mail134-5.atl141.mandrillapp.com
 (mail134-5.atl141.mandrillapp.com [198.2.134.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c65c7d7-a830-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 18:47:01 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4XvQfC5rvVzG0CBVQ
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 17:46:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a95a4a8b39304e3ba3aaa3fbb27082e6; Thu, 21 Nov 2024 17:46:59 +0000
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
X-Inumbo-ID: 9c65c7d7-a830-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNC41IiwiaGVsbyI6Im1haWwxMzQtNS5hdGwxNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjljNjVjN2Q3LWE4MzAtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjExMjIxLjc2ODA3NSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2Y3MjEzLnYxLWE5NWE0YThiMzkzMDRlM2JhM2FhYTNmYmIyNzA4MmU2QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732211219; x=1732471719;
	bh=4HrLBiDweoVZkUTDxCbNJhCB9u/XYHeFmjaL4uZGXqA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LdSa6SJ4CQl/Hz5XbX23TlR6nUR2Wjdya/+n1WXDUkixV/Z/EtYKGpC1FI9o6krjc
	 B/XgLzXVurZOdnDm57C0gFfvcwk70trtRde/myO1aLAUulnVKFeQo1PrRcZWkyu1O9
	 pb4x1xCyY92BPNi8jLKD5Dwq6JjMdepDput3OE7plCfO+lIdVyPB3CaA8wvXcWdR2O
	 g4xTzNLUci6sCJsCm7wFduozu4NQ4kMPyuF/OJK0huK3BdOF6axxzfIFecxeTpqThg
	 h3Qk5J6xPWtpjr2Ljs0EdX4NcHGsUhF9rfKNJ8QQlKHMlpeWV0/IA6Bs1EkL4FmkBy
	 tArTvW8TwTWPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732211219; x=1732471719; i=anthony.perard@vates.tech;
	bh=4HrLBiDweoVZkUTDxCbNJhCB9u/XYHeFmjaL4uZGXqA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RDsQ6p8GUBNCl/FUI70wia0sj2YzdzX0EP96lw4/qjMaoYEwIGGAPYGMIg1d3PSuX
	 MpXLU78TH4GF69HXnvojNOW/MhjEfL2HpkYpJaPtP2OyzVGoAJsHyMQbfZ994m5S5b
	 EVbz0+KZni3aFwod+Cv6RJwMOPxkbJyGVBjEA0bNgFMVoY3NO6FIBbOI9vTczVKidG
	 jTm/s1HiZBtRjfZeFScjhXT5yQC1gnykloPklqis2aP9lwvIEzWBtECejhRglNumGQ
	 ObJygLbbiMAOLx2xvI7IWrtPMjUCiWenaiNF0fRUCSPHfJwQT111WKAhteSW4UxvZM
	 N5YlS5jgiS8+A==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2000/25]=20Introduce=20xenbindgen=20to=20autogen=20hypercall=20structs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732211218271
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Christian Lindig" <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Samuel Thibault" <samuel.thibault@ens-lyon.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Tim Deegan" <tim@xen.org>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Teddy Astie" <teddy.astie@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
Message-Id: <Zz9yEUj1_t1SSKE_@l14>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a95a4a8b39304e3ba3aaa3fbb27082e6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241121:md
Date: Thu, 21 Nov 2024 17:46:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Alejandro,

Nice work :-).

On Fri, Nov 15, 2024 at 11:51:29AM +0000, Alejandro Vallejo wrote:
> This series is the result of my "Interfacing Rust with Xen" talk in Xen Summit.
> It adds a hypercall ABI IDL parser and generator to the xen tree, replaces a
> couple of existing hypercalls, creates a Rust crate with autogenerated contents
> an creates a CI job to ensure nothing goes out of sync.
>
> The changes are fairly invasive because the various autogenerated items appear
> in many places (specially the domaincreate flags). However, the changes to the
> hypervisor are all mechanical and not functional (not intentionally so, at
> least).

I tried to build QEMU with this series applied, and the build failed. In
this case nothing important, the "autogen" directory just need to be
installed. But I fear the changes introduce to the API (like change
of case for the flags) will also be done to other API that project
outside of the xen repo use, and thus introduce unneeded breakage.
Should the changes also introduce a compatibility with the previous API?

> I've split the generator in reasonably small pieces, but it's still not a small
> tool. The Rust backend remains monolithic in a single patch until the RFC goes
> further. It mirrors the C backend for the most part.
> 
> The hypercall ABI is specified in a schema of TOML. Most of it should be fairly
> obvious as to what it does and means, with the possible exception of the "typ"
> field. That has the look of a dictionary because that helps the deserializer to
> automatically resolve the typ to a convenient Rust enum type (Typ). In time,
> that will become something nicer to write, but that's fairly far in my list of
> priorities at the moment.

Instead of creating your own IDL specification, did you look for
existing project that would do just that? That is been able to describe
the existing ABI in IDL and use an existing project to generate C and
Rust headers.

I kind of look into this, but there's quite a few project to explore and
I didn't really spend enough time. Also, there's probably quite a lot
that are for client-server interfaces rather than syscall/hypercalls, or
they impose a data format.


Next, on the file format choice, is TOML the best for describing an ABI,
or would other existing file format make it a bit easier to read, like
JSON or YAML? (I quite like using YAML so I have a bias toward it :-),
and that's the format used for the CI). I don't think it mater much for
Serde which file format is used.

> After the series sysctl::readconsole and domctl::createdomain are autogenerated
> from their formalized forms. In the course of formalizing the ABI it became
> apparent readconsole has a different ABI in 32 and 64 bits. While benign in
> that particular case, it's yet one more reason to formalize the ABI in a
> language agnostic way and have it machine-checked.
> 
> ======== The Plan ===========
> 
> So, the idea of the series is to adjust 2 meaningful hypercalls to TOML-based
> specifications (sysctl::readconsole and domctl::createdomain). The series is
> organised in the following chunks of work
> 
>   1. Sanitise domctl::createdomain to remove packed subfields.
>   2. Introduce xenbindgen (IDL parser and generator for C).
>   3. Specify hypercalls in TOML, and replace the hand-crafted public bits.
>   4. Introduce Rust generator for xenbindgen.
>   5. Introduce a xen-sys crate, with the autogenerated Rust constructs.
>   6. Introduce CI checks for Rust linters, ABI validation and autogenerated
>      file consistency.
> 
> Future work involves migrating more hypercalls, in the same way patch 12 does.
> Most hypercalls should not take the amount of churn createdomain did. With the
> foundations laid down the involved work should be simple.
> 
> I have considered integrating the hypercall generation in the build process.
> That forces the Rust toolchain to be in the list of build dependencies for
> downstreams, which might be complicated or annoying. For the time being, I
> think checking in the autogenerated files and confirming in CI that they are
> in-sync is (imo) more than enough.

Having the generated header files been committed sound like a good idea
for now. For better or for worth we've got a few of those already, so
it isn't a first.

But the way the different pieces are spread out in the repository in
this patch series will make it difficult for future contributor to update
the hypercall ABI. They'll be meet with an "autogenerated file, don't
modify" with little clue as to how actually regenerate them. For that I
think it would be better to have the IDL description (TOML files) in
that "xen/public/include" directory or at the very least in "xen/".
Second, with "xenbindgen" been in in "tools/", this introduce a soft
dependency of "xen" on "tools", which should be avoided even if the
build system of "xen/" doesn't call into xenbindgen today. So I think it
would be better to have xenbindgen either live in "xen/" or in a
different directory at the root of the repo. There's already Kconfig in
"xen/" so xenbindgen isn't going to be the first parser/generator in
"xen/" directory.

> ======== Patch grouping ===========
> 
> Patches 1 and 2 remove packed subfields to allow encoding it in the TOML specs
> (e.g: see patch 13, replace hand-crafted altp2m_mode). It's non-functional
> changes aiming to reach simpler representability.
> 
>   Patch 1.  xen/domctl: Refine grant_opts into max_grant_version
>   Patch 2.  xen/domctl: Replace altp2m_opts with altp2m_mode
> 
> Patches 3 to 10 are xenbindgen (with the C generator backend only). The
> Cargo.lock file in patch 4 is required for build reproducibility and is
> recommended to have checked in the repo.
> 
>   Patch 3.  tools/xenbindgen: Introduce a Xen hypercall IDL generator
>   Patch 4.  tools/xenbindgen: Add a TOML spec reader
>   Patch 5.  tools/xenbindgen: Add basic plumbing for the C backend
>   Patch 6.  tools/xenbindgen: Add xenbindgen's Cargo.lock file
>   Patch 7.  tools/xenbindgen: Add support for structs in TOML specs
>   Patch 8.  tools/xenbindgen: Add support for enums in TOML specs
>   Patch 9.  tools/xenbindgen: Add support for bitmaps in TOML specs
>   Patch 10. tools/xenbindgen: Add support for includes in the TOML specs
> 
> Patch 11 goes a step beyond and validates the ABI has no implicit padding and
> that all names are unique. In the future, when we define rules for stable ABIs,
> all of those can be checked here, at generation time.
> 
>   Patch 11. tools/xenbindgen: Validate ABI rules at generation time
> 
> Patches 12 to 19 replace current items in the C headers with autogenerated
> versions. They should all be mechanical translations.
> 
>   Patch 12. xen: Replace sysctl/readconsole with autogenerated version
>   Patch 13. xen: Replace hand-crafted altp2m_mode descriptions with
>             autogenerated ones
>   Patch 14. xen: Replace common bitmaps in domctl.createdomain with
>             autogenerated versions
>   Patch 15. xen/arm: Replace hand-crafted xen_arch_domainconfig with
>             autogenerated one

I feel like you write "hand-crafted" in those patch description as if it
is a bad thing. Yet, you replace the hand-crafted C headers by
hand-crafted IDL. I think a better title could be "Translate
xen_arch_domainconfig into IDL" to avoid what I feel like is a
pejorative term.

Also, would it be possible to separate changes to the existing API from
the patch that introduce the newly generated headers? I think it would
be much easier to review that the generated headers don't introduce
any changes over the current one.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

