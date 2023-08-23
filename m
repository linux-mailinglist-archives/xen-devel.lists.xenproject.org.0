Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E0784DFC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 03:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588845.920463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYcDV-0002uZ-12; Wed, 23 Aug 2023 00:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588845.920463; Wed, 23 Aug 2023 00:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYcDU-0002s0-UU; Wed, 23 Aug 2023 00:59:24 +0000
Received: by outflank-mailman (input) for mailman id 588845;
 Wed, 23 Aug 2023 00:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iGE6=EI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYcDS-0002ru-HL
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 00:59:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a371453-4150-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 02:59:20 +0200 (CEST)
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by AM9PR08MB6306.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 00:59:12 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0::4) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Wed, 23 Aug 2023 00:59:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.16 via Frontend Transport; Wed, 23 Aug 2023 00:59:11 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Wed, 23 Aug 2023 00:59:11 +0000
Received: from 2ecfea0de9db.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 128662C8-D6B9-4AD0-B0C8-DB06619CCA5B.1; 
 Wed, 23 Aug 2023 00:59:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ecfea0de9db.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Aug 2023 00:59:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB7327.eurprd08.prod.outlook.com (2603:10a6:10:2e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 00:58:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 00:58:58 +0000
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
X-Inumbo-ID: 4a371453-4150-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0Vb+PFpyVNmv4TmOKhB0VIx+EXYu/A3OO+at38wZOE=;
 b=6xODFnY3JZ8x3+iPq4Jg3dSJmq5aU0Sn5gWpTXbyzo5B0ntfZytFxBO+1h6sishXrjr4FPd+Tep/loSPveyv9SmMMJCoICNIPO4m02mRbd44TdsWWuTUtlj6x6exsc3mqMflYVcNVn0uaN5QrZgnalbp5vqq6dawQPKIFR3QQ90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31904cd7c4bcea58
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK85c2z5woaqKS6Jho6UHIhKWJkimf4sxIzBaEN5Y4Erbui114G1p4ZxQThJSJ15Z766/jZQZvQxYZ1PTyvt4dv9zmoptrqqQPHRGoPGBBnfjrhkAzG0VDw2b/uyAKQJGO54L92s2awxhZLayi0RO7NRTkHDdCiQKIbBjGtpS5Cu8ximPh6Z1NFgqJ/sXna7wudnEHRHL5trDabZGyOvMyHZUiavJKmlYbd1lRXLiwu3663Py7FFpIGX0hAraTZVy9IZCPZ4Y9DjfUebthaaQdq9athMLsZH40FyOQuZ3aCICQw22+EYihq9axC135rG9vEpHdtdUtHTDCS12Ccunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0Vb+PFpyVNmv4TmOKhB0VIx+EXYu/A3OO+at38wZOE=;
 b=GH5Ia1yNvF15KX0x8jPu39GzXjE8pY5V9N2UjqvUtk+iSs4vFkLueOsvSdJQAoftOnA5O1IKobazncN7cw3qw9CikOqbXK288uCmwcN4BGPFn4c1Cq/Evyc74YQ9rMkrAO53Q3AwLA3bFi7lmWdEUp28Fll3GlI6V7vwe/vzcarVn9QV1wNG/cxp+evqeeRHmcWaCQA7Nk+pohUbVbqY1QmYd+XOhYaT8u/FeMsamtTiwWauSOcVnOU8zre6iWnQQQpuPWMQajp+ZOkZh4W50jDgqET7qO9xlylajgobTiUGW3LB3Q4aC3v7wnSC3dU4UmOZ5xXO9CuUvV68k6Xa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0Vb+PFpyVNmv4TmOKhB0VIx+EXYu/A3OO+at38wZOE=;
 b=6xODFnY3JZ8x3+iPq4Jg3dSJmq5aU0Sn5gWpTXbyzo5B0ntfZytFxBO+1h6sishXrjr4FPd+Tep/loSPveyv9SmMMJCoICNIPO4m02mRbd44TdsWWuTUtlj6x6exsc3mqMflYVcNVn0uaN5QrZgnalbp5vqq6dawQPKIFR3QQ90=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Topic: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Index: AQHZzmeOkWUgiqEb9U2fOmI3mEWP3a/1UMEAgACrQQCAABBYAIABAyyAgAANmwA=
Date: Wed, 23 Aug 2023 00:58:57 +0000
Message-ID: <1CB3A225-F309-4CCB-B559-A9DDD8740099@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
 <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
 <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
 <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
 <alpine.DEB.2.22.394.2308221656400.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308221656400.6458@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB7327:EE_|DBAEUR03FT047:EE_|AM9PR08MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: d31b8443-1d26-4f09-104a-08dba37429cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KSoSjfxQ9rJS/xbkqgduDlcnCuvYjNUSg+4lVXaMN/PDJ0FVaN+rng5sk7OZWD1J3L1JMgYbzI0TdkCBfw5SH6Bcus0VUuJB/uF1IOuX0vwsMtp1IvMLn72O9swov+ap5UrxxqYHHkrkHK3rWJWjyEAsRVktsD2+sV/Tr0ZQLOSkkio+iTNJ1dav+eHe3H6MyKqw2wg2pA/4Mt1Gx7DAFgY5KVmkdCJ8wPRZzTQoIWsgRpl9Ko1i0dmnspHs/tg6a2E3/gOnbCcJkUtFeF3aAqU//H9jASxgrwKqBMweaKcDhd0WHz9X98kYRFbVDaDBiziOnY6P+D+CwfdHILCx001Rju6FpYdA1oNFqRc2YUG7CncTYlcMCSgm6maFewRF2GGOThHZxufz5GWUl2ZhzUVW30zFzlZOX/XtckTVAdYurOyt0ya7yxTdk2HtaY6pa1eft82uSF7CO9+zUg3Du6VC2Ae/aN0aSXmNAzSp4kK130AT7IFOEg/cCmzQQRqmQsVS0XJj5ZvkVHjbyPO/4EKZQR+89ursO7W08D+29uODfx0GXAsNCo+ITRgbMH5CvmFWy6gFS24gnhzc78dGSLcBAI9WgExAYM0O2jW1hNZXe8wxLyZ1CDS/yJIPuwQoBQdBwbf97n/lNurM2avnXg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199024)(1800799009)(186009)(2906002)(38070700005)(38100700002)(6506007)(53546011)(6486002)(83380400001)(5660300002)(26005)(33656002)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(64756008)(6512007)(6916009)(54906003)(76116006)(66446008)(66556008)(66476007)(91956017)(66899024)(478600001)(122000001)(71200400001)(36756003)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01A6C99B1DFD7442892B09F6987055E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7327
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91595398-bad1-4a25-142b-08dba37421b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPd39HU6yLJgjF92ZLfserrgszsHTG9lgG3y/Iw2d8w3DpsHfpFh4pybbF3gHhKCboHSg98mkbYLFs01hGuKvQZbWY/ODGKGuSSvOvjW+7qqWskGL7qpX1nDdavX900Xg3aniHjOHUs66kFoYJuxFxLjt1VRXmNEbQADD+r3GAy0WHfQtM0DyBGQ1xSpn2jorFWkdD7TjkgSU65/rHi1r5TvXi+kcUiMYnf9vZeMZg3f0EuY8FZ7Gyhk+aan7Xut9toLak4GV3yXOlJthEeXJjHnrlQR5+JCSlPaOof768wZOVwqD+tjE4NP++t+3Am7mwDL2K+kwRqCcu0QF7jo/oG94OzWyXe5Boa0BMAqPH77WHXxzfwhgYW0GjpB0g+4/AtUJuhawTJOk+FuaBu8p6ZjPE7muAcGg7ZqxhUG8+1DQC082OgM5kxUeg0Wq8vVMCBdYsQdZw9Cs76p/MwELh8R8mt7qjATBlOMrLNQ2/RiBBjooPGuxXiGu0GFu03mQuhWkC9nNFya/qSJJ/rQ4xdUQO/VjHX3SCWYlVOg1ZkiLNnIjhQLUvqRChsv/iFnYsga32zMwJY7TNfKM2boOqwDeQiWRmMCDkwEGz/Gj3JjiRNDv0BY6ll5LzLkhjBy37MdlJpJj3ljgGTtw8IgBo/qTWKEFXNk1YcwyqtEZwqvbUriW1CqQmXSJAQyJCsD9TiZ3zj88ZqpADN2sA8vv8lDT9xF16YAPnn8+Wvksc65LNvgskhIZO/9RvJfRufi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(36840700001)(46966006)(40470700004)(83380400001)(40480700001)(336012)(66899024)(2906002)(36860700001)(40460700003)(47076005)(316002)(6486002)(6506007)(54906003)(53546011)(70206006)(70586007)(478600001)(86362001)(33656002)(36756003)(356005)(82740400003)(5660300002)(81166007)(26005)(2616005)(41300700001)(6512007)(8676002)(8936002)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 00:59:11.5895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31b8443-1d26-4f09-104a-08dba37429cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6306

SGkgU3RlZmFubywNCg0KPiBPbiBBdWcgMjMsIDIwMjMsIGF0IDA4OjEwLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAyMiBB
dWcgMjAyMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBJIGFsc28gZG9uJ3QgbGlrZSB0aGUg
aWRlYSBvZiBoYXZpbmcgYWdhaW4gYSBtYXNzaXZlIG1tLmMgZmlsZXMuIFNvIG1heWJlDQo+Pj4+
IHdlIG5lZWQgYSBzcGxpdCBsaWtlOg0KPj4+PiAgKiBGaWxlIDE6IEJvb3QgQ1BVMCBNTSBicmlu
Z3VwIChtbXUvc2V0dXAuYykNCj4+Pj4gICogRmlsZSAyOiBTZWNvbmRhcnkgQ1BVcyBNTSBicmlu
Z3VwIChtbXUvc21wYm9vdC5jKQ0KPj4+PiAgKiBGaWxlIDM6IFBhZ2UgdGFibGVzIHVwZGF0ZS4g
KG1tdS9wdC5jKQ0KPj4+PiANCj4+Pj4gSWRlYWxseSBmaWxlIDEgc2hvdWxkIGNvbnRhaW4gb25s
eSBpbml0IGNvZGUvZGF0YSBzbyBpdCBjYW4gYmUgbWFya2VkIGFzDQo+Pj4+IC5pbml0LiBTbyB0
aGUgc3RhdGljIHBhZ2V0YWJsZXMgbWF5IHdhbnQgdG8gYmUgZGVmaW5lZCBpbiBtbXUvcHQuYy4N
Cj4+PiANCj4+PiBTbyBiYXNlZCBvbiBKdWxpZW7igJlzIHN1Z2dlc3Rpb24sIFBlbm55IGFuZCBJ
IHdvcmtlZCBhIGJpdCBvbiB0aGUgY3VycmVudA0KPj4+IGZ1bmN0aW9ucyBpbiDigJxhcmNoL2Fy
bS9tbS5j4oCdIGFuZCB3ZSB3b3VsZCBsaWtlIHRvIHByb3Bvc2UgYmVsb3cgc3BsaXQNCj4+PiBz
Y2hlbWUsIHdvdWxkIHlvdSBwbGVhc2UgY29tbWVudCBvbiBpZiBiZWxvdyBtYWtlcyBzZW5zZSB0
byB5b3UsDQo+Pj4gdGhhbmtzIQ0KPj4+IA0KPj4+ICIiIg0KPj4+IHN0YXRpYyB2b2lkIF9faW5p
dCBfX21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKCkgICAgICAtPiBhcmNoL2FybS9tbS5j
DQo+PiANCj4+IEFsbCB0aGUgZXhpc3RpbmcgYnVpbGQgYXNzZXJ0aW9ucyBzZWVtcyB0byBiZSBN
TVUgc3BlY2lmaWMuIFNvIHNob3VsZG4ndCB0aGV5DQo+PiBiZSBtb3ZlZCB0byBtbXUvbW0uYy4N
Cj4+IA0KPj4+IHN0YXRpYyBscGFlX3QgKnhlbl9tYXBfdGFibGUoKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4+IHN0YXRpYyB2b2lkIHhlbl91bm1hcF90YWJsZSgp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4+IHZvaWQgZHVtcF9w
dF93YWxrKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQu
Yw0KPj4+IHZvaWQgZHVtcF9oeXBfd2FsaygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtPiBtbXUvcHQuYw0KPj4+IGxwYWVfdCBtZm5fdG9feGVuX2VudHJ5KCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4+IHZvaWQgc2V0X2ZpeG1h
cCgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0K
Pj4+IHZvaWQgY2xlYXJfZml4bWFwKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtPiBtbXUvcHQuYw0KPj4+IHZvaWQgZmx1c2hfcGFnZV90b19yYW0oKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jPw0KPj4gDQo+PiBJIHRoaW5r
IGl0IHNob3VsZCBzdGF5IGluIGFyY2gvYXJtL21tLmMgYmVjYXVzZSB5b3Ugd2lsbCBwcm9iYWJs
eSBuZWVkIHRvDQo+PiBjbGVhbiBhIHBhZ2UgZXZlbiBvbiBNUFUgc3lzdGVtcy4NCj4gDQo+IEkg
dGFrZSB5b3UgYXJlIHJlZmVycmluZyB0byBmbHVzaF9wYWdlX3RvX3JhbSgpIG9ubHksIGFuZCBu
b3QgdGhlIG90aGVyDQo+IGZ1bmN0aW9ucyBhYm92ZQ0KPiANCj4gDQo+Pj4gbHBhZV90IHB0ZV9v
Zl94ZW5hZGRyKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5j
DQo+Pj4gdm9pZCAqIF9faW5pdCBlYXJseV9mZHRfbWFwKCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0+IG1tdS9zZXR1cC5jDQo+Pj4gdm9pZCBfX2luaXQgcmVtb3ZlX2Vhcmx5X21hcHBp
bmdzKCkgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zZXR1cC5jDQo+Pj4gc3RhdGljIHZv
aWQgeGVuX3B0X2VuZm9yY2Vfd254KCkgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9w
dC5jLA0KPj4+IGV4cG9ydCBpdA0KPj4gDQo+PiBBRkFJVSwgaXQgd291bGQgYmUgY2FsbGVkIGZy
b20gc21wYm9vdC5jIGFuZCBzZXR1cC5jLiBGb3IgdGhlIGZvcm1lciwgdGhlDQo+PiBjYWxsZXIg
aXMgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSgpIHdoaWNoIEkgdGhpbmsgY2FuIGJlIGZvbGRlZCBp
biBoZWFkLlMuDQo+PiANCj4+IElmIHdlIGRvIHRoYXQsIHRoZW4geGVuX3B0X2VuZm9yY2Vfd254
KCkgY2FuIGJlIG1vdmVkIGluIHNldHVwLmMgYW5kIGRvZXNuJ3QNCj4+IG5lZWQgdG8gYmUgZXhw
b3J0ZWQuDQo+PiANCj4+PiBzdGF0aWMgdm9pZCBjbGVhcl90YWJsZSgpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLT4gbW11L3NtcGJvb3QuYw0KPj4+IHZvaWQgX19pbml0IHNldHVw
X3BhZ2V0YWJsZXMoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvc2V0dXAuYw0K
Pj4+IHN0YXRpYyB2b2lkIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpICAgICAgICAgICAgICAgICAg
ICAgICAtPiBtbXUvc21wYm9vdC5jDQo+IA0KPiBXaHkgY2xlYXJfdGFibGUoKSBhbmQgY2xlYXJf
Ym9vdF9wYWdldGFibGVzKCkgaW4gbW11L3NtcGJvb3QuYyByYXRoZXINCj4gdGhhbiBtbXUvc2V0
dXAuYyA/IEl0IGlzIE9LIGVpdGhlciB3YXkgYXMgaXQgZG9lcyBzZWVtIHRvIG1ha2UgbXVjaCBv
ZiBhDQo+IGRpZmZlcmVuY2UgYnV0IEkgYW0gY3VyaW91cy4NCg0KSSB0aGluayBpdCBpcyBiZWNh
dXNlIGJlbG93IGNhbGwgc2VxdWVuY2U6DQppbml0X3NlY29uZGFyeV9tbSgpIC0+IGNsZWFyX2Jv
b3RfcGFnZXRhYmxlcygpIC0+IGNsZWFyX3RhYmxlKCkNCg0KV2UgaGF2ZSB0aGUgc3VnZ2VzdGlv
biBmcm9tIEp1bGllbiB0aGF0Og0KIkZpbGUgMjogU2Vjb25kYXJ5IENQVXMgTU0gYnJpbmd1cCAo
bW11L3NtcGJvb3QuYynigJ0sIGFuZCBoZW5jZQ0KSSBzdWdnZXN0ZWQgdGhlIHNtcGJvb3QuYw0K
DQo+PiANCj4+IFRoZSBwbGFjZW1lbnQgb2YgYWxsIHRoZSBvbmVzIEkgZGlkbid0IGNvbW1lbnQg
b24gbG9vayBmaW5lIHRvIG1lLiBJdCB3b3VsZCBiZQ0KPj4gZ29vZCB0byBoYXZlIGEgc2Vjb25k
IG9waW5pb24gZnJvbSBlaXRoZXIgQmVydHJhbmQgb3IgU3RlZmFubyBiZWZvcmUgeW91IHN0YXJ0
DQo+PiBtb3ZpbmcgdGhlIGZ1bmN0aW9ucy4NCj4gDQo+IEl0IGxvb2tzIGdvb2QgaW4gcHJpbmNp
cGxlIGFuZCBpdCBhbHNvIGxvb2tzIGxpa2UgYSBncmVhdCBjbGVhbiB1cC4gSXQNCj4gaXMgbm90
IGFsd2F5cyBzdXBlciBjbGVhciB0byBtZSB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBtbXUvcHQu
YywNCj4gbW11L3NtcGJvb3QuYyBhbmQgbW11L3NldHVwLmMgYnV0IGl0IGRvZXNuJ3Qgc2VlbSBp
bXBvcnRhbnQuIFRoZQ0KPiBkaXN0aW5jdGlvbiBiZXR3ZWVuIG1tdS8qIGFuZCBhcmNoL2FybS9t
bS5jIGlzIGNsZWFyIGFuZCBsb29rcyBmaW5lIHRvDQo+IG1lLg0KDQpJIGdlbmVyYWxseSBmb2xs
b3dlZDoNCiIqIEZpbGUgMTogQm9vdCBDUFUwIE1NIGJyaW5ndXAgKG1tdS9zZXR1cC5jKQ0KICog
RmlsZSAyOiBTZWNvbmRhcnkgQ1BVcyBNTSBicmluZ3VwIChtbXUvc21wYm9vdC5jKQ0KICogRmls
ZSAzOiBQYWdlIHRhYmxlcyB1cGRhdGUuIChtbXUvcHQuYykiDQoNCj4gDQo+IEkgYW0gbG9va2lu
ZyBmb3J3YXJkIHRvIHRoaXMhDQoNCisxLCB3aWxsIHBvc3QgdGhlIHVwZGF0ZWQgcGF0Y2ggc29v
biENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo=

