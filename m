Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43270B587BC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 00:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124452.1466792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyHuC-0005sU-R5; Mon, 15 Sep 2025 22:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124452.1466792; Mon, 15 Sep 2025 22:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyHuC-0005r4-Ns; Mon, 15 Sep 2025 22:42:40 +0000
Received: by outflank-mailman (input) for mailman id 1124452;
 Mon, 15 Sep 2025 22:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aw70=32=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1uyHuB-0005qy-9r
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 22:42:39 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 451bb509-9285-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 00:42:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 58FMgVw6018413; Mon, 15 Sep 2025 15:42:31 -0700
Received: from XCH16-05-04.nos.boeing.com (xch16-05-04.nos.boeing.com
 [137.137.111.25])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 58FMgSR6018389
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Sep 2025 15:42:28 -0700
Received: from XCH16-05-01.nos.boeing.com (137.137.111.22) by
 XCH16-05-04.nos.boeing.com (137.137.111.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Mon, 15 Sep 2025 15:42:27 -0700
Received: from XCH19-EDGE-Q01.nos.boeing.com (130.76.23.13) by
 XCH16-05-01.nos.boeing.com (137.137.111.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 15:42:27 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by boeing.com (130.76.23.13) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Mon, 15 Sep
 2025 15:42:14 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by PH1P110MB1131.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 22:42:13 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%7]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 22:42:13 +0000
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
X-Inumbo-ID: 451bb509-9285-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1757976152;
	bh=tIRoOIbJ52kYhtN19KU7Tov6Yt6nzIwL/SSo+i8lIeI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Tv49FfgQtK+25fXjys4lDoXowvqG7Cy7jHa4GGJoK2GjBvJH7hUITR/h8i8BWcwdl
	 HHvCkCUkN3FEH4ZMmgjg/hoOsxQy3qRLN2PYJugmE3+FGK2cUIUUXfzHcZSExtguaI
	 kSiEUDJDyCNtP5XLM06rIdwbyT5eaGFH/ECAcFZhfvoR18+aDkEDm039sGL/dD9u+j
	 dzR1efkHup1lZDo3YJgTvCvwHo2dBLBF9GbcnscGBQcgu8TRAI77XE/+PiL+R70M/0
	 9fgzTTM+tjZknaJR5KTuIYvVX5d0oO0wJX5eeA2pGpq3F+/ykadZdNM0//hg4A8x2+
	 Qvg31u+UXGEYg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=swDYddfAj0zC/YJ111gz1Cc+g2CvDmPDp5CIkjUpmZFn1351vadztF8fe2eNGn2kV4p6R4J0KSjmDOLIVK3c34p7hkXXpOwIbsj1K+FRgesIj5m2dJwntNvc9PifGmKR+fNoZD4+W8kLPnjHIdTd6vCB7fxyfLmFYYh87YZm7hC60xb6b+GLWKbr9RvYBakfCo4fT7uVzpxVuNv2qMKEeW9Np4yE+5oOqOvN7qm8RFtDOYhajCWX3cXwseSkhYu2GfqT7KWrOvWlX+4raFfmnKIDJJPB3WfDlN0YYpN76gVWKNBORWDa1rGlXLKAaAtniSXzVTo8t6yideNwvf6vUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIRoOIbJ52kYhtN19KU7Tov6Yt6nzIwL/SSo+i8lIeI=;
 b=dI/XREeDnlnKXqRcRkswxtVYGfGA7tgnzzTaRylQ8XHS0c86VKxhYbA4s8xhnG+niPF1Z7rnBP2OiJbKFWiKmnjy402HpLuj51TpHLkeP8ssYlCiUVdfj4B4axwRZLOtPtakNh6GG7B0iWojh2KrqEv+RwLHeDFrCagiFS8EzGq2BrbHqvxxwNJP0spAb99y3PM6d4aTScD/a6NDv7F4MJPwgZfhImqXQjAxEZ8k1DdCCHrPQDv0mnmZZmu1kj4johGPDoc1xCate6svYwbbyRELuLoPmLrIOQsgbGWJYexDwMWnKbZHWPgR8C1pA30hRTBrPshM9iit/4v/5Vm+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIRoOIbJ52kYhtN19KU7Tov6Yt6nzIwL/SSo+i8lIeI=;
 b=Tgn2DaQuwVaw+RbdzUVqeIXuI177xgLAz+ItO9Z7ie/dWFx+BymdfkLqfRQg9dHKzeZTKGLl31ELf6C78+fXLHhn/5byW8Q0JToqYptpikLvCk36BgmRtvrFJpkK1lkzolW6+uJL4RduWcOlue9LOtU+he+98bA9sKilHeUwWco=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: Saman Dehghan <samaan.dehghan@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
Subject: RE: [EXTERNAL] [llvm coverage] Update LLVM profile raw format from v4
 to v10
Thread-Topic: [EXTERNAL] [llvm coverage] Update LLVM profile raw format from
 v4 to v10
Thread-Index: AQHcJmG2oeeyHeOUtEKLs5eugkA/BLSUy2Pg
Date: Mon, 15 Sep 2025 22:42:13 +0000
Message-ID: <BN0P110MB2067F165EDF1F24B604FDA02F315A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
In-Reply-To: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|PH1P110MB1131:EE_
x-ms-office365-filtering-correlation-id: 467b71f5-5d8e-445c-14fd-08ddf4a91d8d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?NIs0yLZU9jMCIuZaH17b6TR1S9sLGVttFYLaAvNdfB2Jda/XeUfolFxjUq4n?=
 =?us-ascii?Q?P5WzGNPexxrWsvCjFlV/nqIpLDxPVhIi73E8vprw9gwR9nwq5DPpKcCoOcHK?=
 =?us-ascii?Q?HWej75uV7kSuzLUjctt8VeaEPZ3BXCPkfVmztTKc7lvlfLnrrsluZqbBtiUE?=
 =?us-ascii?Q?lavIx2xLCU+8cp4NB9+nImzEMtn9OCIrxC1N+vVzVWKoNJgSq8sY908Lylpu?=
 =?us-ascii?Q?DK252OsspN9DFsNAWknPVNVh/u4RPxoaa9Lm0Zq41uPt2idhQ9xPXdnekCCA?=
 =?us-ascii?Q?Oilm8iRNYHRRO/OC+Ra3/tehzKJhST+FLSFVT5ysXe7qT7C5r1G2T0YssdvF?=
 =?us-ascii?Q?DFSu2utugCLyqVLRYlfJCa3kepqX4BQJx/PzjQjtgNeTzuPogsY7ESY42eH4?=
 =?us-ascii?Q?BjNDlYbPRIihlPXQNxgGWO7tNwfQpkVxwD/2Hk1savglc4ZwkKqLUOKwLn1j?=
 =?us-ascii?Q?+gHwxI+eQuiAc4K/1wnC1JbaudVCzjkWnE2z75v5F5yvI+1VH6S1WEWSu88v?=
 =?us-ascii?Q?ht3Lt+8OK+NVik0yE+n5F+ow7VQw+bwuibcz8Tza24OXR56HGazvJeMEWpN+?=
 =?us-ascii?Q?aQPE+TYTzWAPuIrp6VLjZGtr63Gj6Up5qSD0gsTcJzk4hvYZnHbq3NFtnp3a?=
 =?us-ascii?Q?AGzNy9Ifg59WC86BHiTavo3q/W4VbxNbnUqsJXsYwxePYyQwOr27D0/sJ8lZ?=
 =?us-ascii?Q?jeUjKIub4Jrz40oJnd9WUMpms6Ana2VvQ68+OkLpE7KvkkdzMrMtg7Ey2RpU?=
 =?us-ascii?Q?gRtGmc8tzB0iyc9J+ArYYs+bU8i02UqGFy2wSF7taH0FgmanKG7Kk/SDuZR0?=
 =?us-ascii?Q?SfLwzFADED8QkcA+fqoDE8YgCXx8NvB/Pbf4UEdpxG1TM6s2gq/klHU8JKk+?=
 =?us-ascii?Q?UDA/LdX58zRfKZ7DDkYllmoaP3NpQIIg8IzCLYIDdMhnoP0fvPygyeDMz7hb?=
 =?us-ascii?Q?628lGUWEoDfQx5/4WQ9dmo4QhhADH0bEYPeVHTrlrKlaZmKq0E2MVLcbsNq8?=
 =?us-ascii?Q?UoUw7KzQDYGKxkQAvKYasucANwVi/s2hJFS6XWQl/bW/UtxDcHrFaLUaCl8C?=
 =?us-ascii?Q?/EBejmTovUfaCNoxeTiJlKK9FyrxS/U22LFy1Ow0fbhMgM3yZdY+SGGCYeEo?=
 =?us-ascii?Q?VfBV9cHjjLk353fxwCIsp8y64WSGsl0cOdONE83zNNY8IbKwW5vQh2tDu36j?=
 =?us-ascii?Q?2waja0+cR4mL/9JX5X7q+oONBKV2WSVIu/mfC2/OcNuyORyMMHBTH9KMiLHJ?=
 =?us-ascii?Q?y8jwmTJGCeLJOhrhvO4Qm8rXnoMrPN6P7tTwjG6llxJes1Zv6QKiBIHQZHHO?=
 =?us-ascii?Q?9VgaPjyq6w1ONVwfr3Cw9w/ThzjzWHD/+2Wm/FHQt2wcxGM5wILj2Q6Eu6v/?=
 =?us-ascii?Q?i49RQo0uwlRZtJcvZ4HlhixLZmFCghh0fRAGap43xc0JQUYWNYG+k5LBoB8A?=
 =?us-ascii?Q?EfPo/cR9so1wUfvjQNx4znyPIp82CezzGQbfbuYIyZ2UsfJ78oXecbiY5gEJ?=
 =?us-ascii?Q?hHcxjezYl0lqFsw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X0eYIvB+j/HMIA8szWK9TRDFOlebmyr87DHCxibk1UjkvErdwwS8OFDlMDrK?=
 =?us-ascii?Q?w7eaOnIGhkHLu0mMA/sz8EL7YdxdHWYkHQ/XQrbml3GdX/pV7pk+aG/IP7Hv?=
 =?us-ascii?Q?w0Y3UhQjJUtfMdSN67vZ4v8GIgzE48pbfwMZKuJJhAN/4XVUp9UCUkEU46Ry?=
 =?us-ascii?Q?rN8CL8npkuRsh1dP0Ts1q7rHfzmjhjZxDDyzS3hb4zDFT8o225445nX/DPxb?=
 =?us-ascii?Q?kJY25AuBq0ku/Kq8yiGnVenYiC2U5IDW5JUxBFrvVhkrzkumrOOZ3MAoWqY4?=
 =?us-ascii?Q?DAWl8GthgeDl9A2didktHp4kccR7zKRG1lLIIgNtqrTf5cMHszI9ftTwR8CM?=
 =?us-ascii?Q?ViBxJ1Z7W1juhtHgqz+7XivzQ9oOKf2PN/kpAcmABEKVvtf8U2AB8mXLmzlm?=
 =?us-ascii?Q?SxSHvumzedOJBvlWHwV14q59Pam1feXrgFOlX+n0orN7A9rDZ50pshSyYScU?=
 =?us-ascii?Q?kMOTPrEdgg/HkMUOAVBrASpvFPo3y9CuTvr2lteQ/k1GpA8zpXtC6mRwydmX?=
 =?us-ascii?Q?Bl4Dipk2GF8jQD9RoSnNq0E2d35wj4ia2xiHRfD07/EVjo89hnesk0S2SMGm?=
 =?us-ascii?Q?UKO42t8Q9pQJ5OOtOCtVQ4d73qbqD13S3R1MaTI9tIH6PoDW0oD3aNGZYHBr?=
 =?us-ascii?Q?PKRjeGwuBFywAQoeVNV+L/ufsfC6TSA53pn/BNAcvP5NKQDMY+BGeG5mQQ2P?=
 =?us-ascii?Q?skO3gxQQQYJiWekTZn7WQJ0VzpfrBQClAiJYWldc8KqL6Jvb+lPIgy0qixZ5?=
 =?us-ascii?Q?LZ2VrvGhJdmDBB3cd9SUDSrIBjmr7c99WVR5dDzlAMFgK3j8brqdNXjn2F5Y?=
 =?us-ascii?Q?gdQrdKPFewavvbQ0r+glHRnZYNDM4cO8zBYQgAA9vHZI9mqmtcOJLXSNFLTi?=
 =?us-ascii?Q?pfx6RCK/ckDRA6o/g76fMgZC0VrwAEtVuaTjefDV+nOMsQqnB9QwOuej6btd?=
 =?us-ascii?Q?FOvu9jq1MoA8HC4uDGiQhR/3Fou8uP2X99OA/OSIlx4AaUm3NWHwiPbFxPAE?=
 =?us-ascii?Q?DVlvuOW6Ll6MKYc6flZNf6kU+kgEBmVno1GpMmyBRNyfbC2iVNgyfVzjdRP7?=
 =?us-ascii?Q?UA31TK1D+YpG8TvNquO6JgjDgqztmtUs2OGmFcVvzknr+IIdzl1ACcfXiQ2X?=
 =?us-ascii?Q?Q6wDs3MEM4PC54BKhqVG1H644/IkLVKRCTr13FRd1uIEi6nijlzFXRp4TUU4?=
 =?us-ascii?Q?pQSLYaVcCEvn2dLJ/rcjCqEr+9xSAFTnBRZt/hMvx7v+b9nHrv0IPR/9a6rO?=
 =?us-ascii?Q?TmM6n2JpQYegKvQgCEUJ0/V1eT9eDBghCVxXXWVQf6xsP7/a3m7WaFQ2SLNq?=
 =?us-ascii?Q?ygPu35LLPCequdRkfaaN9ZaeR/D2rtqmqcqzaVOz6fiq8pwRndBm3O4oyiGV?=
 =?us-ascii?Q?KFJq3roqOTH28pFZmfUt2ryt8jtEOGgzpnqI6bNycOipzgMtHTqEhiD6Rfcd?=
 =?us-ascii?Q?lJo1TPZYjB9rH4xbQRQvKoUGk/E87Sj+Jdv82L9RjYSh+3TMSt3hYByQNKg+?=
 =?us-ascii?Q?t6YdFkAj53mYOcB2sAGuiAHbWYEq7Z4GK7Kv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 467b71f5-5d8e-445c-14fd-08ddf4a91d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 22:42:13.8546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1131
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Saman,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Sam=
an Dehghan
> Sent: Monday, September 15, 2025 9:56 AM
> To: xen-devel@lists.xenproject.org
> Cc: Saman Dehghan <samaan.dehghan@gmail.com>; Jan Beulich <jbeulich@suse.=
com>
> Subject: [EXTERNAL] [llvm coverage] Update LLVM profile raw format from v=
4 to v10
>=20
> EXT email: be mindful of links/attachments.
>=20
>=20
>=20
> This patch updates the LLVM profile raw format in `xen/common/coverage/ll=
vm.c` from version 4 to version 10, enabling compatibility with LLVM versio=
ns 19 and 20.
> While the patch supports only one version:
> 1. It seems better to support one version than no version --
>    the current profile version 4 is not compatible with
>    LLVM version 11 or later

I'd suggest adding logic to check the LLVM version and conditionally add th=
e struct field(s).  e.g., "__clang__", "__clang_major__" and "__clang_minor=
__".

[snip]

>=20
> Overall, this change would enhance Xen's code coverage analysis capabilit=
ies by leveraging the latest LLVM toolchain improvements, particularly for =
safety-critical hypervisor code.
>=20
> The patch modifies only `xen/common/coverage/llvm.c`, maintaining API com=
patibility while enabling modern toolchain support.
> Testing was performed with LLVM 19 and 20 to confirm functionality.

Please elaborate on your testing.  You could put it under the --- so it's s=
how what you did but not included in the git description when merged.
E.g. what dom0 was used, command sequence, etc.


[snip]

>  struct llvm_profile_header {
>      uint64_t magic;
>      uint64_t version;
> -    uint64_t data_size;
> -    uint64_t counters_size;
> +    uint64_t binary_ids_size;
> +    uint64_t num_data;
> +    uint64_t padding_bytes_before_counters;
> +    uint64_t num_counters;
> +    uint64_t padding_bytes_after_counters;
> +    uint64_t num_bitmap_bytes;   =20

The above line has extra spaces at the end.

> +    uint64_t padding_bytes_after_bitmap_bytes;
>      uint64_t names_size;
>      uint64_t counters_delta;
> +    uint64_t bitmap_delta;
>      uint64_t names_delta;
> +    uint64_t num_vtables;
> +    uint64_t vnames_size;
>      uint64_t value_kind_last;
> };
>

Steps I used to build
- I checked out latest master (656b9ca03b)=20
- Applied this patch
- menuconfig'd to disable livepatch and enable coverage
- make dist-xen clang=3Dy

I got the following.

  CC      common/coverage/llvm.o
common/coverage/llvm.c:120:10: error: field designator 'data_size' does not=
 refer to any field in type 'struct llvm_profile_header'
        .data_size =3D (END_DATA - START_DATA) / sizeof(struct llvm_profile=
_data),
         ^
common/coverage/llvm.c:121:10: error: field designator 'counters_size' does=
 not refer to any field in type 'struct llvm_profile_header'
        .counters_size =3D (END_COUNTERS - START_COUNTERS) / sizeof(uint64_=
t),
         ^

Best Regards,
Matt

