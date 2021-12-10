Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D19470218
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243892.421990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgIp-000689-VJ; Fri, 10 Dec 2021 13:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243892.421990; Fri, 10 Dec 2021 13:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgIp-00064v-RR; Fri, 10 Dec 2021 13:51:11 +0000
Received: by outflank-mailman (input) for mailman id 243892;
 Fri, 10 Dec 2021 13:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5au=Q3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mvgIo-00064g-2B
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:51:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d2a71f-59c0-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 14:51:07 +0100 (CET)
Received: from AS8PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:312::19)
 by VI1PR08MB4285.eurprd08.prod.outlook.com (2603:10a6:803:f8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 10 Dec
 2021 13:51:03 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::7a) by AS8PR04CA0044.outlook.office365.com
 (2603:10a6:20b:312::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Fri, 10 Dec 2021 13:51:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Fri, 10 Dec 2021 13:51:02 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Fri, 10 Dec 2021 13:51:01 +0000
Received: from 95de5ab20173.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9EE131E-C9E4-47D4-8CC8-5CB0CD52D4F0.1; 
 Fri, 10 Dec 2021 13:50:48 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95de5ab20173.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Dec 2021 13:50:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5991.eurprd08.prod.outlook.com (2603:10a6:20b:29f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 13:50:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 13:50:47 +0000
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
X-Inumbo-ID: 38d2a71f-59c0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv8keQ3kUpPKIGej8rfrMI7eQyQ5bUkDwjnga82nFEY=;
 b=amjslSgqP1ho/WpG9Kz9oxfwamUEDhEtyW7RrXOUTQWtWw6nMfHM8MSD0p6ito2kVGiFq8oOuAG1tumct2gyghTeZrjqpmMD9Y9CYlqkPQcXJWUT7qakG4FUNAI8ktA3BJ3+JX9L4SkQebeeOyqXN4O4YOpvPRN+Yj9JNoBz65A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d4344fba6ea640f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdtKy3QcXWtv+9v0oiEA7MX8/nY93/9WmBpM01GB6IEQDXZVNP5UmPUAEQWQ9zh6j0TsLTz9wD+PlW+t9EUQgp5plmj7ZGDeUe2GJBthqS3FDeHzuYVv6hFM+8kBFaIoYtp4vWh+DVSLdXj9/N/WBA8UjNk6r0Ux4QH9Ba6kHEsH/JaBjCbFJv1InAhSpnD4QP0wKQ9ohLTMUeBZsTNe1f0T8I8kJbAOvwoYHClgojgFSxLSnVjITYIAD0ee5bVnLsAmslOvAtkgG2cTEyCfX7vteDN8J9tyZeEyTx1f9LLxoy/D1pliLoVxl8SZtw0tVkIiV8iwieLRbSta3iAhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv8keQ3kUpPKIGej8rfrMI7eQyQ5bUkDwjnga82nFEY=;
 b=ZNhfUEsDFgRdl1DC067pHLfYX99vdQ+1PUiqDgz8boVwezJneeMpHd9geRem1ZOZyVRUG/+XBxlWbKbqXqZNOkh30QO/TBrRucTspdM1KybFgH1gyfu6WKZsiRydHKj8+Np9CRGDzGi8KXsie/EWllkeBPkML0zEoerxpinPqzipSDhqlGveXdvuIBFnmbS/8BpXPzzf+2jKgjgVMawYkpl5smL5kEBVl5BwXMVlGiPykhBURkUuaiGGKvoEa0IH1KaAB4VNxGH/yC1gnuFgjhoaXRMyq2zJn8f0DuER0APnFCzxu7qJASErYFqw9/+KC2G/XwWK+5UWcc3vDcfogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv8keQ3kUpPKIGej8rfrMI7eQyQ5bUkDwjnga82nFEY=;
 b=amjslSgqP1ho/WpG9Kz9oxfwamUEDhEtyW7RrXOUTQWtWw6nMfHM8MSD0p6ito2kVGiFq8oOuAG1tumct2gyghTeZrjqpmMD9Y9CYlqkPQcXJWUT7qakG4FUNAI8ktA3BJ3+JX9L4SkQebeeOyqXN4O4YOpvPRN+Yj9JNoBz65A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Thread-Topic: [PATCH v2] libxc: avoid clobbering errno in
 xc_domain_pod_target()
Thread-Index: AQHX7ceTNtjLavE+e0K+in6YCJvpZawrvk0A
Date: Fri, 10 Dec 2021 13:50:47 +0000
Message-ID: <52F30125-172C-4AC8-B3A6-104D7914CDB0@arm.com>
References: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
In-Reply-To: <ac9ffddc-b102-9876-7a46-345078c3423c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cab0d82a-3d8d-482c-af19-08d9bbe41a9d
x-ms-traffictypediagnostic:
	AS8PR08MB5991:EE_|VE1EUR03FT045:EE_|VI1PR08MB4285:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB428577BFE45DC7A9D43D79D29D719@VI1PR08MB4285.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rwDv0Tt61R1goaGktU8IaCJvp3k5CoOoBNlEBNQWTDVtv1OGcJzfzS/dIS4/Rial8teBUA/Pw2gVejVOM6y7ZTIetyZBjkiyIfLrxqGyxMQbBSDfjYPkHocynI7aimNfSzB3lvLe9C0K0aXfNf5NwDdjUQgM9aQHw37DnnDIrJs41GFTyqDsUuViUgrc/VZWc690HJujKjc4ZaMQB8gdE25P8dVoJkYYVf20xuMybTslIpPvpk1jtbW66UJQgnlYy4K9nSpT6cByCDfzmNgTqlV8Gq8bVuIDz1v9j2YhXVHJmGENKddyGEQtkxoTzlspVbMXQGuKKC3OAq1TkSSwNnWL+lybDpwi4JW9m2oMBDxTg7l9G6UuwR989AxJacAuxNraIXxJevicJMtjkA07mIHtBzDcU9rUlrcQkkeyoTvQPVgAK/g1AyGZLqxkQgMX0J8X1KULF1KLK3Lfwum5C0l7dr/HZXVRFWqtG7CqwUMznb3RCBLaxzLxxS7VCV+Dm40E5FakQ81+TFh1/hwZ+6MVHko8g2n5Gnx+HGy++N0L9DpfohT42Q9UipJa1HBVDiPY2lVxDlVdWVLnoz+i1mBlxuLjkQwFeWX2D27PcW+XHwcIjaP9fsFI58ifv1Wp4gZbZjcVGRl7ZGUS3/sc8xZUJxpGSMaxqwv/DKqzaIwM7MvB/LesPPU4s9ovR9zaYaoP1svKJ46n+DOarD8wmnLlkcgVrriJB75Y7peMv5ohzVmLdWk36io7UCEcZQ3d
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(2616005)(316002)(508600001)(4326008)(122000001)(38100700002)(71200400001)(54906003)(36756003)(38070700005)(33656002)(8936002)(8676002)(86362001)(6486002)(6916009)(6512007)(5660300002)(2906002)(91956017)(66556008)(66446008)(66476007)(53546011)(64756008)(186003)(66946007)(6506007)(76116006)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA4EAB052EC5174DA4F5127894F5C618@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5991
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4075bdc-4e45-486e-62b1-08d9bbe411a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VbLCDxfr+GbtlCUQuJP5FcjlbSsRPir+VQz0ujhmOVhyp+CA69e4eGPK8EzAlOx0f14dPkt20OsvFXVsOk22tW7ExGZNTU19vbGQImreGAf4x7nSocloVF3JpA8kDOP3+U0OiuEBIVsubayvgkZz/JMqZJvgTYTk0MbHRYVe8K7uV3MD+vRYufCc78JSLG3zD7aCnTbkJR52OLjfNkw0yhiI/dfYB/RnzOffJtTONn9NWPjqMd+GqRC545Hdu7ITKIG1cMgWigyOAkbCmv2K6PmEu1FiwiontkMyYcGlh2iCBuAG3zauAzp8q4ojQBGwvO3218rpWyvoTwhdCVnrlXP4ijYY2ngALrbI8X2CIbo/Iz2gMKb4Sr98xV0UF0s85Yfi8RHmAXm3xOyN5uAyuQXrqjtvIzWcpb+/WiKl/go6qMACj1lfjEocF8NifH0MA/t7dGvmhsC+JfMiMn1CM+GMT1GtEYbI87BxipIQF75TzJXht2gvvRWyDIAqOMwkjDdJ+PMtFDb5gN/JwwyziPuPzkvpzutoSnBk9p+4V9AtMoXXH2nbdAJp/9RFwDmMXhaFOAMpW3kkM6E3X3C5YQUi4/56jQL0RaORYd2tPqCsxGFeztGUpJPWX3CNUf9ty5CMkcA1NdVjsSErgJvs34jRNLy59J4vk4OyoK4bYBcQerdC/PYcw8K89hGIynzIeuc2kOgO/rFzzw5MpNg3ZFB9/KjNXw5VDmSUgAO0lAVmElm3RGAI7Ozn39acjrJlSTjPTBUDdf1NHGAFKITU0A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(186003)(83380400001)(6506007)(47076005)(36756003)(316002)(4326008)(81166007)(336012)(6862004)(33656002)(107886003)(54906003)(2906002)(26005)(82310400004)(40460700001)(36860700001)(53546011)(6486002)(70206006)(6512007)(86362001)(2616005)(5660300002)(8936002)(70586007)(508600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:51:02.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab0d82a-3d8d-482c-af19-08d9bbe41a9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4285

Hi Jan

> On 10 Dec 2021, at 13:11, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> do_memory_op() supplies return value and has "errno" set the usual way.
> Don't overwrite "errno" with 1 (aka EPERM on at least Linux). There's
> also no reason to overwrite "err".
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

But if err can really only be 0 or -1, I do wonder if the else forcing err =
to 0 could
be removed but I must say I have no idea if do_memory_op could return a val=
ue >0.

Anyway not related to the patch itself.

Cheers
Bertrand

> ---
> While the hypervisor side of the hypercall gives the impression of being
> able to return positive values as of 637a283f17eb ("PoD: Allow
> pod_set_cache_target hypercall to be preempted"), due to the use of
> "rc >=3D 0" there, afaict that's not actually the case. IOW "err" can
> really only be 0 or -1 here, and hence its setting to zero may also be
> worthwhile to drop.
> ---
> v2: Don't save/restore errno, as DPRINTF() already does so.
>=20
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1230,13 +1230,9 @@ static int xc_domain_pod_target(xc_inter
>     err =3D do_memory_op(xch, op, &pod_target, sizeof(pod_target));
>=20
>     if ( err < 0 )
> -    {
>         DPRINTF("Failed %s_pod_target dom %d\n",
>                 (op=3D=3DXENMEM_set_pod_target)?"set":"get",
>                 domid);
> -        errno =3D -err;
> -        err =3D -1;
> -    }
>     else
>         err =3D 0;
>=20
>=20
>=20


