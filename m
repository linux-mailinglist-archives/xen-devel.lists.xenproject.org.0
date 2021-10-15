Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B259742EE41
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210081.366799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJzm-0007fb-A8; Fri, 15 Oct 2021 09:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210081.366799; Fri, 15 Oct 2021 09:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJzm-0007dQ-6T; Fri, 15 Oct 2021 09:59:22 +0000
Received: by outflank-mailman (input) for mailman id 210081;
 Fri, 15 Oct 2021 09:59:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbJzk-0007dK-Bp
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:59:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::60e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4b2063-9537-4d95-9492-8450a5873f3a;
 Fri, 15 Oct 2021 09:59:18 +0000 (UTC)
Received: from AM6P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::16)
 by AM4PR08MB2850.eurprd08.prod.outlook.com (2603:10a6:205:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 09:59:16 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::37) by AM6P194CA0003.outlook.office365.com
 (2603:10a6:209:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 09:59:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 09:59:15 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 15 Oct 2021 09:59:14 +0000
Received: from 078073e218ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FC93A6C-34F0-4E07-A44D-DD2C9824B073.1; 
 Fri, 15 Oct 2021 09:59:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 078073e218ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 09:59:04 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4895.eurprd08.prod.outlook.com (2603:10a6:802:ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 09:59:00 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 09:59:00 +0000
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
X-Inumbo-ID: bc4b2063-9537-4d95-9492-8450a5873f3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQmxa07pRCEJF1EK8YPd/kuFqwLQ/P6m0VXS0LMi8A0=;
 b=kgbdCFxh8dOUdMA7sxzY3ybSy+g2t0uhyr20YlcJitEBjjI4eTzoaXh6iGleS7W0Y6x3vKCWKzBm0gULedUREtzYoNqfqEYV4/PqPQbRYx3CEI7/R02ByxY8SNKEG1J0/RTsJV1Xgsxh8t/YLeA8uK72GMaXkk1ERz5BjhJmMhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzBQvOQ/I/FobDOzyxqRZex0lN/zTORCIzRyBqWl9555mHUvNNLLc7iFsYeMEkVcEL3Z5GJhXvKmTVGxL2xroSGKztETuVCAPXyAdKdVAQS4p6GlQFKI7Ar79pPbeWXFSifI15Z/V5dh1IO+QggWLkznBCFPWZqovDsZO/pIAGg3Kj9LxqR+hzQgSUV5dEdrJL0Wy8cS/Tf3LUmWIOeq8NDssX8FfczCjYFOlMcttRuiDB4e01p9DI777vVF+yyYCOM35nc+3E3YW8TRKc3ZjP9uT8u4IZ1vJuo1lcM6ZUSxq+ODEXCpzz5Aht1UFCW2In18JopdnqLYuqnu/X1BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQmxa07pRCEJF1EK8YPd/kuFqwLQ/P6m0VXS0LMi8A0=;
 b=d/Z7dt9hbomv1siwz40RkwqyNG8R07q0U5kfRzjihmnd09BVx/qHkSXdmCRtAjoN18lqu/vnzw6qyH5z2iyDaDDcQbknNerp6Z2CUW4FdxQfzozK3zBrdiXeT4gY6ybxSCSbgqyXSt8DsKWSMpSXUQlgrqdUizBeUlw0druO7QXJtewHDZB/ojt6z3/w0akBUFxjCJp0gTyw1ypcwOqBMEGHPdAcMYJBMqcRzdP5TxFcr9N5M1mLeD05MQkVpRbPAhCeL7HU9KO1PFHc5Be48YXPDmKdTpkahciJgNkeM/xc8PvqxegAd2lHCydVOYZ6TXmXAjePJ3RrsnW0LuYOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQmxa07pRCEJF1EK8YPd/kuFqwLQ/P6m0VXS0LMi8A0=;
 b=kgbdCFxh8dOUdMA7sxzY3ybSy+g2t0uhyr20YlcJitEBjjI4eTzoaXh6iGleS7W0Y6x3vKCWKzBm0gULedUREtzYoNqfqEYV4/PqPQbRYx3CEI7/R02ByxY8SNKEG1J0/RTsJV1Xgsxh8t/YLeA8uK72GMaXkk1ERz5BjhJmMhE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Topic: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Index: AQHXwaEz9sR/Jlon9kSpv6953h7AKKvTwZeQ
Date: Fri, 15 Oct 2021 09:59:00 +0000
Message-ID:
 <VE1PR08MB521583497AD2D7A3FA3AAA8CF7B99@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
 <073d4b36-cb2f-88b2-76d2-3438d4ef589a@suse.com>
In-Reply-To: <073d4b36-cb2f-88b2-76d2-3438d4ef589a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 40D2948B8CCF5347ABDF82F81703A94B.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 194e6e3d-ce7f-4ceb-b23d-08d98fc27256
x-ms-traffictypediagnostic: VE1PR08MB4895:|AM4PR08MB2850:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2850ED3D1B1501403AB400FDF7B99@AM4PR08MB2850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m6kL9Bj7C4WW0I4ZJQNVoWwd2WBbU2/xzHReiOhNIBO+jJrjRIhSKnWqunMWvrmxwsS6nFfmaJPuK6fQbklPGqL/P/sl8mgaI8t6zCfzJoMmn3/OcYacXTTJsIN44wVuJFCc89JcKyuh0NRBfHy1hdItA7VI63CC9Xx5on5mG8ImGJcFQLlsP1bc2h07sKWchUfA9OjYmiON5IrTKXgJ14r+fcnWRR2kZ3M6aGQFO/HctMI/sAt3C/yugXmAMI8/198rtU0ljBQVNKCAu0pCJD9xvQYrgWAe8d7bQV41Eh+TzbNoQ0HjlQTeyXP8UWZHjPu1qySGb/2oglo0R5PVr3yFm7AUe1pbnMnqNnS+XSwVgpsdBKhhiAMoveLQyH7uH2iReuool942/M7OGiMARo4ajjm9QZL1150mTa66wMm+sFG0zVtQk8wfAkmjcr2C6uN44ydb2ULYVFt0r4Bmfe1/+woix7AXXaFZLgjflCQCxn5BIQi9q4zmoG/MsJKgX0M5u0mh8eGFMa1jl6pxu33nQrySLq34fGJE1NazsIe8pG4cqqIgNJQt0dxHLFiefCba8ZOnw1JhNd5aI4myzNigIbll394TDOfYc+544HP4viA3Prw5T0TYNbFd2Ci6ebq+AG1Fs4HqBdFB0yhhzQchIEQOuPzkI5RRXg3YPtnAc38UWXqvgxl+kME/HmCNQWnqD7U4ZhQscBEQt8VL4S0JFQlMqihJHGwsJSmJfiSvewnGMzEsU3DoyYIFkCkpt3gXFYIFAsmSyL3ojnwad445ZLgS9w4Y3toUvd6AByI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(52536014)(53546011)(316002)(966005)(6506007)(33656002)(86362001)(71200400001)(8676002)(26005)(508600001)(76116006)(8936002)(38100700002)(122000001)(55016002)(66556008)(64756008)(66946007)(9686003)(186003)(5660300002)(66446008)(38070700005)(4326008)(66476007)(7696005)(2906002)(83380400001)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4895
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de1b868d-7de0-47c4-45f0-08d98fc26973
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sp3s/T7yh7MQXl5c9WCLrEF+Jg0Uh0KsDMzMXRuWjFgoQs5fhBV/qHNPvptxjo8uH2RGlUdf2gfdcOqWkqpa2wB3mp/q4drKLa/3Y2TGXL/YXMRl99j519ObEO6oFZZZF/AYvvVGcxgDHH8SzPvZDipH2FA3fbSS/fjbyYWaBXN6k7Xr6Z7lC5NmE5S3QCKNHpSl5ZBl0hDoktkI02uBGjtWHgeCHAhLDFOFvaXkXgN046IY+lpwYvgsowNtIXF2dIwy1o3JaxAGYg0EAWR8Cdn6oYyNRC7R9SszTHLscR4juMSIfd/OyTiQNuSr9YUwHXzGj5Q36YjX4FtY3UvsYRwXibO10r4PIcE9nCaYNK1mXvopiaX64z38EGI0VsOhy+4OxmxGetUmRLyzVOu3WHNUtCEu+Bk4kKQqAiGV7dM9B10nnN0xI/25BIvPA228nkymzysmY7WYs2hBB1YOfOZK8S2d/0FwaM1zAtrvJseI7TC0oIWAjNDQG2wZ4EIQYVSWLmTcVwz6ep6GoSAkucv5wvWV3EBdz7NvgAHI+aCf//14ACO4gMI+tMvTLXSk6UfWFMddERJ5P01VkBgDM2hP+wMvpoBA8N7yXinhBt2e94o0pD6nEh9psYam0xJMBYDxaXDJ8/N8f3sEfNBEAEdaR45jW7q2nwVUNeHZYJsuA+510VUyVHQBo4J4HgTyCm0mvNBEFa86k2jKZMHOK8zCre2CRTlib97iWbln34P++7pIeRxc89zgyGWckWfwtWZF/l86uy72VEs/nklAPPP/KUufmv4gMaz4+m24NIg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(54906003)(53546011)(26005)(316002)(33656002)(6506007)(9686003)(356005)(8676002)(52536014)(55016002)(82310400003)(7696005)(186003)(6862004)(81166007)(8936002)(5660300002)(36860700001)(70586007)(70206006)(508600001)(83380400001)(86362001)(336012)(966005)(4326008)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:59:15.2978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194e6e3d-ce7f-4ceb-b23d-08d98fc27256
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTUsIDIwMjEg
NDo0NyBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0
YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzZdIHhlbjogaW50cm9kdWNlIFhFTl9ET01DVExfQ0RGX2RpcmVjdG1hcA0KPiANCj4g
T24gMTUuMTAuMjAyMSAwNTowOSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnJvbTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gPg0KPiA+IFRo
aXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgYXJtLXNwZWNpZmljIGZsYWcNCj4gPiBYRU5fRE9N
Q1RMX0NERl9kaXJlY3RtYXAgdG8gc3BlY2lmeSB0aGF0IHRoaXMgZG9tYWluIHNob3VsZCBoYXZl
IGl0cw0KPiA+IG1lbW9yeSBkaXJlY3RseSBtYXBwZWQgKGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mg
PT0gcGh5c2ljYWwgYWRkcmVzcykgYXQNCj4gZG9tYWluIGNyZWF0aW9uLg0KPiA+DQo+ID4gUmVm
aW5lIGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGZsYWcNCj4g
PiBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXAgaXMgc2V0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAt
LS0NCj4gPiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQ0KPiA+IENDOiBqYmV1bGljaEBz
dXNlLmNvbQ0KPiA+IENDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+DQo+ID4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPg0KPiA+
IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiA+IENDOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiANCj4gUGxlYXNlIGhhdmUgaGVyZSBhIGJy
aWVmIGxvZyBvZiBjaGFuZ2VzIGluIHRoZSBuZXcgdmVyc2lvbiwgdG8gYWlkIHJldmlld2Vycy4N
Cj4gDQoNClN1cmUuDQoNCj4gPiAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICB8IDMgKyst
DQo+ID4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgfCA0ICsrKy0NCj4gPiAgeGVuL2Nv
bW1vbi9kb21haW4uYyAgICAgICAgICB8IDMgKystDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0v
ZG9tYWluLmggfCA0ICsrLS0gIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCAgfA0KPiA+IDQg
KysrLQ0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+IA0KPiBZb3UgY2xlYXJseSBoYWQgdG8gcmUtYmFzZSBvdmVyIHRoZSBYRU5fRE9NQ1RM
X0NERl92cG11IGFkZGl0aW9uLiBJIHRoaW5rDQo+IGp1c3QgbGlrZSB0aGF0IGNoYW5nZSAod2hp
Y2ggSSdkIGV4cGVjdCB5b3UgdG8gaGF2ZSBsb29rZWQgYXQgd2hpbGUgZG9pbmcgdGhlDQo+IHJl
LWJhc2UpIHlvdSBhbHNvIG5lZWQgdG8gYXQgbGVhc3QgZmlkZGxlIHdpdGggT0NhbWwncyBkb21h
aW5fY3JlYXRlX2ZsYWcsIHRvDQo+IGtlZXAgdGhlIEFCSSBjaGVjayB0aGVyZSBoYXBweS4NCj4g
DQoNClRoZSBwYXRjaCBzZXJpZSBpcyBiYXNlZCBvbiB0aGUgc3RhZ2luZyBicmFuY2ggd2l0aCBh
biBleHRyYSBjb21taXQgIg0KUmV2ZXJ0ICJ4ZW4vZG9tY3RsOiBJbnRyb2R1Y2UgWEVOX0RPTUNU
TF9DREZfdnBjaSBmbGFnIiwgd2hpY2gNCklzIGFscmVhZHkgYmVlbiBwdXNoZWQgdG8gY29tbXVu
aXR5IGZvciByZXZpZXcuKA0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDIxLTEwL21zZzAwODIyLmh0bWwpDQoNCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmgNCj4gPiBAQCAtNzIsOSArNzIsMTEgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
IHsNCj4gPiAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9uZXN0ZWRfdmlydCAgICAoMVUgPDwNCj4g
X1hFTl9ET01DVExfQ0RGX25lc3RlZF92aXJ0KQ0KPiA+ICAvKiBTaG91bGQgd2UgZXhwb3NlIHRo
ZSB2UE1VIHRvIHRoZSBndWVzdD8gKi8NCj4gPiAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl92cG11
ICAgICAgICAgICAoMVUgPDwgNykNCj4gPiArLyogSWYgdGhpcyBkb21haW4gaGFzIGl0cyBtZW1v
cnkgZGlyZWN0bHkgbWFwcGVkPyAoQVJNIG9ubHkpICovDQo+ID4gKyNkZWZpbmUgWEVOX0RPTUNU
TF9DREZfZGlyZWN0bWFwICAgICAgKDFVIDw8IDgpDQo+IA0KPiBUaGUgY29tbWVudCBkb2Vzbid0
IHJlYWQgd2VsbDsgaG93IGFib3V0ICJTaG91bGQgZG9tYWluIG1lbW9yeSBiZQ0KPiBkaXJlY3Rs
eSBtYXBwZWQ/IiBUaGF0J3MgaWYgYSBjb21tZW50IGhlcmUgaXMgcmVhbGx5IG5lZWRlZCBpbiB0
aGUgZmlyc3QgcGxhY2UuIEkNCj4gYWxzbyBkb24ndCB0aGluayAiQXJtIG9ubHkiIHNob3VsZCBi
ZSBoZXJlIC0gdGhpcyBtYXkgZ28gc3RhbGUuIFdoYXQgSSdtDQo+IG1pc3NpbmcgaW4gdGhpcyBy
ZWdhcmQgaXMgcmVqZWN0aW5nIG9mIHRoZSBmbGFnIGluIHg4Nidlcw0KPiBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoKSAob3IgYnkgd2hpY2hldmVyIG90aGVyIG1lYW5zKS4NCj4gDQo+IEph
bg0KDQo=

