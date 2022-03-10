Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01CE4D4646
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 12:49:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288301.488934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHHX-0005b1-Ao; Thu, 10 Mar 2022 11:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288301.488934; Thu, 10 Mar 2022 11:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHHX-0005Y7-6R; Thu, 10 Mar 2022 11:48:35 +0000
Received: by outflank-mailman (input) for mailman id 288301;
 Thu, 10 Mar 2022 11:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sG2=TV=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nSHHV-0005Y1-ON
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 11:48:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019b9f84-a068-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 12:48:31 +0100 (CET)
Received: from AM5PR0601CA0044.eurprd06.prod.outlook.com
 (2603:10a6:203:68::30) by PA4PR08MB5902.eurprd08.prod.outlook.com
 (2603:10a6:102:e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 11:48:28 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::18) by AM5PR0601CA0044.outlook.office365.com
 (2603:10a6:203:68::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 11:48:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 11:48:28 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 10 Mar 2022 11:48:28 +0000
Received: from cebf5f71ebe2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1ACDE381-145D-492A-B377-0ADA3F3B6EB5.1; 
 Thu, 10 Mar 2022 11:48:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cebf5f71ebe2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Mar 2022 11:48:17 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM9PR08MB6291.eurprd08.prod.outlook.com
 (2603:10a6:20b:284::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 11:48:15 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5038.027; Thu, 10 Mar
 2022 11:48:15 +0000
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
X-Inumbo-ID: 019b9f84-a068-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpJGoNss4Yfq+O4dv5c/humRFEFAwNVxVOavAl1Oh8I=;
 b=pubq6pdn0yIk75kbreUJ6Vp6FAIJ1AUiraVbRBQ5cYciBbbp7d2hV4aSVzkVDk0m/qv50FzC8cUssftAJVGLCrh1y7WJ8HLP4MlwZ2ROZklOTCwykaFKEqOpxyGYBw9jB0P9mjHosXX27br5SCd0AH6cCL81IvN/MIXS9gPeTwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2a2e3417b493904
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGMcBsP6iDgNInmaFe9jhB7PDdym/OCePvHzk+Y1I1Wlx1YEfDll9Abpg0oyK0m79ufHEMGrx3lkxbfJMtgDnIPRDj30USyXxg8JQRtyF6+/OjNIgVWLfmvGwSqKV8MSJCa1AW5l3JnTLuDkpEsgZJBZTIeesVAmOw/C4mzLq/KfdmCBnPjzB2utEkgGNFRnT8mpc0YwqKjxOtWYZvdQxykD3XkX7F4TSlhdUVF0sE4497Emb+mvnqbT1EutBcH73pADDzIWI6SdUtXlTkx6kiYJPDszavxzV+zOiEV9LDluHaANOfydo4UKmkgNCJY1NgsQTmbtGT5HMxZSdlpmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpJGoNss4Yfq+O4dv5c/humRFEFAwNVxVOavAl1Oh8I=;
 b=W9v6o4XBtbMj5RkpWL10LcCJynoJJpU6eFRlltWU7KkvNX1FPvGSdCvAQMChz7I4+DbUnjPl28+44EL5Wwt+bRX+O7cU9TKenspShmiZRfCmomL0samKnvoz0JCDt9WzLge5eyf7f/oUFwRTyAwd6MzmqBxjbgAetaLGYsojvYJ2I1eXlMlB5auPAnbot6vxBqmDp4lRy+2fJR93wRMmBuynaVelQObBwrpBwsEXu30yVM0hV2W/tMUwo27H71vl53Wx34MGiQxWNIPfx4IStwxr05O5bCV4iY4RLUmMetM5huMmbUbXmo4Rw+FEvDPMUCEwu/1mTyrGWHCQq78LIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpJGoNss4Yfq+O4dv5c/humRFEFAwNVxVOavAl1Oh8I=;
 b=pubq6pdn0yIk75kbreUJ6Vp6FAIJ1AUiraVbRBQ5cYciBbbp7d2hV4aSVzkVDk0m/qv50FzC8cUssftAJVGLCrh1y7WJ8HLP4MlwZ2ROZklOTCwykaFKEqOpxyGYBw9jB0P9mjHosXX27br5SCd0AH6cCL81IvN/MIXS9gPeTwY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index:
 AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQCAAAXLAIADUEkAgAD5MYCACAnKAIAAAqaAgABc6ACAAAR3gIABSkMA
Date: Thu, 10 Mar 2022 11:48:15 +0000
Message-ID: <500E2C83-DC6E-47C0-B345-D03F67472196@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
 <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
 <YijQc9DejYAo3EcS@Air-de-Roger>
In-Reply-To: <YijQc9DejYAo3EcS@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 694b6d5a-fed4-40aa-3494-08da028be489
x-ms-traffictypediagnostic:
	AM9PR08MB6291:EE_|AM5EUR03FT034:EE_|PA4PR08MB5902:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB590239DECA04E2DC8A455B0BFC0B9@PA4PR08MB5902.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bpEKc8FGABDsyhvRUzgdkP4fPd52FcSc2IMQrshnd60Xc/EbNP6JNhkPTwW6Ptp27tZ5LOAHXoDpwErzd0feD59u5rRUTq04dMqzWQxXT9fH2wY4mj7jhLF/MJLiq7UUzKa0KKMYHVsfAwsJwEvPUW6uZV5ror+KDDx53SCBZ1eayTl5Yp8fK7yxvZxdz/hHE60HwfrYRjTurEQwmty/u1FKTBDu5lBvAAwt4gz0NCBo/eQUS0iXupuHLU98UKXDPlEpgBMKp1EkfzXwGgvmb8ZlMUtb/nL07kn6SbJp9OTOFqX8I9LPx/DkL97jJD/yIxxanBEy2nzZxwRkuS9n4NNwA75SAdGF5tu66ZqBbUlAnr8t+i03qHQXQvRhp91nmU7KR3a3tTcCAypx/poHo02ReYysFI5hJbbDJReITg3Tf1XWglhpsqgAaTwbXLFCzxIDXdhwxAdNqnohBKiKjPIb2D7BPeRgYN+ICS83L/ng+72KLkZMFDAg82+P2oCX65XUVI7bMoxx3KRB53/KHKgmqJe1Rprrppci8Dy4Co+TTwc0Sz02crHYEBUxEZm/ZBz6QI3EhGTQh+Wx9PwIzxpjVlwSTBrPt614k+2af0ugDy4mPbanG/gE0d4KrEx87PRKmNsZ9DeoiP5mrWBk8jIyg6IOH/VDhn/dFTbCMXFfM2uG1/9ngXezYXnSLee5x7mQ1//uvwsMeJr27lcuco+1u7g0t304zUTvf+JZFx5n5U4YlvugRT5bmKlVU97P
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(76116006)(54906003)(6916009)(316002)(8936002)(66476007)(66446008)(66556008)(66946007)(36756003)(91956017)(5660300002)(2906002)(6512007)(6486002)(33656002)(6506007)(83380400001)(86362001)(186003)(26005)(2616005)(4326008)(64756008)(38070700005)(122000001)(53546011)(508600001)(71200400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C62166E65C4FCB43852B3EF38DC77857@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6291
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	670c5e8e-45d6-4397-d3ad-08da028bdcd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5CwIvkAjyG98Ipcc1GX+tftZ8wI9nKmlqsDV2kh9NqK9pY39Z6B8q0BaUrtf1BwIennnGM0FGGR2k8Mg7arg965cf/oh41SGzeTmdxyuVTP6LlvGX/lj6MYa9MtgPG3bi5vG/roZepDCKZBARP33I19+L9rrJOx+kG9AjTXr0VS+NXMqWHBwpNuxJV3kVQ8vFhNBnr8wWE86Z/ABMVUDOSWrRJIbJO5i9Y3zCJ/vbdAU/Wm9B9XjWyiJd4Dwm/GQYdhWSsoVJ/Pe5hgQP4yfL0H9ldyxOiYVhRRQX9ykSIwx8rhu9aaG+8lbLOtbzYA/reMUtkFquMhTCnkVPuyL/Q5RqHCn2xNuoZr1tS/hBbSvYPYFTD5AkWIiehsGvbmHbkmDHhVpdp3SD7XBfVEmEvSmg07Vt2PRl4CuNK8QEvzCqaIHSHEI1UjkBsrsy3PW5qnqbDqkuAChhhglH4GikigFXt7v0GvSsoSfPfuENXP8MhsWRfPsTM1H5n+2f/Uxz8/8+pqyPuk/uronJpuIDA/HhKwTXi2sQensxwz1Ch/9+NkBfCDZYulUYLL3NsM6FJHZs1sceqaJ3pl+LAOScWWDEXTRutoy0XKf73r8Zu75LRKsY8nypkG7p0Qy0ObJ9ZY4YkpKoh9TggW3nczmSrl7m+aA0gmCmMf72MVGF3d+pNRzrRBOi7E5nx8PJaqr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(6862004)(8676002)(33656002)(8936002)(70586007)(70206006)(81166007)(316002)(356005)(5660300002)(36756003)(54906003)(4326008)(36860700001)(6486002)(86362001)(40460700003)(508600001)(2616005)(47076005)(6506007)(6512007)(53546011)(26005)(186003)(83380400001)(336012)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:48:28.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 694b6d5a-fed4-40aa-3494-08da028be489
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5902

SGVsbG8gUm9nZXIsDQoNCj4gT24gOSBNYXIgMjAyMiwgYXQgNDowNiBwbSwgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBNYXIgMDks
IDIwMjIgYXQgMDM6NTA6MTJQTSArMDAwMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKYW4s
DQo+PiANCj4+PiBPbiA5IE1hciAyMDIyLCBhdCAxMDoxNyBhbSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwOS4wMy4yMDIyIDExOjA4LCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+Pj4gSGkgSmFuLA0KPj4+PiANCj4+Pj4+IE9uIDQgTWFyIDIwMjIs
IGF0IDc6MjMgYW0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+
PiANCj4+Pj4+IE9uIDAzLjAzLjIwMjIgMTc6MzEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+
PiBPbiAxIE1hciAyMDIyLCBhdCAxOjU1IHBtLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOg0KPj4+Pj4+PiBPbiAwMS4wMy4yMDIyIDE0OjM0LCBSYWh1bCBTaW5naCB3cm90
ZToNCj4+Pj4+Pj4+PiBPbiAyNCBGZWIgMjAyMiwgYXQgMjo1NyBwbSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAxNS4wMi4yMDIyIDE2OjI1LCBS
YWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNp
LmMNCj4+Pj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXNpLmMNCj4+Pj4+Pj4+Pj4g
QEAgLTkyNSw0ICs5MjUsMTA2IEBAIGludCB2cGNpX21zaXhfYXJjaF9wcmludChjb25zdCBzdHJ1
Y3QgdnBjaV9tc2l4ICptc2l4KQ0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gcmV0dXJuIDA7DQo+
Pj4+Pj4+Pj4+IH0NCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiAraW50IHZwY2lfbWFrZV9tc2l4
X2hvbGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+
Pj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBkZXYtPmRvbWFpbjsNCj4+Pj4+Pj4+Pj4gKyAg
ICB1bnNpZ25lZCBpbnQgaTsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIGlmICggIXBk
ZXYtPnZwY2ktPm1zaXggKQ0KPj4+Pj4+Pj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+Pj4+Pj4+
Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIC8qIE1ha2Ugc3VyZSB0aGVyZSdzIGEgaG9sZSBmb3IgdGhl
IE1TSVggdGFibGUvUEJBIGluIHRoZSBwMm0uICovDQo+Pj4+Pj4+Pj4+ICsgICAgZm9yICggaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKHBkZXYtPnZwY2ktPm1zaXgtPnRhYmxlcyk7IGkrKyApDQo+Pj4+
Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4+PiArICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0ID0g
UEZOX0RPV04odm1zaXhfdGFibGVfYWRkcihwZGV2LT52cGNpLCBpKSk7DQo+Pj4+Pj4+Pj4+ICsg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kID0gUEZOX0RPV04odm1zaXhfdGFibGVfYWRkcihwZGV2
LT52cGNpLCBpKSArDQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm1zaXhfdGFibGVfc2l6ZShwZGV2LT52cGNpLCBpKSAtIDEpOw0KPj4+Pj4+Pj4+PiAr
DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIGZvciAoIDsgc3RhcnQgPD0gZW5kOyBzdGFydCsrICkNCj4+
Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgcDJtX3R5cGVfdCB0
Ow0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgbWZuX3QgbWZuID0gZ2V0X2dmbl9xdWVyeShkLCBz
dGFydCwgJnQpOw0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICBzd2l0Y2gg
KCB0ICkNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIHsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAg
IGNhc2UgcDJtX21taW9fZG06DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICBjYXNlIHAybV9pbnZh
bGlkOg0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgY2FzZSBwMm1fbW1pb19kaXJlY3Q6DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICAgaWYgKCBtZm5feChtZm4pID09IHN0YXJ0ICkNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGNsZWFyX2lkZW50aXR5X3AybV9l
bnRyeShkLCBzdGFydCk7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0K
Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAvKiBmYWxsdGhyb3VnaC4gKi8NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGRlZmF1bHQ6DQo+
Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgcHV0X2dmbihkLCBzdGFydCk7DQo+Pj4+Pj4+Pj4+
ICsgICAgICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywNCj4+Pj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICIlcHA6IGV4aXN0aW5nIG1hcHBpbmcgKG1mbjogJSIgUFJJ
X21mbg0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgInR5cGU6ICVkKSBhdCAl
I2x4IGNsb2JiZXJzIE1TSVggTU1JTyBhcmVhXG4iLA0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgJnBkZXYtPnNiZGYsIG1mbl94KG1mbiksIHQsIHN0YXJ0KTsNCj4+Pj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgICByZXR1cm4gLUVFWElTVDsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAg
ICAgIH0NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIHB1dF9nZm4oZCwgc3RhcnQpOw0KPj4+Pj4+
Pj4+PiArICAgICAgICB9DQo+Pj4+Pj4+Pj4+ICsgICAgfQ0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+
Pj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4g
Li4uIG5vdGhpbmcgaW4gdGhpcyBmdW5jdGlvbiBsb29rcyB0byBiZSB4ODYtc3BlY2lmaWMsIGV4
Y2VwdCBtYXliZQ0KPj4+Pj4+Pj4+IGZ1bmN0aW9ucyBsaWtlIGNsZWFyX2lkZW50aXR5X3AybV9l
bnRyeSgpIG1heSBub3QgY3VycmVudGx5IGJlIGF2YWlsYWJsZQ0KPj4+Pj4+Pj4+IG9uIEFybS4g
QnV0IHRoaXMgZG9lc24ndCBtYWtlIHRoZSBjb2RlIHg4Ni1zcGVjaWZpYy4NCj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4gSSB3aWxsIG1heWJlIGJlIHdyb25nIGJ1dCB3aGF0IEkgdW5kZXJzdGFuZCBmcm9t
IHRoZSBjb2RlIGlzIHRoYXQgZm9yIHg4NiANCj4+Pj4+Pj4+IGlmIHRoZXJlIGlzIG5vIHAybSBl
bnRyaWVzIHNldHVwIGZvciB0aGUgcmVnaW9uLCBhY2Nlc3NlcyB0byB0aGVtIHdpbGwgYmUgdHJh
cHBlZCANCj4+Pj4+Pj4+IGludG8gdGhlIGh5cGVydmlzb3IgYW5kIGNhbiBiZSBoYW5kbGVkIGJ5
IHNwZWNpZmljIE1NSU8gaGFuZGxlci4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gQnV0IGZvciBBUk0g
d2hlbiB3ZSBhcmUgcmVnaXN0ZXJpbmcgdGhlIE1NSU8gaGFuZGxlciB3ZSBoYXZlIHRvIHByb3Zp
ZGUgDQo+Pj4+Pj4+PiB0aGUgR1BBIGFsc28gZm9yIHRoZSBNTUlPIGhhbmRsZXIuIA0KPj4+Pj4+
PiANCj4+Pj4+Pj4gUXVlc3Rpb24gaXM6IElzIHRoaXMganVzdCBhbiBlZmZlY3QgcmVzdWx0aW5n
IGZyb20gZGlmZmVyZW50IGltcGxlbWVudGF0aW9uLA0KPj4+Pj4+PiBvciBhbiBpbmhlcmVudCBy
ZXF1aXJlbWVudD8gSW4gdGhlIGZvcm1lciBjYXNlLCBoYXJtb25pemluZyB0aGluZ3MgbWF5IGJl
IGFuDQo+Pj4+Pj4+IGFsdGVybmF0aXZlIG9wdGlvbi4NCj4+Pj4+PiANCj4+Pj4+PiBUaGlzIGlz
IGFuIGluaGVyZW50IHJlcXVpcmVtZW50IHRvIHByb3ZpZGUgYSBHUEEgd2hlbiByZWdpc3Rlcmlu
ZyB0aGUgTU1JTyBoYW5kbGVyLg0KPj4+Pj4gDQo+Pj4+PiBTbyB5b3UgZmlyc3Qgc2F5IHllcyB0
byBteSAiaW5oZXJlbnQiIHF1ZXN0aW9uLCBidXQgdGhlbiAuLi4NCj4+Pj4+IA0KPj4+Pj4+IEZv
ciB4ODYgbXNpeCBtbWlvIGhhbmRsZXJzIGlzIHJlZ2lzdGVyZWQgaW4gaW5pdF9tc2l4KC4uKSBm
dW5jdGlvbiBhcyB0aGVyZSBpcyBubyByZXF1aXJlbWVudA0KPj4+Pj4+IG9uIHg4NiB0byBwcm92
aWRlIEdQQSB3aGVuIHJlZ2lzdGVyaW5nIHRoZSBoYW5kbGVyLiBMYXRlciBwb2ludCBvZiB0aW1l
IHdoZW4gQkFScyBhcmUgY29uZmlndXJlZA0KPj4+Pj4+IGFuZCBtZW1vcnkgZGVjb2RpbmcgYml0
IGlzIGVuYWJsZWQgdnBjaV9tYWtlX21zaXhfaG9sZSgpIHdpbGwgY2xlYXIgdGhlIGlkZW50aXR5
IG1hcHBpbmcgZm9yIG1zaXgNCj4+Pj4+PiBiYXNlIHRhYmxlIGFkZHJlc3Mgc28gdGhhdCBhY2Nl
c3MgdG8gbXNpeCB0YWJsZXMgd2lsbCBiZSB0cmFwcGVkLg0KPj4+Pj4+IA0KPj4+Pj4+IE9uIEFS
TSB3ZSBuZWVkIHRvIHByb3ZpZGUgR1BBIHRvIHJlZ2lzdGVyIHRoZSBtbWlvIGhhbmRsZXIgYW5k
IE1TSVggdGFibGUgYmFzZQ0KPj4+Pj4+IGFkZHJlc3MgaXMgbm90IHZhbGlkIHdoZW4gaW5pdF9t
c2l4KCkgaXMgY2FsbGVkIGFzIEJBUiB3aWxsIGJlIGNvbmZpZ3VyZWQgbGF0ZXIgcG9pbnQgaW4g
dGltZS4NCj4+Pj4+PiBUaGVyZWZvcmUgb24gQVJNIG1taW8gaGFuZGxlciB3aWxsIGJlIHJlZ2lz
dGVyZWQgaW4gZnVuY3Rpb24gdnBjaV9tYWtlX21zaXhfaG9sZSgpIHdoZW4NCj4+Pj4+PiBtZW1v
cnkgZGVjb2RpbmcgYml0IGlzIGVuYWJsZWQuDQo+Pj4+PiANCj4+Pj4+IC4uLiB5b3UgZXhwbGFp
biBpdCdzIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbC4gSSdtIGluY2xpbmVkIHRvDQo+Pj4+PiBz
dWdnZXN0IHRoYXQgeDg2IGFsc28gcGFzcyB0aGUgR1BBIHdoZXJlIHBvc3NpYmxlLiBIYW5kbGVy
IGxvb2t1cA0KPj4+Pj4gcmVhbGx5IHdvdWxkIGJlbmVmaXQgZnJvbSBub3QgbmVlZGluZyB0byBp
dGVyYXRlIG92ZXIgYWxsIHJlZ2lzdGVyZWQNCj4+Pj4+IGhhbmRsZXJzLCB1bnRpbCBvbmUgY2xh
aW1zIHRoZSBhY2Nlc3MuIFRoZSBvcHRpbWl6YXRpb24gcGFydCBvZiB0aGlzDQo+Pj4+PiBvZiBj
b3Vyc2UgZG9lc24ndCBuZWVkIHRvIGJlIGRvbmUgcmlnaHQgaGVyZSwgYnV0IGhhcm1vbml6aW5n
DQo+Pj4+PiByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoKSBiZXR3ZWVuIGJvdGggYXJjaGl0ZWN0dXJl
cyB3b3VsZCBzZWVtIHRvIGJlDQo+Pj4+PiBhIHJlYXNvbmFibGUgcHJlcmVxIHN0ZXAuDQo+Pj4+
IA0KPj4+PiBJIGFncmVlIHdpdGggeW91IHRoYXQgaWYgd2UgbW9kaWZ5IHRoZSByZWdpc3Rlcl9t
bWlvX2hhbmRsZXIoKSBmb3IgeDg2IHRvIHBhc3MgR1BBDQo+Pj4+IHdlIGNhbiBoYXZlIHRoZSBj
b21tb24gY29kZSBmb3IgeDg2IGFuZCBBUk0gYW5kIGFsc28gd2UgY2FuIG9wdGltaXplIHRoZSBN
TUlPDQo+Pj4+IHRyYXAgaGFuZGxpbmcgZm9yIHg4Ni4NCj4+Pj4gDQo+Pj4+IFdoYXQgSSB1bmRl
cnN0YW5kIGZyb20gdGhlIGNvZGUgaXMgdGhhdCBtb2RpZnlpbmcgdGhlIHJlZ2lzdGVyX21taW9f
aGFuZGxlcigpIGZvcg0KPj4+PiB4ODYgdG8gcGFzcyBHUEEgcmVxdWlyZXMgYSBsb3Qgb2YgZWZm
b3J0IGFuZCB0ZXN0aW5nLg0KPj4+PiANCj4+Pj4gVW5mb3J0dW5hdGVseSwgSSBoYXZlIGFub3Ro
ZXIgaGlnaCBwcmlvcml0eSB0YXNrIHRoYXQgSSBoYXZlIHRvIGNvbXBsZXRlIEkgZG9u4oCZdCBo
YXZlIHRpbWUNCj4+Pj4gdG8gb3B0aW1pc2UgdGhlIHJlZ2lzdGVyX21taW9faGFuZGxlcigpIGZv
ciB4ODYgYXQgdGhpcyB0aW1lLg0KPj4+IA0KPj4+IEFjdHVhbGx5IG1ha2luZyB1c2Ugb2YgdGhl
IHBhcmFtZXRlciBpcyBub3RoaW5nIEkgd291bGQgZXhwZWN0IHlvdSB0bw0KPj4+IGRvLiBCdXQg
aXMganVzdCBhZGRpbmcgdGhlIGV4dHJhIHBhcmFtZXRlciBzaW1pbGFybHkgb3V0IG9mIHNjb3Bl
IGZvcg0KPj4+IHlvdT8NCj4+PiANCj4+IA0KPj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB5
b3UgYXJlIGFza2luZyB0byBtYWtlIHJlZ2lzdGVyX21taW9faGFuZGxlcigpIGRlY2xhcmF0aW9u
DQo+PiBzYW1lIGZvciB4ODYgYW5kIEFSTS4gWW91IGFyZSBub3QgYXNraW5nIHRvIG1vZGlmeSB0
aGUgeDg2IE1NSU8gaGFuZGxlciBsb2dpYyB0bw0KPj4gdXNlIEdQQSB0byBmaW5kIHRoZSBoYW5k
bGVyPw0KPj4gDQo+PiBBcyBSb2dlciBhbHNvIG1lbnRpb25lZCB0aGF0IHZwY2lfbWFrZV9tc2l4
X2hvbGUoKSBpcyByZXF1aXJlZCBvbmx5IGZvciB4ODYgdG8gY2xlYXINCj4+IHRoZSBpZGVudGl0
eSBtYXBwaW5nLiBJZiB3ZSBtYWtlIHRoZSB2cGNpX21ha2VfbXNpeF9ob2xlKCkgYXJjaC1zcGVj
aWZpYyB0aGVyZSBpcyBubw0KPj4gbmVlZCB0byBtb2RpZnkgdGhlIHBhcmFtZXRlciBmb3IgcmVn
aXN0ZXJfbW1pb19oYW5kbGVyKCksIGFzIGZvciB4ODYgYW5kIEFSTQ0KPj4gcmVnaXN0ZXJfbW1p
b19oYW5kbGVyKCkgd2lsbCBiZSBjYWxsZWQgaW4gZGlmZmVyZW50IHBsYWNlcy4NCj4+IA0KPj4g
Rm9yIHg4NiByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoKSB3aWxsIGJlIGNhbGxlZCBpbiBpbml0X21z
aXgoKSB3aGVyZWFzIGZvciBBUk0NCj4+IHJlZ2lzdGVyX21taW9faGFuZGxlcigpIHdpbGwgYmUg
Y2FsbGVkICBpbiB2cGNpX21ha2VfbXNpeF9ob2xlKCkuIEluIHRoaXMgY2FzZSB3ZQ0KPj4gaGF2
ZSB0byBtb3ZlIHRoZSBjYWxsIHRvIHJlZ2lzdGVyX21taW9faGFuZGxlcigpIGFsc28gdG8gYXJj
aC1zcGVjaWZpYyBmaWxlcy4gSWYgd2UgbW92ZQ0KPj4gdGhlIHJlZ2lzdGVyX21taW9faGFuZGxl
cigpICB0byBhcmNoIHNwZWNpZmljIGZpbGUgdGhlcmUgaXMgbm8gbmVlZCB0byBtYWtlIHRoZQ0K
Pj4gZnVuY3Rpb24gY29tbW9uLg0KPiANCj4gU28gdGhlbiBmb3IgQXJtIHlvdSB3aWxsIG5lZWQg
c29tZXRoaW5nIGFraW4gdG8NCj4gdW5yZWdpc3Rlcl9tbWlvX2hhbmRsZXIgc28gdGhlIGhhbmRs
ZXIgY2FuIGJlIHJlbW92ZWQgd2hlbiBtZW1vcnkNCj4gZGVjb2RpbmcgaXMgZGlzYWJsZWQ/DQo+
IA0KPiBPciBlbHNlIHlvdSB3b3VsZCBrZWVwIGFkZGluZyBuZXcgaGFuZGxlcnMgZXZlcnkgdGlt
ZSB0aGUgZ3Vlc3QNCj4gZW5hYmxlcyBtZW1vcnkgZGVjb2RpbmcgZm9yIHRoZSBkZXZpY2Ugd2l0
aG91dCBoYXZpbmcgcmVtb3ZlZCB0aGUNCj4gc3RhbGUgb25lcz8NCg0KWWVzLCB3aGVuIEkgd2ls
bCBzZW5kIHRoZSBwYXRjaGVzIGZvciBBUk0gSSB3aWxsIHRha2UgY2FyZSBvZiB0aGlzIG5vdCB0
byByZWdpc3RlciB0aGUgaGFuZGxlciANCmFnYWluIGlmIHRoZSBtZW1vcnkgZGVjb2RpbmcgYml0
IGlzIGNoYW5nZWQuIEJlZm9yZSByZWdpc3RlcmluZyB0aGUgaGFuZGxlciB3aWxsIGNoZWNrIA0K
aWYgdGhlIGhhbmRsZXIgaXMgYWxyZWFkeSBmb3IgR1BBIGlmIGl0IGlzIGFscmVhZHkgcmVnaXN0
ZXJlZCBubyBuZWVkIHRvIHJlZ2lzdGVyLg0KDQpSZWdhcmRzLA0KUmFodWwNCj4gDQo+IFRoYW5r
cywgUm9nZXIuDQoNCg==

