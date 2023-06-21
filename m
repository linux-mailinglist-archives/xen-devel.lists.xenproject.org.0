Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54987384BB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552711.862991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxj3-0003QK-Vu; Wed, 21 Jun 2023 13:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552711.862991; Wed, 21 Jun 2023 13:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxj3-0003Ij-NR; Wed, 21 Jun 2023 13:18:21 +0000
Received: by outflank-mailman (input) for mailman id 552711;
 Wed, 21 Jun 2023 13:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pkmq=CJ=samsung.com=j.granados@srs-se1.protection.inumbo.net>)
 id 1qBxXY-0008E5-0h
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:06:28 +0000
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1abc50-1034-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 15:06:22 +0200 (CEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230621130618euoutp029064a17d1e909129860c2967cf88b763~qrmmZm0i81313413134euoutp02z;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230621130618eucas1p26bebad0290381b6c6cb4bc9b27d122f5~qrml9OciK0200302003eucas1p2H;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.F5.42423.AC5F2946; Wed, 21
 Jun 2023 14:06:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230621130617eucas1p2d418f189352fca58d3547c0b3c4e2078~qrmlH_Wmx0598905989eucas1p2M;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230621130617eusmtrp1deec7a7753b1b8a355f9dfe83f8704bb~qrmlF-M1k0740407404eusmtrp1I;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F1.B8.14344.9C5F2946; Wed, 21
 Jun 2023 14:06:17 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230621130616eusmtip17e21dd5f7eca1289642f50e5db94443d~qrmkf0BdK0234302343eusmtip1d;
 Wed, 21 Jun 2023 13:06:16 +0000 (GMT)
Received: from localhost (106.210.248.248) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Jun 2023 14:06:15 +0100
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
X-Inumbo-ID: 6b1abc50-1034-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230621130618euoutp029064a17d1e909129860c2967cf88b763~qrmmZm0i81313413134euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1687352779;
	bh=tF4riIzozstFHcZHBtz5SQAzztgzSEi85C6+BMxI57A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KizIn4h/+VubKpimOPqcdjHWTOSNrdxhq52NIdlcN6uvcXLAB6nFiyBh7t4SmSiCP
	 td604+vg7J45oRN7XVDY0MruktIM6Tfp+rbOoX3PpG3N0t8hckrvJWga2W8NV3jyeY
	 H1l5Lg0B87tZSR6VD/1dW5vkoQMqYyIu+p+NXDVs=
X-AuditID: cbfec7f2-a3bff7000002a5b7-83-6492f5ca7091
Date: Wed, 21 Jun 2023 15:06:14 +0200
From: Joel Granados <j.granados@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <mcgrof@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
	Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Andy Lutomirski
	<luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Russ
	Weight <russell.h.weight@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Corey
	Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "K. Y. Srinivasan"
	<kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
	<wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Song Liu <song@kernel.org>, Robin Holt
	<robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, David Ahern
	<dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sudip Mukherjee
	<sudipm.mukherjee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Doug Gilbert <dgilbert@interlog.com>, Jiri
	Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Benjamin
	LaHaise <bcrl@kvack.org>, David Howells <dhowells@redhat.com>, Jan Harkes
	<jaharkes@cs.cmu.edu>, <coda@cs.cmu.edu>, Trond Myklebust
	<trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
	Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Jan Kara
	<jack@suse.cz>, Anton Altaparmakov <anton@tuxera.com>, Mark Fasheh
	<mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
	<joseph.qi@linux.alibaba.com>, Kees Cook <keescook@chromium.org>, Iurii
	Zaikin <yzaikin@google.com>, Eric Biggers <ebiggers@kernel.org>, "Darrick J.
 Wong" <djwong@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
	Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Balbir
	Singh <bsingharora@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
	<anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, John
	Stultz <jstultz@google.com>, Steven Rostedt <rostedt@goodmis.org>, Andrew
	Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, Pablo
	Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
	Aleksandrov <razor@blackwall.org>, Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Steffen Klassert
	<steffen.klassert@secunet.com>, Matthieu Baerts
	<matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Simon
	Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>, Remi
	Denis-Courmont <courmisch@gmail.com>, Santosh Shilimkar
	<santosh.shilimkar@oracle.com>, Marc Dionne <marc.dionne@auristor.com>, Neil
	Horman <nhorman@tuxdriver.com>, Marcelo Ricardo Leitner
	<marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Karsten Graul
	<kgraul@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>, Jan Karcher
	<jaka@linux.ibm.com>, Jon Maloy <jmaloy@redhat.com>, Ying Xue
	<ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>, John Johansen
	<john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
	Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jarkko
	Sakkinen <jarkko@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Mike Travis
	<mike.travis@hpe.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Amir Goldstein <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>,
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau
	<martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, John Ogness
	<john.ogness@linutronix.de>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel
	Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider
	<vschneid@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Will Drewry
	<wad@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Miaohe Lin
	<linmiaohe@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-hyperv@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<linux-raid@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-aio@kvack.org>,
	<linux-cachefs@redhat.com>, <codalist@telemann.coda.cs.cmu.edu>,
	<linux-mm@kvack.org>, <linux-nfs@vger.kernel.org>,
	<linux-ntfs-dev@lists.sourceforge.net>, <ocfs2-devel@oss.oracle.com>,
	<fsverity@lists.linux.dev>, <linux-xfs@vger.kernel.org>,
	<bpf@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-hams@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
	<bridge@lists.linux-foundation.org>, <dccp@vger.kernel.org>,
	<linux-wpan@vger.kernel.org>, <mptcp@lists.linux.dev>,
	<lvs-devel@vger.kernel.org>, <rds-devel@oss.oracle.com>,
	<linux-afs@lists.infradead.org>, <linux-sctp@vger.kernel.org>,
	<tipc-discussion@lists.sourceforge.net>, <linux-x25@vger.kernel.org>,
	<apparmor@lists.ubuntu.com>, <linux-security-module@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 09/11] sysctl: Remove the end element in sysctl table
 arrays
Message-ID: <20230621130614.s36w4u7dzmb5d5p3@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="avrt2cz7yepdubk6"
Content-Disposition: inline
In-Reply-To: <87o7l92hg8.fsf@intel.com>
X-Originating-IP: [106.210.248.248]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0wUVxTGc2dmZxYsmxGJXhFCimJbQeqjjUeRpk20mTaNscRgrIl1A6No
	EcyutEhr5CmUgsjykkfl6WJ57ALlvUArwsqCtSKUAorAgkEEedWlvLcLg61J/7n5ne+c797v
	/HHFpGWq2Fp8xucCL/ORetvT5lS5dvb+9maDwnNH8721UNwyTEOauoCGsCojBUHaDBEsKrQM
	vJx9xEDkUikFA4v1NDwc+IOGpOEgCsaVUQgeK4YYMPYMEZDT1E+ARjVGwGJVOAnG8lgSsjOn
	SXhWFI6gLrTEdFwvpGEseJ6CtkEJqKrDCCisWSDhe72RhvGQExCSraaho4KDkRt5CELKDAgS
	izdAu3KChqzOcgLSunbBrDKPAd39aQp6DXoKVOpsAoIrbxHQEJ9Cwk/KGQZ6YhIoSI4MMQVq
	MRBQ9jiYhqG6aAIelF8VwWB+GQPxczdJuNa8E0oGOkQwmdPMQO+TWQJqanWUKUIPAQmxplfD
	I9IQPM0YEcGvtekIqhcqGahPqEUw//eSCPTqceJDT653dJHiCm4UIK6to5Xk5ucUiOvWG0gu
	NbCV4gxd9wlubnYb97TVjYsNGWO42ukMiqtK6WG4jBI/rkNzjFuoL2a46uog5vDuL8z3e/Le
	Z77mZe9+cNLcK1V9hTzfZO+vbdMQgajYJhKZiTH7Hp54qqQjkbnYkr2FsC6rkBGKlwjfDu4j
	heIvhOeNV9ErS7E+VyQ0chHuL60j/p1qnKlZtZQhrG+JW7FQrAOeiUkQLTPNOuHfRx+Ty2zF
	bseFnYMrV5Hsw704vKRhxbCOdcOhWRHMMluwe/DNqWAk8FqsSx6klplk/bGq/zfTjNjEm3Du
	knhZNmPfwlVDi5QQdTP+sy6bFvgSbi7tXkmK2a43cGSlYrVxAOeP9TMCr8PP75ausg1uiYui
	BEMcwr8sTTBCkY+wMshACFMuOLR9cNXxEW7KaqSXE2FWgjtfrBWCSrCiPIkUZAscccVSmN6K
	85+MUtfQ5pTXVkt5bbWU/1YTZCecoZmi/yc7YmXmCCmwK1apxqkMxOShDbyf/NxpXr7Th//G
	WS49J/fzOe3s4XuuBJn+bMvS3alK9OPzSed6RIhRPdpiMuuL8h8ga8rH14e3t7KwLVF4Wlp4
	Si8G8DLfL2V+3ry8Hm0SU/YbLBxddR6W7GnpBf4rnj/Py151CbGZdSCxw6M6nzLqTk5PFfzw
	IMH9M8O3Cwed1vnGi467N2okI0XGGLuRng4uxx/bWe7f6uwq6hq2s753OX14fVFc8ttdz/eE
	3kk9dej8M2NH3O0+Zbrv2aiKg1WxbvtkDVYvjnd/jEivn4ef6V2MeTh6fVSQZ6V3MrYlT7RP
	v5hs2Gsd/WhNaOGmpLzuT6aptGtndUfVcv/rY66Sd2IcuS1RsjDpkUvvBzSWLiR4gLo97fLG
	xIu5FVoXDWnm0Lxxt5Z0P6vplBxQJUmcv0uttg090hW5L/7zOw44Zs2puU/DKgIiWrcePmbN
	28xrsvrueEV5SMqOpu/KfHPqUKlrk3a4KjHcrq3XnpJ7SXduI2Vy6T9p9zyTLgUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTfUxTZxTG9957e1s0aAcS7hB16eZgqIWilYMB5zI0Fzc30bklbgKd3KEb
	tKQFMnGaIjC1+AF1KgNC/CoIlEJZqzL8CkIpgwEq8m02oA75GBWhOMTCbm2WmeyfN7/3Oed5
	ct43OTzc7SrXi7dXmsjIpZI4ATmPaJytf7iqwaaOCRjt5YO+cYgEc8cFDPLLtSTUKIOgVVeK
	4NlMHg7Vj3sIyKiaI6Cq0sCBVNM5DtjVJi5MTvdwQTVrIODJoQwctIZUDAbsNSRMVMyyR209
	CSN3niIwa9m+ewMPSDg7lEpA/lATF6yFxxD0qge5MPdwEINL5j4MprSdGFTrxjCwVx3GYaJv
	kANzV7JxuHh+CofHFYcR5LekE2DvyCThZnolgps5ZSSMHZoh4FGWEYf7lgXQZrOSoPslA2Ot
	6Vwou/4Ch0emfi4c7Z8j4cpx9lXWtEhozZ3iQNrFchLar9JQU3+LCyMFJQgyh70hzWhDcEbv
	CXlZP2NgOdnPgbyzaRhoeo5yoK3wCQlF98sRqKez0IY6RN9v+5B+lnGCoH8ftRO0tkDLSu13
	cXrmuRrR3f02nB5rbkB0gXY/nas8TtJ5yrsEfa72I9rW1YzRz6f9aENxF0Zn1g7jW3fsFIbI
	ZUmJzJt7ZIrEUMEXIggUioJBGLgmWChaHbRrXaBY4L8+JIaJ25vMyP3XRwv3nO68jCWYBN91
	T5/nKFG5twq58Cj+GkrfX8RxsBtfg6gJa6hT96b0kw84TnanXrSrSBWax/aMI6qoqRZ3XoyI
	OlGS/7KL4C+n/j55+iWT/JVUy2gv7uBF/FVUWaeF4zDg/OZgKv2vNtJRcOdvo9IvHOE62JUf
	RGmeHkLO1D8QZb3QQjgLr1MNP1leMs5PpjJum1kDj+XFVNEszyG78H2oqkE74Rz1Larj5kXS
	yQeoCfufKAu5576SlPtKUu5/SU7Zj+qcHcL+J6+gCs+P4E4OpXQ6K3EOcUvQIiZJER8brwgU
	KiTxiiRprHC3LL4SsVtzxTRtuIaKh8eFNQjjoRr0NuvsryhtRV6EVCZlBItcl1SqY9xcYyT7
	Uhi5LEqeFMcoapCY/cZs3Mtjt4xdQWlilGhtgFi0Zm1wgDh47WqBp2t4whGJGz9Wksh8yzAJ
	jPxfH8Zz8VJiZ2NX1RkPLqyOXNKOKbsT7kUdOJwaOhM9aXEJ8857tkw8lSneeKbn1MSNhI/D
	l3oOPaxuCesMMPXuPO5htjARme8ZePuCLlvMn260Dezvur1yV6NldPhSdruvWr8dK530/PHX
	z0QnIlWGkXe//+COPmWpz5YNIz7vNH0dqqnWbt6eY/d/v2/plorxH5BdMb+A52lYn+aLfOoC
	Dm5+7vs4hZzu8NKE6D9ZybW+SNXcuEYujvLDVcc8Dp65Zp/8MqkgYr7RNNAcrZPOdhm/Kba8
	tqwvWpAT3lq+YPGKTEtYRFiZ56n8dePLF5Ra3riu3NbB2Vq/adOOhbyJ5N/EOU2f33pQvuWr
	KAGh2CMR+eFyheQfqa/esMoEAAA=
X-CMS-MailID: 20230621130617eucas1p2d418f189352fca58d3547c0b3c4e2078
X-Msg-Generator: CA
X-RootMTR: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
References: <20230621091000.424843-1-j.granados@samsung.com>
	<CGME20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3@eucas1p2.samsung.com>
	<20230621094817.433842-1-j.granados@samsung.com> <87o7l92hg8.fsf@intel.com>

--avrt2cz7yepdubk6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 02:16:55PM +0300, Jani Nikula wrote:
> On Wed, 21 Jun 2023, Joel Granados <j.granados@samsung.com> wrote:
> > Remove the empty end element from all the arrays that are passed to the
> > register sysctl calls. In some files this means reducing the explicit
> > array size by one. Also make sure that we are using the size in
> > ctl_table_header instead of evaluating the .procname element.
>=20
> Where's the harm in removing the end elements driver by driver? This is
> an unwieldy patch to handle.

I totally agree. Its a big one!!! but I'm concerned of breaking bisectibili=
ty:
* I could for example separate all the removes into separate commits and
  then have a final commit that removes the check for the empty element.
  But this will leave the tree in a state where the for loop will have
  undefined behavior when it looks for the empty end element. It might
  or might not work (probably not :) until the final commit where I fix
  that.

* I could also change the logic that looks for the final element,
  commit that first and then remove the empty element one commit per
  driver after that. But then for all the arrays that still have an
  empty element, there would again be undefined behavior as it would
  think that the last element is valid (when it is really the sentinel).

Any ideas on how to get around these?
>=20
> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i9=
15_perf.c
> > index f43950219ffc..e4d7372afb10 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -4884,24 +4884,23 @@ int i915_perf_remove_config_ioctl(struct drm_de=
vice *dev, void *data,
> > =20
> >  static struct ctl_table oa_table[] =3D {
> >  	{
> > -	 .procname =3D "perf_stream_paranoid",
> > -	 .data =3D &i915_perf_stream_paranoid,
> > -	 .maxlen =3D sizeof(i915_perf_stream_paranoid),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D SYSCTL_ONE,
> > -	 },
> > +		.procname =3D "perf_stream_paranoid",
> > +		.data =3D &i915_perf_stream_paranoid,
> > +		.maxlen =3D sizeof(i915_perf_stream_paranoid),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D SYSCTL_ONE,
> > +	},
> >  	{
> > -	 .procname =3D "oa_max_sample_rate",
> > -	 .data =3D &i915_oa_max_sample_rate,
> > -	 .maxlen =3D sizeof(i915_oa_max_sample_rate),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D &oa_sample_rate_hard_limit,
> > -	 },
> > -	{}
> > +		.procname =3D "oa_max_sample_rate",
> > +		.data =3D &i915_oa_max_sample_rate,
> > +		.maxlen =3D sizeof(i915_oa_max_sample_rate),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D &oa_sample_rate_hard_limit,
> > +	}
> >  };
>=20
> The existing indentation is off, but fixing it doesn't really belong in
> this patch.

Agreed. But I actually was trying to fix something that checkpatch
flagged. I'll change these back (which will cause this patch to be
flagged).

An alternative solution would be to fix the indentation as part of the
preparation patches. Tell me what you think.

Thx

>=20
> BR,
> Jani.
>=20
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20

Joel Granados

--avrt2cz7yepdubk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmSS9cQACgkQupfNUreW
QU/tWQv+LHqhRfLnActmTK06NicBnR3PUYRIMank4jSVG6jtvqu/VBMNmvKyRaeA
68kGzzIEbayPbBOL1M2GmrBgIaWp9OIWt4jKQeY4ARm9DcL2FWqUqLufGoPlwjX/
0GFjsIlBykddf6c3149Hf7D2Xz+hZyF8GgqMaIuty4hcNbIoeYs5zmwPaQmn+/q0
eoe07uBOs32ocQPIMJuRPMw6KSxHYOiWbNHxgQlIl7stObKOuvQXO2GLDgqHc13y
NKMTC6XNh4VAc7JHtrsEVEBiVro3IGh7cS5U5DK0jhlSLsRfJUkXmSO4H9EwGLBq
mWAl5Qr+YGnCrfE6jGc7uTM0etzscRGIlKIJ+7qcLgSfVgkqYeb5AmkZ8bvailD8
h66rr3XzwBKiQRaXpk6V7/IliqJcG7+N2yGsGJ3UXpvoF/1ieeb39kcSOFZ75BU5
USV/t5Fj0VqHetwv6dC5A8RLktlHNQZcTAXJkLL0QZ5xrmWC9kiIJ/EzJnCgJlSu
AwkfgT+P
=LLXc
-----END PGP SIGNATURE-----

--avrt2cz7yepdubk6--

