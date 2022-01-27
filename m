Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7E49DC29
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261274.452183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzlR-0001eX-6M; Thu, 27 Jan 2022 08:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261274.452183; Thu, 27 Jan 2022 08:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzlR-0001ch-24; Thu, 27 Jan 2022 08:04:17 +0000
Received: by outflank-mailman (input) for mailman id 261274;
 Thu, 27 Jan 2022 08:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nCzlQ-0001cZ-Bj
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:04:16 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe05::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e8c73a-7f47-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:04:15 +0100 (CET)
Received: from AM5PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:69::20) by AM8PR08MB5651.eurprd08.prod.outlook.com
 (2603:10a6:20b:1c4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 08:04:04 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::4d) by AM5PR0202CA0010.outlook.office365.com
 (2603:10a6:203:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 08:04:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:04:03 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 27 Jan 2022 08:04:03 +0000
Received: from 671eae0af1e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 986679E4-760B-4DEA-AFE5-71D39C474955.1; 
 Thu, 27 Jan 2022 08:03:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 671eae0af1e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:03:57 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6932.eurprd08.prod.outlook.com (2603:10a6:20b:301::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 08:03:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:03:56 +0000
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
X-Inumbo-ID: b7e8c73a-7f47-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aulY6N+wY3Q2qtoEOWjfk646UHH1xeCvrILBn0guYs=;
 b=K6r8ugmTPtSo8jtQXOGVR/7ZVLcy1oCLzc4bZvz6goHUFek+IMD+4bAuTqjlUsUjUSLqVugAcIxEmmGCZGAGrQ0Kec8SZ80JLZ/ZL4kHo3ZEBDMGXW+8mO/CErAxJHU3SFYj7kUJwK0Gd1n8PBUwpCnDVowvb2kWhf4oZBqSSzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSJA2tO0CK2F5OioKUqhY66hFQF1sx9nsP9xz43RAlR/k3EV9JOPbzJUF9FDwcgeQYmVl3tIEn1xt98h9LWXLJEYgy6OGPIFADuW2Rhkm/F2arGUND4+aZt69C9KDvek03RSjG0sT5O3DoL/o9sRDB5+2TWY0uD4ARBy27swBOrZSjpWy83kN0F0ffPBC4gO6qAQsx45TJcf2wYdA15p0Hbj0MAJkQD8mihrLZ6mTSKW9fP4F36SiitP7QR3RPwvoU99LcutmOK8A8cX5sNxFdRtgqfIX5IpqgjdPxUkq65yAC1q1Y1NgI4KF4a0KAei07O8xuzSBASjPU5nOOA8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aulY6N+wY3Q2qtoEOWjfk646UHH1xeCvrILBn0guYs=;
 b=oMyDl7U7SsYSEpipYQew3GxIzz2KZEdPS548LvIlPudM/oZeRNMgeMdTDXGzARSo7kjFj2C4Ev2ometfbX+LfTM0U76Xi0PlGuXuW+K/MxGhSOyc8FMbHzEbWN55dMrTHoetPY4kB4BTGtNUXDN4PjtBCoHdATkxEB3AVjTAMAjjF+FE58uv5JPAB/iVVJXOW1C7ORbLqp+UN+E/GB/i2ApsT/r3MPAKKfnQXAj4kaW273ZcWp1YtRHQhrHIQScWj86ZnVTQah8nF2yUGAW2ItnhOxq2N6g/P1W0DSAq6fLntCft3UvwcmJGIflAZ5NfYW839bmzeBalCWToW2nybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aulY6N+wY3Q2qtoEOWjfk646UHH1xeCvrILBn0guYs=;
 b=K6r8ugmTPtSo8jtQXOGVR/7ZVLcy1oCLzc4bZvz6goHUFek+IMD+4bAuTqjlUsUjUSLqVugAcIxEmmGCZGAGrQ0Kec8SZ80JLZ/ZL4kHo3ZEBDMGXW+8mO/CErAxJHU3SFYj7kUJwK0Gd1n8PBUwpCnDVowvb2kWhf4oZBqSSzs=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Topic: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Index: AQHXsHMWLK2Lk+nkCEuQGshEHTFFNqxzJoSAgAQcdmA=
Date: Thu, 27 Jan 2022 08:03:55 +0000
Message-ID:
 <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
 <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
In-Reply-To: <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C960163EF1F47B4682D992B165CD7D69.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8b31d1a6-1df2-4086-717d-08d9e16b95a0
x-ms-traffictypediagnostic:
	AM9PR08MB6932:EE_|VE1EUR03FT061:EE_|AM8PR08MB5651:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56517713C5B7D49F9CAD76779E219@AM8PR08MB5651.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ocYxhgZxGEIXhQLIKKXEJwwDL73FicA42zN996zjTTQyE6C6i0m3U7KBjcnghe0kk2KaaYN0B2AVf4od8ht0JeQqq7fGJYStQ920IC0K95rATGoiFSo7zBqXlJmTZFbvCc/f/CjLzh4e6XbtjyS16JTS+GVuUA88TQ5LtPmEumS+MKSgJyb77Oo4Cz/oT17BD6pX8dfjRVK4g4l0WjPX1KdltnsqR1kThxmYTKpgCdxPxmWUHMVK48wSgL/cdLTrevHox0uR/Oxw/w8wOP/4aO6lkE73YxXL05dNVuUzcHApvgTZbMU1eZU43UyOnHLguTVbiFwMsY7on9cRPnuIPhno6WhmBQuJLJDRx5TnEHEwAr618OaneGuKaUHrJ9bI4Cblr3HCvppEFGvwNvHvRVN71bougsXVqeQ07UVFVw/8d392ST1o/oIrv7BLk5BsNnluZJpJ4USfWoZKMF3kvn+SeuZCM4uPBtgTGIf86hh1wDCidvoWtrzD9L1h/lxfY6onuCKECzRZkWEcdqGzJqrkszsBANKke5UTRhtjw8sQy39JC2iS3bre65Xm+wA03GjpNnlvjuq3n3PC1VFkTrkcLxNgn4UKOKXWjGmMQdNKzfOK4N1YOMliWUASnGaBSCbBRZjvXtU5fgga11oU//R9av2k+9oAoTB7R0ujR6GeeX4tkcjzNin/cM4ikNK3zTS7WLLVab32Im1P4UElbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(2906002)(186003)(66446008)(9686003)(66946007)(53546011)(316002)(33656002)(64756008)(71200400001)(6506007)(6916009)(54906003)(66556008)(83380400001)(66476007)(26005)(52536014)(38070700005)(8676002)(8936002)(122000001)(76116006)(55016003)(38100700002)(4326008)(7696005)(86362001)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6932
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31bd640e-3a07-4e5f-418d-08d9e16b9109
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w/8CA3swseqlRombsZtn4I9sQ7Nsb2SKgURtohNJgU6W8Y/FNBap/vJSCNIYiLYlcS/i+V5V8/OzHio3e/DnlJNR7strKiv9tepNOS/mpMJB9k7en8NO/OaQ3C/eA4QLjI0J9J2nEZUjPq0QGzaU1xlO4B93PfCrt9/bs8GXGnWkvjjrjtwcDlKNezt6hP+H4wc+qy6YtCQChw86gzNC/7EuvdVnUlqYIepoPUq3fQe8pOxIjMDhpw0mqfcTf/A/RT4ZLpC97ZU9gxfn7mrESb8xn+0LQpAGvyfLles/Pc4QRRqi5BaBh5lqASBv3XK1xv0JefUEwLiUFTAz0hPyvey6Ce94jW7L/KqUjLZPyyj3gL9W3tkwlVkXfpPrzgXxiuwVaAwpnfjjFn5py7zLqzYPW1ACR61MOSi9yv0QSVIk00YtQWvCe8VkKm8ei21lSBjYE7QIV/JKJXlFP+TE1RWd+zA8rs2C/3xL/5BCGeVn/ZO++8P2y8STEfdW6a0hQE9M782ADo6hgiuZkrbu84MzhotGodiejLEwK1JjmBQdru0bnUmvHJOKb0uoGxvFkLEDwUPvwu1/8q8K3YqoV+JIjtnwLi5K5OtIGF1StGsUI1y8kFXuTYZjhlRf09XN0lyeqeMHTCcFzWesG5Lz42ShCDUl7ff7DTcxssNXBrw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(186003)(508600001)(86362001)(47076005)(36860700001)(336012)(83380400001)(33656002)(40460700003)(7696005)(53546011)(2906002)(9686003)(6506007)(82310400004)(8936002)(5660300002)(70206006)(70586007)(52536014)(8676002)(54906003)(316002)(4326008)(6862004)(356005)(55016003)(81166007)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:04:03.6612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b31d1a6-1df2-4086-717d-08d9e16b95a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAwOjU5DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMTIvMzddIHhlbi94ODY6IGRlY291cGxlIG5vZGVzX2NvdmVyX21lbW9yeSBm
cm9tIEU4MjANCj4gbWFwDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hlbiB3cm90
ZToNCj4gPiBXZSB3aWxsIHJldXNlIG5vZGVzX2NvdmVyX21lbW9yeSBmb3IgQXJtIHRvIGNoZWNr
IGl0cyBib290bWVtDQo+ID4gaW5mby4gU28gd2UgaW50cm9kdWNlIHR3byBhcmNoIGhlbHBlcnMg
dG8gZ2V0IG1lbW9yeSBtYXAncw0KPiA+IGVudHJ5IG51bWJlciBhbmQgc3BlY2lmaWVkIGVudHJ5
J3MgcmFuZ2U6DQo+ID4gICAgIGFyY2hfZ2V0X21lbW9yeV9iYW5rX251bWJlcg0KPiA+ICAgICBh
cmNoX2dldF9tZW1vcnlfYmFua19yYW5nZQ0KPiANCj4gSSdtIHNvcnJ5LCBidXQgcGVyc29uYWxs
eSBJIHNlZSBubyB3YXkgZm9yIHlvdSB0byBpbnRyb2R1Y2UgdGhlIHRlcm0NCj4gIm1lbW9yeSBi
YW5rIiBpbnRvIHg4NiBjb2RlLg0KPiANCg0KSW4gbXkgbGF0ZXN0IGNoYW5nZXMsIEkgaGF2ZSB1
cGRhdGVkIHRoZXNlIHR3byBoZWxwZXJzIHRvOg0KdWludDMyX3QgX19pbml0IGFyY2hfbWVtaW5m
b19nZXRfbnJfYmFuayh2b2lkKQ0KX19pbml0IGFyY2hfbWVtaW5mb19nZXRfcmFtX2JhbmtfcmFu
Z2UoLi4uKQ0KSSBhbSBzb3JyeSwgSSBmb3Jnb3QgdG8gY2hhbmdlIHRoZSBjb21taXQgbG9nIGFj
Y29yZGluZ2x5Lg0KSSB3aWxsIHVwZGF0ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L251bWEuYw0KPiA+
IEBAIC0zNzgsNiArMzc4LDI0IEBAIHVuc2lnbmVkIGludCBhcmNoX2hhdmVfZGVmYXVsdF9kbWF6
b25lKHZvaWQpDQo+ID4gICAgICByZXR1cm4gKCBudW1fb25saW5lX25vZGVzKCkgPiAxICkgPyAx
IDogMDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3VpbnQzMl90IF9faW5pdCBhcmNoX21lbWluZm9fZ2V0
X25yX2Jhbmsodm9pZCkNCj4gDQo+IHVuc2lnbmVkIGludCAoYWxzbyBlbHNld2hlcmUpDQo+IA0K
DQpPSy4NCg0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gZTgyMC5ucl9tYXA7DQo+ID4gK30NCj4gPiAr
DQo+ID4gK2ludCBfX2luaXQgYXJjaF9tZW1pbmZvX2dldF9yYW1fYmFua19yYW5nZSh1aW50MzJf
dCBiYW5rLA0KPiA+ICsJcGFkZHJfdCAqc3RhcnQsIHBhZGRyX3QgKmVuZCkNCj4gPiArew0KPiA+
ICsJaWYgKGU4MjAubWFwW2JhbmtdLnR5cGUgIT0gRTgyMF9SQU0gfHwgIXN0YXJ0IHx8ICFlbmQp
IHsNCj4gDQo+IEkgc2VlIG5vIHJlYXNvbiBmb3IgdGhlIGNoZWNraW5nIG9mIHN0YXJ0IGFuZCBl
bmQuDQo+IA0KDQpZZXMsIEkgaGF2ZSByZW1vdmVkIHRoaXMgY2hlY2tpbmcgaW4gdGhlIGxhdGVz
dCB2ZXJzaW9uLg0KDQo+ID4gKwkJcmV0dXJuIC0xOw0KPiA+ICsJfQ0KPiANCj4gTm8gbmVlZCBm
b3IgYnJhY2VzIGhlcmUuDQo+IA0KDQpPay4NCg0KPiA+ICsJKnN0YXJ0ID0gZTgyMC5tYXBbYmFu
a10uYWRkcjsNCj4gPiArCSplbmQgPSBlODIwLm1hcFtiYW5rXS5hZGRyICsgZTgyMC5tYXBbYmFu
a10uc2l6ZTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3Rh
dGljIHZvaWQgZHVtcF9udW1hKHVuc2lnbmVkIGNoYXIga2V5KQ0KPiA+ICB7DQo+ID4gICAgICBz
X3RpbWVfdCBub3cgPSBOT1coKTsNCj4gDQo+IEp1ZGdpbmcgYnkganVzdCB0aGUgdHdvIHBpZWNl
cyBvZiBwYXRjaCBjb250ZXh0IHlvdSdyZSBpbnNlcnRpbmcNCj4gYSBMaW51eC1zdHlsZSBjb2Rl
IGZyYWdtZW50IGluIHRoZSBtaWRkbGUgb2YgdHdvIFhlbi1zdHlsZSBvbmVzLg0KPiANCj4gVmFy
aW91cyBvdGhlciBjb21tZW50cyBnaXZlbiBmb3IgZWFybGllciBwYXRjaGVzIGFwcGx5IGhlcmUg
YXMgd2VsbC4NCj4gDQoNClllcywgdGhlIG9yaWdpbmFsIGZpbGUgaXMgeGVuLXN0eWxlLiBJIHdp
bGwgY2hhbmdlIHRoZSBpbnNlcnRlZCBjb2RlDQp0byB4ZW4tc3R5bGUgdG9vLiBUaGFua3MhDQoN
Cj4gSmFuDQoNCg==

