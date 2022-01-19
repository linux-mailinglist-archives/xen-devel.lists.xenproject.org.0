Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1E493581
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258737.445958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5TY-0006mW-1L; Wed, 19 Jan 2022 07:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258737.445958; Wed, 19 Jan 2022 07:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5TX-0006je-Tq; Wed, 19 Jan 2022 07:33:47 +0000
Received: by outflank-mailman (input) for mailman id 258737;
 Wed, 19 Jan 2022 07:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA5TV-0006jY-KL
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:33:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c859bd-78fa-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 08:33:43 +0100 (CET)
Received: from AM6PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::20)
 by AM8PR08MB5636.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 07:33:40 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::bb) by AM6PR10CA0007.outlook.office365.com
 (2603:10a6:209:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 19 Jan 2022 07:33:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 07:33:40 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 19 Jan 2022 07:33:39 +0000
Received: from d5b884c1f6fb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F812D8D5-4C68-44D8-A425-49FA6F63BEC0.1; 
 Wed, 19 Jan 2022 07:33:33 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5b884c1f6fb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 07:33:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6921.eurprd08.prod.outlook.com (2603:10a6:10:2a5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 07:33:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 07:33:31 +0000
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
X-Inumbo-ID: 20c859bd-78fa-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41FLYyYNG/aJJDaOInaSy6ofBFgrSA8YQnqsStWmG+8=;
 b=QzkOTH1P9PCTRz9pxKR594UJEaj5sxv1oHUX9UinKDyibOh5rWOpWJEUY43pOJenMkbNAio1jnKngBeoUVB29oHOKRwxWoc37v8pH7uUyjvza/l9SvPTjyCSFJLONn9If0NF5Skoh3UTMb9Qr571etMikNEBt0o8a4MYgy3TdJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOMcF6DwKsDG40Dxgwvc86JDNd+6W9G4I3aQhAnSdbB0zLXzJji2leQPK+UvLccMJaZEKgXcieedBfPQr6K92dBzTZ4p0WZaOl69gAL8Idhe6Nz9XhFJQbb+qyzCPjJe+iDOg/Cu5Pxn5JC2jdqBu9opT+k1YPmqIu9QPkRV15DRaGRTCnefJj3LRbqt4nRIBSZCyXz2C191GD28GneqOnnjuL3aRVRJsX+6+tqMgbxQCJcdYXcWc16YqL+ZiicsCxLbWzAiEFfnNzdvFzxp+ix293w0zaHUyghMPXrMlhKXuKOKmbfleJhs2iYRnJ261hfiv6m7CaZQ0wNzHfUp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41FLYyYNG/aJJDaOInaSy6ofBFgrSA8YQnqsStWmG+8=;
 b=RbkgPF9DhQf3kodvUwcdbCTycEGLGdHRwBJhxFQHL3YNffu5VYz7FfJ+WEUVJ3PVaS64cshFQMchqDphkBc4y0h59YdFYzOawWlUkmjUEN9KHPH0BOWL3rZWw30Rsv5366WNNKl20VtvoRBdFmYsGW7gktA7XNUfsLJtNTswgugy6RfsW2uR9FMEKM0n+b4uYdDmVwmGPYcj8+yN5eRzGD9skRMBfjwT3fKTP/os4wEv97ibm3rvMjF/jMCxqh6aaTQoDPsQrKN5Ttm+g2VjgCivJkKz3kU4tXn0jYVZuFJ/Og+9vlmFdLHzPBVPGUKPBlegrD5OXURNismhiFROSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41FLYyYNG/aJJDaOInaSy6ofBFgrSA8YQnqsStWmG+8=;
 b=QzkOTH1P9PCTRz9pxKR594UJEaj5sxv1oHUX9UinKDyibOh5rWOpWJEUY43pOJenMkbNAio1jnKngBeoUVB29oHOKRwxWoc37v8pH7uUyjvza/l9SvPTjyCSFJLONn9If0NF5Skoh3UTMb9Qr571etMikNEBt0o8a4MYgy3TdJE=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Topic: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Index: AQHXsHMRZjZ8eZQrbkW8SEq2x0f00Kxpq6IAgAD9ltA=
Date: Wed, 19 Jan 2022 07:33:31 +0000
Message-ID:
 <PAXPR08MB74209486B9983A392AB66E059E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <3fe681fa-d01f-d5df-23f2-6c6d8089fd8a@suse.com>
In-Reply-To: <3fe681fa-d01f-d5df-23f2-6c6d8089fd8a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 43E8886BEC7819458D084DCBF5F66293.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0d4ac33a-4506-4ace-833e-08d9db1e0374
x-ms-traffictypediagnostic:
	DB9PR08MB6921:EE_|VE1EUR03FT061:EE_|AM8PR08MB5636:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5636E101575A3960A95F05249E599@AM8PR08MB5636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vFh/6W9moJWbg1ifkXj2wjPwI+xargyYh+h2bY1knWwXLVOTykuom6IkFFlWjHP3ts4t4NGh6CZ7oE7UQwX7dQpL4YgXS+kI+8Z8cxfX9o0SgJ14JKozyY0c+Sx3uB3FauxVdmhNJIrI1Hn6G7FQTYqX+acod661S7BwSGRRuAXx0kkAMG/yNtDpHaaf3FqTlna6BWWoYNaiCd38LAsETybGJ0gxWsw6LbKUl1tNfGMouW9GV9KicyUAC7aifeYwnT8vn4CoNn96flHXZsSU4w4qY09dMI4FXgOpQRDX7NIYGNM1hwEXG1mjafOWVw+Fw0UOdatheeeSX4dH97nQ1jYmixcOwVHmrk5yBPuYPUeZqhgiraJHciDUnXgudcdbjkh37MyAE9RyymKJZ+E/IEmRzbsYERvRu1qCaGnAQASkCxXkUfFG4GZyz/idN8BwBBinJiQMjajAlhqmuO+ZIOIzzLHz0a+m7zHRqowXHZXgnyafJYFEEJoIHpxNa/P631/60OfUxWU7Eefa9AAch7P6N8dl0zjloi5f+bBclmjEKt9GymAZtTSxqqKj68SjG7yTNyZyyHC73okn9GzC7XrR6dhM7GsV4wcBObRqH4stZuucY4VjwKIq2nJ8ISG1hP1Gnux7vqbPSZzm7yWPsGLCVkRaunMuEeRARTZXN8crxvR7Dq7BY6/7XaX5M9v1HS74fPINcZpXnNHSCkIItQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(83380400001)(64756008)(66556008)(66476007)(2906002)(66446008)(76116006)(66946007)(9686003)(4326008)(26005)(508600001)(55016003)(5660300002)(52536014)(38100700002)(71200400001)(122000001)(316002)(53546011)(6506007)(86362001)(7696005)(186003)(8676002)(8936002)(38070700005)(33656002)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6921
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff386235-720d-4623-1764-08d9db1dfe30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RMoJOB3lIoP+qVSTdVSOSu06qqANxKJ6pg9ZKKf6zn67v0gqGNbH75m2j1JbimadqYsR8I49aD/qLT35XqnPQcXbubWFBM00QAzVfc18vOQi7EaxqWI43fjqEbBvOKClyCT/BRuxI0viaCbjaOdkr+v0KROcrfpvcsJ2QgxcOCEN7s3IfuxfyANP8QPBUww6xDOvMdazfYWBb3QdZlXW3JudwguQsSRlCe+icf1ledKWk9xO8jW1F7XFYAr6Tso6eUqDtOPz2idYixXgxisR3mS0z/p/jjosShcU21B2OFWtuhWjtP8F4gEFa2iUTaHAgjlUOfs4WRy4Of+xjPvhNKQJOnTdcdFQ68xKE0A2D9yHzGIQR1+JnUpQX13uJO+K3eMYssEZ3mfmgJG7jyjKr9CQ3dpSs311HXTby5gk1MIuwAeFCVW4UH3CNDVf7TMjDOS54UOETf5Twcrwz++4yklug8/aGkVSLs21orFawYnndiP0sqpmS8rjsT4sImVtHWkDUCD94U3z4NoHqLDYwcWtAQrGmW8CjZd1QtWn3eVABmE2IbFFFiLnz0rQSKagXd7NMWE3Z0B7lP+hZUDPr7vMtyPmFl/NXk+YqRIWplmR8rMWOdy3VaaYtyNE0jPJ9ZMBDK4Fo0VE/lSZEsHGhwyitz368KsjPbsfC5pZyifpTKsU99OeH7cL3NhO/tSWnTfcXw+WznKtkJik1xc/KNEpWDnZVlCb9v8hPWNl1zd1dQMVjwFrF54e4SYVQ/MPlvmxl1AMFdrS9ZzS8Spvgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(6506007)(8676002)(8936002)(36860700001)(9686003)(83380400001)(2906002)(6862004)(316002)(4326008)(53546011)(7696005)(40460700001)(26005)(5660300002)(47076005)(356005)(186003)(86362001)(82310400004)(33656002)(508600001)(52536014)(54906003)(55016003)(70206006)(70586007)(81166007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:33:40.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4ac33a-4506-4ace-833e-08d9db1e0374
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5636

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOeaXpSAwOjEzDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMDgvMzddIHhlbi94ODY6IGFkZCBkZXRlY3Rpb24gb2YgZGlzY29udGlub3Vz
IG5vZGUNCj4gbWVtb3J5IHJhbmdlDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hl
biB3cm90ZToNCj4gPiBPbmUgTlVNQSBub2RlIG1heSBjb250YWluIHNldmVyYWwgbWVtb3J5IGJs
b2Nrcy4gSW4gY3VycmVudCBYZW4NCj4gPiBjb2RlLCBYZW4gd2lsbCBtYWludGFpbiBhIG5vZGUg
bWVtb3J5IHJhbmdlIGZvciBlYWNoIG5vZGUgdG8gY292ZXINCj4gPiBhbGwgaXRzIG1lbW9yeSBi
bG9ja3MuIEJ1dCBoZXJlIGNvbWVzIHRoZSBwcm9ibGVtLCBpbiB0aGUgZ2FwIG9mDQo+ID4gb25l
IG5vZGUncyB0d28gbWVtb3J5IGJsb2NrcywgaWYgdGhlcmUgYXJlIHNvbWUgbWVtb3J5IGJsb2Nr
cyBkb24ndA0KPiA+IGJlbG9uZyB0byB0aGlzIG5vZGUgKHJlbW90ZSBtZW1vcnkgYmxvY2tzKS4g
VGhpcyBub2RlJ3MgbWVtb3J5IHJhbmdlDQo+ID4gd2lsbCBiZSBleHBhbmRlZCB0byBjb3ZlciB0
aGVzZSByZW1vdGUgbWVtb3J5IGJsb2Nrcy4NCj4gPg0KPiA+IE9uZSBub2RlJ3MgbWVtb3J5IHJh
bmdlIGNvbnRhaW5zIG90aGUgbm9kZXMnIG1lbW9yeSwgdGhpcyBpcyBvYnZpb3VzbHkNCj4gPiBu
b3QgdmVyeSByZWFzb25hYmxlLiBUaGlzIG1lYW5zIGN1cnJlbnQgTlVNQSBjb2RlIG9ubHkgY2Fu
IHN1cHBvcnQNCj4gPiBub2RlIGhhcyBjb250aW5vdXMgbWVtb3J5IGJsb2Nrcy4gSG93ZXZlciwg
b24gYSBwaHlzaWNhbCBtYWNoaW5lLCB0aGUNCj4gPiBhZGRyZXNzZXMgb2YgbXVsdGlwbGUgbm9k
ZXMgY2FuIGJlIGludGVybGVhdmVkLg0KPiA+DQoNCkkgd2lsbCBhZGp1c3QgYWJvdmUgcGFyYWdy
YXBoIHRvOg0KLi4uIFRoaXMgbWVhbnMgY3VycmVudCBOVU1BIGNvZGUgb25seSBjYW4gc3VwcG9y
dCBub2RlIGhhcyBubyBpbnRlcmxhY2VkDQptZW1vcnkgYmxvY2tzLiAuLi4NCg0KPiA+IFNvIGlu
IHRoaXMgcGF0Y2gsIHdlIGFkZCBjb2RlIHRvIGRldGVjdCBkaXNjb250aW5vdXMgbWVtb3J5IGJs
b2Nrcw0KPiA+IGZvciBvbmUgbm9kZS4gTlVNQSBpbml0aWFsaXp0aW9uIHdpbGwgYmUgZmFpbGVk
IGFuZCBlcnJvciBtZXNzYWdlcw0KPiA+IHdpbGwgYmUgcHJpbnRlZCB3aGVuIFhlbiBkZXRlY3Qg
c3VjaCBoYXJkd2FyZSBjb25maWd1cmF0aW9uLg0KDQpJIHdpbGwgYWRqdXN0IGFib3ZlIHBhcmFn
cmFwaCB0bzoNClNvIGluIHRoaXMgcGF0Y2gsIHdlIGFkZCBjb2RlIHRvIGRldGVjdCBpbnRlcmxl
YXZlIG9mIGRpZmZlcmVudCBub2RlcycNCm1lbW9yeSBibG9ja3MuIE5VTUEgaW5pdGlhbGl6YXRp
b24gd2lsbCBiZSAuLi4NCg0KPiANCj4gTHVja2lseSB3aGF0IHlvdSBhY3R1YWxseSBjaGVjayBm
b3IgaXNuJ3QgYXMgc3RyaWN0IGFzICJkaXNjb250aW51b3VzIjoNCj4gV2hhdCB5b3UncmUgYWZ0
ZXIgaXMgbm8gaW50ZXJsZWF2aW5nIG9mIG1lbW9yeS4gQSBzaW5nbGUgbm9kIGNhbiBzdGlsbA0K
PiBoYXZlIG11bHRpcGxlIGRpc2NvbnRpZ3VvdXMgcmFuZ2VzIChhbmQgdGhhdCdsbCBvZnRlbiBi
ZSB0aGUgY2FzZSBvbg0KPiB4ODYpLiBQbGVhc2UgYWRqdXN0IGRlc2NyaXB0aW9uIGFuZCBmdW5j
dGlvbiBuYW1lIGFjY29yZGluZ2x5Lg0KPiANCg0KWWVzLCB3ZSdyZSBjaGVja2luZyBmb3Igbm8g
aW50ZXJsYWNlZCBtZW1vcnkgYW1vbmcgbm9kZXMuIEluIG9uZQ0Kbm9kZSdzIG1lbW9yeSByYW5n
ZSwgdGhlIG1lbW9yeSBibG9jayBzdGlsbCBjYW4gYmUgZGlzY29udGludW91cy4NCg0KSSB3aWxs
IHJlbmFtZSB0aGUgc3ViamVjdCB0bzoNCiJhZGQgZGV0ZWN0aW9uIG9mIGludGVybGFjZWQgbWVt
b3J5IGZvciBkaWZmZXJlbnQgbm9kZXMiDQpBbmQgSSB3b3VsZCByZW5hbWUgaXNfbm9kZV9tZW1v
cnlfY29udGludW91cyB0bzoNCm5vZGVfd2l0aG91dF9pbnRlcmxlYXZlX21lbW9yeS4NCg0KPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc3JhdC5j
DQo+ID4gQEAgLTI3MSw2ICsyNzEsMzYgQEAgYWNwaV9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9p
bml0KGNvbnN0IHN0cnVjdA0KPiBhY3BpX3NyYXRfY3B1X2FmZmluaXR5ICpwYSkNCj4gPiAgCQkg
ICAgICAgcHhtLCBwYS0+YXBpY19pZCwgbm9kZSk7DQo+ID4gIH0NCj4gPg0KPiA+ICsvKg0KPiA+
ICsgKiBDaGVjayB0byBzZWUgaWYgdGhlcmUgYXJlIG90aGVyIG5vZGVzIHdpdGhpbiB0aGlzIG5v
ZGUncyByYW5nZS4NCj4gPiArICogV2UganVzdCBuZWVkIHRvIGNoZWNrIGZ1bGwgY29udGFpbnMg
c2l0dWF0aW9uLiBCZWNhdXNlIG92ZXJsYXBzDQo+ID4gKyAqIGhhdmUgYmVlbiBjaGVja2VkIGJl
Zm9yZSBieSBjb25mbGljdGluZ19tZW1ibGtzLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGJvb2wg
X19pbml0IGlzX25vZGVfbWVtb3J5X2NvbnRpbnVvdXMobm9kZWlkX3QgbmlkLA0KPiA+ICsgICAg
cGFkZHJfdCBzdGFydCwgcGFkZHJfdCBlbmQpDQo+IA0KPiBUaGlzIGluZGVudGF0aW9uIHN0eWxl
IGRlbWFuZHMgaW5kZW50aW5nIGxpa2UgLi4uDQo+IA0KDQpPay4NCg0KPiA+ICt7DQo+ID4gKwlu
b2RlaWRfdCBpOw0KPiANCj4gLi4uIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBhdCBmdW5jdGlvbiBz
Y29wZSwgaS5lLiBpbiBhIExpbnV4LXN0eWxlDQo+IGZpbGUgYnkgYSB0YWIuDQo+IA0KPiA+ICsN
Cj4gPiArCXN0cnVjdCBub2RlICpuZCA9ICZub2Rlc1tuaWRdOw0KPiA+ICsJZm9yX2VhY2hfbm9k
ZV9tYXNrKGksIG1lbW9yeV9ub2Rlc19wYXJzZWQpDQo+IA0KPiBQbGVhc2UgbW92ZSB0aGUgYmxh
bmsgbGluZSB0byBiZSBiZXR3ZWVuIGRlY2xhcmF0aW9ucyBhbmQgc3RhdGVtZW50cy4NCj4gDQo+
IEFsc28gcGxlYXNlIG1ha2UgbmQgcG9pbnRlci10byBjb25zdC4NCg0KT2suDQoNCj4gDQo+ID4g
Kwl7DQo+IA0KPiBJbiBhIExpbnV4LXN0eWxlIGZpbGUgb3BlbmluZyBicmFjZXMgZG8gbm90IGJl
bG9uZyBvbiB0aGVpciBvd24gbGluZXMuDQo+IA0KDQpPay4NCg0KPiA+ICsJCS8qIFNraXAgaXRz
ZWxmICovDQo+ID4gKwkJaWYgKGkgPT0gbmlkKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArDQo+
ID4gKwkJbmQgPSAmbm9kZXNbaV07DQo+ID4gKwkJaWYgKHN0YXJ0IDwgbmQtPnN0YXJ0ICYmIG5k
LT5lbmQgPCBlbmQpDQo+ID4gKwkJew0KPiA+ICsJCQlwcmludGsoS0VSTl9FUlINCj4gPiArCQkJ
ICAgICAgICJOT0RFICV1OiAoJSJQUklwYWRkciItJSJQUklwYWRkciIpIGludGVydHdpbmUNCj4g
d2l0aCBOT0RFICV1ICglIlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+IA0KPiBzL2ludGVy
dHdpbmUvaW50ZXJsZWF2ZXMvID8NCg0KWWVzLCBpbnRlcmxlYXZlcy4gSSB3aWxsIGZpeCBpdC4N
Cg0KPiANCj4gPiBAQCAtMzQ0LDYgKzM3NCwxMiBAQCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQoY29uc3Qgc3RydWN0DQo+IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiA+ICAJ
CQkJbmQtPnN0YXJ0ID0gc3RhcnQ7DQo+ID4gIAkJCWlmIChuZC0+ZW5kIDwgZW5kKQ0KPiA+ICAJ
CQkJbmQtPmVuZCA9IGVuZDsNCj4gPiArDQo+ID4gKwkJCS8qIENoZWNrIHdoZXRoZXIgdGhpcyBy
YW5nZSBjb250YWlucyBtZW1vcnkgZm9yIG90aGVyDQo+IG5vZGVzICovDQo+ID4gKwkJCWlmICgh
aXNfbm9kZV9tZW1vcnlfY29udGludW91cyhub2RlLCBuZC0+c3RhcnQsIG5kLT5lbmQpKQ0KPiB7
DQo+ID4gKwkJCQliYWRfc3JhdCgpOw0KPiA+ICsJCQkJcmV0dXJuOw0KPiA+ICsJCQl9DQo+IA0K
PiBJIHRoaW5rIHRoaXMgY2hlY2sgd291bGQgYmV0dGVyIGNvbWUgYmVmb3JlIG5vZGVzW10gZ2V0
cyB1cGRhdGVkPyBPdG9oDQo+IGJhZF9zcmF0KCkgd2lsbCB6YXAgZXZlcnl0aGluZyBhbnl3YXkg
Li4uDQoNClllcywgd2hlbiBJIHdyb3RlIHRoaXMgY2hlY2ssIEkgY29uc2lkZXJlZCB3aGVuIHRo
ZSBjaGVjayB3YXMgZmFpbGVkLA0KYmFkX3NyYXQgd291bGQgbWFrZSBudW1hIGluaXRpYWxpemF0
aW9uIGJlIGZhaWxlZC4gVGhlIHZhbHVlcyBpbiBub2Rlc1tdDQp3aWxsIG5vdCB0YWtlIGFueSBl
ZmZlY3QuIFNvIEkgZGlkbid0IGFkanVzdCB0aGUgb3JkZXIuIEJ1dCBpZiB0aGUgYmFkX3NyYXQN
CndpbGwgYmUgY2hhbmdlZCBpbiBmdXR1cmUsIGFuZCBub2Rlc1tdIHdpbGwgYmUgdXNlZCBpbiBm
YWxsYmFjayBwcm9ncmVzcywNCnRoaXMgd2lsbCB0YWtlIG1vcmUgZWZmb3J0IHRvIGRlYnVnLiBJ
biB0aGlzIGNhc2UsIEkgYWdyZWUgd2l0aCB5b3UsDQpJIHdpbGwgdXBkYXRlIHRoZSBvcmRlciBp
biBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCldlaSBDaGVuDQoNCj4gDQo+IEphbg0KDQo=

