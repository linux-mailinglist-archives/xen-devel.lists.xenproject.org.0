Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE8709E4F
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 19:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537218.836155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q041C-0003c9-Iu; Fri, 19 May 2023 17:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537218.836155; Fri, 19 May 2023 17:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q041C-0003a3-DG; Fri, 19 May 2023 17:35:54 +0000
Received: by outflank-mailman (input) for mailman id 537218;
 Fri, 19 May 2023 17:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q041B-0003Zx-3N
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 17:35:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 961bd3a6-f66b-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 19:35:46 +0200 (CEST)
Received: from DU2PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:10:28d::26)
 by AM0PR08MB5332.eurprd08.prod.outlook.com (2603:10a6:208:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 17:35:42 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::e) by DU2PR04CA0201.outlook.office365.com
 (2603:10a6:10:28d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 17:35:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 17:35:41 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 19 May 2023 17:35:41 +0000
Received: from cf0b35af8a2a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42E12A3F-70EA-4132-82EC-FD09309099F1.1; 
 Fri, 19 May 2023 17:35:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf0b35af8a2a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 17:35:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 17:35:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 17:35:32 +0000
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
X-Inumbo-ID: 961bd3a6-f66b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+UMVRzaD+CWOar4o5v5DYZiy3og6QZZF9IHD80Ncr0=;
 b=IANhoUUxDYhwVZNJEIAbwInsVe3d5bGsBjsKhWnkIJNSOqiAXty4bWADlwZhh3OtvFNG2JnyflseWBYKhVC/WCTAgO+ucsAADtMNUuVLscsocE4xQYslA6kPOetiVMz2CcHTCCgtOq9dHGhvaKUQ55X9qWF/1C03t0Jrld264zU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba0ad3a4333b7f6a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+xur66z5BMlEO2jX883JvQ98AprKS6278IuEPrUlAl83py2o1GDQo6ohKRkWmsAoPA2LPi5KTGWIDIlADj+Ko4Y5C91J+ATohhuk5hMGcfmdEojMrsMrw/VeXTuyZ1718pynyiPQ+/E+tYO2pkIzBj6Y/h5/XYaUTiSECg/wwm4XKSiNr84tEczEaafcnjkfodwwIn1JetXXznpcCdqf3Xdos8SapICKw09f1viDmSUBRcwlLRWXt2OtjmPTRM5aW2urBrL7v77MYl2x3dNOPkzHYWbo+ZfRPFc9zrDsS9X8U1lGi+hNeMeR/NcZ8VG6lEneTqiHJ+fbLqDkqi66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+UMVRzaD+CWOar4o5v5DYZiy3og6QZZF9IHD80Ncr0=;
 b=RJFa1g3B9XElNepFE3RD3Bg17UAnQTQcpXIiF6OLeVfPUa/bSzhmw23BskRQ6/EFj5XjeYztOOx5XVM2HTE7KmBJH3zmrMeQLUFFIF6aMSohR54o0xIpDk0vWP3rJTsNIAmVkRu6UtII8V25Mh99p6jZJx5gOdeD2GVKAUeMDHXwJvcVTnZZpsqijN49nFxRacMuRg+eCNeqA72ZqxwFHOF9NZOQznL5LdMrLtfqllYgF7IGtoT5ijPDKvw2grMihLo73n9ZZf/b++wck0LCY/qYPZ/CNtXuDJVY8/qwVBscPO4OoR0pMkqiKn3xo+z1ChWNGJLru1MM/V39YGGjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+UMVRzaD+CWOar4o5v5DYZiy3og6QZZF9IHD80Ncr0=;
 b=IANhoUUxDYhwVZNJEIAbwInsVe3d5bGsBjsKhWnkIJNSOqiAXty4bWADlwZhh3OtvFNG2JnyflseWBYKhVC/WCTAgO+ucsAADtMNUuVLscsocE4xQYslA6kPOetiVMz2CcHTCCgtOq9dHGhvaKUQ55X9qWF/1C03t0Jrld264zU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZdnJ92qfFeC693kK/O74mILlnGa9gf/oAgAGDsIA=
Date: Fri, 19 May 2023 17:35:30 +0000
Message-ID: <57A30CAD-678F-45F8-93A5-7CB65764E26D@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
 <d735e539-a8ad-0c14-2eda-22fbad19191f@xen.org>
In-Reply-To: <d735e539-a8ad-0c14-2eda-22fbad19191f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5786:EE_|DBAEUR03FT005:EE_|AM0PR08MB5332:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dfb869-2e5b-4744-9156-08db588f77a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TOyyuci17wI46mCyF7PJVCfRxAnKC0XXUSKnGtLfLsmAOm7xf9BGjBLLm768/ytvgIyiO8Wm3jkgQtj7534kvW3QcU/70/wUs4NcqrcNKX2ihmW+Im+Yyr8+C9LSNOAMf+0LkgTHjlVgX/9IY+04q8WbxDCFMVWdYDkSkRGBzfT1mxJmITVLpJ2iS2jC9MdHRnFdz6oVSiXUS9YX7Rkba1Rx9q54AOpl1GAxvNUTjXftRd74iAJ/b6u5tTlFFhPuswM+ZlbsQ894p3pBzQNBna0114b27Oiq+AsPONANWy5XDHhS+WBptl1TJXQ3WwC7wTr3pLp/4E2TzGsBIV4ifNMDn1reQpF/cgTsyYKwxwRdHAAE/ccEMMpYSyClhpcu1pHkYO2V5kWO5D19mO4Ve/DKC2RikYrTcAYmIy2y8WkYA3tQgJhNQwGMzC1Z68Wc+ZLEo9VZfeY2mLElrhgWiFzOeVbC3Bc334HgMjPZ1m3igigqso5MIm+05NP+FBklggqfWeZWX+YKits5hxUza3O4hmY7aohKmqy2IBMXZ2KkCwkJT58hso5nqzAZFBb6KpcNIgPs3plGNs1Z1e0AfCwTBYLljrF68H7IBocUO6uwlsnnIbTKFpzU7o/ErD0xXJOAXILNioO7cOlw7q0nmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(66946007)(76116006)(66476007)(66556008)(6916009)(64756008)(66446008)(4326008)(8676002)(8936002)(91956017)(316002)(54906003)(478600001)(41300700001)(122000001)(71200400001)(86362001)(30864003)(2906002)(33656002)(53546011)(6506007)(26005)(6512007)(36756003)(6486002)(38100700002)(186003)(38070700005)(5660300002)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C87FE54521BF04FB491EFE3317A4315@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7e2bb6a-613c-4eb9-afc0-08db588f710c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRKrUcZvBdoy+RXpT8JVxTQngiyoKc41ouPI6chGB6/+u1JUFFD90X8lw8TJWrXZVxUkzPiHC4eTdrp6Qlh2kyxiz2pxBhw1p7ZrmrGKu8KSwjoUUn1pZ6/I8Cyfg228cF5nZ1AWNOejs9cXNWrH7p1BqkC2Jv6stS0d3a+odwbVe3fgMz1uRGGbQAI5gqwSMDoFnie3VuFq5a7WOPZUODCMQVYhzuNTgtzyUsq1zbD6AT1wMYnyYItR8Z+7ywb9axnKxFRl3nK0O4gy1llDH4AWzPqXBbokFOhhXRyRDNk7Awy4LJ3dtkkcYBhpbewB0GFsETmZ5MtdU+Cz6K4Xwnc6qH1b3uSgaiLpNn48NY9bOnVKJextRqHdNusg+V67hiPC9JF3dJWUJGoQe/Hej25aMLU7vd8+ZIcpJaWmxLbcUE981/85LtfLEA8pn3npr8mjcyh1ghcksqYOMJFrOwU31DOZfoe5ZUfPQETMuWtdANfn9I/3o6yKkDK8Yd9E8tUvO+6ceG867bns3ICwk6oHz96+dPyfwRaa2TiXsloknBYaXT8DOFVyYlfR0pi7dqA9pbpG+qBwkzDIVCSkPpu3BOuvbSgfPW+5SAg+HoRDlnhaDpmdJ1J7W5Sm3HTAMukAnA8ydFHJi91R2DyRzzAKUQfykPADLwN0BYDg04+FLJ7QbQ4Q9iWj0U+SdXiq0ww5phpq78Gac4i2M5VpzNx+ZVY6QR+p3c6Tp+FwJiugN6vMbqQ0G5B8/YRt97/S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(30864003)(53546011)(2906002)(6512007)(6506007)(70586007)(70206006)(186003)(26005)(33656002)(54906003)(478600001)(36756003)(40480700001)(40460700003)(6486002)(356005)(81166007)(82310400005)(2616005)(47076005)(336012)(41300700001)(36860700001)(83380400001)(8676002)(5660300002)(6862004)(8936002)(82740400003)(4326008)(107886003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 17:35:41.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dfb869-2e5b-4744-9156-08db588f77a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5332

DQoNCj4gT24gMTggTWF5IDIwMjMsIGF0IDE5OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyNC8wNC8yMDIzIDA3OjAyLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gU2F2ZS9yZXN0b3JlIGNvbnRleHQgc3dpdGNoIGZvciBT
VkUsIGFsbG9jYXRlIG1lbW9yeSB0byBjb250YWluDQo+PiB0aGUgWjAtMzEgcmVnaXN0ZXJzIHdo
b3NlIGxlbmd0aCBpcyBtYXhpbXVtIDIwNDggYml0cyBlYWNoIGFuZA0KPj4gRkZSIHdobyBjYW4g
YmUgbWF4aW11bSAyNTYgYml0cywgdGhlIGFsbG9jYXRlZCBtZW1vcnkgZGVwZW5kcyBvbg0KPj4g
aG93IG1hbnkgYml0cyBpcyB0aGUgdmVjdG9yIGxlbmd0aCBmb3IgdGhlIGRvbWFpbiBhbmQgaG93
IG1hbnkgYml0cw0KPj4gYXJlIHN1cHBvcnRlZCBieSB0aGUgcGxhdGZvcm0uDQo+PiBTYXZlIFAw
LTE1IHdob3NlIGxlbmd0aCBpcyBtYXhpbXVtIDI1NiBiaXRzIGVhY2gsIGluIHRoaXMgY2FzZSB0
aGUNCj4+IG1lbW9yeSB1c2VkIGlzIGZyb20gdGhlIGZwcmVncyBmaWVsZCBpbiBzdHJ1Y3QgdmZw
X3N0YXRlLA0KPj4gYmVjYXVzZSBWMC0zMSBhcmUgcGFydCBvZiBaMC0zMSBhbmQgdGhpcyBzcGFj
ZSB3b3VsZCBoYXZlIGJlZW4NCj4+IHVudXNlZCBmb3IgU1ZFIGRvbWFpbiBvdGhlcndpc2UuDQo+
PiBDcmVhdGUgemNyX2VsezEsMn0gZmllbGRzIGluIGFyY2hfdmNwdSwgaW5pdGlhbGlzZSB6Y3Jf
ZWwyIG9uIHZjcHUNCj4+IGNyZWF0aW9uIGdpdmVuIHRoZSByZXF1ZXN0ZWQgdmVjdG9yIGxlbmd0
aCBhbmQgcmVzdG9yZSBpdCBvbg0KPj4gY29udGV4dCBzd2l0Y2gsIHNhdmUvcmVzdG9yZSBaQ1Jf
RUwxIHZhbHVlIGFzIHdlbGwuDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgZnJvbSB2NToNCj4+ICAtIHVz
ZSBYRlJFRSBpbnN0ZWFkIG9mIHhmcmVlLCBrZWVwIHRoZSBoZWFkZXJzIChKdWxpZW4pDQo+PiAg
LSBBdm9pZCBtYXRoIGNvbXB1dGF0aW9uIGZvciBldmVyeSBzYXZlL3Jlc3RvcmUsIHN0b3JlIHRo
ZSBjb21wdXRhdGlvbg0KPj4gICAgaW4gc3RydWN0IHZmcF9zdGF0ZSBvbmNlIChCZXJ0cmFuZCkN
Cj4+ICAtIHByb3RlY3QgYWNjZXNzIHRvIHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwgaW5zaWRlIGFy
Y2hfdmNwdV9jcmVhdGUgbm93DQo+PiAgICB0aGF0IHN2ZV92bCBpcyBhdmFpbGFibGUgb25seSBv
biBhcm02NA0KPj4gQ2hhbmdlcyBmcm9tIHY0Og0KPj4gIC0gTm8gY2hhbmdlcw0KPj4gQ2hhbmdl
cyBmcm9tIHYzOg0KPj4gIC0gZG9uJ3QgdXNlIGZpeGVkIGxlbiB0eXBlcyB3aGVuIG5vdCBuZWVk
ZWQgKEphbikNCj4+ICAtIG5vdyBWTCBpcyBhbiBlbmNvZGVkIHZhbHVlLCBkZWNvZGUgaXQgYmVm
b3JlIHVzaW5nLg0KPj4gQ2hhbmdlcyBmcm9tIHYyOg0KPj4gIC0gTm8gY2hhbmdlcw0KPj4gQ2hh
bmdlcyBmcm9tIHYxOg0KPj4gIC0gTm8gY2hhbmdlcw0KPj4gQ2hhbmdlcyBmcm9tIFJGQzoNCj4+
ICAtIE1vdmVkIHpjcl9lbDIgZmllbGQgaW50cm9kdWN0aW9uIGluIHRoaXMgcGF0Y2gsIHJlc3Rv
cmUgaXRzDQo+PiAgICBjb250ZW50IGluc2lkZSBzdmVfcmVzdG9yZV9zdGF0ZSBmdW5jdGlvbi4g
KEp1bGllbikNCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9hcm02NC9zdmUtYXNtLlMgICAgICAg
ICAgICAgfCAxNDEgKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJjaC9hcm0vYXJt
NjQvc3ZlLmMgICAgICAgICAgICAgICAgIHwgIDYzICsrKysrKysrKysNCj4+ICB4ZW4vYXJjaC9h
cm0vYXJtNjQvdmZwLmMgICAgICAgICAgICAgICAgIHwgIDc5ICsrKysrKystLS0tLS0NCj4+ICB4
ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgIHwgICA5ICsrDQo+PiAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3N2ZS5oICAgICB8ICAxMyArKysNCj4+ICB4ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3lzcmVncy5oIHwgICAzICsNCj4+ICB4ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvdmZwLmggICAgIHwgIDEyICsrDQo+PiAgeGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oICAgICAgICB8ICAgMiArDQo+PiAgOCBmaWxlcyBjaGFu
Z2VkLCAyODggaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTY0L3N2ZS1hc20uUyBiL3hlbi9hcmNoL2FybS9hcm02NC9zdmUtYXNt
LlMNCj4+IGluZGV4IDRkMTU0OTM0NDczMy4uOGMzN2Q3YmM5NWQ1IDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2FybTY0L3N2ZS1hc20uUw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L3N2ZS1hc20uUw0KPiANCj4gQXJlIGFsbCB0aGUgbmV3IGhlbHBlcnMgYWRkZWQgaW4gdGhpcyBw
YXRjaCB0YWtlbiBmcm9tIExpbnV4PyBJZiBzbywgaXQgd291bGQgYmUgZ29vZCB0byBjbGFyaWZ5
IHRoaXMgKGFnYWluKSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQgaGVscHMgZm9yIHRoZSBy
ZXZpZXcgKEkgY2FuIGRpZmYgd2l0aCBMaW51eCByYXRoZXIgdGhhbiBwcm9wZXJseSByZXZpZXdp
bmcgdGhlbSkuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYyBi
L3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gaW5kZXggODZhNWU2MTdiZmNhLi4wNjQ4MzJi
NDUwZmYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gQEAgLTUsNiArNSw4IEBADQo+PiAgICogQ29w
eXJpZ2h0IChDKSAyMDIyIEFSTSBMdGQuDQo+PiAgICovDQo+PiAgKyNpbmNsdWRlIDx4ZW4vc2No
ZWQuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL3NpemVzLmg+DQo+PiAgI2luY2x1ZGUgPHhlbi90eXBl
cy5oPg0KPj4gICNpbmNsdWRlIDxhc20vYXJtNjQvc3ZlLmg+DQo+PiAgI2luY2x1ZGUgPGFzbS9h
cm02NC9zeXNyZWdzLmg+DQo+PiBAQCAtMTMsNiArMTUsMjQgQEANCj4+ICAjaW5jbHVkZSA8YXNt
L3N5c3RlbS5oPg0KPj4gICAgZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3ZsKHZvaWQp
Ow0KPj4gK2V4dGVybiB2b2lkIHN2ZV9zYXZlX2N0eCh1aW50NjRfdCAqc3ZlX2N0eCwgdWludDY0
X3QgKnByZWdzLCBpbnQgc2F2ZV9mZnIpOw0KPj4gK2V4dGVybiB2b2lkIHN2ZV9sb2FkX2N0eCh1
aW50NjRfdCBjb25zdCAqc3ZlX2N0eCwgdWludDY0X3QgY29uc3QgKnByZWdzLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgcmVzdG9yZV9mZnIpOw0KPiANCj4gRnJvbSB0aGUgdXNl
LCBpdCBpcyBub3QgZW50aXJlbHkgd2hhdCByZXN0b3JlX2Zmci9zYXZlX2ZmciBpcyBtZWFudCB0
byBiZS4gQXJlIHRoZXkgYm9vbD8gSWYgc28sIG1heWJlIHVzZSBib29sPyBBdCBtaW1pbXVtLCB0
aGV5IHByb2JhYmx5IHdhbnQgdG8gYmUgdW5zaWduZWQgaW50Lg0KDQpJIGhhdmUgdG8gc2F5IHRo
YXQgSSB0cnVzdGVkIHRoZSBMaW51eCBpbXBsZW1lbnRhdGlvbiBoZXJlLCBpbiBhcmNoL3JtNjQv
aW5jbHVkZS9hc20vZnBzaW1kLmgsIHRoYXQgdXNlcyBpbnQ6DQoNCmV4dGVybiB2b2lkIHN2ZV9z
YXZlX3N0YXRlKHZvaWQgKnN0YXRlLCB1MzIgKnBmcHNyLCBpbnQgc2F2ZV9mZnIpOw0KZXh0ZXJu
IHZvaWQgc3ZlX2xvYWRfc3RhdGUodm9pZCBjb25zdCAqc3RhdGUsIHUzMiBjb25zdCAqcGZwc3Is
DQppbnQgcmVzdG9yZV9mZnIpOw0KDQpCdXQgaWYgeW91IHByZWZlciBJIGNhbiBwdXQgdW5zaWdu
ZWQgaW50IGluc3RlYWQuDQoNCj4gDQo+PiArDQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBp
bnQgc3ZlX3pyZWdfY3R4X3NpemUodW5zaWduZWQgaW50IHZsKQ0KPj4gK3sNCj4+ICsgICAgLyoN
Cj4+ICsgICAgICogWjAtMzEgcmVnaXN0ZXJzIHNpemUgaW4gYnl0ZXMgaXMgY29tcHV0ZWQgZnJv
bSBWTCB0aGF0IGlzIGluIGJpdHMsIHNvIFZMDQo+PiArICAgICAqIGluIGJ5dGVzIGlzIFZMLzgu
DQo+PiArICAgICAqLw0KPj4gKyAgICByZXR1cm4gKHZsIC8gOFUpICogMzJVOw0KPj4gK30NCj4+
ICsNCj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBzdmVfZmZycmVnX2N0eF9zaXplKHVu
c2lnbmVkIGludCB2bCkNCj4+ICt7DQo+PiArICAgIC8qIEZGUiByZWdpc3RlciBzaXplIGlzIFZM
LzgsIHdoaWNoIGlzIGluIGJ5dGVzIChWTC84KS84ICovDQo+PiArICAgIHJldHVybiAodmwgLyA2
NFUpOw0KPj4gK30NCj4+ICAgIHJlZ2lzdGVyX3QgY29tcHV0ZV9tYXhfemNyKHZvaWQpDQo+PiAg
ew0KPj4gQEAgLTYwLDMgKzgwLDQ2IEBAIHVuc2lnbmVkIGludCBnZXRfc3lzX3ZsX2xlbih2b2lk
KQ0KPj4gICAgICByZXR1cm4gKChzeXN0ZW1fY3B1aW5mby56Y3I2NC5iaXRzWzBdICYgWkNSX0VM
eF9MRU5fTUFTSykgKyAxVSkgKg0KPj4gICAgICAgICAgICAgIFNWRV9WTF9NVUxUSVBMRV9WQUw7
DQo+PiAgfQ0KPj4gKw0KPj4gK2ludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1ICp2KQ0K
Pj4gK3sNCj4+ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bCh2
LT5kb21haW4tPmFyY2guc3ZlX3ZsKTsNCj4+ICsgICAgdWludDY0X3QgKmN0eCA9IF94emFsbG9j
KHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSArDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdmVfZmZycmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEwxX0NBQ0hFX0JZVEVTKTsNCj4+ICsNCj4+ICsgICAgaWYg
KCAhY3R4ICkNCj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyAgICAvKiBQ
b2ludCB0byB0aGUgZW5kIG9mIFowLVozMSBtZW1vcnksIGp1c3QgYmVmb3JlIEZGUiBtZW1vcnkg
Ki8NCj4gDQo+IE5JVDogSSB3b3VsZCBhZGQgdGhhdCB0aGUgbG9naWMgc2hvdWxkIGJlIGtlcHQg
aW4gc3luYyB3aXRoIHN2ZV9jb250ZXh0X2ZyZWUoKS4gU2FtZS4uLg0KPiANCj4+ICsgICAgdi0+
YXJjaC52ZnAuc3ZlX3pyZWdfY3R4X2VuZCA9IGN0eCArDQo+PiArICAgICAgICAoc3ZlX3pyZWdf
Y3R4X3NpemUoc3ZlX3ZsX2JpdHMpIC8gc2l6ZW9mKHVpbnQ2NF90KSk7DQo+PiArDQo+PiArICAg
IHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIHN2ZV9jb250ZXh0X2ZyZWUoc3RydWN0
IHZjcHUgKnYpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMgPSBzdmVf
ZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwpOw0KPj4gKw0KPj4gKyAgICAvKiBQb2lu
dCBiYWNrIHRvIHRoZSBiZWdpbm5pbmcgb2YgWjAtWjMxICsgRkZSIG1lbW9yeSAqLw0KPiANCj4g
Li4uIGhlcmUgKGJ1dCB3aXRoIHN2ZV9jb250ZXh0X2luaXQoKSkuIFNvIGl0IGlzIGNsZWFyZXIg
dGhhdCBpZiB0aGUgbG9naWMgY2hhbmdlIGluIG9uZSBwbGFjZSB0aGVuIGl0IG5lZWRzIHRvIGJl
IGNoYW5nZWQgaW4gdGhlIG90aGVyLg0KDQpTdXJlIEkgd2lsbA0KDQo+IA0KPj4gKyAgICB2LT5h
cmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kIC09DQo+PiArICAgICAgICAoc3ZlX3pyZWdfY3R4X3Np
emUoc3ZlX3ZsX2JpdHMpIC8gc2l6ZW9mKHVpbnQ2NF90KSk7DQo+IA0KPiBGcm9tIG15IHVuZGVy
c3RhbmRpbmcsIHN2ZV9jb250ZXh0X2ZyZWUoKSBjb3VsZCBiZSBjYWxsZWQgd2l0aCBzdmVfenJl
Z19jdHh0X2VuZCBlcXVhbCB0byBOVUxMIChpLmUuIGJlY2F1c2Ugc3ZlX2NvbnRleHRfaW5pdCgp
IGZhaWxlZCkuIFNvIHdvdWxkbid0IHdlIGVuZCB1cCB0byBzdWJzdHJhY3QgdGhlIHZhbHVlIHRv
IE5VTEwgYW5kIHRoZXJlZm9yZS4uLg0KPiANCj4+ICsNCj4+ICsgICAgWEZSRUUodi0+YXJjaC52
ZnAuc3ZlX3pyZWdfY3R4X2VuZCk7DQo+IA0KPiAuLi4gZnJlZSBhIHJhbmRvbSBwb2ludGVyPw0K
DQpUaGFuayB5b3UgZm9yIHNwb3R0aW5nIHRoaXMsIEkgd2lsbCBzdXJyb3VuZCB0aGUgb3BlcmF0
aW9ucyBpbiBzdmVfY29udGV4dF9mcmVlIGJ5OiANCg0KaWYgKCB2LT5hcmNoLnZmcC5zdmVfenJl
Z19jdHhfZW5kICkNCg0KSeKAmW0gYXNzdW1pbmcgdGhlIG1lbW9yeSBzaG91bGQgYmUgemVybyBp
bml0aWFsaXNlZCBmb3IgdGhlIHZmcCBzdHJ1Y3R1cmUsIHBsZWFzZQ0KY29ycmVjdCBtZSBpZiBJ
4oCZbSB3cm9uZy4NCg0KPiANCj4+ICt9DQo+PiArDQo+PiArdm9pZCBzdmVfc2F2ZV9zdGF0ZShz
dHJ1Y3QgdmNwdSAqdikNCj4+ICt7DQo+PiArICAgIHYtPmFyY2guemNyX2VsMSA9IFJFQURfU1lT
UkVHKFpDUl9FTDEpOw0KPj4gKw0KPj4gKyAgICBzdmVfc2F2ZV9jdHgodi0+YXJjaC52ZnAuc3Zl
X3pyZWdfY3R4X2VuZCwgdi0+YXJjaC52ZnAuZnByZWdzLCAxKTsNCj4+ICt9DQo+PiArDQo+PiAr
dm9pZCBzdmVfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikNCj4+ICt7DQo+PiArICAgIFdS
SVRFX1NZU1JFRyh2LT5hcmNoLnpjcl9lbDEsIFpDUl9FTDEpOw0KPj4gKyAgICBXUklURV9TWVNS
RUcodi0+YXJjaC56Y3JfZWwyLCBaQ1JfRUwyKTsNCj4gDQo+IEFGQUlVLCB0aGlzIHZhbHVlIHdp
bGwgYmUgdXNlZCBmb3IgdGhlIHJlc3RvcmUgYmVsb3cuIFNvIGRvbid0IHdlIG5lZWQgYW4gaXNi
KCk/DQoNCldlIHJlYWNoZWQgdGhlIGFncmVlbWVudCBvbiB0aGlzIGluIHBhdGNoIDENCg0KPiAN
Cj4+ICsNCj4+ICsgICAgc3ZlX2xvYWRfY3R4KHYtPmFyY2gudmZwLnN2ZV96cmVnX2N0eF9lbmQs
IHYtPmFyY2gudmZwLmZwcmVncywgMSk7DQo+PiArfQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC92ZnAuYyBiL3hlbi9hcmNoL2FybS9hcm02NC92ZnAuYw0KPj4gaW5kZXggNDc4
ODVlNzZiYWFlLi4yZDBkN2MyZTZkZGIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvdmZwLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC92ZnAuYw0KPj4gQEAgLTIsMjkg
KzIsMzUgQEANCj4+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPg0KPj4gICNpbmNsdWRlIDxh
c20vY3B1ZmVhdHVyZS5oPg0KPj4gICNpbmNsdWRlIDxhc20vdmZwLmg+DQo+PiArI2luY2x1ZGUg
PGFzbS9hcm02NC9zdmUuaD4NCj4+ICAgIHZvaWQgdmZwX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUg
KnYpDQo+PiAgew0KPj4gICAgICBpZiAoICFjcHVfaGFzX2ZwICkNCj4+ICAgICAgICAgIHJldHVy
bjsNCj4+ICAtICAgIGFzbSB2b2xhdGlsZSgic3RwIHEwLCBxMSwgWyUxLCAjMTYgKiAwXVxuXHQi
DQo+PiAtICAgICAgICAgICAgICAgICAic3RwIHEyLCBxMywgWyUxLCAjMTYgKiAyXVxuXHQiDQo+
PiAtICAgICAgICAgICAgICAgICAic3RwIHE0LCBxNSwgWyUxLCAjMTYgKiA0XVxuXHQiDQo+PiAt
ICAgICAgICAgICAgICAgICAic3RwIHE2LCBxNywgWyUxLCAjMTYgKiA2XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAic3RwIHE4LCBxOSwgWyUxLCAjMTYgKiA4XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHExMCwgcTExLCBbJTEsICMxNiAqIDEwXVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHExMiwgcTEzLCBbJTEsICMxNiAqIDEyXVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHExNCwgcTE1LCBbJTEsICMxNiAqIDE0XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHExNiwgcTE3LCBbJTEsICMxNiAqIDE2XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHExOCwgcTE5LCBbJTEsICMxNiAqIDE4XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEyMCwgcTIxLCBbJTEsICMxNiAqIDIwXVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEyMiwgcTIzLCBbJTEsICMxNiAqIDIyXVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEyNCwgcTI1LCBbJTEsICMxNiAqIDI0XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEyNiwgcTI3LCBbJTEsICMxNiAqIDI2XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEyOCwgcTI5LCBbJTEsICMxNiAqIDI4XVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICAic3RwIHEzMCwgcTMxLCBbJTEsICMxNiAqIDMwXVxuXHQiDQo+PiAtICAgICAg
ICAgICAgICAgICA6ICI9USIgKCp2LT5hcmNoLnZmcC5mcHJlZ3MpIDogInIiICh2LT5hcmNoLnZm
cC5mcHJlZ3MpKTsNCj4+ICsgICAgaWYgKCBpc19zdmVfZG9tYWluKHYtPmRvbWFpbikgKQ0KPj4g
KyAgICAgICAgc3ZlX3NhdmVfc3RhdGUodik7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgYXNtIHZvbGF0aWxlKCJzdHAgcTAsIHExLCBbJTEsICMxNiAqIDBdXG5cdCINCj4+
ICsgICAgICAgICAgICAgICAgICAgICAic3RwIHEyLCBxMywgWyUxLCAjMTYgKiAyXVxuXHQiDQo+
PiArICAgICAgICAgICAgICAgICAgICAgInN0cCBxNCwgcTUsIFslMSwgIzE2ICogNF1cblx0Ig0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICJzdHAgcTYsIHE3LCBbJTEsICMxNiAqIDZdXG5cdCIN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAic3RwIHE4LCBxOSwgWyUxLCAjMTYgKiA4XVxuXHQi
DQo+PiArICAgICAgICAgICAgICAgICAgICAgInN0cCBxMTAsIHExMSwgWyUxLCAjMTYgKiAxMF1c
blx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJzdHAgcTEyLCBxMTMsIFslMSwgIzE2ICog
MTJdXG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAic3RwIHExNCwgcTE1LCBbJTEsICMx
NiAqIDE0XVxuXHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAgInN0cCBxMTYsIHExNywgWyUx
LCAjMTYgKiAxNl1cblx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJzdHAgcTE4LCBxMTks
IFslMSwgIzE2ICogMThdXG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAic3RwIHEyMCwg
cTIxLCBbJTEsICMxNiAqIDIwXVxuXHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAgInN0cCBx
MjIsIHEyMywgWyUxLCAjMTYgKiAyMl1cblx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJz
dHAgcTI0LCBxMjUsIFslMSwgIzE2ICogMjRdXG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAic3RwIHEyNiwgcTI3LCBbJTEsICMxNiAqIDI2XVxuXHQiDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgInN0cCBxMjgsIHEyOSwgWyUxLCAjMTYgKiAyOF1cblx0Ig0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICJzdHAgcTMwLCBxMzEsIFslMSwgIzE2ICogMzBdXG5cdCINCj4+ICsgICAgICAg
ICAgICAgICAgICAgICA6ICI9USIgKCp2LT5hcmNoLnZmcC5mcHJlZ3MpIDogInIiICh2LT5hcmNo
LnZmcC5mcHJlZ3MpKTsNCj4+ICsgICAgfQ0KPj4gICAgICAgIHYtPmFyY2gudmZwLmZwc3IgPSBS
RUFEX1NZU1JFRyhGUFNSKTsNCj4+ICAgICAgdi0+YXJjaC52ZnAuZnBjciA9IFJFQURfU1lTUkVH
KEZQQ1IpOw0KPj4gQEAgLTM3LDIzICs0MywyOCBAQCB2b2lkIHZmcF9yZXN0b3JlX3N0YXRlKHN0
cnVjdCB2Y3B1ICp2KQ0KPj4gICAgICBpZiAoICFjcHVfaGFzX2ZwICkNCj4+ICAgICAgICAgIHJl
dHVybjsNCj4+ICAtICAgIGFzbSB2b2xhdGlsZSgibGRwIHEwLCBxMSwgWyUxLCAjMTYgKiAwXVxu
XHQiDQo+PiAtICAgICAgICAgICAgICAgICAibGRwIHEyLCBxMywgWyUxLCAjMTYgKiAyXVxuXHQi
DQo+PiAtICAgICAgICAgICAgICAgICAibGRwIHE0LCBxNSwgWyUxLCAjMTYgKiA0XVxuXHQiDQo+
PiAtICAgICAgICAgICAgICAgICAibGRwIHE2LCBxNywgWyUxLCAjMTYgKiA2XVxuXHQiDQo+PiAt
ICAgICAgICAgICAgICAgICAibGRwIHE4LCBxOSwgWyUxLCAjMTYgKiA4XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHExMCwgcTExLCBbJTEsICMxNiAqIDEwXVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHExMiwgcTEzLCBbJTEsICMxNiAqIDEyXVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHExNCwgcTE1LCBbJTEsICMxNiAqIDE0XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHExNiwgcTE3LCBbJTEsICMxNiAqIDE2XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHExOCwgcTE5LCBbJTEsICMxNiAqIDE4XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEyMCwgcTIxLCBbJTEsICMxNiAqIDIwXVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEyMiwgcTIzLCBbJTEsICMxNiAqIDIyXVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEyNCwgcTI1LCBbJTEsICMxNiAqIDI0XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEyNiwgcTI3LCBbJTEsICMxNiAqIDI2XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEyOCwgcTI5LCBbJTEsICMxNiAqIDI4XVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICAibGRwIHEzMCwgcTMxLCBbJTEsICMxNiAqIDMwXVxuXHQiDQo+PiAtICAg
ICAgICAgICAgICAgICA6IDogIlEiICgqdi0+YXJjaC52ZnAuZnByZWdzKSwgInIiICh2LT5hcmNo
LnZmcC5mcHJlZ3MpKTsNCj4+ICsgICAgaWYgKCBpc19zdmVfZG9tYWluKHYtPmRvbWFpbikgKQ0K
Pj4gKyAgICAgICAgc3ZlX3Jlc3RvcmVfc3RhdGUodik7DQo+PiArICAgIGVsc2UNCj4+ICsgICAg
ew0KPj4gKyAgICAgICAgYXNtIHZvbGF0aWxlKCJsZHAgcTAsIHExLCBbJTEsICMxNiAqIDBdXG5c
dCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAibGRwIHEyLCBxMywgWyUxLCAjMTYgKiAyXVxu
XHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAgImxkcCBxNCwgcTUsIFslMSwgIzE2ICogNF1c
blx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJsZHAgcTYsIHE3LCBbJTEsICMxNiAqIDZd
XG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAibGRwIHE4LCBxOSwgWyUxLCAjMTYgKiA4
XVxuXHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAgImxkcCBxMTAsIHExMSwgWyUxLCAjMTYg
KiAxMF1cblx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJsZHAgcTEyLCBxMTMsIFslMSwg
IzE2ICogMTJdXG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAibGRwIHExNCwgcTE1LCBb
JTEsICMxNiAqIDE0XVxuXHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAgImxkcCBxMTYsIHEx
NywgWyUxLCAjMTYgKiAxNl1cblx0Ig0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJsZHAgcTE4
LCBxMTksIFslMSwgIzE2ICogMThdXG5cdCINCj4+ICsgICAgICAgICAgICAgICAgICAgICAibGRw
IHEyMCwgcTIxLCBbJTEsICMxNiAqIDIwXVxuXHQiDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ImxkcCBxMjIsIHEyMywgWyUxLCAjMTYgKiAyMl1cblx0Ig0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICJsZHAgcTI0LCBxMjUsIFslMSwgIzE2ICogMjRdXG5cdCINCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAibGRwIHEyNiwgcTI3LCBbJTEsICMxNiAqIDI2XVxuXHQiDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgImxkcCBxMjgsIHEyOSwgWyUxLCAjMTYgKiAyOF1cblx0Ig0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICJsZHAgcTMwLCBxMzEsIFslMSwgIzE2ICogMzBdXG5cdCINCj4+ICsg
ICAgICAgICAgICAgICAgICAgICA6IDogIlEiICgqdi0+YXJjaC52ZnAuZnByZWdzKSwgInIiICh2
LT5hcmNoLnZmcC5mcHJlZ3MpKTsNCj4+ICsgICAgfQ0KPj4gICAgICAgIFdSSVRFX1NZU1JFRyh2
LT5hcmNoLnZmcC5mcHNyLCBGUFNSKTsNCj4+ICAgICAgV1JJVEVfU1lTUkVHKHYtPmFyY2gudmZw
LmZwY3IsIEZQQ1IpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hl
bi9hcmNoL2FybS9kb21haW4uYw0KPj4gaW5kZXggMTQzMzU5ZDBmMzEzLi4yNGM3MjJhNGExMWUg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9kb21haW4uYw0KPj4gQEAgLTU1Miw3ICs1NTIsMTQgQEAgaW50IGFyY2hfdmNwdV9jcmVh
dGUoc3RydWN0IHZjcHUgKnYpDQo+PiAgICAgICAgdi0+YXJjaC5jcHRyX2VsMiA9IGdldF9kZWZh
dWx0X2NwdHJfZmxhZ3MoKTsNCj4+ICAgICAgaWYgKCBpc19zdmVfZG9tYWluKHYtPmRvbWFpbikg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIChyYyA9IHN2ZV9jb250ZXh0X2luaXQodikp
ICE9IDAgKQ0KPj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICAgICAgICAgIHYtPmFyY2gu
Y3B0cl9lbDIgJj0gfkhDUFRSX0NQKDgpOw0KPj4gKyNpZmRlZiBDT05GSUdfQVJNNjRfU1ZFDQo+
IA0KPiBUaGlzICNpZmRlZiByZWFkcyBhIGJpdCBvZGQgdG8gbWUgYmVjYXVzZSB5b3UgYXJlIHBy
b3RlY3Rpbmcgdi0+YXJjaC56Y3JfZWwyIGJ1dCBub3QgdGhlIHJlc3QuIFRoaXMgaXMgb25lIG9m
IHRoZSBjYXNlIHdoZXJlIEkgd291bGQgc3Vycm91bmQgdGhlIGZ1bGwgaWYgd2l0aCB0aGUgI2lm
ZGVmIGJlY2F1c2UgaXQgbWFrZXMgY2xlYXJlciB0aGF0IHRoZXJlIGlzIG5vIHdheSB0aGUgcmVz
dCBvZiB0aGUgY29kZSBjYW4gYmUgcmVhY2hlZCBpZiAhQ09ORklHX0FSTTY0X1NWRS4NCj4gDQo+
IFRoYXQgc2FpZCwgSSB3b3VsZCBhY3R1YWxseSBwcmVmZXIgaWYuLi4NCj4gDQo+PiArICAgICAg
ICB2LT5hcmNoLnpjcl9lbDIgPSB2bF90b196Y3Ioc3ZlX2RlY29kZV92bCh2LT5kb21haW4tPmFy
Y2guc3ZlX3ZsKSk7DQo+IA0KPiAuLi4gdGhpcyBsaW5lIGlzIG1vdmVkIGluIHN2ZV9jb250ZXh0
X2luaXQoKSBiZWNhdXNlIHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgU1ZFIGNvbnRleHQuDQoNClN1
cmUgSSB3aWxsIGRvIHRoYXQsIHNvIGlmIEnigJl2ZSB1bmRlcnN0b29kIGNvcnJlY3RseSwgeW91
IHdhbnQgbWUgdG8ga2VlcCB0aGlzOg0KDQoNCnYtPmFyY2guY3B0cl9lbDIgPSBnZXRfZGVmYXVs
dF9jcHRyX2ZsYWdzKCk7DQppZiAoIGlzX3N2ZV9kb21haW4odi0+ZG9tYWluKSApDQp7DQogICAg
aWYgKCAocmMgPSBzdmVfY29udGV4dF9pbml0KHYpKSAhPSAwICkNCiAgICAgICAgZ290byBmYWls
Ow0KICAgIHYtPmFyY2guY3B0cl9lbDIgJj0gfkhDUFRSX0NQKDgpOw0KfQ0KDQpXaXRob3V0ICNp
ZmRlZiBDT05GSUdfQVJNNjRfU1ZFDQoNCj4gDQo+PiArI2VuZGlmDQo+PiArICAgIH0NCj4+ICAg
ICAgICB2LT5hcmNoLmhjcl9lbDIgPSBnZXRfZGVmYXVsdF9oY3JfZmxhZ3MoKTsNCj4+ICBAQCAt
NTgyLDYgKzU4OSw4IEBAIGZhaWw6DQo+PiAgICB2b2lkIGFyY2hfdmNwdV9kZXN0cm95KHN0cnVj
dCB2Y3B1ICp2KQ0KPj4gIHsNCj4+ICsgICAgaWYgKCBpc19zdmVfZG9tYWluKHYtPmRvbWFpbikg
KQ0KPj4gKyAgICAgICAgc3ZlX2NvbnRleHRfZnJlZSh2KTsNCj4+ICAgICAgdmNwdV90aW1lcl9k
ZXN0cm95KHYpOw0KPj4gICAgICB2Y3B1X3ZnaWNfZnJlZSh2KTsNCj4+ICAgICAgZnJlZV94ZW5o
ZWFwX3BhZ2VzKHYtPmFyY2guc3RhY2ssIFNUQUNLX09SREVSKTsNCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vYXJtNjQvc3ZlLmgNCj4+IGluZGV4IDczMGMzZmI1YTljOC4uNTgyNDA1ZGZkZjZhIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3N2ZS5oDQo+PiAr
KysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCj4+IEBAIC0yNiw2ICsy
NiwxMCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBzdmVfZGVjb2RlX3ZsKHVuc2lnbmVk
IGludCBzdmVfdmwpDQo+PiAgcmVnaXN0ZXJfdCBjb21wdXRlX21heF96Y3Iodm9pZCk7DQo+PiAg
cmVnaXN0ZXJfdCB2bF90b196Y3IodW5zaWduZWQgaW50IHZsKTsNCj4+ICB1bnNpZ25lZCBpbnQg
Z2V0X3N5c192bF9sZW4odm9pZCk7DQo+PiAraW50IHN2ZV9jb250ZXh0X2luaXQoc3RydWN0IHZj
cHUgKnYpOw0KPj4gK3ZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiAr
dm9pZCBzdmVfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiArdm9pZCBzdmVfcmVzdG9y
ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiAgICAjZWxzZSAvKiAhQ09ORklHX0FSTTY0X1NW
RSAqLw0KPj4gIEBAIC00Niw2ICs1MCwxNSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBn
ZXRfc3lzX3ZsX2xlbih2b2lkKQ0KPj4gICAgICByZXR1cm4gMDsNCj4+ICB9DQo+PiAgK3N0YXRp
YyBpbmxpbmUgaW50IHN2ZV9jb250ZXh0X2luaXQoc3RydWN0IHZjcHUgKnYpDQo+PiArew0KPj4g
KyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHN2ZV9j
b250ZXh0X2ZyZWUoc3RydWN0IHZjcHUgKnYpIHt9DQo+PiArc3RhdGljIGlubGluZSB2b2lkIHN2
ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KSB7fQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBz
dmVfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikge30NCj4+ICsNCj4+ICAjZW5kaWYgLyog
Q09ORklHX0FSTTY0X1NWRSAqLw0KPj4gICAgI2VuZGlmIC8qIF9BUk1fQVJNNjRfU1ZFX0ggKi8N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3lzcmVncy5o
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3N5c3JlZ3MuaA0KPj4gaW5kZXggNGNh
YmI5ZWI0ZDVlLi4zZmRlYjlkOGNkZWYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJtNjQvc3lzcmVncy5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXJtNjQvc3lzcmVncy5oDQo+PiBAQCAtODgsNiArODgsOSBAQA0KPj4gICNpZm5kZWYgSURf
QUE2NElTQVIyX0VMMQ0KPj4gICNkZWZpbmUgSURfQUE2NElTQVIyX0VMMSAgICAgICAgICAgIFMz
XzBfQzBfQzZfMg0KPj4gICNlbmRpZg0KPj4gKyNpZm5kZWYgWkNSX0VMMQ0KPj4gKyNkZWZpbmUg
WkNSX0VMMSAgICAgICAgICAgICAgICAgICAgIFMzXzBfQzFfQzJfMA0KPj4gKyNlbmRpZg0KPj4g
ICAgLyogSUQgcmVnaXN0ZXJzIChpbXBvcnRlZCBmcm9tIGFybTY0L2luY2x1ZGUvYXNtL3N5c3Jl
Zy5oIGluIExpbnV4KSAqLw0KPj4gIGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXJtNjQvdmZwLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvdmZwLmgNCj4+
IGluZGV4IGU2ZThjMzYzYmMxNi4uNGFhMzcxZTg1ZDI2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3ZmcC5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJtNjQvdmZwLmgNCj4+IEBAIC02LDcgKzYsMTkgQEANCj4+ICAgIHN0cnVjdCB2
ZnBfc3RhdGUNCj4+ICB7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFdoZW4gU1ZFIGlzIGVuYWJs
ZWQgZm9yIHRoZSBndWVzdCwgZnByZWdzIG1lbW9yeSB3aWxsIGJlIHVzZWQgdG8NCj4+ICsgICAg
ICogc2F2ZS9yZXN0b3JlIFAwLVAxNSByZWdpc3RlcnMsIG90aGVyd2lzZSBpdCB3aWxsIGJlIHVz
ZWQgZm9yIHRoZSBWMC1WMzENCj4+ICsgICAgICogcmVnaXN0ZXJzLg0KPj4gKyAgICAgKi8NCj4+
ICAgICAgdWludDY0X3QgZnByZWdzWzY0XSBfX3ZmcF9hbGlnbmVkOw0KPj4gKyAgICAvKg0KPj4g
KyAgICAgKiBXaGVuIFNWRSBpcyBlbmFibGVkIGZvciB0aGUgZ3Vlc3QsIHN2ZV96cmVnX2N0eF9l
bmQgcG9pbnRzIHRvIG1lbW9yeQ0KPj4gKyAgICAgKiB3aGVyZSBaMC1aMzEgcmVnaXN0ZXJzIGFu
ZCBGRlIgY2FuIGJlIHNhdmVkL3Jlc3RvcmVkLCBpdCBwb2ludHMgYXQgdGhlDQo+PiArICAgICAq
IGVuZCBvZiB0aGUgWjAtWjMxIHNwYWNlIGFuZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBGRlIg
c3BhY2UsIGl0J3MgZG9uZQ0KPj4gKyAgICAgKiBsaWtlIHRoYXQgdG8gZWFzZSB0aGUgc2F2ZS9y
ZXN0b3JlIGFzc2VtYmx5IG9wZXJhdGlvbnMuDQo+PiArICAgICAqLw0KPj4gKyAgICB1aW50NjRf
dCAqc3ZlX3pyZWdfY3R4X2VuZDsNCj4+ICAgICAgcmVnaXN0ZXJfdCBmcGNyOw0KPj4gICAgICBy
ZWdpc3Rlcl90IGZwZXhjMzJfZWwyOw0KPj4gICAgICByZWdpc3Rlcl90IGZwc3I7DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+PiBpbmRleCAzMzFkYTBmM2JjYzMuLjgxNDY1MmQ5MjU2
OCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+PiBAQCAtMTk1LDYgKzE5
NSw4IEBAIHN0cnVjdCBhcmNoX3ZjcHUNCj4+ICAgICAgcmVnaXN0ZXJfdCB0cGlkcnJvX2VsMDsN
Cj4+ICAgICAgICAvKiBIWVAgY29uZmlndXJhdGlvbiAqLw0KPj4gKyAgICByZWdpc3Rlcl90IHpj
cl9lbDE7DQo+PiArICAgIHJlZ2lzdGVyX3QgemNyX2VsMjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBj
cHRyX2VsMjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBoY3JfZWwyOw0KPj4gICAgICByZWdpc3Rlcl90
IG1kY3JfZWwyOw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQoN
Cg==

