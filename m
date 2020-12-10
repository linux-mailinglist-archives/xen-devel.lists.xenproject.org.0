Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF52D5FDC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49458.87466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNzl-00047C-MK; Thu, 10 Dec 2020 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49458.87466; Thu, 10 Dec 2020 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNzl-00046n-JA; Thu, 10 Dec 2020 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 49458;
 Thu, 10 Dec 2020 15:36:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNzk-00046h-Po
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:36:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::610])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0da8f9a7-21b9-41b2-bc82-9f3d52fe316d;
 Thu, 10 Dec 2020 15:36:39 +0000 (UTC)
Received: from DB6PR0301CA0029.eurprd03.prod.outlook.com (2603:10a6:4:3e::39)
 by VI1PR08MB3968.eurprd08.prod.outlook.com (2603:10a6:803:e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 10 Dec
 2020 15:36:36 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::ae) by DB6PR0301CA0029.outlook.office365.com
 (2603:10a6:4:3e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:36:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:36:35 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Thu, 10 Dec 2020 15:36:35 +0000
Received: from 5754061f6571.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28A81783-8BDF-4E17-9F3F-8B7F4D753DC3.1; 
 Thu, 10 Dec 2020 15:36:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5754061f6571.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:36:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6252.eurprd08.prod.outlook.com (2603:10a6:10:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 10 Dec
 2020 15:36:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:36:28 +0000
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
X-Inumbo-ID: 0da8f9a7-21b9-41b2-bc82-9f3d52fe316d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcRXd9RF3nGiJPD5Q9wbQ6foiJEShdxvoSLTCVIWw+Q=;
 b=Au8fj9RUkz95QQTm7pDCR9rQ8ExJ766yuom4dbi1oVm3bDgzRYP2+sXIEE5j/VyDWHI/SAn6kc5uxNt/ZiWVAl1b2oBf3I7KNUSeVsEBLRDw9Yq1umrGOLbaDpo8o0dYMRI5SFOf4Yk33zU7ZbsiJNmgNfLoqtvpbtXH4lY8UXs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03d8f3fe86f71e60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6a2CRPNzmfAVAxcGOSbp+Npl0L0/5j4kf0fMBoQni9BwKT2uUNu9VcXTJXwwzWrikV8u+Sn8DQAC53ig/y/S+LqcWVMu5D33a0qyVYBCHVzjop01VtGsEOFR+ZnggqgDwO6RB7KnvrLqqx5G7FHXUJaSnejw+ivTGPJrGdGq6Z0/LM/t2D8RfyRjmetH0Kx7feQJJuaJfzArlChINNFHTN9z85i3H7wGR1Nj+vFbEsPh/awDEbLdo3b3Bi0DaJpEB1VudAiYjGAkt18fH76QjFLonE2BBVJRIcGiaUr5+1dXLR39La8XGFuyZlMKc9zDOnKFwX4dkRpyYwtNTr0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcRXd9RF3nGiJPD5Q9wbQ6foiJEShdxvoSLTCVIWw+Q=;
 b=U+8zBEkcOyCzazU8meIEQLVaOurams9nrNHzYKMeq6yfzHau7C4su/EgLoAqC0uJg1qj7rrE1ZR14MIrmoSCnOIqYuVLvbNLG5lE9lcYabK/3OUy1Cf/NNcvWugFstfw4UVrcD9mBmVJiv5LZtv1Xcupprek22b7aC0kk9U8NQy6jYr+feh7aClhB20RPpx1KlfV6JS43Im9pSlit3mbxRb7CFvOT5Se686xRvivzpu48PnGDwHx7YnsUVgKhncHh+owdiU0mJYUt9i69OaadjTEpkETZ59hsQioevbIt9c4of64EkMeD+3hkfIV167ftWKUZD9cebS0c6n4oKQIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcRXd9RF3nGiJPD5Q9wbQ6foiJEShdxvoSLTCVIWw+Q=;
 b=Au8fj9RUkz95QQTm7pDCR9rQ8ExJ766yuom4dbi1oVm3bDgzRYP2+sXIEE5j/VyDWHI/SAn6kc5uxNt/ZiWVAl1b2oBf3I7KNUSeVsEBLRDw9Yq1umrGOLbaDpo8o0dYMRI5SFOf4Yk33zU7ZbsiJNmgNfLoqtvpbtXH4lY8UXs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Activate TID3 in HCR_EL2
Thread-Topic: [PATCH v3 7/7] xen/arm: Activate TID3 in HCR_EL2
Thread-Index: AQHWzkl013/0PfAuCEKW6HlWdTiWa6nvZnoAgAERZAA=
Date: Thu, 10 Dec 2020 15:36:28 +0000
Message-ID: <C38106BC-5FDB-49A7-A36C-2584748A7054@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <956cf336ffce24f0cabfc7a98ae855bc71d5f028.1607524536.git.bertrand.marquis@arm.com>
 <6e81e7ff-9cfc-aaec-e1fc-336dec06dd6d@xen.org>
In-Reply-To: <6e81e7ff-9cfc-aaec-e1fc-336dec06dd6d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7beff5c9-73ea-476f-f224-08d89d2160e8
x-ms-traffictypediagnostic: DBBPR08MB6252:|VI1PR08MB3968:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3968B9B11D65731ABAE6B98D9DCB0@VI1PR08MB3968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +OM7R2+LIsdPmegoQ0dWsADD7XIyw96vhYSJio8/5WZ3kbCo4orxng53BpcuCw5gQ7jDBr4eTxAd2Zmcn0csNwgKFfVtISMgTudz7UoOF9S/48pyQ1OM5VExtCXnbnjuOfV537D7krJPdRgdvNbLwJbkw56C9fkzajxaMi0lcqm8CvcZJuEbHLsnBBzeg6ogIzsO7DLB7R9j68xY8OuakQLkdULVbApbB5fKTyCqSYgvSWEIkdPKiEoMDF2Rnb9LclysB0TUO/Z/PyaKnH7Cw1T5/OhUKT6voLFTyI3hFS5EzAtR+Z/FJfIOztnkKiWHWNicexB/0/F5651rSbcd28evCuiSvK2dQjNkCHvHsMnPW+pwe9cOGRrqD/ukE8+a
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(66946007)(54906003)(36756003)(33656002)(6486002)(6916009)(186003)(66446008)(8676002)(26005)(6512007)(5660300002)(316002)(2906002)(91956017)(478600001)(66476007)(6506007)(71200400001)(2616005)(86362001)(4326008)(64756008)(53546011)(76116006)(83380400001)(66556008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?VDMWxokBqQxNmV4EBD2Wd3CMBeRP1+gZxNKazzkjeYyLwMgc4zoLvCZ2TGG4?=
 =?us-ascii?Q?VdkbUyDapDlzfKj5OXJPx4wYuk5VoP3ZUP1au+kILprflCNGLe4Mz5DxJRrG?=
 =?us-ascii?Q?PJ5n24VUxj6fJAUsCSMV2sYKQa0e4UoAWc9ZtYzmfZnDlRKSUIphyDrjAAql?=
 =?us-ascii?Q?UDmYB82A8p+1MLJp6njkGItlMNgHrlGTZbbTmnXZyJNvaObccZTGTzcb0Pf2?=
 =?us-ascii?Q?BQgnyB/po3NhwcI6bMmegJJzBqaEe9Lq1AvptzIRL3PQ2NkirZZ4g3dw0d+7?=
 =?us-ascii?Q?oK1otQK7KhlmHISKxx21oZ32a2S9fX4prmjrHU7LKmcKoEhkeg6auF5ncWxR?=
 =?us-ascii?Q?aEVNroOOj1L9sEwYh6h0wNgrpjJ5PZmOEkkvXP5YPE3Y4cMMtSQN+tvT4KBr?=
 =?us-ascii?Q?Fqt6ta1D+yY4rX1V2be9yb81M2TpFpPzlQNDkEnnakRbOyYxcCqsFknMQJnA?=
 =?us-ascii?Q?XBpfDxqGnVqGsa5Fj1mAnFfIWvH8Qz4IE0qgUiQbT11jJx4qb6g1YOZNsnn4?=
 =?us-ascii?Q?B0t+Z2ZQSTX2UR5yiNsw/eQCIBIbeJAHaPr07RSlqc9DuvN8VwKUG/0AVqon?=
 =?us-ascii?Q?IDlyTdo1a5PUT1CNpfXGaReOo0oPWsYXxtwyUWDvPjRhQM6M747/wbbvDVkg?=
 =?us-ascii?Q?u5J50W+35ZwcXr6kXkc85TnnyZR1PZ2NKiRcuVF2I6V8enxzWhq4kQ1xC+Hs?=
 =?us-ascii?Q?Khm05XGR3q4v1wsGcJjSIYpzTyIb9qtFJywE20FEf/W5jW6zhLZRiTjVlVyV?=
 =?us-ascii?Q?orf/EAvRvWMCuMpKcZDMrC8JamdsAoeiGXp1XCfS/BH1dYkdXVZ3dvmIdmzI?=
 =?us-ascii?Q?Ktsy0j8okFTVBUp20if59UIX6GZ7Ta3dDzxTbkh3AuMdBbqDtAQ9oFvZ320g?=
 =?us-ascii?Q?D0GQWBpjQ3rJa5/AJ8G/cNyrr//Wki3ymgFX2MGKXMjYqDxI0hWt5Le0CFw0?=
 =?us-ascii?Q?fSqVMpbo9qXF72lf5cnFO0BpCUA77Jji0oHchbPaLBeCXMZq5kGPw+ch70Rz?=
 =?us-ascii?Q?Haze?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1A59F816D87A84A99C41C89AD6ECFCF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6252
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3b6bbba-50be-4529-28c1-08d89d215c7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pGQTlzeX9RSL3sHzUnt9ffgVpUKBRnvBNF+Rjyub8Bx7beNKymg4ZSAk9X7ViMaUootcjAG1oM/qSsfr5HFkbyZcr7er+AKFC303YnvRif0Jd8maXKxi/OVlvoknyJAN2unwJKWNl1wYCSPoxV/tSTZ4r1MkDRJ0xPktuSKCMNnZCP2IctDULjRoKMXGJMab0oFgApX2UVst2nqkQP0HKXovLTFWmOu+byC636owipp1VJpKpj7a9Rvqs4XPqe67oIaavWHeitQg02NolsOPB5cnrJYqFTGwYS2A1KSQnW2EsBoS5N7LlfUyp1r0AlH9QvkfUxN0dx2UsttzL+43iHDa5V0CwB2ottPjvlKwicioYFcCXrvk1EJ6FqKt3GEEW84VWrsizOqRVnauOq566w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(33656002)(356005)(54906003)(36756003)(8676002)(8936002)(6486002)(86362001)(70586007)(6512007)(186003)(81166007)(2906002)(316002)(6506007)(26005)(478600001)(2616005)(107886003)(53546011)(82310400003)(4326008)(6862004)(47076004)(82740400003)(70206006)(5660300002)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:36:35.8225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beff5c9-73ea-476f-f224-08d89d2160e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968

Hi Julien,

> On 9 Dec 2020, at 23:17, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/12/2020 16:31, Bertrand Marquis wrote:
>> Activate TID3 bit in HSR register when starting a guest.
>=20
> s/HSR/HCR/
>=20

Right, I did it a lot thanks for the review.
I will fix that in V4.

>> This will trap all coprecessor ID registers so that we can give to guest
>> values corresponding to what they can actually use and mask some
>> features to guests even though they would be supported by the underlying
>> hardware (like SVE or MPAM).
>=20
> So this will make sure the guest will not be able to identify the feature=
. Did you check that the features are effectively not accessible by the gue=
st? IOW it should trap.

For SVE yes I checked and with the serie a Linux kernel with SVE support ac=
tivated on a target with SVE is now working (was crashing before).
For MPAM, I have no target available with MPAM support so I could not test =
that but your recent XSA patch did turn the access to the guest off.

With my SVE test, I could confirm that access are trapped and properly emul=
ated.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


