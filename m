Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A3631EF3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 12:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446515.702124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4Yh-0007Ie-Ea; Mon, 21 Nov 2022 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446515.702124; Mon, 21 Nov 2022 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4Yh-0007Fq-BI; Mon, 21 Nov 2022 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 446515;
 Mon, 21 Nov 2022 11:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQtr=3V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ox4Yf-0007Fk-Mc
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 11:01:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43515d0-698b-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 12:01:47 +0100 (CET)
Received: from FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:9c::8) by
 AM8PR08MB5810.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 11:01:17 +0000
Received: from VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:9c:cafe::65) by FR2P281CA0109.outlook.office365.com
 (2603:10a6:d10:9c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Mon, 21 Nov 2022 11:01:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT026.mail.protection.outlook.com (100.127.144.203) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 11:01:16 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Mon, 21 Nov 2022 11:01:16 +0000
Received: from c409788f01af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8A92DE8-5417-41E6-A037-AD65A5E3AD1D.1; 
 Mon, 21 Nov 2022 11:01:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c409788f01af.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Nov 2022 11:01:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB3PR08MB8820.eurprd08.prod.outlook.com (2603:10a6:10:438::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 11:01:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Mon, 21 Nov 2022
 11:01:09 +0000
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
X-Inumbo-ID: e43515d0-698b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylLdoX3quGgGcnv6snER42N6P7jvPC1rDvaK2FEHeVs=;
 b=Q72Wluj1/iFOh48L2SOQF/4S6AOEuZLcve4qIpq2KMNVvRGhxM6zwZVMH/1dxGeYA0F/AT5EQaeQRHilxuoqS4LNQCmp0R0HD+NQruZnqd3Mhd1kDDxrpyHokx8ZL1kM/VUsw/DNohjujavP+28HPyMajoLso3QjSo5o9THcEDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIx1rZ5oFRYYjxbukV7Vl7//I7JC3aD200zA4XiBLg1/4tzpsvruR9TpjTUOgWeGKcIQHEpQLzzwt3guVj6026XVk+OoWLFJPM+zAwGGRzENryZqhDMafLuFl6ArM/lWM7+ozW4px1L8fXVpmDGX17c4NPxt3oZ3aWq23Fzo5xVVZb3U1OmJxwPwuxnCEqYpFS5+SFW/7Ly7izjPpymbTz+9znM3ZLcl2d/QUUxWZ2Z/1oygzgDtKBIDGIhXTzWSyhnX+bgnML10/2tOvehLe5bLXaYSMfQfkoCjmNI1XA3u5/6yAZ85MIX/1ODR34f6amwVUi3fhtxw1zrde01/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylLdoX3quGgGcnv6snER42N6P7jvPC1rDvaK2FEHeVs=;
 b=gX9L6baJSriEVTm7Y/4B4X4DFvTyg36i04ptgQAC8jwruG8501prjbL/NpHaBY/8SuEHqZkYr3oD8z8FBeLEi2bofWfBCoGa5p1peltkIsv3SwRIYIW2cYjAyvv1ED6gdI2BJQ/NhKX0BeFxrQjtKnPKlvnxBNTc8ixO6JKb6B/yNsmladselO7+DfRMKbhlGP1QBJrc9d9s+9CFM8jyS0SWFkBgq4eIFunSe/HZFLqarCGv+4cxv04MKGYKfrfw+bDjNliOsfxW6Owi8W9/AaWDPiAYKqdXXa5V7Fd+jNrcjv0/YIqueQVxVdK1OwrGLhnXssX3CkZxp+3zs5RS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylLdoX3quGgGcnv6snER42N6P7jvPC1rDvaK2FEHeVs=;
 b=Q72Wluj1/iFOh48L2SOQF/4S6AOEuZLcve4qIpq2KMNVvRGhxM6zwZVMH/1dxGeYA0F/AT5EQaeQRHilxuoqS4LNQCmp0R0HD+NQruZnqd3Mhd1kDDxrpyHokx8ZL1kM/VUsw/DNohjujavP+28HPyMajoLso3QjSo5o9THcEDc=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Topic: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Index: AQHY+2+K+dbSE+6zIE6kpdVqzhxbFq5E7LKAgARNc2A=
Date: Mon, 21 Nov 2022 11:01:09 +0000
Message-ID:
 <AS8PR08MB7991C99B16553649942B753D920A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221118170213.2872-1-andrew.cooper3@citrix.com>
 <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
In-Reply-To: <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B1E32200F7237248A4F105170B110607.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB3PR08MB8820:EE_|VI1EUR03FT026:EE_|AM8PR08MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cde8acc-652c-431f-f69a-08dacbafb681
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JFtbsKK6dtm/AyiN6RnXSbA0XEKLkfbTYBlGYa3k0YlzYCCS81hxYAx+U5f0v5g6C7VCFZDg7XgnK0UIKxFsl1EQA4Wz/jiuaxcOJ7vu/GN7qMQlI5LCvnJb/f0fFgEihDf5tiMc9mdbEVpRktJmNXN7/zFmVQSwPAancffGXEDR5ptPcFV3eVtDff5o/pgB+P9zjrS0FpkkWuJlOOotwVOKLbsLg0w7sMscauFu6qY5L/J1ffStbaXB+1UKMb2gstrE7SZJuFvbzNKhvzU+fr/73XzZX+jxTQJu4As9UzysShIkSrSCjFJoTeM7d+UpyHCFUJxlFHq0SbYNKDV/J00dUErLlccNjViZfiiZjP/GqxUkYQUB5QCtf4pj2PoSi4I7nbHsxeTr3VmpqtcQd/UDhkjpzS//1p84E4DiJ1IdGKVtoHuQr1oI2MPyg0cdJVqQRSHvp7a5vauCrMaeBmG5czOn0oQd/u5Pn+DiQzvSZfJhs4MmUsy6742Mj15Dn2fXk9UNSAO9JLO2lK+2wpvYsZHMFJ6JjHVhBc9IMNiA9g9ypuWpYVWNHk9ixGFfvOOM6MGlpsVK82XcpUmrXF85h1NI36MNsuqHXSanP6Y++zuFzhLEnzXes2Xwnumc8YUOPon0yyULvNoO0gS1cL8jC7/qvDsup4agxEm37lkaYQ51Pa5mpPLAINCzh3zfJcYDjSicnx5tE1Fga92Dtu5zOGyD/wFI7Yz16LXa9Jk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199015)(71200400001)(38100700002)(55016003)(8676002)(15650500001)(83380400001)(186003)(110136005)(66446008)(4326008)(86362001)(38070700005)(52536014)(66556008)(478600001)(33656002)(76116006)(5660300002)(41300700001)(64756008)(122000001)(66476007)(66946007)(8936002)(26005)(2906002)(6506007)(316002)(7696005)(9686003)(101420200003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8820
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cd3eaff-3d61-48b2-e51d-08dacbafb26a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gzYvucx7mP2VKDFbCLdDU6agnjn0NFGVq/6B9tcWOkw37iKk/kZIX5CdNaz7wZLksyP6qmfL/KAsNN+LTvfRUF0tfU8wcHUMHKqQ3cSz419nUK3xryf+a+Gpoc21TeDbTPYXMHOeEokNhMAD3R1pZQfHmbQHNfhr3WMY9xSIJ6jjbpUAOiKOYKFIfx9cYKPjOdfGf8n46qFKPfw8/yynbOsGC7G1oHB+yu+lVFWE2C9rPaF1wtj8b5mym/5UcjPo6rFkA4s433pYe9Q0Zjq5YVQQtgU8w2O4R6/hXjAPyMADQ+SMewaKARqtKenurSwQTGDvUPGJRgjs3IsqMmx4KWc0H+Sw7neFmUd58HeRnsfvcDjznatal9McJWTTggIjDABmAKnqzy6AU8gKcWDBB0TnoL3wPuamaaE0gDiwwiLvrDx4OkrGLVEx42DokYasX3rquVdmKnpFavYbrhrX0tgsd8wuhoBrOj/o7yPVYFizRV8DEDvkDDDtXm0mPig5BQL7EyHyiP5YUIwHjckVZSmvk0SPRo7+51PJViRdkmh+fx3aCqQ/JgjRCcruC/m09ehfe0YyznfPLnAaDzPg8qHshjNmGISuW++aP4PnlHFlR40T6F6x2d7WWxBvAfT8sLgQPEuwEh5Fzn65X01uTyJT6MbXmXeBzksjNyzNu5mCYrw3kNzJSrz+ePSfIkCfpA4tSlBUjuSyi3F9bv6qW2Xjw5jzu2v230lkb13GgPNlkJ+OUbBHXjsW026mu3Op
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(83380400001)(81166007)(86362001)(356005)(82740400003)(2906002)(8936002)(4326008)(15650500001)(110136005)(70586007)(70206006)(82310400005)(40460700003)(41300700001)(52536014)(5660300002)(55016003)(9686003)(7696005)(40480700001)(26005)(47076005)(186003)(6506007)(316002)(336012)(478600001)(8676002)(33656002)(101420200003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 11:01:16.6938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cde8acc-652c-431f-f69a-08dacbafb681
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5810

Hi Andrew,

> -----Original Message-----
> Subject: Re: [PATCH for-4.17] tools/libxl: Correct error message units in
> libxl__domain_set_paging_mempool_size()
>=20
> On Fri, Nov 18, 2022 at 05:02:13PM +0000, Andrew Cooper wrote:
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.=
c
> > index b59bbe00bb30..68ad9763b6ba 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -1459,7 +1459,8 @@ int libxl__domain_set_paging_mempool_size(
> >      int r =3D xc_set_paging_mempool_size(CTX->xch, domid, shadow_mem);
> >      if (r) {
> >          LOGED(ERROR, domid,
> > -              "Failed to set paging mempool size to %"PRIu64"kB",
> shadow_mem);
> > +              "Failed to set paging mempool size to %lukB",
> > +              d_config->b_info.shadow_memkb);
>=20
> Unless I miss read, `shadow_memkb` is also "uint64_t", so I'm pretty
> sure the format doesn't need to be changed, and we should keep using
> PRIu64.
>=20
> With that changed: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

