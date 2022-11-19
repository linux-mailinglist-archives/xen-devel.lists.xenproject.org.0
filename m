Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673E6308AF
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 02:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445974.701442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owCwH-0003FB-Mw; Sat, 19 Nov 2022 01:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445974.701442; Sat, 19 Nov 2022 01:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owCwH-0003Bj-Ja; Sat, 19 Nov 2022 01:46:37 +0000
Received: by outflank-mailman (input) for mailman id 445974;
 Sat, 19 Nov 2022 01:46:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VbUS=3T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1owCwF-0003Bd-P2
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 01:46:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5e685c-67ab-11ed-8fd2-01056ac49cbb;
 Sat, 19 Nov 2022 02:46:34 +0100 (CET)
Received: from DBBPR09CA0040.eurprd09.prod.outlook.com (2603:10a6:10:d4::28)
 by DU0PR08MB9051.eurprd08.prod.outlook.com (2603:10a6:10:470::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Sat, 19 Nov
 2022 01:46:05 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::7f) by DBBPR09CA0040.outlook.office365.com
 (2603:10a6:10:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Sat, 19 Nov 2022 01:46:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Sat, 19 Nov 2022 01:46:04 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Sat, 19 Nov 2022 01:46:04 +0000
Received: from 873c802cda53.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E3E0EB4-7997-4419-A8BB-7ED014FE9CCA.1; 
 Sat, 19 Nov 2022 01:45:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 873c802cda53.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 19 Nov 2022 01:45:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6285.eurprd08.prod.outlook.com (2603:10a6:102:e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Sat, 19 Nov
 2022 01:45:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 01:45:56 +0000
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
X-Inumbo-ID: ff5e685c-67ab-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd8mJ5zfR+79oWHkdqNzD1zqjctsNe0GXT3PlKrnKbI=;
 b=uR44bQFy8bokgmurAZ/rJ+5gZctTItVtmoGbQ266Fud0+6Zxryaob+B8Re5PKsU5CFXCreAU1VmwKMl5+csS84eYyurSk2PMq/lEV9joG6IB2enUPCO6TkPxXE9gl0P7h4eVEbvsWUe+G7CNSqaUetx4jZvNsoPJO7dD22zi2KY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwU9/oKQRCHS5rwOBlDo7NLqj8nvQyY+DgeALunYXJ38xozsulbsrR9A9tw6MCICY/Kfgf07pgxlKRGAMHEsHlauz+bZQkd6R59kTKWSKdkcKJbVxs+pFN6HBjXhMo23xXSP0Kgy5JqaPP4AzY/BIcxo6AxqEUpu7kFu9n820T8x8OHbWcOCvUGSdsW9kDOIka1TjaKXPwEY7E+7s6olL2bgb5J5bXxWTKw2t6ghJj1lpfNVQQjDAXScfmATRFiBESkbbE4XJnV4tSoG3Wf9VOqqIJodla1mTp2lF4OFtyeUbciSNr3KtqjMvY360+CkPI1bpVL4iUpcSpKp7YaILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd8mJ5zfR+79oWHkdqNzD1zqjctsNe0GXT3PlKrnKbI=;
 b=B4lIGlsE9lFtHcPT0gnXSmgA6NyrEb/u9287/4gafKvgYzYK+FiKig4qUQwaapyobp/jZ/acGTPFuG/yrT4WUyfyMgdu46zjdAHbu2H0/ujCF+YbK5Hsl/8af5o15J/5iVDSAhzidDvDlzW6iPCtVykwIAUy0mAx5hDMwLtGVxWbc6YqBkL0bJ7H2B8j3HlaBV//45Y3Aemu1s850R/7dNk3VmJryA06G6KJ68YChmwqS6USF3ErhO1c9Ov8hhGzNI8WHXzh/0vvJKwewwWXCRIr0NbOLa8C65CYdbBoqAJnVbiMe4KZkaV9mJcAgwvJ1juexHqUpa4JuxvFIuzrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd8mJ5zfR+79oWHkdqNzD1zqjctsNe0GXT3PlKrnKbI=;
 b=uR44bQFy8bokgmurAZ/rJ+5gZctTItVtmoGbQ266Fud0+6Zxryaob+B8Re5PKsU5CFXCreAU1VmwKMl5+csS84eYyurSk2PMq/lEV9joG6IB2enUPCO6TkPxXE9gl0P7h4eVEbvsWUe+G7CNSqaUetx4jZvNsoPJO7dD22zi2KY=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Topic: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Index: AQHY+2+K+dbSE+6zIE6kpdVqzhxbFq5E7LKAgACNCOA=
Date: Sat, 19 Nov 2022 01:45:56 +0000
Message-ID:
 <AS8PR08MB79914F454FE85E15AE24B67592089@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221118170213.2872-1-andrew.cooper3@citrix.com>
 <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
In-Reply-To: <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 93EA12714FF6254BB8A7C4FE948BDE3F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6285:EE_|DBAEUR03FT041:EE_|DU0PR08MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 197fa909-5f20-4a66-0fc5-08dac9cfd222
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XCt2jda+2hAH/+ZtbusbfKdy+xsWkDX7F1YjiqOhSIdGkQYAlGdLKL2pIkiRH8i7x4ByKbDC1azxhlp3p2El/GtCljumi/UUFavgqtMhUzTqjJD7CIqnpIY9Cm+ucU7y3WzTsIWrUp51xG/+6qjnYsAmSu3M61ux8nyC/1Rc9+t775ytVyN7em2XQxCnvg0h3LrhSp+gtpciNSr87fILvbRqGioTbjRFyOvJ+vXL3OhgTLnorBIAs/dTiXGJ8yfVnWliTTGek4wkhloKGlWL6i+wSq6SWDvHP3+jy1YUSLH86setcTnHbveRyyJj8XsgDkZKDBd3e+uV5dGaJrOHOevmlFrOayYDVkXhFjIJJDCGLXDqUj3keovVDWRWEL05UwYBPEy4vpXvehjdiYYjTAyhwPIkmOeo/GYTJlDi2X9y7nrfRIFIaR/v8FnPaluZtHS1i9cGSexVGvnE5amH51bbyBaFXK+C6w0yU95wHA9DGGlbmFz2dpSEXyZhByRiSDPbNCrE2wlVnrgFAUZ6/WeTMHOL8vEYTI2g5azIc3bO5qYjwUsgBUnZLHHWxDNsvXnS/YCtzT/mntwbQAy4SUtY2A5ujMPNcc7jOxIVPide2bzvpg6w82W0OEreWD2OyehJaQ58cZID64XfRuZo5tsg8+1mDcgj6cuYq4lZSARxpuDBA1YeDN2MwHaaCL8uO3Pqjf8UGL7p5nimVndBXkKvf2MGswO9qRysQiVvDR8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(9686003)(2906002)(71200400001)(478600001)(7696005)(26005)(6506007)(15650500001)(83380400001)(38100700002)(33656002)(122000001)(52536014)(316002)(186003)(4326008)(55016003)(8676002)(5660300002)(86362001)(38070700005)(110136005)(66946007)(8936002)(41300700001)(66446008)(64756008)(66556008)(66476007)(76116006)(101420200003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6285
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b0633c6-76db-44b8-c603-08dac9cfcd00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mp11AB8vGAQMEJ2Fc86Cyrfd0ctyZXuSSeNYdwUu8lJ9H8C1eMc/JaNju9sWPkOt2G/a0Wi7zSXsOTbsybsP/20U872W89vfEui5rLlurMl5RgudvDMpwswQGaHJt2bRTNeihlWhlyyUeradxxwZfqJb2qGyr9S9D6aupAvizdaoAVoSttexFNRfB0u35oqR8+gz4p/eBStbZ7bVMlbtTQnNai+H4YBMJnUMNiabTHltA0pxCMl7GzykK+bOJLMVzrYhOah2Bre0i2y/ZMoWfUw/eZztmQBM5O8hPI2F4BPX9mXv96PCDBQlmflQQ6W71honUdUQF2etjg2TzXwm1UI7Tz4gy0WP8by1J3rRh20eUZZzbd/b/lTxgDgGQazSJ842yfcGq/GrRKFceZuyfBNpEqDKMYKy8oIY7FnmQy1nREXJFRWJLGQH752je66EEZUZpVvhhwhnmnSWJEFahynEP1nyk29QNABw6O15dpwzpn4qPzTFUSTkiAFrf6BlpFbX+4C1rTJf3JCiz+kXAvYxCrWYMoUYtCKpZRYOhowyFnEb4LjSBRXqqPPKiqUnGkCKEIIGK/kW+lbojakyT+jKtkZ80yFuVjk865aqpFn5CaHUE1R+ILOiMXpZY9nznyncHvmn2MJDgF/mZ8iE0GtchV/DoFi+27C601348ftJpa5n0/SkvJ0KCb3d8GtgjGdyQ170CRrtRqcS74qa1bIQdtMDB9RA1bJNIEu+ZeI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(83380400001)(33656002)(40460700003)(55016003)(70206006)(70586007)(40480700001)(41300700001)(82310400005)(86362001)(82740400003)(110136005)(7696005)(6506007)(356005)(81166007)(186003)(8936002)(5660300002)(336012)(52536014)(4326008)(8676002)(47076005)(15650500001)(316002)(26005)(9686003)(478600001)(101420200003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 01:46:04.7051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197fa909-5f20-4a66-0fc5-08dac9cfd222
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9051

Hi Anthony and Andrew,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
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

I did a grep in current code, and:
In libs/light/libxl_types.idl, "shadow_memkb" is defined as MemKB, which
is MemKB =3D UInt(64, init_val =3D "LIBXL_MEMKB_DEFAULT", json_gen_fn =3D "=
libxl__uint64_gen_json")
so yes it is 64bit indeed. Using PRIu64 seems correct.

Kind regards,
Henry

>=20
> With that changed: Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> Thanks,
>=20
> --
> Anthony PERARD

