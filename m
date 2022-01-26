Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99549C4C7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 08:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260680.450585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCd7y-0008Q1-1L; Wed, 26 Jan 2022 07:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260680.450585; Wed, 26 Jan 2022 07:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCd7x-0008O0-Ts; Wed, 26 Jan 2022 07:54:01 +0000
Received: by outflank-mailman (input) for mailman id 260680;
 Wed, 26 Jan 2022 07:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHDZ=SK=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nCd7v-0008Nu-DI
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 07:53:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe06::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d07ab06-7e7d-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 08:53:57 +0100 (CET)
Received: from AM6P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::38)
 by AM6PR08MB3301.eurprd08.prod.outlook.com (2603:10a6:209:47::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Wed, 26 Jan
 2022 07:53:53 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::3b) by AM6P192CA0025.outlook.office365.com
 (2603:10a6:209:83::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 07:53:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 07:53:53 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Wed, 26 Jan 2022 07:53:53 +0000
Received: from 95d41e5216f7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D8730BA-4F00-4663-B974-80AB003A7D20.1; 
 Wed, 26 Jan 2022 07:53:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95d41e5216f7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jan 2022 07:53:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM7PR08MB5512.eurprd08.prod.outlook.com (2603:10a6:20b:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 26 Jan
 2022 07:53:46 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 07:53:46 +0000
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
X-Inumbo-ID: 1d07ab06-7e7d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpWhxK+4sylmCM2zs4mWtv7k94dMFNXnXzWCQjTuVSw=;
 b=AkrGb8u4aqjOpNDyCJ4URn6VkcXrU6GK6Qbm2Kw0WZM4g0l+LQVWKv5fKB8WMc0wWOfFTiXfndrT7/N2AUpB4kNGvF03RTn0crH0wHaKgc8r2bAGIrcn35i020Z6mTRsCgFqynq+xYhQrG6udmfjBr+hGgKM9Ic/JYr3vpVKH7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9USPKFQDbB2xGrfczm86nRMxyrIf8t2ABksj/IG4Jy2qhM5yi8k66DPbCU7kDGXHzUwJNrkEzUYoX6C0UtTlDmKX13a4bEe8H5W1iVgkVkVXgC6ZQSQY1R2qcuw9hkZZ8B4yq2hE4T86PTNTmyrvyTqVzvJ0B6Ys+C62jRvvJle6HY4Jbz6X4GP/y83zCxolpypXxzFJqnaQVMa86scHn+2jYxGv3ocKC/V5aTa5d1ImnTNwMIlUUwuHXgE5jN9nbHrL6L7zQ8YMsDc/YXlDQTVOUUdku88Gg8FpK84roAjvjIVuxpGLiP3inv3t42d99L+gU+pos/vbKoVRi30Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpWhxK+4sylmCM2zs4mWtv7k94dMFNXnXzWCQjTuVSw=;
 b=eT7QWeQ5CeuRItUdC8OSynP+bmSEr9boL0RHYwVMh23uGHMqDMJxxdpAQuHZYZjxJdFi2MvSo6s59L1RTR6j3fE9SQf8oR0kfLzfs9RfhhgT1SduaoNETRWlYj0nm/3jwIzX3IjGimL8XNWIKuZHvRb9nbos0hR5NyUkkn6sP3iPdo1k/qgP9WLc/xVFC0x5kF03s9lQnSfMf9zS2STzs420fBF7ynrlcP3V0+ug4vjBmatZFZ0kTL5MflEcU5MwyDUrRbRLkSpKjsqmX6Da0aA1M0w/0MVqCtoYWJJlof7WE/ysTlMlqVnuEzGA6hVdufWhJ8VyxfZFVC5nvsMnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpWhxK+4sylmCM2zs4mWtv7k94dMFNXnXzWCQjTuVSw=;
 b=AkrGb8u4aqjOpNDyCJ4URn6VkcXrU6GK6Qbm2Kw0WZM4g0l+LQVWKv5fKB8WMc0wWOfFTiXfndrT7/N2AUpB4kNGvF03RTn0crH0wHaKgc8r2bAGIrcn35i020Z6mTRsCgFqynq+xYhQrG6udmfjBr+hGgKM9Ic/JYr3vpVKH7Y=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 09/37] xen/x86: introduce two helpers to access memory
 hotplug end
Thread-Topic: [PATCH 09/37] xen/x86: introduce two helpers to access memory
 hotplug end
Thread-Index: AQHXsHMSm4kTUY1aDkqu1iaKpcFN+KxzHOkAgAKVffA=
Date: Wed, 26 Jan 2022 07:53:46 +0000
Message-ID:
 <PAXPR08MB7420FFCBF02D56B2861B5A169E209@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-10-wei.chen@arm.com>
 <9b5756ec-2ec8-c796-e894-4cf4cfa67ff8@suse.com>
In-Reply-To: <9b5756ec-2ec8-c796-e894-4cf4cfa67ff8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7D87730444D39A45AEDE34D510DB2B20.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e7ea62f6-e1f9-40a4-b393-08d9e0a0ff97
x-ms-traffictypediagnostic:
	AM7PR08MB5512:EE_|AM5EUR03FT018:EE_|AM6PR08MB3301:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB33013B0C614A6FDF690F7D399E209@AM6PR08MB3301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:972;OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6kfljbLv/79VtUBTuybBGY47Tu+z6S6SPNv8D62+yeCyA7vsIwGT7qLA3bREE6Y0WFFlsn5S0BpgK1aYOHYdOcR3jmqtFr3jJv9NClKZ5tbLdB03OUVqoKfUTxAy1uHoXs+t8MxqWldIowTgyNTueNw7Q6qbrASDkXwaDjbYkd4Wy4cG6T1BWR9+3atqAnMoXOkQsVLtptr5ZT9wxzsgG56MWnW5vfPSHspWywPR0/WmR+qFIsjKUPffg3qWKRJtl/1QST5GH7Iy1G5w0TCoBXiJyhExlTxrrnDdNLfDn3Osxbhi6m0GqrmeQ9dEusrhM0edE2T73E56b69zh9o7nihxS7/i3DZ73TkLV2/hi/MoO3yiujUcWVMk+dJDQ7buO2+VNu0G5t0mhvXSWIexojm/iQviPDrHwAzKQ2T0xyHB1JWMIdK8D5DWUwwf4LpjTpAur5kHXFXJp8XAs+cHLkPZOAImBZAyDxmmz//xqHAcIb+P4LBwMyeUblKXyoohWnxqJGIJMyepuKF+JMTrawNCsvk8jSHn6OedJXC6XhcTdL4Tz7gzaN4kV9Y1tv4hYNxJo6wRtGAIPCgVwkGUQJ7HCk5PYqZ1hMdSVYElyjToDnQhd4gmL3moev7KCCysZ/6A4byBIZjeBktI2nDJU0H7bhap1u7s2DzWyfzNEwCajM4FAzbjlQpMeoKgN7G3OHUxFYHAKfonYSb5+7x+MA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(9686003)(8936002)(71200400001)(2906002)(86362001)(83380400001)(6506007)(55016003)(38070700005)(8676002)(52536014)(5660300002)(122000001)(66946007)(7696005)(33656002)(53546011)(186003)(38100700002)(6916009)(66556008)(4326008)(76116006)(66476007)(54906003)(64756008)(66446008)(26005)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd4d2830-5150-404f-0793-08d9e0a0fb17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pHMJ8cn6KZX5urhIlwjtHenR6BWmfH0Ov2A7XpJqJVEOlsnTCoJmj9OCVcbBZq2fwNB3bjW4ph5DER5NI0QTykDLBXIn8jHpQ+wWwu8+OHUpxay8yqK+u83OSAxLzhrGz28IJq2OFSt3vFp1b8HvSsmZX+5lqd1fhkUsietkRhPpoSBlFnhA95eEZl7YnQgviQpo0ZfsOkZWG923KwqRtC97aJTp4wIsfG6sRBJT/3oUomkkHktI+/RJK3hrYyk9NAIHjmiFz9m5w9J8tpkAMlMzDUx5N8FVLhjy0mH4mytHHYNCOa3VKXwkCpxhkOZ5MO1FTEy/aV6ErFhAADypO9UMQrDBp4rDfHfkyv1aoTmGbtTdVITcTyrxeJLdpuK1mFOhFgxsxyDqiG2J//2VwHo6HtHXE4LRMcgwn2ZNQE5OFgp3CuzioioKZF5Xv8NpEIUmJcPwBcC3XXHigzdxcxkpV4muwuNfki8/Y1pvJ/5n15B1RFC8k3XRaae/HjezulNGuGVkmUld7QRhLW/EZp8HhbumMVt9Z/RM0kKjWTt/YBOOMCA1UYrxeTc0W4ECXSeL3WOTnkaZLmqRR4D+1HjuVnLex3LpKRABfJosSxYesGRDuAxnSdqZwx36oOoPcALcUQoIGlF6maHB/NEQM8tb3onvGpRwZmpNPhuiuMDTNThPe4Ydachb1eZ4PmGUSHEoDyCyW4Z0r/0avfiFEZmHTIOSq9gS3nfuGERRjJ2ihn2b0gKksKQ3dzbZES5EvT+ViT9Juib+LlzEdSUD/g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(54906003)(316002)(6862004)(186003)(4326008)(9686003)(2906002)(26005)(5660300002)(336012)(40460700003)(52536014)(82310400004)(86362001)(70206006)(36860700001)(6506007)(356005)(55016003)(53546011)(8676002)(33656002)(508600001)(8936002)(7696005)(81166007)(47076005)(83380400001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 07:53:53.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ea62f6-e1f9-40a4-b393-08d9e0a0ff97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3301

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAwOjI1DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMDkvMzddIHhlbi94ODY6IGludHJvZHVjZSB0d28gaGVscGVycyB0byBhY2Nl
c3MgbWVtb3J5DQo+IGhvdHBsdWcgZW5kDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkg
Q2hlbiB3cm90ZToNCj4gPiB4ODYgcHJvdmlkZXMgYSBtZW1faG90cGx1ZyB0byBtYWludGFpbiB0
aGUgZW5kIG9mIG1lbW9yeSBob3RwbHVnDQo+ID4gZW5kIGFkZHJlc3MuIFRoaXMgdmFyaWFibGUg
Y2FuIGJlIGFjY2Vzc2VkIG91dCBvZiBtbS5jLiBXZSB3YW50DQo+ID4gc29tZSBjb2RlIG91dCBv
ZiBtbS5jIGNhbiBiZSByZXVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aXRob3V0DQo+ID4g
bWVtb3J5IGhvdHBsdWcgYWJpbGl0eS4gU28gaW4gdGhpcyBwYXRjaCwgd2UgaW50cm9kdWNlIHRo
ZXNlIHR3bw0KPiA+IGhlbHBlcnMgdG8gcmVwbGFjZSBtZW1faG90cGx1ZyBkaXJlY3QgYWNjZXNz
LiBUaGlzIHdpbGwgZ2l2ZSB0aGUNCj4gPiBhYmlsaXR5IHRvIHN0dWIgdGhlc2UgdHdvIEFQSS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+
IC0tLQ0KPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggfCAxMCArKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oDQo+ID4g
aW5kZXggY2I5MDUyNzQ5OS4uYWYyZmM0YjBjZCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L21tLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgNCj4gPiBA
QCAtNDc1LDYgKzQ3NSwxNiBAQCBzdGF0aWMgaW5saW5lIGludCBnZXRfcGFnZV9hbmRfdHlwZShz
dHJ1Y3QNCj4gcGFnZV9pbmZvICpwYWdlLA0KPiA+DQo+ID4gIGV4dGVybiBwYWRkcl90IG1lbV9o
b3RwbHVnOw0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtZW1faG90cGx1Z191cGRhdGVf
Ym91bmRhcnkocGFkZHJfdCBlbmQpDQo+ID4gK3sNCj4gPiArICAgIG1lbV9ob3RwbHVnID0gZW5k
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIHBhZGRyX3QgbWVtX2hvdHBsdWdf
Ym91bmRhcnkodm9pZCkNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuIG1lbV9ob3RwbHVnOw0KPiA+
ICt9DQo+ID4gKw0KPiA+DQo+IC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICoqKioqDQo+ID4gICAqIFdp
dGggc2hhZG93IHBhZ2V0YWJsZXMsIHRoZSBkaWZmZXJlbnQga2luZHMgb2YgYWRkcmVzcyBzdGFy
dA0KPiA+ICAgKiB0byBnZXQgZ2V0IGNvbmZ1c2luZy4NCj4gDQo+IEltbyBmb3IgdGhpcyB0byBt
YWtlIHNlbnNlIHlvdSB3YW50IHRvIGFsc28gdXNlIHRoZSBuZXcgZnVuY3Rpb25zDQo+IHJpZ2h0
IGF3YXkgaW4gdGhlIHBsYWNlKHMpIHdoZXJlIHRoZSBkaXJlY3QgYWNjZXNzKGVzKSBnZXQocykg
aW4NCj4geW91ciB3YXkuDQo+IA0KDQpPSywgSSB3aWxsIG1lcmdlIHRoaXMgcGF0Y2ggd2l0aCB0
aGUgcGF0Y2ggdGhhdCB3aWxsIHVzZSB0aGVzZQ0KZnVuY3Rpb25zIGZpcnN0bHkuIA0KDQo+IEph
bg0KDQo=

