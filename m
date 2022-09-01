Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D45AA3A3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 01:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397032.637473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTtTj-0008D3-6C; Thu, 01 Sep 2022 23:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397032.637473; Thu, 01 Sep 2022 23:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTtTj-0008BU-2f; Thu, 01 Sep 2022 23:20:07 +0000
Received: by outflank-mailman (input) for mailman id 397032;
 Thu, 01 Sep 2022 23:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zb7p=ZE=perches.com=joe@srs-se1.protection.inumbo.net>)
 id 1oTtTh-0007z6-Qh
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 23:20:05 +0000
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b06fa31-2a4c-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 01:20:03 +0200 (CEST)
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id 1E25A1C6992;
 Thu,  1 Sep 2022 23:19:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id A9ECF8000E; 
 Thu,  1 Sep 2022 23:19:36 +0000 (UTC)
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
X-Inumbo-ID: 9b06fa31-2a4c-11ed-82f2-63bd783d45fa
Message-ID: <c3a6e2d86724efd3ac4b94ca1975e23ddb26cc6f.camel@perches.com>
Subject: Re: [RFC PATCH 28/30] Improved symbolic error names
From: Joe Perches <joe@perches.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
 hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
 dave@stgolabs.net,  willy@infradead.org, liam.howlett@oracle.com,
 void@manifault.com,  peterz@infradead.org, juri.lelli@redhat.com,
 ldufour@linux.ibm.com,  peterx@redhat.com, david@redhat.com,
 axboe@kernel.dk, mcgrof@kernel.org,  masahiroy@kernel.org,
 nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com, 
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
 bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
 penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
 glider@google.com,  elver@google.com, dvyukov@google.com,
 shakeelb@google.com,  songmuchun@bytedance.com, arnd@arndb.de,
 jbaron@akamai.com, rientjes@google.com,  minchan@google.com,
 kaleshsingh@google.com, kernel-team@android.com,  linux-mm@kvack.org,
 iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
 io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 01 Sep 2022 16:19:35 -0700
In-Reply-To: <20220830214919.53220-29-surenb@google.com>
References: <20220830214919.53220-1-surenb@google.com>
	 <20220830214919.53220-29-surenb@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: A9ECF8000E
X-Spam-Status: No, score=0.64
X-Stat-Signature: iwqjhu65bfnp7s38he58qcgfcrx3mruu
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18FfjZ7BuRv/DHsUMYX6e6vN/rFvSwIdRQ=
X-HE-Tag: 1662074376-819350

On Tue, 2022-08-30 at 14:49 -0700, Suren Baghdasaryan wrote:
> From: Kent Overstreet <kent.overstreet@linux.dev>
>=20
> This patch adds per-error-site error codes, with error strings that
> include their file and line number.
>=20
> To use, change code that returns an error, e.g.
>     return -ENOMEM;
> to
>     return -ERR(ENOMEM);
>=20
> Then, errname() will return a string that includes the file and line
> number of the ERR() call, for example
>     printk("Got error %s!\n", errname(err));
> will result in
>     Got error ENOMEM at foo.c:1234

Why? Something wrong with just using %pe ?

	printk("Got error %pe at %s:%d!\n", ERR_PTR(err), __FILE__, __LINE__);

Likely __FILE__ and __LINE__ aren't particularly useful.

And using ERR would add rather a lot of bloat as each codetag_error_code
struct would be unique.

+#define ERR(_err)							\
+({									\
+	static struct codetag_error_code				\
+	__used								\
+	__section("error_code_tags")					\
+	__aligned(8) e =3D {						\
+		.str	=3D #_err " at " __FILE__ ":" __stringify(__LINE__),\
+		.err	=3D _err,						\
+	};								\
+									\
+	e.err;								\
+})


