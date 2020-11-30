Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF772C8EB5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41416.74554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpT9-0003JQ-8N; Mon, 30 Nov 2020 20:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41416.74554; Mon, 30 Nov 2020 20:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpT9-0003J1-4q; Mon, 30 Nov 2020 20:08:19 +0000
Received: by outflank-mailman (input) for mailman id 41416;
 Mon, 30 Nov 2020 20:08:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjpT7-0003Iw-J3
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:08:17 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 352803f8-c8ed-4a55-8ce2-00e9c94fe34a;
 Mon, 30 Nov 2020 20:08:15 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUK5hBN025753; Mon, 30 Nov 2020 20:08:11 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com with ESMTP id 353dv2wugf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:08:11 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3136.eurprd03.prod.outlook.com (2603:10a6:802:2f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 20:08:08 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:08:08 +0000
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
X-Inumbo-ID: 352803f8-c8ed-4a55-8ce2-00e9c94fe34a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLU7Su1zCuE8M4O30Zrosnf96727mBEcXxTL6R2P9r45NUeTiY4Q+6BK0r6WNa2yyFZd7oj7HkkckpsyzxyBaCMGFiKMWqUqTN8ckdCAtD2PKqMzaYj1IHL7j7rmz0vMo3aCb3v2Ou/jr/vsgzGX/sKWrxsXV13hhGuRMgWy/LgCuZHzajWCEARjMOkbjD+nZbl8xsPjgCGqecxIPefI9VMmw9CLgqP8azLvs0smlPacUi8B31ZuOwcVgnjyn2cx4BkhofTGw0GZD1QAgZOGy6kip7HKuPZjyxYZ34R0Rcw4wVHWwUAAhRkaLxThBCdQytp4kNHdPwgv2QS0tYdFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GpJLuMk490sLpHVQEx7ReDP4GVxwBBTJSCre2mVUfA=;
 b=XoPmi1bMozCrkxn1PCrW75NbUOtnwm0RBa9Lmz2fLCD2kUJcqXs/v3Metd62CGY/dZW1El+foObKJjQzBqgugiUGeUna6yM9nIT/6vBS3pELQrt5GEUh/OXLQG1RFa6DpDyUAFqdb7xDxsx8P0RBJTYsKjPyGS7V9QbhqIeE0zeQO9pBiksGDzrKeWc9FBCaph5mecZZ1najBt1FzWxr6Gz3WAj7hLG+mfrq8LSSrI6OSDCtfERO+WMG1ysqaViyX3WOX6z1Ltf4K831NvBnJ0+dBtJPc9LIcl5yQaq/qtgc1cWbNkpO45L1tpXHtTTJjy93FoVFObLubTcgSonIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GpJLuMk490sLpHVQEx7ReDP4GVxwBBTJSCre2mVUfA=;
 b=FUOLYKdQYQPERVaAh+0mLQBGiapQn6ZLrLxta3WPpQj9q0k3h1cHoFvyV311s6ZXs0EcDVny2LSIhtvkObf8/yjauJkPVgawDl292MCr81JOViOzKxVT0t035K33nFa2lh740/LU5e0C/r4/O5f0mDurdiAwMJiYKSjfj4Kqt0KYyXIGlW7bm51viKncK/arGurTncQBtN7Ehq56tFoviyJArHv2pA9U+JYhDFOM4ZBAcbI6R2WgZCDS2cfwL9QFOFr2FLok3a2Y1DBkQKQWUs03OfPVUeW2xvr8w2pejkz3QI6b46A3vYsSh1zb3mCnI4wI28gUX9SgZIx5PjcxDA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/7] xen/arm: Add arm64 ID registers definitions
Thread-Topic: [PATCH v2 2/7] xen/arm: Add arm64 ID registers definitions
Thread-Index: AQHWxyRQqQqjgsMJ50ujNTmlFMWEoKnhGsCA
Date: Mon, 30 Nov 2020 20:08:08 +0000
Message-ID: <87zh2y7gm0.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <83f4e52dce23d2e83f6118e5ecb3cef22112f9e9.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <83f4e52dce23d2e83f6118e5ecb3cef22112f9e9.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fe48c91-9908-4db0-c829-08d8956ba814
x-ms-traffictypediagnostic: VI1PR03MB3136:
x-microsoft-antispam-prvs: 
 <VI1PR03MB313630C2435BDA809D0F9243E6F50@VI1PR03MB3136.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eEDUAilF5iflN9T08h8XSXOxe/oZoz/74sWAGdcHeLAHVVHBxcPX4Pnv6gsTChs4SBA/Ghc6Z4YAuxIeIv415Ja+9GGwKIgWae8yyIIW9svzz1NPlOStPNK1dt6y6E5LffVyLWff0eoIf8UaOFng6xDSoqbuzqrv9NIlrdlvV6Yzun1gZOKuWA9p20pclDUPztBUVifSgXhMemdvDBt6v4BKsVQlQo6if18eMS4NfzVmQRv+8oyXRK3OnOn/cy1PM9nXRQFztDsN4dL6JmlUrMP/VRqB3qaUEGbKEFFMo2yb4/Bmun/R+7Erk/9GXMmhf2UMlpDGeYTkE/1ixC4tDQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(66476007)(6512007)(86362001)(6916009)(8676002)(8936002)(91956017)(66446008)(478600001)(76116006)(2906002)(66946007)(6486002)(55236004)(5660300002)(26005)(2616005)(186003)(64756008)(71200400001)(54906003)(316002)(36756003)(4326008)(66556008)(83380400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?UsqJJMS80FSN9JgifhSLtjJAmGT26SKyOm3zLTHVB6IUBDcaLniGflLua/?=
 =?iso-8859-1?Q?4jmVWpabQZ0zKoUzLi4GsWonSViWyo/qsMkuQDvWKb3Ar0oRxu1pkiX6Qc?=
 =?iso-8859-1?Q?oYvgY6lnyvl57iRtglHjnQc1pkoxQq4sW2dRiTiLlKbdrsGjRp9ch1ghtq?=
 =?iso-8859-1?Q?7N/neoqtBlxGLpo+OQXuMBmFg8WOQyqB8CggnJfwAn0qc8f06QeiL9AwUY?=
 =?iso-8859-1?Q?dRTyK4L2v0RnfFfKa2wFemJ4TTs4T3N2JHte9ZVl87Ejz7u6opoBSVJmCz?=
 =?iso-8859-1?Q?kEUmZs2rKflhMJqey1zfWR4DhUAG1WLpv5/FIPaGFXX/Jgzh9Yc1XqXA6z?=
 =?iso-8859-1?Q?S0fX+ck4vwjoFu1TsO2klVFgOmf244FsLW5KgUxe9jKUlCWtFYiGGYtOxI?=
 =?iso-8859-1?Q?Wp7yicMRES1ekfEmoeD/ZWcOiY6Sj3+8XsIYjhzcQKgX5ncyG80RH8qeKw?=
 =?iso-8859-1?Q?pQ/F5n92YgyapryyxgKSr/8S+uQ/SnoPu2XZ8QZwwe7jS2ZgGBGmKysOvv?=
 =?iso-8859-1?Q?O5Zug/0VQoRUtS+GBw0G+bpo9fB4HH+cTO1gWWJLJ8QGSh1TyRIzpcJXgW?=
 =?iso-8859-1?Q?2O3rIXMNldZtNmJJLU8jr9Uo+BUv4/gR1DwIaitHckl8pyRiKxwFRBi2bP?=
 =?iso-8859-1?Q?5xlw9kvTr5GRATCHs4dyNq+9ysgtcOkrFljs+KLpwEY7AxrXFIu3Xw/lM7?=
 =?iso-8859-1?Q?zsqrWMenyTJJbdVHs6gnrJQ1jHh6o4qd7BQJ69P8VawlXKor9mlLoyNvn6?=
 =?iso-8859-1?Q?WCsP8YYPyEtPWDcSH+Ph6JSra/KduDHbrpqiyI/kRNO3IvBrlr1nfAOmJp?=
 =?iso-8859-1?Q?wrMG7ZeCuJ4/GkPv89nOlDdxm95COFz7kAxU4Pp3Go7uWA5KgocTPHtGBy?=
 =?iso-8859-1?Q?OYWZqUZ0b2TmzxZIVIFvzY0OZb2Bmd4lTTSPC61r3mElv1fksD49vf2u3q?=
 =?iso-8859-1?Q?kDyQ0dGjocbi85GlXSUAVkc1TyX5ne+MmAlU345Skyv5J5QoSY9tuRZT/H?=
 =?iso-8859-1?Q?IUOxpbb6YR6rnZGMfkBmY1ZKhpEOTtyFr6mV7R?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe48c91-9908-4db0-c829-08d8956ba814
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:08:08.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4WTwxoKbTMhTADbAt9KYt+LQuB+iPYYQpA4Utc+5YhFNEZWOOqmYo1uOqEyK+R5HWxK57X2TOmXe6BWxBXJ5RXYAuyUbx6jMffpxGJionM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3136
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_08:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 mlxlogscore=584 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300129


Bertrand Marquis writes:

> Add coprocessor registers definitions for all ID registers trapped
> through the TID3 bit of HSR.
> Those are the one that will be emulated in Xen to only publish to guests
> the features that are supported by Xen and that are accessible to
> guests.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in V2: rebase
> ---
>  xen/include/asm-arm/arm64/hsr.h | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/asm-arm/arm64/=
hsr.h
> index ca931dd2fe..e691d41c17 100644
> --- a/xen/include/asm-arm/arm64/hsr.h
> +++ b/xen/include/asm-arm/arm64/hsr.h
> @@ -110,6 +110,43 @@
>  #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
>  #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
> =20
> +/* Those registers are used when HCR_EL2.TID3 is set */
> +#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
> +#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
> +#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
> +#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
> +#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
> +#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
> +#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
> +#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
> +#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
> +#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
> +#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
> +#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
> +#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
> +#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
> +#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
> +#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
> +#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
> +#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
> +#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
> +#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
> +#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
> +#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
> +
> +#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
> +#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
> +#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
> +#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
> +#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
> +#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
> +#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
> +#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
> +#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
> +#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
> +#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
> +#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
> +
>  #endif /* __ASM_ARM_ARM64_HSR_H */
> =20
>  /*


--=20
Volodymyr Babchuk at EPAM=

