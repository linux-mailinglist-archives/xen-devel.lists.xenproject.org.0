Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C963877B220
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583224.913309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRjk-000853-8I; Mon, 14 Aug 2023 07:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583224.913309; Mon, 14 Aug 2023 07:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRjk-00081i-4b; Mon, 14 Aug 2023 07:11:36 +0000
Received: by outflank-mailman (input) for mailman id 583224;
 Mon, 14 Aug 2023 07:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVRji-00081c-OC
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:11:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb6102d6-3a71-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:11:31 +0200 (CEST)
Received: from AS9PR05CA0130.eurprd05.prod.outlook.com (2603:10a6:20b:497::10)
 by AS8PR08MB7305.eurprd08.prod.outlook.com (2603:10a6:20b:440::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:11:29 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:497:cafe::56) by AS9PR05CA0130.outlook.office365.com
 (2603:10a6:20b:497::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:11:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Mon, 14 Aug 2023 07:11:28 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 14 Aug 2023 07:11:28 +0000
Received: from 727a02f8e251.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 018E80E7-9860-42BB-9D00-FE5C1D53A8B1.1; 
 Mon, 14 Aug 2023 07:10:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 727a02f8e251.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Aug 2023 07:10:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9956.eurprd08.prod.outlook.com (2603:10a6:20b:637::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:10:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:10:54 +0000
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
X-Inumbo-ID: cb6102d6-3a71-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+Nhf/sUMjd9AAr8fIq1mo4pDvH5OutbGZPqs+yjS9Q=;
 b=60s2+GElvw3sQ2acWngNZfaWUj5W/EP2DFzzvr92+y+F9EjDAiYJnVBjwcw86VT3DX90H2+31OzL1WNeJEvYakOXShBU7EEI53d772jC3U+xPJ350E2CNTCQiDFoF7h1DTsRqb5KDDXiYcjoFoKsSLaM0fMKurNqVjJ/OhrBXqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06ce60e18af6e604
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J68I5m5hWGMTDncq35kb5OYpL1D+xQK6F1fnnrF9DgzOhL2TnC2O6emCfxRVfxy3+5FGXebrek3LzHDJYTeWski14M0BCXdC16PjxvAqRFORfiXZA5m8AfGmbk0Y5kHPQSk+ApfMezkF2N9iAFIxP970TPVfmpVgjNeQ2TawUidF1DvnVeOR7+oGD3X4U52unDgJ7iahXqbSQZTbD7HUmUInNprNYhF7uTZzkjWI+mirRVDFCNLaIGVdaMpwNkOzlzFIS6ivYH/U3hgA3S7fFqiIUbAV/h+niXZBH3/oRmsQE7IDKJMhaEyAZ05dp6fM96Rf3pxkvUV9MbOjQ8qXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+Nhf/sUMjd9AAr8fIq1mo4pDvH5OutbGZPqs+yjS9Q=;
 b=lD2njhso6DsAdkXP4qjjgx7u/Ev8EtmRUgLjkpdRmIwvlz+fo7ywOU0LxE6XqtPKBagcYYXsrOsOK0SW6jnN6GF85JZPeozP7nb/lZXyTRsagwQpl0WAkdkYeeX69puNx4yPKjT8L1UJXPzkPtA+O3U0fy6v4m4Jd0HqlxHMYAgAxW+iFFcpmORFYpPHkiw8h67IwyvtUEGDu+IhSokB3zcxMvX0EP9M1nxR0i3aHZRgt98rfuyRaUmx7roBdi/Z2ibCmoHJf3jskOMXfXW9RvKy4kFdlXE/KLKr+4C4DcHSW/T63BrOTHA7phDI89vb6c2YTA3gCTBYqMtLJ5hqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+Nhf/sUMjd9AAr8fIq1mo4pDvH5OutbGZPqs+yjS9Q=;
 b=60s2+GElvw3sQ2acWngNZfaWUj5W/EP2DFzzvr92+y+F9EjDAiYJnVBjwcw86VT3DX90H2+31OzL1WNeJEvYakOXShBU7EEI53d772jC3U+xPJ350E2CNTCQiDFoF7h1DTsRqb5KDDXiYcjoFoKsSLaM0fMKurNqVjJ/OhrBXqw=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHZzmeUay8NQ4kvrE+CkZdRGQuMz6/pX10AgAAAtIA=
Date: Mon, 14 Aug 2023 07:10:54 +0000
Message-ID: <3926864F-135F-4A6A-889B-767DE9DA7502@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
 <59478354-6805-8a91-776e-93a4cbdb4efb@suse.com>
In-Reply-To: <59478354-6805-8a91-776e-93a4cbdb4efb@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9956:EE_|AM7EUR03FT017:EE_|AS8PR08MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: cea2be8c-151d-4aac-cd71-08db9c95ae33
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rVU+mUiwtdpzd7k8znnHzRmLOIJudDKx/39o7zO7N9aElbaMv585bCNx6pf420/FCCfAuX61rV1MDoQeP+8OCpg9yiF/igvLqxsl1Rv4NkaN1cgeNPh3sgtO3I7VZ8UmOOUVbxRQRJKk++0QzoKtj63uEQNkvQ+9rHU5jdBib7R80ClPGXxh4YdNj+ziecdWFg6fOWjVotq2AYYfQQiwrHKwuJ0L6LAjyDO+ly/LOByrioM6Nr4cVsK//lAzcrfL3b+XopagQkutLuynV/2O3Ul3VxaGoxiYysywXlhCOnMcix/Xmo4TTbmY2dRzKBBTHc4OT/FEbRE0brB54slbTBDGVMCdRTIGKtMSCFh8EJdLGCjqHEHSrfsMgArHP/jh5JhxFf3uOEBpq8XSgulOSlXyDQt7thlu/rolbS5aGsl6ztyAm38KaSXfpj/unMV3FDrUs3+xVtjb12yVc/vaj+PzA1EoKM71jLQWCcdBj+IXQY4GT57ue9z08T5uIhZVFdUlxXl5vEiMFI/S3QKlW9f4SyFRMyD9ED4rFd7vr/O8mKnKj/pQteN+g1+6XzYEppdVbQi6S2alZQ9QNGQDAmDmOwByJfz720VhKwq8oNolGFTrq0s1+TbW3y4/pcdJNlQ917ny7tPksd045+jEXA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(1800799006)(186006)(451199021)(83380400001)(8936002)(41300700001)(91956017)(76116006)(66446008)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(2616005)(26005)(53546011)(6506007)(71200400001)(6486002)(54906003)(122000001)(478600001)(38100700002)(36756003)(33656002)(86362001)(64756008)(6916009)(4326008)(5660300002)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8228812B4A4A27439B35D15C11DF3066@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9956
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	830e86b7-4bfe-4b76-5c8a-08db9c9599b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ii3tm8AyW8MFnOo7cwZ1pjvDIzbuNJuDMDx33U1qNHMzctfElrdemfPZ88+MqZDhZz+hqRDIjMDZvYakrJ4hKU6HWpfnIa+YUCqkxM7mRzfPGE4U8oXdulEr5R3zZtBQnlZJGgB0/9slD4XGouy3eIUuGkhhBIwRtKUS0ZaEKH3vhajucb10qfQ433ye3vJtsAENDEFyf4Qi7NEUvLEsCEzL0hClUAoNQgAaRj9mISCDQGfSWdYRPk5cpaGN0lpaYK/emHFxauKWqfX4PXXlPVJH4eGRiNUttA7eVEXZrTWe447uJ/22K+ljlurbCHyKkwXd7hZf6XpH09/w6YaNzjC5J88XPbhIBGo2Q8KYLe7ANnqcXdCtT26Bso/Id9CNf3+ZFERrf/OnsWymutG7crY7rmSu4UVgHopQNAJsuQoFXjboisqE1TFYEyXwliB3Ip9AoOmC5rhiVxqZWZi3L6lHFu2qozIgZo/j97n19vTpEIxjUzpx1K44CrHmpqux86FHp+oOK0Rn7vklYt53YVabscAdSvv5S+nK5LCn2EgnCUuxhklpn9M7XjSDeOSJ1o+lfsdvGyLqq7f24eAP2WeG49eeUI+bqRwYPncxYiztG1669sMc3ig3bRpOWCEeNAe5dVUCQsAOITfhmGQLAJB2JbDkP6tgW3Qe5o9DQpiaNAhV53XgaYwkjOWHKtaBH+AjOa3KtesaYJexNMspl6mjDBr1R1rYOWTkRgnERlfF7FuqGDAMt5Dk2a9bb8u
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(82310400008)(186006)(1800799006)(451199021)(46966006)(36840700001)(40470700004)(356005)(81166007)(36860700001)(82740400003)(40460700003)(316002)(4326008)(478600001)(54906003)(41300700001)(70206006)(70586007)(6862004)(2906002)(8676002)(33656002)(40480700001)(86362001)(36756003)(6486002)(8936002)(6512007)(336012)(53546011)(26005)(6506007)(5660300002)(2616005)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:11:28.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea2be8c-151d-4aac-cd71-08db9c95ae33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7305

SGkgSmFuLA0KDQo+IE9uIEF1ZyAxNCwgMjAyMywgYXQgMTU6MDgsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxNC4wOC4yMDIzIDA2OjI1LCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+
PiANCj4+IFNNTVUgc3Vic3lzdGVtIGlzIG9ubHkgc3VwcG9ydGVkIGluIE1NVSBzeXN0ZW0sIHNv
IHdlIG1ha2UgaXQgZGVwZW5kZW50DQo+PiBvbiBDT05GSUdfSEFTX01NVS4NCj4gDQo+IE5pdDog
U3RhbGUgIkhBUyIgaW5maXg/DQoNCkFo4oCmTmljZSBjYXRjaCwgc29ycnkgYWJvdXQgdGhhdCwg
d2lsbCBmaXggdGhhdCBpbiB2NiBpZiB0aGUgc2VyaWVzIG5lZWRzIGNoYW5nZXMNCmluIG90aGVy
IHBhdGNoZXMuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KPiANCj4+IFNp
Z25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBI
ZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0tDQo+PiB2NToNCj4+IC0gQWRkIEFja2VkLWJ5IHRh
ZyBmcm9tIEphbi4NCj4+IHY0Og0KPj4gLSBObyBjaGFuZ2UNCj4+IHYzOg0KPj4gLSBuZXcgcGF0
Y2gNCj4+IC0tLQ0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyB8IDMgKystDQo+
PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiANCj4+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9LY29uZmlnIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvS2NvbmZpZw0KPj4gaW5kZXggODY0ZmNmM2IwYy4uZWJiMzUwYmMzNyAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcNCj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcNCj4+IEBAIC01LDYgKzUsNyBAQCBjb25m
aWcgSEFTX1BBU1NUSFJPVUdIDQo+PiBpZiBBUk0NCj4+IGNvbmZpZyBBUk1fU01NVQ0KPj4gYm9v
bCAiQVJNIFNNTVV2MSBhbmQgdjIgZHJpdmVyIg0KPj4gKyBkZXBlbmRzIG9uIE1NVQ0KPj4gZGVm
YXVsdCB5DQo+PiAtLS1oZWxwLS0tDQo+PiAgU3VwcG9ydCBmb3IgaW1wbGVtZW50YXRpb25zIG9m
IHRoZSBBUk0gU3lzdGVtIE1NVSBhcmNoaXRlY3R1cmUNCj4+IEBAIC0xNSw3ICsxNiw3IEBAIGNv
bmZpZyBBUk1fU01NVQ0KPj4gDQo+PiBjb25maWcgQVJNX1NNTVVfVjMNCj4+IGJvb2wgIkFSTSBM
dGQuIFN5c3RlbSBNTVUgVmVyc2lvbiAzIChTTU1VdjMpIFN1cHBvcnQiIGlmIEVYUEVSVA0KPj4g
LSBkZXBlbmRzIG9uIEFSTV82NCAmJiAoIUFDUEkgfHwgQlJPS0VOKQ0KPj4gKyBkZXBlbmRzIG9u
IEFSTV82NCAmJiAoIUFDUEkgfHwgQlJPS0VOKSAmJiBNTVUNCj4+IC0tLWhlbHAtLS0NCj4+IFN1
cHBvcnQgZm9yIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgQVJNIFN5c3RlbSBNTVUgYXJjaGl0ZWN0
dXJlDQo+PiB2ZXJzaW9uIDMuIERyaXZlciBpcyBpbiBleHBlcmltZW50YWwgc3RhZ2UgYW5kIHNo
b3VsZCBub3QgYmUgdXNlZCBpbg0KPiANCg0K

