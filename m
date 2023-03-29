Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660446CD7DE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516175.799881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTJg-0005k2-K7; Wed, 29 Mar 2023 10:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516175.799881; Wed, 29 Mar 2023 10:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTJg-0005hd-HS; Wed, 29 Mar 2023 10:46:08 +0000
Received: by outflank-mailman (input) for mailman id 516175;
 Wed, 29 Mar 2023 10:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTc=7V=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phTJe-0005hX-Lw
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:46:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c285e2-ce1e-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:46:01 +0200 (CEST)
Received: from DB8PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:10:be::34)
 by AS8PR08MB8252.eurprd08.prod.outlook.com (2603:10a6:20b:53c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:45:57 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::b7) by DB8PR03CA0021.outlook.office365.com
 (2603:10a6:10:be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 10:45:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Wed, 29 Mar 2023 10:45:57 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 29 Mar 2023 10:45:57 +0000
Received: from 2ccd6a0d4885.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C842C504-C028-457E-B322-0581F10ABD14.1; 
 Wed, 29 Mar 2023 10:45:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ccd6a0d4885.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Mar 2023 10:45:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6371.eurprd08.prod.outlook.com (2603:10a6:20b:363::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Wed, 29 Mar
 2023 10:45:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 10:45:46 +0000
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
X-Inumbo-ID: e5c285e2-ce1e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eut2csArcCZA5PYPoSV7KJjsImLE6DzQJgIfbnA88ZU=;
 b=AD/zidtCfPrYdNYkOGV99bCd6CHhqruPXjoPyQ3OeBGuzGTjhdKJBXw+2AXTtcFYXoXsicdhXN7Kc85dF31XNIyWewFkI3n6r3ffAhEcVT8dwk/zM9jEYbRrxULydXr+/3NG6rZ5dY59rLbkMkynjDrRHIDdtGMwqFCYyHG/eE0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3114729f6e634d9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Br/CDISAFkwpzYktg8J8RRcTugHJ6mSQtGxmzWdXfhUfleTUJqYJXPTiY1XCvn2mHt6cACazskrLvIC5tyvCWsBh4nxuEjwURl7aDd8gsLMep4tmoYKdd2YOJD9LGW/z9Ja8hQL8Wi12q8oYBgUdW7kRlO2qvv3/i34oOQ+ZWFYAflDXN/Az3ta8YifT5wCJb3ycV1o2QgSNHXUWVpjTnU3j7n7Tpz6fSpFs22jHJTgUiNK1pol4iqR8b/4zwifqjEgxrV/iUUiaArbBqtPHNWSyWNUvBm2t17wFrHhGLas4rF4s6es/KV9Nl4nv2qmkKIobMTrjPqsxl2Lzzdr8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eut2csArcCZA5PYPoSV7KJjsImLE6DzQJgIfbnA88ZU=;
 b=dT3dyMnVRTcPs5XqqtJhpGgdqALAGTaDsz0YNIvxDrHnY0bl/tOHdoutw9ufMLCkbK8tZnMhVbZw4An10Ye+TvA8gsya/MqkMXMk2mh2hyJ52GXe6eMgMDKiUrWYOoWUUEqL9gCuckLYPCDNnW/LkeetUPqbSl5wOc1O8Z1mEl2rLK+u/js3ONHJKgNnZbEi5etQZaAfbevqDuCF7jiP/sdA93N7TFpmcLiyG+O5e+/TbJPaSn4wU2NXXfpEq0qhN0bMejtqXLijkE+0/wZgh9CXRr9qOs6LyY2DYc2aTf2TIYCy1rIo0GSGmEV044Bvgc0UbV8JldkHaBegckyTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eut2csArcCZA5PYPoSV7KJjsImLE6DzQJgIfbnA88ZU=;
 b=AD/zidtCfPrYdNYkOGV99bCd6CHhqruPXjoPyQ3OeBGuzGTjhdKJBXw+2AXTtcFYXoXsicdhXN7Kc85dF31XNIyWewFkI3n6r3ffAhEcVT8dwk/zM9jEYbRrxULydXr+/3NG6rZ5dY59rLbkMkynjDrRHIDdtGMwqFCYyHG/eE0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v4 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZYJtYhPNp4K3qPECnSSUY8aM6MK8P8D+AgAGZUgCAAAi3gIAAA68A
Date: Wed, 29 Mar 2023 10:45:45 +0000
Message-ID: <E93EA3A5-0C3F-4B67-8AAF-68CD446B1C02@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-3-luca.fancellu@arm.com>
 <71f3e78a-aa70-a12f-8380-ab8806cefd39@suse.com>
 <D3910D5E-BA1E-40AB-B960-CF8806F0D9E6@arm.com>
 <6736a614-258b-0d5e-9c78-e25fa6b8a932@suse.com>
In-Reply-To: <6736a614-258b-0d5e-9c78-e25fa6b8a932@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6371:EE_|DBAEUR03FT014:EE_|AS8PR08MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a1e63c-3bf9-4398-2f6c-08db3042c75a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 khUJ4OGNVRIwNKbEodNF1ByXJ9EVzBP0K+oBbFD9nRxkEogbK1MgFYWtJG2fTMAY8qOigiEeHMyH75fkolcZ6vDiz2gSZjpIU9rkzJsbH7YR4IQhh62ukkuPUHyYsBjlZyzoVizO/OPzXW9hea63EnzWwq4G/c+ks7+b9lYjXCyfjvTuU8IUQRsnXpYDktlMLXioM8OiSWlom0/qCqNAu72J8FPav+Y2xhfQDKZtoxyhZEZBNciwg1DqzXjsSvV8b/ojvQs7RAouXwlTSBgEThODVUq35k9MvjP5GDuEsrZiuOoSAnkH5XVSD1M/Kl40rYRQMcM8a8F6iqFaCVDkFTzW9YdlOg5C0fyZiXNqJfwachPN3JPQNaWdB//u3ZqP305adVVGbWFYc3VGyyofANvhbNtKuhFKDD7Fu3XoZMoU7xhgUsmBNUi3qG30yIb0lr73P06BZaGfQ/QSCWlbfLoa/4ZLfoAkERbj7uoIl/JSZM5w4q/7hOr7C3uGw/moEOf+/5xKvaZEPu4BDtAibYMxbi5bGNm3UVtQYBpjsUX7CS9Zk6FBlGGJounSGu/fH5G+LWbjCAavqxhwMrFmAtHQJO1jnaGog4SFhBYNqk9wrxO/fMT5naVsyng4YLeRSnUQJZ8d7vhf+DTijyVIEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199021)(41300700001)(83380400001)(6486002)(86362001)(54906003)(5660300002)(38100700002)(38070700005)(478600001)(71200400001)(2906002)(91956017)(8676002)(6916009)(186003)(2616005)(4326008)(66476007)(66446008)(66946007)(64756008)(66556008)(76116006)(122000001)(33656002)(8936002)(36756003)(53546011)(6506007)(316002)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <36156CE0AE72D6429032A2DFB9ACAE85@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e59c7e8-d855-4837-0395-08db3042c082
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HApqPa9tTmLlOHfZcKZyPBkEvqdBIeDsAeyBguG0rscefKhY2uGfU6KRfgADrBTD16Yotm/kcXOr+NtWHdtisn82+FdAq8UK8Ke8sGjr4GKeGOKt/akvurLb+HNijge3thmACgrxGKB/p0lfE4AjeUh6KPYj9eu8u751CchYKBIMcJ1tcx4aahH3c/4lV3ZNJQyM+paooZmXmZ/jx8gogVDn1YmejBXFOiBCRm/bGeIPf6plTdX5ruNuyo4NXcAlQb8fiPvuSHyD5GpTdh7SDFdRPenX4WWMd+PbF+Kdg7oJ+YSKtMbxY6ZmsrRiKljk9Kbw5kHi0/iTTfmxH6Iogxp2uOpCmBl8A3UR9bnZZ2wDf6ZoKYB1iSFu+umLEnGqGpIetsE/nR8pEa0mvUTmyCo3BCMX6D/NBP1/UdHoHOktP07Q/+GDoPlckjsjU7dAFaNQVoO7HzfjvYXfMMBghKxM3mr6VDtJrV9SEHLFm2NeQd4HieMMBkJRkz9EZJC1DmYmIe3RVeGCNQKpxpcaOBmMhrdgxLFJT5UXnOs2yZyon2ExWTZS4jzzmKJ4qAmSGsYdcb7MVffx910AdiNGOBNXmf46px7vJZHF705ULNKhE9rk1XnoW+xaN98sPYCzvFw2VdQujuzebs6nZoVPtKVVxFE1BPYAm3xcFiZwYXC5Pp2cponm4FVGmYTex9C1vQAW6yR/8Qw4qs0VUg5QxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(6506007)(81166007)(356005)(82740400003)(26005)(53546011)(82310400005)(478600001)(316002)(54906003)(6512007)(36756003)(70206006)(8676002)(70586007)(40480700001)(41300700001)(86362001)(4326008)(336012)(2616005)(47076005)(6486002)(33656002)(6862004)(8936002)(2906002)(40460700003)(5660300002)(36860700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:45:57.3452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a1e63c-3bf9-4398-2f6c-08db3042c75a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8252

DQoNCj4gT24gMjkgTWFyIDIwMjMsIGF0IDExOjMyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjkuMDMuMjAyMyAxMjowMSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyOCBNYXIgMjAyMywgYXQgMTA6MzYsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gWWV0IGFub3RoZXIgcXVlc3Rpb24gaXMgd2hldGhlciBi
b3RoIHJhbmdlIGNoZWNrcyAoYWdhaW5zdA0KPj4+IFNWRV9WTF9NQVhfQklUUyBhbmQgemNyX21h
eF9iaXRzKSBhcmUgYWN0dWFsbHkgbmVjZXNzYXJ5IC8gdXNlZnVsLg0KPj4+IElpcmMgMjA0OCBp
cyBhIGhhcmQgdXBwZXIgYm91bmQsIHNvIHpjcl9tYXhfYml0cyBiZWluZyBoaWdoZXIgdGhhbg0K
Pj4+IHRoYXQgdmFsdWUgc2hvdWxkIGxpa2VseSBsZWFkIHRvIG5vdCB1c2luZyBTVkUgYXQgYWxs
IChpZiBpdCBkb2Vzbid0DQo+Pj4gYWxyZWFkeTsgZGlkbid0IGNoZWNrKS4NCj4+IA0KPj4gSSB0
aGluayB0aGUgY2hlY2sgc3ZlX3ZsX2JpdHMgPiB6Y3JfbWF4X2JpdHMgaXMgbmVlZGVkIGJlY2F1
c2UgZnJvbSANCj4+IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bChjb25maWctPmFyY2guc3Zl
X3ZsKTsgSSBjYW4gZ2V0IHZhbHVlcyBhYm92ZSB0aGUNCj4+IG1heGltdW0gc3VwcG9ydGVkIGJp
dHMgKHpjcl9tYXhfYml0cyksIGxhdGVyIG9uIEkgd2lsbCB1c2UgdGhlIHN0cnVjdCBhcmNoX2Rv
bWFpbg0KPj4gZmllbGQgc3ZlX3ZsIHRvIGNvbXB1dGUgdGhlIHNpemUgb2YgdGhlIHJlZ2lzdGVy
cyB0byBiZSBzYXZlZC9yZXN0b3JlDQo+PiANCj4+IElzIHRoZXJlIHNvbWV0aGluZyBJ4oCZdmUg
bWlzc2VkIGZyb20geW91ciBjb21tZW50Pw0KPiANCj4gSG1tLCBJIHJlYWxpemUgbXkgZWFybGll
ciByZXNwb25zZSBtYXkgaGF2ZSBiZWVuIGFtYmlndW91czogSSBkaWRuJ3QNCj4gbWVhbiB0byBx
dWVzdGlvbiB0aGUgcHJlc2VuY2Ugb2YgYm90aCBjaGVja3MgaW5kaXZpZHVhbGx5LiBJIG1lcmVs
eQ0KPiBtZWFudCB0byBxdWVzdGlvbiB3aGV0aGVyIGluIGFkZGl0aW9uIHRvIHRoZSB6Y3JfbWF4
X2JpdHMgY2hlY2sgeW91DQo+IHJlYWxseSBhbHNvIG5lZWQgdGhlIFNWRV9WTF9NQVhfQklUUyBv
bmUuDQoNCk9oIG9rIG5vdyBJIHNlZSB3aGF0IHlvdSBtZWFuLCB0aGlzIGNoZWNrDQoNCmlmICgg
IWlzX3ZsX3ZhbGlkKHN2ZV92bF9iaXRzKSApDQp7DQogICBkcHJpbnRrKFhFTkxPR19JTkZPLCAi
VW5zdXBwb3J0ZWQgU1ZFIHZlY3RvciBsZW5ndGggKCV1KVxu4oCdLA0KICAgc3ZlX3ZsX2JpdHMp
Ow0KICAgcmV0dXJuIC1FSU5WQUw7DQp9DQoNCkNhbiBiZSByZW1vdmVkIGJlY2F1c2UgaWYgKCBz
dmVfdmxfYml0cyA+IHpjcl9tYXhfYml0cyApIGlzIGVub3VnaCwNCkkgYWdyZWUgYW5kIHNvIGlz
X3ZsX3ZhbGlkIGlzIG5vdCByZXF1aXJlZCBhbnltb3JlDQoNCj4gDQo+IEphbg0KDQo=

