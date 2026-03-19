Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBtoObZSu2lMigIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 02:34:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27C2C483B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 02:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256613.1551147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w32HG-0006UY-Rs; Thu, 19 Mar 2026 01:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256613.1551147; Thu, 19 Mar 2026 01:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w32HG-0006SW-P3; Thu, 19 Mar 2026 01:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1256613;
 Thu, 19 Mar 2026 01:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tHx=BT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1w32HF-0006SQ-Rc
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 01:34:21 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf7cfd79-2333-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 02:34:19 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB9653.eurprd03.prod.outlook.com
 (2603:10a6:102:319::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 01:34:10 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9700.020; Thu, 19 Mar 2026
 01:34:10 +0000
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
X-Inumbo-ID: bf7cfd79-2333-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPGPY30d4Nn6OH9Fw8GpZRku3oUJYUzri4t0uuQ0waSG+Ndi4rfgnritxHouXg70tLxJQfu287yOwUt14Z23KzUPfOpJhq4PKHS4f7V6/VAXOr8M1RiPF8fiXel1NEKwqDc7TotmcGTsBCmSW4Fbx2kScdXuf1UzUU6NekereQqRnxOhJ31ibnw5sE4um8D9eDYoG9uM7Rcdh0dqAlG6Pf95GJeHXpFLGekBPDx1nqeu2+ucminQkumaVUAMDogGRzOpxop+b6YC280oaOxhGCMVpLpBtk7c6j2xEjXtXFzKW+GrKj9NaH17GBLgmyGI/HxeOUGqsRtcXBbtYEiK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gizkw0lbqJIAHyUoQh5IaArorurwfAP1FDIVo3b4zk4=;
 b=lT01Q2DnS7l20tVARdiaqk6NftoHaxEqFuoux7+z8Irmgt8BSrSewJYm5xNUb6xukm8nHlv29FtQnMwxd6sufkkVJc8BVhc6ILCz/i/8/SWXVkCVB00YQAx13dBiQ/hNpbmhklY6X8XeqOU93Ek0UlQf7U1F5deK6q6Mj7Yg8zxPPC/T6YPYXANvUD2fOCsBSu+1MVHPr4mP9Lht5qUXgDeczGg8lOXaZ3bN8yIC5Lk8P74/5cVa7Hcbx49yoeL3p6/UIZ2SqqRII1lB+JbFW62NMSYHngwrO0tHxO4/uYU+1UWj/ijyKzoUuvB7Y4o/2J7RUC9/5gYBRc0Jb5XNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gizkw0lbqJIAHyUoQh5IaArorurwfAP1FDIVo3b4zk4=;
 b=RF8x4abAjOjJnG6RiJoNueLAS0oUWZ0gRf2FwNx2kI4U1njzkcDuWsvBX/IbazDvhgeElp8ycMRIfAsObHHoG7RnwVew7MUlqOBxWGE3StrN0xmxcKicYXK4y2SDL8n3xsFsrq2o4Mrz8D26BCQEbvtiwPmVEJ/obzYSUqt7FcKNTdyGIfaS7nWfBbzKjF1iMlTlF7uNDFCcUxCkvO9Skdkt9Uq+XQRUmOEB4czZMyLPyEb7rAbQy/LyYOQJuzWwP7JKumxUYSIQ8qEHj9j0JjnNPHlTs+wlXotBQTPespMowUuxPWBmbLe112U+0hhgJffAbgyj8j5N2sI0Tl3aWg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHcsgQfYo2+uc7QB0+uZY6Wrq2Bgg==
Date: Thu, 19 Mar 2026 01:34:10 +0000
Message-ID: <877br8k3fy.fsf@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
	<733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To:
 <733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Thu, 12 Mar 2026 09:39:29 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB9653:EE_
x-ms-office365-filtering-correlation-id: 1406c588-dcb5-4e39-cbcd-08de85579eb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 LkfZdqUMcpLogEwovloCKoNV4tucOecH+eqsGanil1ZK7LiUjZWovyiKqDftp9R7xoTCw96yP5KDRdQ9N88LnRTv9Ly+zv3U9zUM1G9gh8nkaS6t5sdfALxRp97UcIIHamph+MT7Yf7xS93VpMhbdHROKX1KhGrXv84bpQHOnGY8rOXzHIJ4MrRNCUMopg2dfn+igz6Z8rfwIi+tKTVQQKpQx2Yjp++VU2qCpXMnkRDD2x06+UMfGpYCnXpdIIjAYkzzeOEI1dFGInKqcDk1rWfbQDzEqf6BctUBSY5mPHQrtj24ruat3NspqnXdDvzQ4L3ki24R3GaLzHoBizafhSjKz1R61O1ChL4nK8n0Qa2nVmvjEL4DjG8DI9i4d7NcRyPtptj/idNjK3Nc5LL6kLAnvHL3LjoJqANGZyftSu0CrySrrupZJy2C/LQw8A9C+3dvxGrZdK+rzRQBmGwwsY67Go/onq4O16K0eDrhB6r06d3EAuea/I6Gdh1x8cLRoD2ukLjM6dVoFWOVhS6LOC2mE4P3/CgR2e7vsyfF/duHnHaZG/N2PGH/JL7/4xxnqCKMfMAeDSvjTWeVxxFWwmtmqbWdUUo8GzLIVKmGvozR5/toqkYtV5TIiQ880MCVgG0vIHG8dAfjlwvg1GsA8EgqgqEmD1nkCPsNDHEds5s33E/1AXOLK9H7dQJT5VpYuORy7sCeSqPBbBpBs1fYtl9b4/+kODMbyJmCddbEqUjT0GwFwtYRG9X3i6mN9/d6W6VOgghbcrHQ6OtH4J0BLQyAecANenI4vHZtO/98QmI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+wISz7eqTRkGWXiM1argZX+7DSPvibH0PX4zVT6ZLMLUjeqNaxGxnsvw3I?=
 =?iso-8859-1?Q?OV5eJeglEmprAxi5abZiXgZwsuEMvKUH+28c9vt/Sw4fFaM68ibiNRQMUE?=
 =?iso-8859-1?Q?V0uwZANrLNVpSIxfjHcy0Hvw9gjjqrTixmRc2FXFPE3o8H8jBe9KSiXG6I?=
 =?iso-8859-1?Q?p1rwdYMJ5QlN/AAK2dnJJazqaZTjtxhgd3RYn/HmupgDnw3W6jih6nGFYW?=
 =?iso-8859-1?Q?24ERcCFZdJBOiNrU3XECLTfd8WCTuem5MNBAPlwKT9NuH7N5oCGUhrwnet?=
 =?iso-8859-1?Q?jJA58e78QnRFOaPKggMC3syB2PqkhRla3UuNenv1u0kyhJVGFVhGFtDd3s?=
 =?iso-8859-1?Q?NNEIvrn5b5nE5/VHndrtw2Z2uCAtJStVrxITiX0pwHZbk+sMxKxhOH3R6X?=
 =?iso-8859-1?Q?yQ085ZF7SVixeTWY45Qv43vzNlQ+S8J88xKfofCiJjJzoOgJYlkfzmYECN?=
 =?iso-8859-1?Q?M66mTHyLFnk9aaXpfvkPy2gN+WAzVz3vfS9Udy4729uLEG79mVAk4hRLKk?=
 =?iso-8859-1?Q?cTIoN4QxG8iklauS2BTyi0rP57Dxr7lr03+wRTSVr//T6SOCw/7lbC+wsa?=
 =?iso-8859-1?Q?LROCElOD7jbtUJpgojx7hzDK9U25XH/1L9jdDB++0ilxlIFlUAxFj6USRP?=
 =?iso-8859-1?Q?EZOxhAElUgkjXjEN/l9L769NV0wHZ4Ldymm+UqdVE7MzZq4xH2nKYOof6p?=
 =?iso-8859-1?Q?Ug+EHB2GuS+7kWCScsGyh/9YUpnBZhXCznkDKlXdNP+EkQABc9R/6BGBHV?=
 =?iso-8859-1?Q?Nc5cfRfGjh1MmZYsDEAeKIPL9WYVBkkJ/jZG3itTWPJDODa9MqXOFDsFnb?=
 =?iso-8859-1?Q?Vg7e1Wm/22yxCaStV9vu30acUGENU55GksPZvgFWZw1+2fNaQCRwfEBbh3?=
 =?iso-8859-1?Q?N+EDJ8xbugKWsLkTT/W5fSnrk8daLTtTxWm+qqOqDjVK8lKqbJ30Mi4iGV?=
 =?iso-8859-1?Q?nwI2HKB+rpDNyfXdlu6XsG+6mj3TDx2Pl6/NcnyFYQpgf4Yb7KmbdVpJXO?=
 =?iso-8859-1?Q?jr5UtzwnmfczeeBljUD/C0ricCUZA7GXeXCb/cxTButuVXHZzGcJP7ROQR?=
 =?iso-8859-1?Q?83ASmSM05E2kBG5zup2667D9rB4tthxNVZ2x4pw6ChZF6p1FaTkfb/uWfK?=
 =?iso-8859-1?Q?0xjcZsQMnDY+4cDJ/JI39KmzH7zwT8Gzg9YReFJ89ODzd4tA/bbp372NTi?=
 =?iso-8859-1?Q?yxOlmY1REsI4pk1HOiNA0ikRjZMfq6MWFK96KHcHm07ocBGznssAtQjZz3?=
 =?iso-8859-1?Q?moM5weRutpNpC1raBtrGdK3EZp947cMtxRPNYtSpihbS8YruMPadoo1T3n?=
 =?iso-8859-1?Q?TpTL7/Y63k04AW7CWxxcIobvu3wNl2fzqmKo3Mc0uasO0taB4VHEAx1NHE?=
 =?iso-8859-1?Q?XcfrOIbWYb6cJpVTCWMfoe7deaaegzgJNPZMmad7l9DOwCf8WWXg2tItQK?=
 =?iso-8859-1?Q?DFk/09VlH9pysG6kHBpPiBqvekUiOy8St1U8kgnDQ/siF/KcN5wgyJgd2i?=
 =?iso-8859-1?Q?C4Inf9jwjgL2iE1xJxxVJOqZ+hGeD2UhGKCvRRQZbhy6+cxCYEukAmJyFz?=
 =?iso-8859-1?Q?8MJpOm9QzJo738T9jykpBfrugTZQiqBZCX76leq2qVCyFqqWErDTQv8Utu?=
 =?iso-8859-1?Q?pq1S94CSXwSdIpgkWaQ6XT+UCt+HNBEyl1WCz0ONR4OG4OfqCa8kwZXo2y?=
 =?iso-8859-1?Q?F+HT4XiO1gGAK5KJuvGLVJYjtLbv9jV5uuyE7ADhXgpWbI+KNI9TkotD5I?=
 =?iso-8859-1?Q?7VCRFmltd3Wg5rkgEDKHB0H14dSp4PH6KqcfHAcOAMMIJFN3pdpYKOgteK?=
 =?iso-8859-1?Q?Aw6ZrSFLUmMmyl3tF5i6ZZvkR+gWBlc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1406c588-dcb5-4e39-cbcd-08de85579eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 01:34:10.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3egVcJS4SuuzRGQNZOunIDC+nyBp/STIVrHDNir3Yo/78h/Y9Dhm7lVRuGAlmXxyNiZSLLLUMJkVEKYqGtx64z3MB/0pauFzpa5e5AA6fcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9653
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3D27C2C483B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykyta,

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

> Currently on Arm the desc->affinity mask of an irq is never updated,
> which makes it hard to know the actual affinity of an interrupt.

With this change you'll track affinity of hardware interrupts, but pure
virtual interrupts still will not be tracked. Is it intended behaviour?
I believe it should be mentioned in the commit message.

>
> Fix this by updating the field in irq_set_affinity.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>
> ---
> v5->v6:
> * add missing locking around irq_set_affinity calls
>
> v4->v5:
> * add locking
>
> v3->v4:
> * patch introduced
> ---
>  xen/arch/arm/gic-vgic.c          |  2 ++
>  xen/arch/arm/irq.c               |  9 +++++++--
>  xen/arch/arm/vgic.c              | 14 ++++++++++++--
>  xen/arch/arm/vgic/vgic-mmio-v2.c | 11 +++++------
>  xen/arch/arm/vgic/vgic.c         | 15 ++++++++-------
>  5 files changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index ea48c5375a..5253caf002 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
>              if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>              {
>                  struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
> +                spin_lock(&p->desc->lock);
>                  irq_set_affinity(p->desc, cpumask_of(v_target->processor=
));
> +                spin_unlock(&p->desc->lock);
>                  clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
>              }
>          }
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..7204bc2b68 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct =
irq_desc *desc)
>      return irq_get_guest_info(desc)->d;
>  }
> =20
> +/* Must be called with desc->lock held */
>  void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>  {
> -    if ( desc !=3D NULL )
> -        desc->handler->set_affinity(desc, mask);
> +    if ( desc =3D=3D NULL )
> +        return;
> +
> +    ASSERT(spin_is_locked(&desc->lock));
> +    cpumask_copy(desc->affinity, mask);
> +    desc->handler->set_affinity(desc, mask);
>  }
> =20
>  int request_irq(unsigned int irq, unsigned int irqflags,
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 6647071ad4..c59f6873db 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
> =20
>      if ( list_empty(&p->inflight) )
>      {
> +        spin_lock(&p->desc->lock);
>          irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>          spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>          return true;
>      }
> @@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
>      if ( !list_empty(&p->lr_queue) )
>      {
>          vgic_remove_irq_from_queues(old, p);
> +        spin_lock(&p->desc->lock);
>          irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>          spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>          vgic_inject_irq(new->domain, new, irq, true);
>          return true;
> @@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
>      struct domain *d =3D v->domain;
>      struct pending_irq *p;
>      struct vcpu *v_target;
> +    unsigned long flags;
>      int i;
> =20
>      /*
> @@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
>          p =3D irq_to_pending(v_target, virq);
> =20
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
> +        {
> +            if ( !p->desc )
> +                continue;
> +            spin_lock_irqsave(&p->desc->lock, flags);
>              irq_set_affinity(p->desc, cpu_mask);
> +            spin_unlock_irqrestore(&p->desc->lock, flags);
> +        }
>      }
>  }
> =20
> @@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, uns=
igned int n)
>          spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
>          if ( p->desc !=3D NULL )
>          {
> -            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>              spin_lock_irqsave(&p->desc->lock, flags);
> +            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>              /*
>               * The irq cannot be a PPI, we only support delivery of SPIs
>               * to guests.
> @@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v,=
 unsigned int rank, uint32_
>   * indent-tabs-mode: nil
>   * End:
>   */
> -
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mm=
io-v2.c
> index b7c2d7ce99..fc04741ca1 100644
> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> @@ -159,24 +159,23 @@ static void vgic_mmio_write_target(struct vcpu *vcp=
u,
>      for ( i =3D 0; i < len; i++ )
>      {
>          struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid =
+ i);
> +        struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
> =20
> -        spin_lock_irqsave(&irq->irq_lock, flags);
> +        spin_lock_irqsave(&desc->lock, flags);
> +        spin_lock(&irq->irq_lock);
> =20
>          irq->targets =3D (val >> (i * 8)) & cpu_mask;
>          if ( irq->targets )
>          {
>              irq->target_vcpu =3D vcpu->domain->vcpu[ffs(irq->targets) - =
1];
>              if ( irq->hw )
> -            {
> -                struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
> -
>                  irq_set_affinity(desc, cpumask_of(irq->target_vcpu->proc=
essor));
> -            }
>          }
>          else
>              irq->target_vcpu =3D NULL;
> =20
> -        spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        spin_unlock(&irq->irq_lock);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>          vgic_put_irq(vcpu->domain, irq);
>      }
>  }
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index b2c0e1873a..81ba4099ef 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -812,21 +812,22 @@ void arch_move_irqs(struct vcpu *v)
>      {
>          struct vgic_irq *irq =3D vgic_get_irq(d, NULL, i + VGIC_NR_PRIVA=
TE_IRQS);
>          unsigned long flags;
> +        irq_desc_t *desc;
> =20
>          if ( !irq )
>              continue;
> =20
> -        spin_lock_irqsave(&irq->irq_lock, flags);
> +        desc =3D irq_to_desc(irq->hwintid);
> =20
> -        /* Only hardware mapped vIRQs that are targeting this vCPU. */
> -        if ( irq->hw && irq->target_vcpu =3D=3D v)
> -        {
> -            irq_desc_t *desc =3D irq_to_desc(irq->hwintid);
> +        spin_lock_irqsave(&desc->lock, flags);
> +        spin_lock(&irq->irq_lock);
> =20
> +        /* Only hardware mapped vIRQs that are targeting this vCPU. */
> +        if ( irq->hw && irq->target_vcpu =3D=3D v )
>              irq_set_affinity(desc, cpumask_of(v->processor));
> -        }
> =20
> -        spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        spin_unlock(&irq->irq_lock);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>          vgic_put_irq(d, irq);
>      }
>  }

--=20
WBR, Volodymyr=

