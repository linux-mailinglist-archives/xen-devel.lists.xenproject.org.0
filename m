Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD106AE4A2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507510.781103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZDz-0003JM-VJ; Tue, 07 Mar 2023 15:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507510.781103; Tue, 07 Mar 2023 15:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZDz-0003Fv-Pe; Tue, 07 Mar 2023 15:27:35 +0000
Received: by outflank-mailman (input) for mailman id 507510;
 Tue, 07 Mar 2023 15:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TARO=67=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pZZDy-0003Fp-B1
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:27:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 943be782-bcfc-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:27:32 +0100 (CET)
Received: from DB7PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:10:72::24)
 by AS4PR08MB8189.eurprd08.prod.outlook.com (2603:10a6:20b:58c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 7 Mar
 2023 15:27:30 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::e8) by DB7PR03CA0083.outlook.office365.com
 (2603:10a6:10:72::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:27:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29 via Frontend Transport; Tue, 7 Mar 2023 15:27:28 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Tue, 07 Mar 2023 15:27:28 +0000
Received: from b978e48d9a39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F79C6E8B-0AC2-4F03-9F30-BE59437B548E.1; 
 Tue, 07 Mar 2023 15:27:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b978e48d9a39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Mar 2023 15:27:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5364.eurprd08.prod.outlook.com (2603:10a6:208:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:27:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 15:27:19 +0000
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
X-Inumbo-ID: 943be782-bcfc-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39TtagBEJpHWqEuAdKldn4Ewj5WiElEj/f3CGEoWGaA=;
 b=iXTyA2IlsoOg6P0IAUTR0W3akke+XEyU+Wb0Eu3OyP7NWyD+K9/421nI3ZyptLDoZtf5bnWLHO4HdO8ra8flZ4FPqfk+I+gAaXHohD+LTBu9YGaPu/P+GMgk1sMsKuuhHQDZenjwbV6d7U+AtCmJu9gIoscYFZxs0aUzDgq3vnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66875ceb0931c61a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlN+q3+m9HWQPr8gycaTRhZNPIRjK83L/4irmvOb4VdTnS5Vc26290ffDjK2FcR4AcF/yfiZntGqvQEbwBhtd1YnBhLCBoLHnYQMxf9JkOnTG/Kx12BiWzvNijTtiNsMMQ2auHpqsNpuMqGpuZwwx6E771aa90B5JSyi8btCT4QNPaRCNi+enL/Y9MSLmV4pNv6GVhOfc37JQcjK8jkP1LOsamky0XWUT6vEroF+W5Ve05ASnTjankdM70r95e5n0cvgJUnuv+g0L+MMm6+95N3heW2FZbDR/plhW8nf3xXGYAVkgJMptPOqZx1P2zPKNWUJLJ64FuBIkZP4oLcghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39TtagBEJpHWqEuAdKldn4Ewj5WiElEj/f3CGEoWGaA=;
 b=iv2Wob6lcWLHF7/qd6FOHDvk9gxGlOkmMaxv4T0oJnurFIULzX/q2WFC60EXXrYEzCgeV3oQ9LB7XiVIrEJgZr4akpd/fZnTV6xWfLAFWGev8n9AQMgob5TiTGWG1ldGpGyPzfsSErFiDco9UGGMoVIMYHPV9idCJwk8my3+sDeYP3HcLFcntdIoST4ZIV/GjwM6ydEzX5XtotspXilZ6DgawUh8J/dnK6ThcEgiGwMucfJNCzuLbMmk6v+BuvC82ErShqd8lT+tNSoR4Im5O0IoERtbTi6jn2aBPcrpJ97DT24nrKJlypeWDqpVGREYP2KOu+mN+x/kFEsh1lnx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39TtagBEJpHWqEuAdKldn4Ewj5WiElEj/f3CGEoWGaA=;
 b=iXTyA2IlsoOg6P0IAUTR0W3akke+XEyU+Wb0Eu3OyP7NWyD+K9/421nI3ZyptLDoZtf5bnWLHO4HdO8ra8flZ4FPqfk+I+gAaXHohD+LTBu9YGaPu/P+GMgk1sMsKuuhHQDZenjwbV6d7U+AtCmJu9gIoscYFZxs0aUzDgq3vnw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>
Subject: Re: [PATCH v1 0/2] Fix ARM Generic Timer interrupt parsing
Thread-Topic: [PATCH v1 0/2] Fix ARM Generic Timer interrupt parsing
Thread-Index: AQHZUN0kJnuAhQfQv0iYnuJGnTc3ZK7vcNOA
Date: Tue, 7 Mar 2023 15:27:19 +0000
Message-ID: <6A06A9E8-4643-4920-83D9-3B628D29A386@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5364:EE_|DBAEUR03FT022:EE_|AS4PR08MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b48f7f-b225-4b60-50be-08db1f2075ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DRQQhp0yp8BVDNOnGE0DdPc4Ccdw5cov4N+XDQWzponlEgRabTHMCNcL4q3cL2ApFZkbO/8EH/I6YQ8ew5YUEGYB49rihYKBU7MdVs4JT9o3/wY9/MUoGqFf0YWG7wi80Idvn4xp81EIWqD++gEVeHGZmD53lhUDTUjfU/5IHjG9L9/q3skIOaUXf/mQTCX3XfLHpLvFYMGLn3yUmHVUpvppdFYHemitSHF1TxPTPW8SryW5dh8vdwGspmYfzyFQ0SzIaeoH2uSf9xrjrHftDT/hQE9fnYyPhJ3KO9qBbxw0m7a0H6vZXDB846hyo50zBoKF4ctYQvelWBHXfH3JZXqToqgtVZEQtgrczG98aB1Z1eb8TeAl3LcUEjN2zk0Li9MJH12y9fHBQvxvgrg5HAVMuRMMSvdgjnEB315+R0C0l158swiWGJv46xP6ctIh7V8cd5ldYf+ydNcQJoRsSYnCX1+63G/68n18GN0JCunQU5PbBL0GdjrX2dF4+dc1bb1PEuuGk58VjFb4dhk3lVuc3BkdAsCfcTBmlHpBP5+cSgAgil58G9XlfkRKyC45Tn9ygL/tR9qfb4qnyK3UzgadIsExidD7MgYmxuiVi/3dxn8/vDiXW/MhRxyxyQPPYXjvloxHE96/6FOYQC1/0zPh/TMVs6hLaHbTek1R7wgNhvPLX8T4H3zKL2G4eh3q873zN2IMY9lajPy2NmsHQAdtmziCSZDOKahPtsCAx00CHe0XtuCumv0Enfpt92xg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199018)(5660300002)(8936002)(2906002)(41300700001)(76116006)(4326008)(64756008)(66446008)(66946007)(66556008)(83380400001)(6916009)(66476007)(8676002)(91956017)(53546011)(316002)(54906003)(33656002)(478600001)(6486002)(71200400001)(6506007)(6512007)(186003)(86362001)(122000001)(38100700002)(36756003)(2616005)(38070700005)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83EC1F964D7595418B74828F539EECDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5364
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	902ec318-cb8c-4bc3-8d2b-08db1f207094
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vlJKLVaSR6Fa5MiGZbgBZkenH+6Ah7yzHSt9C/7Ap/DS0y7HzWW48CvUF4DH3UG+y+OSCRVsPTnz1Hixy4jDUEoMVbdZP5Of9883ggxGslIQqBsYq3lEU7EuRkzo2q/1RWSdlc+VAqERFLJ2ob3zlbRXj3nctd66tkQyBdLDe6niB4u0RlZaC+F4AtRxuKQbTyvL05wxIg9zttNBJZDzrfpUHT/6wXAewPYBSDGZX9qe/ScKoKngAvUMx95l6kPcFmQnMohShvcun0CY1yFdES1Q4dC3DFhe2s7XZbvRFYOboMzrxvPXstxWSKHU7tG2bol5NlOGt5LcxFJKFT+BzhMsDEPpHwBZzRf9kSxpIfNk7vnLc/t3PENvl1w80o478LhnuzSJvOaRcaWDyYruoPbjCs3gzlCMwYxVuJC4quVQVqfDzA1j0OzzvD74ckF2a6pmJHp/7Fu5HUSl+A/klRQp2Dsl54bcSOzHPbLzqfmI4ZkVg7EkvthlYnFfmHHYCk8jSfAJQANwQgYIDhbkcJeLcef5fv6wARZNhTlVJBIDh6bYNDEhWpzhje91iMJMTuI+txmlTFGYUsCZoMFhpxUZNrXBXkqLOFQI3fz+BSJrfJGyRonK0SCuH0eMDEiQlq62/5lKui+NsThNIbAnqUerrBZQ5LdJje9WIjLDimz1/jX73HTXlp/kfFzfb+7eHlplZJ/azR1NTHy07/49kq9wkpvCiglK7l1ZiFFEYqQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(26005)(6506007)(82310400005)(53546011)(6512007)(36756003)(6486002)(36860700001)(47076005)(40460700003)(356005)(83380400001)(86362001)(40480700001)(82740400003)(33656002)(81166007)(2616005)(336012)(186003)(70206006)(41300700001)(4326008)(8676002)(70586007)(2906002)(5660300002)(8936002)(6862004)(478600001)(316002)(54906003)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:27:28.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b48f7f-b225-4b60-50be-08db1f2075ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8189

Hi Andrei,

When submitting patches, please use the add_maintainer.pl script so that ma=
intainers of the code
modified are added in CC.

> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.n=
xp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> This 2-patch series fixes the parsing of the ARM Generic Timer
> interrupts from the device tree.
>=20
> If the generic timer interrupts order in the DT was different than
> the expected order in Xen code, these interrupts would no longer be
> correctly parsed and registered by Xen, and would result in boot failure.
>=20
> This method with using "interrupt-names" for the generic timer interrupts
> instead of having them hardcoded in the DTB in a specific order is the ne=
wer
> approach already implemented in Linux. Xen did not have the necessary cod=
e for
> this approach, and it has been implemented by the means of this patch ser=
ies.

Would mind giving a link to an example or the Linux documentation if there =
is one ?

Cheers
Bertrand

>=20
> Functionality should remain the same if "interrupt-names" is not present =
in the
> Generic Timer DTB node of the platform, but the interrupts should then st=
ill be
> present in the expected "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt=
" order.
> If "interrupt-names" is present, now it is also correctly handled.
>=20
> Andrei Cherechesu (2):
>  arch/arm: irq: Add platform_get_irq_byname() implementation
>  arch/arm: time: Add support for parsing interrupts by names
>=20
> xen/arch/arm/include/asm/irq.h        |  2 ++
> xen/arch/arm/include/asm/time.h       |  3 ++-
> xen/arch/arm/irq.c                    | 14 +++++++++++
> xen/arch/arm/time.c                   | 26 +++++++++++++++++---
> xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
> 5 files changed, 46 insertions(+), 34 deletions(-)
>=20
> --=20
> 2.35.1
>=20
>=20


