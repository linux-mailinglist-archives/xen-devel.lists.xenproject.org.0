Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6345896E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 07:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228574.395583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp39g-0001TW-Go; Mon, 22 Nov 2021 06:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228574.395583; Mon, 22 Nov 2021 06:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp39g-0001Rj-DK; Mon, 22 Nov 2021 06:50:20 +0000
Received: by outflank-mailman (input) for mailman id 228574;
 Mon, 22 Nov 2021 06:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHiU=QJ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1mp39f-0001Rd-5z
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 06:50:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 733591e3-4b60-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 07:50:17 +0100 (CET)
Received: from AM5PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:206:1::20)
 by DB6PR0802MB2277.eurprd08.prod.outlook.com (2603:10a6:4:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 06:50:13 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::85) by AM5PR04CA0007.outlook.office365.com
 (2603:10a6:206:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 06:50:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 06:50:12 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Mon, 22 Nov 2021 06:50:11 +0000
Received: from dcc87c63711a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D109366-0889-40E1-928C-215621443B1F.1; 
 Mon, 22 Nov 2021 06:50:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcc87c63711a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Nov 2021 06:50:01 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 by AM6PR08MB3608.eurprd08.prod.outlook.com (2603:10a6:20b:51::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 06:49:58 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::653f:85ca:8df1:43ea]) by AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::653f:85ca:8df1:43ea%8]) with mapi id 15.20.4669.022; Mon, 22 Nov 2021
 06:49:58 +0000
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
X-Inumbo-ID: 733591e3-4b60-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti5sln/VG5sKrPazXFCoo/wNepcbMHImY9p/8jLnE/c=;
 b=W16XELSEhoFKRwEzdF4VLFAoSOeh3HR0WBisGG5lvGPZgpsjck+7TAuJs3tS62i9t2BTH4B7/WfzEbwRH9m1U4WhE9JQsDY2uXmyNloc6I62z0eAdzJ4hbBvy/F9CEJ9eZxP4NCQ64h9jlk+HqPzSqoF+gfy9Q1bXCzz6nmU+zc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP79ZSfUs1JaC8SendGinyYZXpie/Gmq/9w5PB94Gt3+taXiJzXnF+KkJsm2CTMj40RRkjq3GaTiPRlA0CAkHKNkyEJzG1n4keDlHRUgiDzZsQjIHtG3XoH2SPnqtCF0X0lM94eszepVKFSMSwOxbYTABqwDeSWfmzF8Huj3JePE5MnTQin2FZh4zgFu0gGRHpkY81qkAIQw05zep/03dESzVAOLQKsQ1+mCQtCD/+Pm/kGG+RYALJWvGooSOLMPrykZRpIwmL4R0YGXQCIVd3p7yRNsce/RqSCUiNP+TCbWLJOqS/+E6s+kmQZXZQLUy1A/rARSy+JBI2Ynnti+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ti5sln/VG5sKrPazXFCoo/wNepcbMHImY9p/8jLnE/c=;
 b=YQQMtShakEeucps8hqJsqZqcmgjxWDaNwxXRNHmT1epcWgeMFiDoRwSbnaZxMCmw3TsTJwV2mI0je7RYsgyWyH9irsKtuWSeLajnUz6bnD7XHDtOYCko00crWhJnUVi8rABCrl++gEsk88a5nJoI8UJATdPsMNr49nXxa/HT+wIs+JdsOs2e0DhNUeh86xp4itCkk1ja+dfDc0Q44TLQsS8soRvF3mNuzyABYh8+643TiLi2n/pxy9d1/aRz3MiVQ+ruzLZXzB9JKoELe8Z5bHUZbJQybUtljDo9rlEXs+zx8DaPZRh5jz41KQUMRFP+5cKiXblBBILzRSRZS/YmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti5sln/VG5sKrPazXFCoo/wNepcbMHImY9p/8jLnE/c=;
 b=W16XELSEhoFKRwEzdF4VLFAoSOeh3HR0WBisGG5lvGPZgpsjck+7TAuJs3tS62i9t2BTH4B7/WfzEbwRH9m1U4WhE9JQsDY2uXmyNloc6I62z0eAdzJ4hbBvy/F9CEJ9eZxP4NCQ64h9jlk+HqPzSqoF+gfy9Q1bXCzz6nmU+zc=
From: Wei Chen <Wei.Chen@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"stefano.stabellini@xilinx.com" <stefano.stabellini@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, "ayankuma@xilinx.com"
	<ayankuma@xilinx.com>
Subject: RE: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Topic: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Index: AQHX3WXsk0YQ5vQljU+vQqG8YaxnEKwPGkxg
Date: Mon, 22 Nov 2021 06:49:58 +0000
Message-ID:
 <AS8PR08MB6853049F8F76B2CE2222AED39E9F9@AS8PR08MB6853.eurprd08.prod.outlook.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
In-Reply-To: <20211119165202.42442-1-ayankuma@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 458DAF5F9296B341A0B1D1B6440C30F6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fb4cb313-6734-4b57-313b-08d9ad84550e
x-ms-traffictypediagnostic: AM6PR08MB3608:|DB6PR0802MB2277:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2277DD85C9D950F1F49FED429E9F9@DB6PR0802MB2277.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JFlqmqOvY8q+yTYmY5QZPlh+51P6WQPprAhIPaEtArqxOHF8Vk2c+wZaQ6PW1TBHxPtvDv1p0UxI62T+P+K9usNAa92qN9I2QR4UdcYfUfpxo7USoMwLZBy8mN4uZwtxM/a+jbjWgishcI784hJfqs+ubthjctxUud2JjhlQ3fhqyzTjgsgMmv4h0NC+9SbVDbjL/B9RqMxE/evPTfEU5zq/9w+NY5MsY7OoUTZi1t3anYxz3uULHn94isEOVmXqC8g9igxB7Ok1yzfUwo3Wh5YbFuI9qMas5kNqhTGeP+1bQakNnnR2iks4GzsYcfEZNYZa7RfIBWk+lfJtuRwB7y91Jc/78Lie+qOI9xKPlBNJGazPuXy44dDHXq5sb+CFr0CI2iIY+TyrUsWYNMiEmwGPFdf6orpIOR9rNL9VeaiM6YkV8woUE5NSPzRgB7Xjl9S6WHpy0TVZskGuxWBA/oNwlVji+KvZm9NDHFD6wkfJwJrajcq2SqG3ejjF4aXCSi1TW6TwLqWP/6pC3pmahmC5opiPdgl3siiRmT+vWLq1SRdgB4WM7mJYUx0CSQu1KBG0HsCXeJDPzm2/BREJpgln3tNg/sS0vBLyqRcR/534pkwgvH8V9cx/mfftxGO/zxYTVPSl4xi8cBXPyNewazxpqDgTCUP4lkvb0sEK6n+lpus06pwFvi2ls1FclBo4fPZONLiR72QldhCKzHDJQTL9XPdhpyz7KkQvTRTs0k/8hghyQ8zVF1pAmaEqhe5w5QkMnJ6Gev8PIIOd/u6E+zPNBDIaIrw7eJkjl58Cysc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6853.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(55016002)(66946007)(76116006)(8936002)(26005)(38070700005)(86362001)(966005)(54906003)(186003)(38100700002)(8676002)(52536014)(316002)(508600001)(9686003)(33656002)(2906002)(5660300002)(83380400001)(7696005)(4326008)(6506007)(53546011)(66476007)(66556008)(110136005)(71200400001)(64756008)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3608
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	978b5122-a6ee-4c58-c1a8-08d9ad844ce2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zvNWv2MYJTihIHrowD3IZdVsbJHabGTudylzgDdHrr5zOTY9OjkzcTbmk8pHtttBWUa+86IKuQDKQ8kQXJQwMTwbZd7zTlaI7fiIsJ8hVzLfbUJNou7kwPY+oHyDzkr9KMeBfrVramT+OdMl61h2JsuGLJmNeV16IDsru8Vp0seTXmKrs7zfH+Jvimi+mg1pkeqmWXpVDPQkJXHX1BrV1J3qjf9tHJVOtLs2bl0k2qFVyqaC+z2MM3VaIEd6kt+yQEo6F56UqR87X+QTB/xNNAHllIDGrWK2iD00QLOQI6+N/9q1SdLGifgbIs9Ga4ily9rHQFtW/lbQDopWPOJExVIXjXhQzIS5KW4/rVNQ412bDGzQDuUtdoYtbep/5pMMIwdyhgc2+Q6Qy80/jwjau89o48BcMtIKWIgrp6ydUVadxiHSXpftl1UL9KusYo0whuJe5jhcp+DBSNVltmHQFE8WOSk2zeFozoOQGJLUTxeXADl1hfXmE2oqKWTi1jsSgkG9cRplwijqHTsa1gkCxck55YopvvDDj5SxaqWm5HVjkf78T9fXJLGX0BzY2xHUlFZz4ZIpKPHVPWyTm7Sde/ovgk6XaJgNcg8ChzE6q2WXgjorhal88GzU96pTJzrxAnGlV2+hD1ab+j0PTkNzc3eKTR3zBiWqIWTri0F9DewOhwxYef4JyvVYKCzLCAESZs4iJTHOHIzu0SYWS3riVLoxoITF/bkhBLzzc8q2pRcaP7Yfx9B2U0K2tKJ2WMsEqzev8eZJ0zpr+/70jVhTws5BDMF0fTM4RRZ1+AXx4CE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(36860700001)(52536014)(82310400003)(966005)(107886003)(8936002)(4326008)(110136005)(26005)(186003)(54906003)(53546011)(8676002)(6506007)(316002)(33656002)(83380400001)(5660300002)(9686003)(70206006)(508600001)(86362001)(47076005)(55016002)(2906002)(81166007)(356005)(70586007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 06:50:12.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4cb313-6734-4b57-313b-08d9ad84550e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2277

SGkgQXlhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
QXlhbg0KPiBLdW1hciBIYWxkZXINCj4gU2VudDogMjAyMcTqMTHUwjIwyNUgMDo1Mg0KPiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBzc3RhYmVsbGluaUBrZXJuZWwu
b3JnOyBzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbTsganVsaWVuQHhlbi5vcmc7DQo+IFZv
bG9keW15cl9CYWJjaHVrQGVwYW0uY29tOyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+Ow0KPiBSYWh1bCBTaW5naCA8UmFodWwuU2luZ2hAYXJtLmNvbT47IGF5YW5r
dW1hQHhpbGlueC5jb20NCj4gU3ViamVjdDogW1JGQyBQQVRDSF0gQWRkZWQgdGhlIGxvZ2ljIHRv
IGRlY29kZSAzMiBiaXQgbGRyL3N0ciBwb3N0LQ0KPiBpbmRleGluZyBpbnN0cnVjdGlvbnMNCj4g
DQo+IEF0IHByZXNlbnQsIHBvc3QgaW5kZXhpbmcgaW5zdHJ1Y3Rpb25zIGFyZSBub3QgZW11bGF0
ZWQgYnkgWGVuLg0KPiBXaGVuIFhlbiBnZXRzIHRoZSBleGNlcHRpb24sIEVMMl9FU1IuSVNWIGJp
dCBub3Qgc2V0LiBUaHVzIGFzIGENCj4gcmVzdWx0LCBkYXRhIGFib3J0IGlzIHRyaWdnZXJlZC4N
Cj4gDQo+IEFkZGVkIHRoZSBsb2dpYyB0byBkZWNvZGUgbGRyL3N0ciBwb3N0IGluZGV4aW5nIGlu
c3RydWN0aW9ucy4NCj4gV2l0aCB0aGlzLCBYZW4gY2FuIGRlY29kZSBpbnN0cnVjdGlvbnMgbGlr
ZSB0aGVzZTotDQo+IGxkciB3MiwgW3gxXSwgIzQNCj4gVGh1cywgZG9tVSBjYW4gcmVhZCBpb3Jl
ZyB3aXRoIHBvc3QgaW5kZXhpbmcgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QXlhbiBLdW1hciBIYWxkZXIgPGF5YW5rdW1hQHhpbGlueC5jb20+DQo+IC0tLQ0KPiBOb3RlIHRv
IHJldmlld2VyOi0NCj4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBhbiBpc3N1ZSBkaXNjdXNzZWQg
aW4NCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDIxLTExL21zZzAwOTY5Lmh0bWwNCj4gIlhlbi9BUk0gLSBRdWVyeSBhYm91dCBhIGRhdGEg
YWJvcnQgc2VlbiB3aGlsZSByZWFkaW5nIEdJQ0QgcmVnaXN0ZXJzIg0KPiANCj4gDQo+ICB4ZW4v
YXJjaC9hcm0vZGVjb2RlLmMgfCA3NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICB4ZW4vYXJjaC9hcm0vaW8uYyAgICAgfCAxNCArKysrKystLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kZWNvZGUuYyBiL3hlbi9hcmNoL2FybS9kZWNvZGUuYw0K
PiBpbmRleCA3OTJjMmU5MmE3Li43YjYwYmVkYmM1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9h
cm0vZGVjb2RlLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RlY29kZS5jDQo+IEBAIC04NCw2ICs4
NCw4MCBAQCBiYWRfdGh1bWIyOg0KPiAgICAgIHJldHVybiAxOw0KPiAgfQ0KPiANCj4gK3N0YXRp
YyBpbmxpbmUgaW50MzJfdCBleHRyYWN0MzIodWludDMyX3QgdmFsdWUsIGludCBzdGFydCwgaW50
IGxlbmd0aCkNCj4gK3sNCj4gKyAgICBpbnQzMl90IHJldDsNCj4gKw0KPiArICAgIGlmICggIShz
dGFydCA+PSAwICYmIGxlbmd0aCA+IDAgJiYgbGVuZ3RoIDw9IDMyIC0gc3RhcnQpICkNCj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKyAgICByZXQgPSAodmFsdWUgPj4gc3RhcnQp
ICYgKH4wVSA+PiAoMzIgLSBsZW5ndGgpKTsNCj4gKw0KPiArICAgIHJldHVybiByZXQ7DQo+ICt9
DQo+ICsNCg0KVGhpcyBmdW5jdGlvbidzIGJlaGF2aW9yIGlzIHZlcnkgc2ltaWxhciB0byB0aGUg
aGVscHMgdnJlZ19yZWd4X2V4dHJhDQppbiB2cmVnLmguIElmIHdlIHdpbGwgaW50cm9kdWNlIG1v
cmUgcmVnIGJpdCBvcGVyYXRpb24gZnVuY3Rpb25zIGxpa2UNCmV4dHJhY3QzMi4gQ2FuIHdlIGNv
bnNpZGVyIHRvIHJldXNlIHRoZW0/DQoNCj4gK3N0YXRpYyBpbnQgZGVjb2RlXzY0Yml0X2xvYWRz
dG9yZV9wb3N0aW5kZXhpbmcocmVnaXN0ZXJfdCBwYywgc3RydWN0DQo+IGhzcl9kYWJ0ICpkYWJ0
KQ0KPiArew0KPiArICAgIHVpbnQzMl90IGluc3RyOw0KPiArICAgIGludCBzaXplOw0KPiArICAg
IGludCB2Ow0KPiArICAgIGludCBvcGM7DQo+ICsgICAgaW50IHJ0Ow0KPiArICAgIGludCBpbW05
Ow0KPiArDQo+ICsgICAgLyogRm9yIGRldGFpbHMgb24gZGVjb2RpbmcsIHJlZmVyIHRvIEFybXY4
IEFyY2hpdGVjdHVyZSByZWZlcmVuY2UNCj4gbWFudWFsDQo+ICsgICAgICogU2VjdGlvbiAtICJM
b2FkL3N0b3JlIHJlZ2lzdGVyIChpbW1lZGlhdGUgcG9zdC1pbmRleGVkKSIsIFBnIDMxOA0KPiAr
ICAgICovDQoNCkkgaGF2ZSBzZWVuIHR3byBzdHlsZXMgb2YgbXVsdGlwbGUgbGluZSBjb21tZW50
cyBpbiB0aGlzIHBhdGNoLg0KSSBjaGVja2VkIHRoZSBvcmlnaW5hbCBmaWxlIGFuZCBpdCBoYXMg
bm8gc3BlY2lhbCBjb21tZW50Lg0KU28gSSB0aGluayB5b3UgbWF5IG5lZWQgdG8gZm9sbG93IHRo
ZSBtdWx0aXBsZSBsaW5lIGNvbW1lbnRzIHlvdQ0KaGF2ZSBkb25lIGZvciBhcm0vaW8uYyBpbiB0
aGlzIHBhdGNoLiBBbmQgdGhlIHNhbWUgZm9yIHNvbWUgY29tbWVudHMgYmVsb3cuDQoNCj4gKyAg
ICBpZiAoIHJhd19jb3B5X2Zyb21fZ3Vlc3QoJmluc3RyLCAodm9pZCAqIF9fdXNlcilwYywgc2l6
ZW9mIChpbnN0cikpICkNCj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKyAgICAv
KiBGaXJzdCwgbGV0J3MgY2hlY2sgZm9yIHRoZSBmaXhlZCB2YWx1ZXMgKi8NCj4gKw0KPiArICAg
IC8qICBBcyBwZXIgdGhlICJFbmNvZGluZyB0YWJsZSBmb3IgdGhlIExvYWRzIGFuZCBTdG9yZXMg
Z3JvdXAiLCBQZw0KPiAyOTkNCj4gKyAgICAgKiBvcDQgPSAxIC0gTG9hZC9zdG9yZSByZWdpc3Rl
ciAoaW1tZWRpYXRlIHBvc3QtaW5kZXhlZCkNCj4gKyAgICAgKi8NCj4gKyAgICBpZiAoIGV4dHJh
Y3QzMihpbnN0ciwgMTAsIDIpICE9IDEgKQ0KPiArICAgICAgICBnb3RvIGJhZF82NGJpdF9sb2Fk
c3RvcmU7DQo+ICsNCj4gKyAgICAvKiBGb3IgdGhlIGZvbGxvd2luZywgcmVmZXIgdG8gIkxvYWQv
c3RvcmUgcmVnaXN0ZXIgKGltbWVkaWF0ZSBwb3N0LQ0KPiBpbmRleGVkKSINCj4gKyAgICAgKiB0
byBnZXQgdGhlIGZpeGVkIHZhbHVlcyBhdCB2YXJpb3VzIGJpdCBwb3NpdGlvbnMuDQo+ICsgICAg
ICovDQo+ICsgICAgaWYgKCBleHRyYWN0MzIoaW5zdHIsIDIxLCAxKSAhPSAwICkNCj4gKyAgICAg
ICAgZ290byBiYWRfNjRiaXRfbG9hZHN0b3JlOw0KPiArDQo+ICsgICAgaWYgKCBleHRyYWN0MzIo
aW5zdHIsIDI0LCAyKSAhPSAwICkNCj4gKyAgICAgICAgZ290byBiYWRfNjRiaXRfbG9hZHN0b3Jl
Ow0KPiArDQo+ICsgICAgaWYgKCBleHRyYWN0MzIoaW5zdHIsIDI3LCAzKSAhPSA3ICkNCj4gKyAg
ICAgICAgZ290byBiYWRfNjRiaXRfbG9hZHN0b3JlOw0KPiArDQoNCklmIHRoZSBjaGVjayBpcyBm
aXhlZCwgd2h5IHdlIGRvbid0IGRlZmluZSBhIFZBTElEX01BU0sgdG8gY2hlY2sgaXQsDQpzb21l
dGhpbmcgbGlrZToNCmlmICggaW5zdHIgJiBNQVNLX2Zvcl8yMV8yNF8yNyA9PSBWQUxJRF9GT1Jf
MjFfMjRfMjcgKQ0KDQoNCj4gKyAgICBzaXplID0gZXh0cmFjdDMyKGluc3RyLCAzMCwgMik7DQo+
ICsgICAgdiA9IGV4dHJhY3QzMihpbnN0ciwgMjYsIDEpOw0KPiArICAgIG9wYyA9IGV4dHJhY3Qz
MihpbnN0ciwgMjIsIDEpOw0KPiArDQo+ICsgICAgLyogQXQgdGhlIG1vbWVudCwgd2Ugc3VwcG9y
dCBTVFIoaW1tZWRpYXRlKSAtIDMyIGJpdCB2YXJpYW50IGFuZA0KPiArICAgICAqIExEUihpbW1l
ZGlhdGUpIC0gMzIgYml0IHZhcmlhbnQgb25seS4NCj4gKyAgICAgKi8NCj4gKyAgICBpZiAoISgo
c2l6ZT09MikgJiYgKHY9PTApICYmICgob3BjPT0wKSB8fCAob3BjPT0xKSkpKQ0KPiArICAgICAg
ICBnb3RvIGJhZF82NGJpdF9sb2Fkc3RvcmU7DQo+ICsNCj4gKyAgICBydCA9IGV4dHJhY3QzMihp
bnN0ciwgMCwgNSk7DQo+ICsgICAgaW1tOSA9IGV4dHJhY3QzMihpbnN0ciwgMTIsIDkpOw0KPiAr
DQo+ICsgICAgaWYgKCBpbW05IDwgMCApDQo+ICsgICAgICAgIHVwZGF0ZV9kYWJ0KGRhYnQsIHJ0
LCBzaXplLCB0cnVlKTsNCj4gKyAgICBlbHNlDQo+ICsgICAgICAgIHVwZGF0ZV9kYWJ0KGRhYnQs
IHJ0LCBzaXplLCBmYWxzZSk7DQo+ICsNCj4gKyAgICBkYWJ0LT52YWxpZCA9IDE7DQo+ICsNCj4g
Kw0KPiArICAgIHJldHVybiAwOw0KPiArYmFkXzY0Yml0X2xvYWRzdG9yZToNCj4gKyAgICBncHJp
bnRrKFhFTkxPR19FUlIsICJ1bmhhbmRsZWQgNjRiaXQgaW5zdHJ1Y3Rpb24gMHgleFxuIiwgaW5z
dHIpOw0KPiArICAgIHJldHVybiAxOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGRlY29kZV90
aHVtYihyZWdpc3Rlcl90IHBjLCBzdHJ1Y3QgaHNyX2RhYnQgKmRhYnQpDQo+ICB7DQo+ICAgICAg
dWludDE2X3QgaW5zdHI7DQo+IEBAIC0xNTUsNiArMjI5LDkgQEAgaW50IGRlY29kZV9pbnN0cnVj
dGlvbihjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncw0KPiAqcmVncywgc3RydWN0IGhzcl9kYWJ0
ICpkYWJ0KQ0KPiAgICAgIGlmICggaXNfMzJiaXRfZG9tYWluKGN1cnJlbnQtPmRvbWFpbikgJiYg
cmVncy0+Y3BzciAmIFBTUl9USFVNQiApDQo+ICAgICAgICAgIHJldHVybiBkZWNvZGVfdGh1bWIo
cmVncy0+cGMsIGRhYnQpOw0KPiANCj4gKyAgICBpZiAoIGlzXzY0Yml0X2RvbWFpbihjdXJyZW50
LT5kb21haW4pICkNCj4gKyAgICAgICAgcmV0dXJuIGRlY29kZV82NGJpdF9sb2Fkc3RvcmVfcG9z
dGluZGV4aW5nKHJlZ3MtPnBjLCBkYWJ0KTsNCj4gKw0KPiAgICAgIC8qIFRPRE86IEhhbmRsZSBB
Uk0gaW5zdHJ1Y3Rpb24gKi8NCj4gICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJ1bmhhbmRsZWQg
QVJNIGluc3RydWN0aW9uXG4iKTsNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW8u
YyBiL3hlbi9hcmNoL2FybS9pby5jDQo+IGluZGV4IDcyOTI4N2UzN2MuLjQ5ZTgwMzU4YzAgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9pby5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pby5j
DQo+IEBAIC0xMDYsMTQgKzEwNiwxMyBAQCBlbnVtIGlvX3N0YXRlIHRyeV9oYW5kbGVfbW1pbyhz
dHJ1Y3QgY3B1X3VzZXJfcmVncw0KPiAqcmVncywNCj4gICAgICAgICAgLmdwYSA9IGdwYSwNCj4g
ICAgICAgICAgLmRhYnQgPSBkYWJ0DQo+ICAgICAgfTsNCj4gKyAgICBpbnQgcmM7DQo+IA0KPiAg
ICAgIEFTU0VSVChoc3IuZWMgPT0gSFNSX0VDX0RBVEFfQUJPUlRfTE9XRVJfRUwpOw0KPiANCj4g
ICAgICBoYW5kbGVyID0gZmluZF9tbWlvX2hhbmRsZXIodi0+ZG9tYWluLCBpbmZvLmdwYSk7DQo+
ICAgICAgaWYgKCAhaGFuZGxlciApDQo+ICAgICAgew0KPiAtICAgICAgICBpbnQgcmM7DQo+IC0N
Cj4gICAgICAgICAgcmMgPSB0cnlfZndkX2lvc2VydihyZWdzLCB2LCAmaW5mbyk7DQo+ICAgICAg
ICAgIGlmICggcmMgPT0gSU9fSEFORExFRCApDQo+ICAgICAgICAgICAgICByZXR1cm4gaGFuZGxl
X2lvc2VydihyZWdzLCB2KTsNCj4gQEAgLTEyMyw3ICsxMjIsMTYgQEAgZW51bSBpb19zdGF0ZSB0
cnlfaGFuZGxlX21taW8oc3RydWN0IGNwdV91c2VyX3JlZ3MNCj4gKnJlZ3MsDQo+IA0KPiAgICAg
IC8qIEFsbCB0aGUgaW5zdHJ1Y3Rpb25zIHVzZWQgb24gZW11bGF0ZWQgTU1JTyByZWdpb24gc2hv
dWxkIGJlIHZhbGlkDQo+ICovDQo+ICAgICAgaWYgKCAhZGFidC52YWxpZCApDQo+IC0gICAgICAg
IHJldHVybiBJT19BQk9SVDsNCj4gKyAgICB7DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAq
IFBvc3QgaW5kZXhpbmcgbGRyL3N0ciBpbnN0cnVjdGlvbnMgYXJlIG5vdCBlbXVsYXRlZCBieSBY
ZW4uIFNvLA0KPiB0aGUNCj4gKyAgICAgICAgICogSVNTIGlzIGludmFsaWQuIEluIHN1Y2ggYSBz
Y2VuYXJpbywgd2UgdHJ5IHRvIG1hbnVhbGx5IGRlY29kZQ0KPiB0aGUNCj4gKyAgICAgICAgICog
aW5zdHJ1Y3Rpb24gZnJvbSB0aGUgcHJvZ3JhbSBjb3VudGVyLg0KPiArICAgICAgICAgKi8NCj4g
KyAgICAgICAgcmMgPSBkZWNvZGVfaW5zdHJ1Y3Rpb24ocmVncywgJmluZm8uZGFidCk7DQo+ICsg
ICAgICAgIGlmICggcmMgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIElPX0FCT1JUOw0KPiArICAg
IH0NCj4gDQo+ICAgICAgLyoNCj4gICAgICAgKiBFcnJhdHVtIDc2NjQyMjogVGh1bWIgc3RvcmUg
dHJhbnNsYXRpb24gZmF1bHQgdG8gSHlwZXJ2aXNvciBtYXkNCj4gLS0NCj4gMi4xNy4xDQo+IA0K
DQo=

