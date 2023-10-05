Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740A7B9CFA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612977.953187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNYj-0007Ay-E9; Thu, 05 Oct 2023 12:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612977.953187; Thu, 05 Oct 2023 12:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNYj-000789-9z; Thu, 05 Oct 2023 12:34:29 +0000
Received: by outflank-mailman (input) for mailman id 612977;
 Thu, 05 Oct 2023 12:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfD8=FT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qoNYi-000783-7o
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:34:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a0cd1e-637b-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 14:34:27 +0200 (CEST)
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by PAVPR08MB9818.eurprd08.prod.outlook.com
 (2603:10a6:102:31e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Thu, 5 Oct
 2023 12:34:19 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::5f) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Thu, 5 Oct 2023 12:34:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Thu, 5 Oct 2023 12:34:18 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Thu, 05 Oct 2023 12:34:18 +0000
Received: from 01a61f9648e4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35A46977-CEA2-45D5-A54A-B08714D37E5C.1; 
 Thu, 05 Oct 2023 12:34:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01a61f9648e4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 12:34:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 5 Oct
 2023 12:34:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 12:34:04 +0000
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
X-Inumbo-ID: 85a0cd1e-637b-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nof8inWieRpZAyEbPoB6s8OOSWDaMBY29C1EDB/U0g=;
 b=QHdquSsnQ2xrcAIGoMTBQz40gqtgEr4KiJp9oKWXYptYllQ/3bLs2cyAnzC6tjzhQgTVKu++pohlybgmLfLDYOfSXHAdHMigwKy7FyEPDVYBQeyImvf6iNrdb5dQc8o0JTMO8UeZVlsB5N4TsLdBV5LMH4nllGkmyHItb+F96NM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 210e09ff11ad8330
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEMCSBAWGnBqXLaKq0h4MK3sItybG9x5El9T7t5lcc3DRGZs5WzqQnepmI1T6yq210xR/x3THHbkgtE5V9U0iel6SXaXuzxttp0FuyEpLxhiIIVD+wZVG14YIHm/SbINc2Y+rV0HK7bzLVs9r5Zq/dljI08Wezt9vVS17I7zRLVFOiN6nCSoRnpFUIwKwxjCrBjfwkkd224gKUjFQm65m0X1zSTq0yGQOsnNlBxwJf1qVJ3/6seAcPyL/Mah3Q229cI6cxdaT2XulxGTjmLVdFZ7+WOK+Qts3HsJMNuV3BkT/S5JrSCsk60mgufAQkHquO6uAXSE4V5YGpZ5OpYQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nof8inWieRpZAyEbPoB6s8OOSWDaMBY29C1EDB/U0g=;
 b=Y5I0CUqdtxi0jFDX1eoap3GoKotf2VHKd7yE+8U5T4wEncRPZ/aYwi+Cx+1Q2POFQ+IJTJbn7niRE1YXY2JCpuEx0HEDvwp4nk1QS6sH/GTl1DMUCee3gZHeK2vgSvuv2p6CODbgAvFOPRBK5o/yZ1aatWnlgzktWKBEzk0dracGq3/ZU6997JOXxxIN/JRavPrQ+U3qvaU5sYx6NXe1ns74ZomRqYO+cG98A+HjcBG6gVIjr5zluvMO9axbraTGdsW6E+2SmmtFPdm+p0c6sbVE+alsPDVSZjKXJSYPPxa2ftPNmEU92aTBHaLTw0kDt4S3Xrhr0XxrKhIyda0FcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nof8inWieRpZAyEbPoB6s8OOSWDaMBY29C1EDB/U0g=;
 b=QHdquSsnQ2xrcAIGoMTBQz40gqtgEr4KiJp9oKWXYptYllQ/3bLs2cyAnzC6tjzhQgTVKu++pohlybgmLfLDYOfSXHAdHMigwKy7FyEPDVYBQeyImvf6iNrdb5dQc8o0JTMO8UeZVlsB5N4TsLdBV5LMH4nllGkmyHItb+F96NM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "andrii.chepurnyi82@gmail.com"
	<andrii.chepurnyi82@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [for-4.18] [PATCH v2] arm/ioreq: guard interaction data on
 read/write operations
Thread-Topic: [for-4.18] [PATCH v2] arm/ioreq: guard interaction data on
 read/write operations
Thread-Index: AQHZ94g6DuMy5FujckaIS3DlGIWhGQ==
Date: Thu, 5 Oct 2023 12:34:04 +0000
Message-ID: <290CBA74-9BB9-450B-A974-3B49B91C6CD2@arm.com>
References: <20231005092141.2540016-1-andrii_chepurnyi@epam.com>
 <c38c503c-1ec8-471c-911f-907e3bfd7c85@xen.org>
In-Reply-To: <c38c503c-1ec8-471c-911f-907e3bfd7c85@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6008:EE_|DBAEUR03FT020:EE_|PAVPR08MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ac0562-8b3c-45d4-e3bb-08dbc59f64e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N3CEF3m3L9vOAqkZ5oQzZSFhhBUnKthGL9cTaAYQrYw2pjkmG8s2a+20j/sGCYL/LDbgiCcR9LM38tv3rpYCUgVfuTrDpQMR8EjFWkrIV1EQ6+xCRFZ215SvbuDQ6KOMFraq32iNXXCjfdapqP5d2TEfZV/k4aRwEqds3P9mfANlobYOd6cZdvHPiPaRFj2GqlzZVeP8SVkWSLhHUp8ZD8olny+FRrd92aCkzBnPNt2gPUeRkC/Nm8s1mkJXsRP3nJCiMR+zjonx6YMMXDxN16SII4h5LTw4kZhy9To+Wik8Ftu7FeuihNEOzLsLricCLNnqENFbIT/hBXEt1hIg/D1v2Uv5HDO8U84iJJJlx/yk7hO/2EgOTK8vzkC0Jh18AnHJkciKC85vo4NEpVCknRG+NqsCS40ej2dCfOVy1J4MJiaLCJTyzu5WKG+qrIG3BPboW/gEx94sM7mlf5e3KBjLRSKp9tkiCJaMBZxeFjenE61MMM5H9Qe+PsDH+JoFthfDyPWjNbUlXny+GwAAh0aJYtNXvrQMOjEPVkpUi9JqP8UDJoqM+EXN03j07CxQrppPdTDWxdvisWewBBHzXXVHIZlipMAm8idotaAn+F/mvkKZcnXxoN8qjA80ye2vP4UKrKrfVGlnj7WssCUxEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8936002)(8676002)(83380400001)(4326008)(53546011)(76116006)(6486002)(66446008)(6506007)(41300700001)(64756008)(54906003)(2616005)(6512007)(26005)(316002)(91956017)(38100700002)(66476007)(66556008)(38070700005)(2906002)(86362001)(478600001)(122000001)(6916009)(66946007)(71200400001)(36756003)(33656002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7741920B9C0E03459A443CA9431F9A3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95fe3015-3e50-49b2-e716-08dbc59f5ca7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPvKoD2PFPhamfSgk7TZefdL59Telvq1GUSZhl2n18cgf4eDDjR58mrgtVcajWd8mELDaPFla4VQf1vQ8lVNVg30NlHOVIknes3C+aiQjnh6dnDRjotPEh7FIkJ95rwQxhtj+o3S/bgQ/kpoc6vAt2G4yAIW7djNk9H0zYh0bKwyoLj9JxdeBJoUTCF0nH3gvcQPwbD+Kf0l1VZ1a3pYpVMG0RUzygO5NqW0m4vDwkPyzTBE0EoIow67WIHVXCOVPm1gXo0xRJS4B+i4QhGW2fQhQtahWMIygAp/0TFcfptPedeXAEcJdi8w9awoD2nIfTLGHhOYBu85W1pUw+sEq0BjWbQ4VOPFjtnwnobEwe5uZYR294bzKFWsTAfBfdFSNPaG2YvMcn4e9wFpjTmCNg7FbV/a2quR7qmIE1Q8/dqmJCKVdQZu6NAKI119PRp6HGbClDhOMotO2RLvf40AZztGH+klVNxZ9NmRfmmZw3v/pQG3wFBd4VOpJcot/Tmqh44aBpDZRmzsc5KdrEslknKNqPHZSh6Q9SxCIlyRu0F75OLkfab0Jhg2ZRvZMazAE6n749PjYcW5wdm08rFZ/pYJsf3Tv63tAbn3MxX62fJdcr6JD5zluKH1jeFcvJIFK900re4sG604mLuiIE/EUOEqucpaUyJ8DuX5cDc9/HmswtMlUxPLGToLki27dHm+oPId5mfu9sYEviJueWUdv7UVjHDic8Etzo0g9ZbNS9FHtSP7YnWRMXsRkurtzLyd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(26005)(40460700003)(336012)(8676002)(8936002)(4326008)(6862004)(36756003)(53546011)(2906002)(6512007)(6486002)(33656002)(86362001)(40480700001)(5660300002)(2616005)(316002)(41300700001)(478600001)(54906003)(70206006)(36860700001)(70586007)(47076005)(81166007)(6506007)(356005)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 12:34:18.6054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ac0562-8b3c-45d4-e3bb-08dbc59f64e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818

Hi Julien,

> On Oct 5, 2023, at 20:30, Julien Grall <julien@xen.org> wrote:
>=20
> (+ Henry)

Thanks.

>=20
> Hi Andrii,
>=20
> @Henry, this patch is a candidate for Xen 4.18. The fix is self-contained=
 in the IOREQ code which is in tech preview. So I think the risk is limited=
.

Sure, with your comments below properly addressed, I think it is fine
to include this patch in 4.18, so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> On 05/10/2023 10:21, Andrii Chepurnyi wrote:
>> For read operations, there's a potential issue when the data field
>> of the ioreq struct is partially updated in the response. To address
>> this, zero data field during read operations. This modification
>> serves as a safeguard against implementations that may inadvertently
>> partially update the data field in response to read requests.
>> For instance, consider an 8-bit read operation. In such cases, QEMU,
>> returns the same content of the dat field with only 8 bits of
>> updated data. This behavior could potentially result in the
>> propagation of incorrect or unintended data to ioreq clients.
>> There is also a good point to guard interaction data with actual size
>> of the interaction.
>=20
> I don't quite understand the last sentence. Is it meant to justify why th=
e two other changes? I.e.:
>  * Masking the value for a write
>  * Masking the value returned by the Device-Model
>=20
>> > Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
>> ---
>>  xen/arch/arm/ioreq.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index 3bed0a14c0..26dae8ca28 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -17,6 +17,8 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs=
, struct vcpu *v)
>>  {
>>      const union hsr hsr =3D { .bits =3D regs->hsr };
>>      const struct hsr_dabt dabt =3D hsr.dabt;
>> +    const uint8_t access_size =3D (1 << dabt.size) * 8;
>=20
> Please use 1U.
>=20
>> +    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
>>      /* Code is similar to handle_read */
>>      register_t r =3D v->io.req.data;
>>  @@ -26,6 +28,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *reg=
s, struct vcpu *v)
>>      if ( dabt.write )
>>          return IO_HANDLED;
>>  +    r &=3D access_mask;
>=20
> I would add a comment on top with:
>=20
> "The Arm Arm requires the value to be zero-extended to the size of the re=
gister. The Device Model is not meant to touch the bits outside of the acce=
ss size, but let's not trust that."
>=20
>>      r =3D sign_extend(dabt, r);
>>        set_user_reg(regs, dabt.reg, r);
>> @@ -39,6 +42,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *reg=
s,
>>      struct vcpu_io *vio =3D &v->io;
>>      const struct instr_details instr =3D info->dabt_instr;
>>      struct hsr_dabt dabt =3D info->dabt;
>> +    const uint8_t access_size =3D (1 << dabt.size) * 8;
>=20
> Please use 1U.
>=20
>> +    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
>>      ioreq_t p =3D {
>>          .type =3D IOREQ_TYPE_COPY,
>>          .addr =3D info->gpa,
>> @@ -79,8 +84,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *reg=
s,
>>          return IO_HANDLED;
>>        ASSERT(dabt.valid);
>> -
>=20
> This change seems to be spurious?
>=20
>> -    p.data =3D get_user_reg(regs, info->dabt.reg);
>> +    p.data =3D p.dir ? 0 : get_user_reg(regs, info->dabt.reg) & access_=
mask;
>=20
> For this case, I would add:
>=20
> "During a write access, the Device Model only need to know the content of=
 the bits associated with the access size (e.g. for 8-bit, the lower 8-bits=
). During a read access, the Device Model don't need to know any value. So =
restrict the value it can access."
>=20
> Cheers,
>=20
> --=20
> Julien Grall


