Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588C31D883
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86225.161709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCL9p-0005c5-D9; Wed, 17 Feb 2021 11:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86225.161709; Wed, 17 Feb 2021 11:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCL9p-0005bi-9v; Wed, 17 Feb 2021 11:38:13 +0000
Received: by outflank-mailman (input) for mailman id 86225;
 Wed, 17 Feb 2021 11:38:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrto=HT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lCL9n-0005bd-JT
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:38:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2c40c3b-ac2f-4c0f-b5d7-5a287013461d;
 Wed, 17 Feb 2021 11:38:09 +0000 (UTC)
Received: from DB6PR0802CA0036.eurprd08.prod.outlook.com (2603:10a6:4:a3::22)
 by VI1PR08MB3472.eurprd08.prod.outlook.com (2603:10a6:803:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 11:38:07 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::d4) by DB6PR0802CA0036.outlook.office365.com
 (2603:10a6:4:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 11:38:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 11:38:06 +0000
Received: ("Tessian outbound fb307b4548b2:v71");
 Wed, 17 Feb 2021 11:38:06 +0000
Received: from ddd18b687afb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7AF98EF7-189B-4D9F-ABCA-F473FACADEBA.1; 
 Wed, 17 Feb 2021 11:38:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddd18b687afb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Feb 2021 11:38:01 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1981.eurprd08.prod.outlook.com (2603:10a6:800:89::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 11:38:00 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 11:37:59 +0000
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
X-Inumbo-ID: a2c40c3b-ac2f-4c0f-b5d7-5a287013461d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF+AlTdElpX6bajun38j3sEa2fmjFdgbKVXV1GWenE0=;
 b=dd3WrAEhAMRocqaJWwQyB1wgS/YyLLLo+L94HGGZpAx3lajETswWjDY1kopcUnnRZBkgBSbZJVWyEHitQiE9UvZmzYTA6F8HccYkoLFvZgt2ZG13DDL6UV0PB9BhS1qBHW311EOvt/xC4+BMmv7Y6BgUZHPsm6pH6TQH72YiuOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a0711ad9db05bf3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3GdUuE5f7+B71rN25pnVpviZGtiqGMIHKBk5ePyhdvP7YY8dyhuXCt7F/GasRjdq0fJlfBAThXjSCK7ZAFJI1PYryIlPs8fOH81eXIBXAh1mGtR0nbzUPb/6alRL+wrSlnG6VgO6tkXR7Bj5SNdoyxFocIpqheZPzfBYYYNs5ZjlxGIV94a6whzIt7+4aod09aHDG+4/gIn8X1YiDAUTGUYkekf0u/5QAc4Vyj293xAM0kX+9tJWoplS3zpDTtmHIXVKWLWwp2bmilpcQdc7Z7wGVWbpeIqJqh6K8AfEyTrbcLbtFlHkZDlvosdNn4ajIggTIMetDkD1tVhYHAsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF+AlTdElpX6bajun38j3sEa2fmjFdgbKVXV1GWenE0=;
 b=R9HRWrpQVXQLEfUXwox5RRaqT8YL9hEg3aSfsqO2ssj2I4vevVDymlj0lYRprZU5w6PWH3LzgLZRjLJZ5bcCWSTXZIwa6HdTJeLJ4BbSZ5+qRFfazlUdchr00N/pp059ucftupKqNPiv8rdFgzdI6O9gEWvMEgjrCWHGpQghjK7UjDUdQhGzAy1fdcM3OMJTHYbRQgwzXoBceNrXItV7GNhaPEcstCSSUsQ4xCAZeX9SAq8DCuxEo4dgQSvKA4rKjXIlOowELywfdXs6jj1wM3bnpeNXlHNb3l9+d4A/aG7uKU2GzGUvonBAs4T9tVt+FVyBEk6njo01wsx7ahetSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF+AlTdElpX6bajun38j3sEa2fmjFdgbKVXV1GWenE0=;
 b=dd3WrAEhAMRocqaJWwQyB1wgS/YyLLLo+L94HGGZpAx3lajETswWjDY1kopcUnnRZBkgBSbZJVWyEHitQiE9UvZmzYTA6F8HccYkoLFvZgt2ZG13DDL6UV0PB9BhS1qBHW311EOvt/xC4+BMmv7Y6BgUZHPsm6pH6TQH72YiuOY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm : smmuv3: Fix to handle multiple StreamIds per
 device.
Thread-Topic: [PATCH] xen/arm : smmuv3: Fix to handle multiple StreamIds per
 device.
Thread-Index: AQHXBRR8dZBOnjHcyUSWoTi7lR9udKpcOIQA
Date: Wed, 17 Feb 2021 11:37:59 +0000
Message-ID: <5145C563-A8AA-41B1-8EBB-B32D1FFC2219@arm.com>
References:
 <43de5b58df37d8b8de037cb23c47ab8454caf37c.1613492577.git.rahul.singh@arm.com>
In-Reply-To:
 <43de5b58df37d8b8de037cb23c47ab8454caf37c.1613492577.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 331a3eda-9853-438a-d917-08d8d3387eae
x-ms-traffictypediagnostic: VI1PR0801MB1981:|VI1PR08MB3472:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB34729722E09AD9BB650E10F19D869@VI1PR08MB3472.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VfILVkqKGslMLAjXkigTiyCdRiZHXcUYrjUVt+b9qz/TOkUGcKix4UxhKCDDPH0bk5ugluYAwXDGXCBfsurxjTCuhi2cz/5HJkQ3Mlm9Q38yQK96j13/U3L/wAzzC4MppwdeG8Kwx/1SleZktwL3ZqarOsO9G+ONMMGIzHH2Eb23qeHT6Xokozl2FKOwJzx73klLWkagdNtd51eEblaGnyqHs8XaMfUhxos4CO0Krn0I4+WsucbGAT+HMrgZEFoKZJICC1KxEpgrLQwPdRAORQKhGyP6b/djY24YhNggFi3AMTUufKMuc0pK7mdy0gjttMjhTwF9VXgPR7aS9NuOXzbAnGFNUaNahnVJx6/zNC809NTxNSi4fkcq/sJ08+D6JvOaeBxX6mDggq6vjcz6r0MzaXdy6+kFDcvvYDXchBZYJWvd0HqSgKLsPdOR5WUT5jsCwhO6yuv6avfvNSEhKOwCX+ulxr4C47l4Wa0G8wcLP3xn6VKpBboWpuu9lFlUQ2Q4jpGF/Enzw7ZLX3DwwgNcH0ziR27S25ax9UqPp39gb7h2UynEW3+fLJntzQgH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(53546011)(8676002)(26005)(6636002)(4326008)(33656002)(76116006)(86362001)(55236004)(71200400001)(8936002)(6506007)(6862004)(2616005)(6486002)(478600001)(186003)(66446008)(37006003)(2906002)(83380400001)(66556008)(316002)(66946007)(66476007)(91956017)(5660300002)(6512007)(54906003)(36756003)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?5k5ST2449UjZ//CejpvVK3yD6tSDIMV3hatYouAsgJjjMDzA+UrxIx7uGOvj?=
 =?us-ascii?Q?1KPlIRu2m6niEG/8+0eGi1GonuvQ73K0BCcb1ItNPjXZftTvYmuA70W/Hc6n?=
 =?us-ascii?Q?HI7UhfuiIqGvprxVk7TnUsqdZ9Zld8Zo1s3WF16uIYez+6va12GetMNQK4rx?=
 =?us-ascii?Q?+jBx8Q6KSQQNhqE8uuAQqhEPaJPHyo+u8NtFu2OFLB9Xjhvy6gXKAAvhXJzz?=
 =?us-ascii?Q?JLssElhf7VIZ4RhHUWE28cBvXfUe5UkaKPn+5jGzescqVYCdjwH4rEuOpay2?=
 =?us-ascii?Q?lKAEiGXFPJz85NW0i3bntqXEbjQuiagFFp/tjqsXujWQRQG5zkQFYYuDA6oQ?=
 =?us-ascii?Q?kk9fkLMxnHhZ8nGKflimvNuFCoLrNTicn1Z8ajlGVF1msBkGHzUVGZiFvyip?=
 =?us-ascii?Q?Xc0PQkoQwrondTA/Ba9UI0vWj4Glqctv4mGFTMSp8ppIVnsIntSPOrEh4Q0W?=
 =?us-ascii?Q?lRUGs0/GBnhxOyQ13HX2vgmh1gEjn19doRZq4PLuFe6bLQ9pcEWBOWd+oPNx?=
 =?us-ascii?Q?4H/GnN17WQN64KrzF2rf3FnldKmc0TNde/frfw0tl9A8fZ8VMXqEJss6vOM+?=
 =?us-ascii?Q?6kzoN45tzCfio1WfNOV1feQatg8eMLFNACtMB++krMWPnlqwnsrgoqwma8+e?=
 =?us-ascii?Q?Fsf+gZu3ah/Nr+9xcJ8U2gcAeT20VSXDVr0LsalPzq+3FT08PLqt53WCj53Q?=
 =?us-ascii?Q?IfQuy19lUXYURrfWapWrrsiDfUpoitO6uj3kq0sK9oVagq5XL6pcGRV0FJHn?=
 =?us-ascii?Q?joTf875tuQbK5ocTKAKHOSpvolEazN3TjAednPc5KSTe+tBPEZ04zkWTE++b?=
 =?us-ascii?Q?vtsiAokgHtVIZ7BOCQS8RQy0ho/n+7M8EbgGK5m1WuONoa1NN2sf06G0HzEA?=
 =?us-ascii?Q?cST+rFlye65dDN6VqCQDLDuQaCO7glb6C7OGFOHX/7KsEA6hNqjkvWzv6Req?=
 =?us-ascii?Q?D8kmO2b+hXoV5YFIakqMoBsC24JcdhmS2itodMpWoR5qTV9p1UvYVFyigyyS?=
 =?us-ascii?Q?4jqPMbOi+sDZSEANpEyAr2V8SDIhz5DANiyZyJIc8bPnEPEj43q76dJEJi3H?=
 =?us-ascii?Q?fvMHlTXeRkNONu31bQkjyfUgh/gov4LOFpY959GHaYgyeu/AQUaqHfXBFVNd?=
 =?us-ascii?Q?yW2ygj8sVnHh6QTjKBixoxNCs6QTU4FxOYaeQy6Xt02cysg/b2e6Mcci4ZPw?=
 =?us-ascii?Q?IOynTtQhotQOc7RLr/pMnp4mAcwND33FASPHB9G4rDqzw+9LGGEVmqIm9SuH?=
 =?us-ascii?Q?kXeUHpNUQkgX9Bb9ZxtOASgsLlLxmatXdthQ6cv7Sy1SVAWIHMgaCtZz9mSF?=
 =?us-ascii?Q?MkT6GUB6ZumTf6tsAGlFHfo3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86E140E06AFC214AB3EA8D2CF28F24F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1981
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0503722-c568-4952-9805-08d8d3387a40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iubWsZQyNfXfLzmDRTeztuFp5Nr+Nc9Uyl23TfMOXNVQhJ7nnfMcm+q3WGNJPbj90KlgMnHl7G/kOol3zsIH0GQIAyBklD2OM0bAeLUnRp5cZDgy199Z046m8Ho5MhH+iYNajPdTOvyTNBX3DlflWROhWaIrGP5BvkhAo0kem9G6RPbqMk6WXXr2XrUjYFRDeflYjpgcIM4bVZvFC4suXGRSn+rT67hhzbVcGwJ7BhqxEGo8JQu+xpvJj7lc6SQjbM2PRVgJ7Wabmi/COJVG0k7pjMMPLA5g8veVqhvlyktcyNJpBTMuglfd2KtI1TEVNUEpK9XMNjty5DITj/4fPTHtSwh2VRNsqjEZshJPgLNOEXyQd3M0IFqQh2g5aCSO31cy4FhIfil4uHP0ztSHx8PIOMg/rcjguHKLL868DT5FNSs1DE49wvEjaHW/2OQzC9oUiRLuajaS5CGAElTd/hdsYDXN4ndEqrI83z4HfGqjs42a2DC2mg1WrIIWnycVhwkRc9XhzLGLVm+vyPR7iNj3xjMB8z7MePi86vmxAhQsFC+AWtN2FhDumm0NOJau1q+FDopgkYB1yd8+XS0ITwbPNHbLJk8K9zEEiHZeEjJAabYa8dgmOk99OiX2aF1w0YABcX3hf95QpWnjNUzgAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(6636002)(6506007)(107886003)(6512007)(86362001)(81166007)(53546011)(82740400003)(2616005)(55236004)(47076005)(336012)(2906002)(33656002)(26005)(70586007)(70206006)(6862004)(478600001)(82310400003)(8936002)(83380400001)(356005)(54906003)(316002)(4326008)(8676002)(36756003)(37006003)(5660300002)(36860700001)(186003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 11:38:06.9872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 331a3eda-9853-438a-d917-08d8d3387eae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3472

Hi Rahul,


> On 17 Feb 2021, at 10:05, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> SMMUv3 driver does not handle multiple StreamId if the master device
> supports more than one StreamID.
>=20
> This bug was introduced when the driver was ported from Linux to XEN.
> dt_device_set_protected(..) should be called from add_device(..) not
> from the dt_xlate(..).
>=20
> Move dt_device_set_protected(..) from dt_xlate(..) to add_device().
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks a lot, this is fixing issues with multiple stream ids for one device=
 :-)

Cheers
Bertrand

> ---
> This patch is a candidate for 4.15 as without this patch it is not possib=
le to
> assign multiple StreamIds to the same device when device is protected beh=
ind
> SMMUv3.
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 29 ++++++++++-----------------
> 1 file changed, 11 insertions(+), 18 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 914cdc1cf4..53d150cdb6 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2207,24 +2207,6 @@ static int arm_smmu_add_device(u8 devfn, struct de=
vice *dev)
> 	 */
> 	arm_smmu_enable_pasid(master);
>=20
> -	return 0;
> -
> -err_free_master:
> -	xfree(master);
> -	dev_iommu_priv_set(dev, NULL);
> -	return ret;
> -}
> -
> -static int arm_smmu_dt_xlate(struct device *dev,
> -				const struct dt_phandle_args *args)
> -{
> -	int ret;
> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> -
> -	ret =3D iommu_fwspec_add_ids(dev, args->args, 1);
> -	if (ret)
> -		return ret;
> -
> 	if (dt_device_is_protected(dev_to_dt(dev))) {
> 		dev_err(dev, "Already added to SMMUv3\n");
> 		return -EEXIST;
> @@ -2237,6 +2219,17 @@ static int arm_smmu_dt_xlate(struct device *dev,
> 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
>=20
> 	return 0;
> +
> +err_free_master:
> +	xfree(master);
> +	dev_iommu_priv_set(dev, NULL);
> +	return ret;
> +}
> +
> +static int arm_smmu_dt_xlate(struct device *dev,
> +				const struct dt_phandle_args *args)
> +{
> +	return iommu_fwspec_add_ids(dev, args->args, 1);
> }
>=20
> /* Probing and initialisation functions */
> --=20
> 2.17.1
>=20


