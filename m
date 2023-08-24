Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3365B786C3D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589862.921916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6vS-0007z6-Mk; Thu, 24 Aug 2023 09:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589862.921916; Thu, 24 Aug 2023 09:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6vS-0007wI-JE; Thu, 24 Aug 2023 09:46:50 +0000
Received: by outflank-mailman (input) for mailman id 589862;
 Thu, 24 Aug 2023 09:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPn2=EJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qZ6vR-0007wA-9T
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:46:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247080b5-4263-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 11:46:47 +0200 (CEST)
Received: from DB8PR09CA0002.eurprd09.prod.outlook.com (2603:10a6:10:a0::15)
 by AM8PR08MB5682.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:46:41 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::fc) by DB8PR09CA0002.outlook.office365.com
 (2603:10a6:10:a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 09:46:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.17 via Frontend Transport; Thu, 24 Aug 2023 09:46:41 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Thu, 24 Aug 2023 09:46:40 +0000
Received: from 0e55205e33be.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54D925E4-0850-4EF0-A67B-3161A67F3499.1; 
 Thu, 24 Aug 2023 09:46:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e55205e33be.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Aug 2023 09:46:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB10359.eurprd08.prod.outlook.com (2603:10a6:10:416::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 09:46:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:46:27 +0000
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
X-Inumbo-ID: 247080b5-4263-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kAEqknmIv6gd0dQt+e5yLwEhAz7CDNw+QowN1LdbZg=;
 b=9g9CoyWZZzKEUT7IwtA4TiKTbUJNDwOPJwuupXV2/0Yn8V8jAQJrTzx5I5l8okbqWXpXf5A2Fg7m4bs8A23t8CKnWN6RWY/4+MKqHaxmaMFNAYS64Eb8QmBACowvmmjKMsKubtKadgg2CXddYwmKQ+US0fJMe5BeqxwS4Zc0A1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 185b167dfeea7769
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jae7StxTxRofI/hcNeOuZjHVr6jlEaJHjZbYlUoSxIMMCTE/8hXRtOpriDCVZRU4li7W1bNv16OiTg8leRsY2g0Ow2oJ16pY6x7eoMdkr9mELcw1LvveF81E+bUwTgJkddtcnt2G9mvT842CJ1MZ6DWeWL7xA8gP8ispzqFbqSq+0Xfr86N3uBoji0SWEDb916MGX9siEoFc2vmK8uE5blvARohs5NI0GObTZLOv6fQvslPq3rCSRrmnfW27N9atNvWrQ8xiZ3AdYrvIWwEz4Ov8PX7zzW0wP5g3+t4TPaQA0Yhftuot85vGbWl/11Zg1h7evEhQJtdKD2v0ZtnwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kAEqknmIv6gd0dQt+e5yLwEhAz7CDNw+QowN1LdbZg=;
 b=JCR+T21JS3Qpr8/ZIMaOyP4nMHVxtHJRXctBNDcGEvopx4TjJtxj7Bim56LzG5ie2FR1+zgxQ0o5GdKoy15AlsUq70QeD84oNqOvHrhaaXKzDJRjTBliVavkib6v0wGVOl1mEqhfg9LRy0a712fDhNeOeUUrJxMblVNno/VSkqOP9keVOofCr0qiQQ+iMWGrlA3t5nATrMyxa5QiJoqs5d1Y9rasxWP+HIupjrb5PrnHf7nZC2c4NgYzCYRuuxE1UlTte9I5t8gS26t7wzHNc1NjUwfsBLMIgJweifTU9OVnSwSbMGLl+WQGWv83C0Eua3g+MUzWE1SLC0MLiwQgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kAEqknmIv6gd0dQt+e5yLwEhAz7CDNw+QowN1LdbZg=;
 b=9g9CoyWZZzKEUT7IwtA4TiKTbUJNDwOPJwuupXV2/0Yn8V8jAQJrTzx5I5l8okbqWXpXf5A2Fg7m4bs8A23t8CKnWN6RWY/4+MKqHaxmaMFNAYS64Eb8QmBACowvmmjKMsKubtKadgg2CXddYwmKQ+US0fJMe5BeqxwS4Zc0A1U=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function names
 for extendability
Thread-Topic: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function
 names for extendability
Thread-Index: AQHZzmeKSbzvNCb8Y0ecj302axbRZK/1HuGAgAQj9YA=
Date: Thu, 24 Aug 2023 09:46:27 +0000
Message-ID: <FBF340E4-5927-48E0-A23B-7D2F8DC8C33C@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-10-Henry.Wang@arm.com>
 <c039015f-43d4-491f-b44c-8ece186e08e4@xen.org>
In-Reply-To: <c039015f-43d4-491f-b44c-8ece186e08e4@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB10359:EE_|DBAEUR03FT059:EE_|AM8PR08MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 667cce57-7d93-4a9b-4ba5-08dba48704c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4k7R5Lw2aBUYfO58tD3N/4Zi2NKug+0UMF/YoxQzG2eXmipTr/NHdHfw1PI2JQCq4TQLzDMSw5sMX881D/qom4pMfhBbp/LIibHMo0rCApYbxbe4hZhLWiosOP0p0L8eanLfx30AmTbLYasy5QEbJ3hMXnD4nRvjGXCJzCQXCTxYfC6JOyiz7Gl3XJamDAwywGdsLF4+sSt61tDL/ZcZc+kKf72zVB3PbwWH27S7LCltEi9DZIEybG90on9rwYvgyLcBMCmPtpkjJiFx/VLC2cyTO9i2LmSFzpJ8MSuk6wvpjk3jG9BzBa4gbPQYD3SaS11thDv7xlfERxRIQkajsYX8PWhJM8OL5U2zgvMTZmfoxL0mvhXgdJvzofMyawb9pVC305RiQV5S4NSP/CRVRzXn5rZW7EnWgkjPOnXnvJYY/VSrIQUXvFU10+cBIHtsdcYxareRA9j1LvfkuvV4+IjdOVBJBcwRaCrKql+bbcsoybvm5IOzRQXYW+l9OgeP1yoSUNnJF45jr100Ovc1iTroxT+2X4ATolSQVE+bSlOHodoX6DmAQ+QPClPe93V49I+rb1v1kR6qOViMePwGxggOFulPKZiSGyEC6hlf9UrzcGBAP93J8To9wJ0r/BGmRWzYlXsKz4DZ0iNUK5kdaEIL5sZNa7cgMKB04rPEdDo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199024)(186009)(1800799009)(83380400001)(2906002)(64756008)(71200400001)(6916009)(66446008)(316002)(66476007)(6506007)(6486002)(66556008)(54906003)(91956017)(76116006)(53546011)(478600001)(86362001)(33656002)(36756003)(66946007)(2616005)(5660300002)(26005)(8676002)(38100700002)(41300700001)(6512007)(122000001)(38070700005)(4326008)(8936002)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <58BCD166C253D04E9ADD089FFCEA9F0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10359
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8074e906-82de-4cac-a4a4-08dba486fcc3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3g+WSGHn+YmTdGa3ouZ+f/GJpM3Gf6cODBI3CIRDp92atY3m6RyZTQum1fK3rgT/q7XLYpXmW2R+dpspzd+4nzW5URJGs6UKrgtHzyttzQpP+/6avQkgFkbExFq6c9MVQyop/188Yj0l0jEfSj6YejhNsz4hCdqBqmXKzU5QerjWP9+X5VoIbb1TQuBuUyZ0uo7Uxgn+4yjVUFXvamy7GhfHNrFIM8wTJgJwrORTTj5yd/GQOhY2slmeRLuZaDOegfaHR4IlSC7+MuiwMXoFhtjbAcwAlN71lijPvMkkhBfh/3FHTFz0FUv6ILgyaxQfgCAJb64hgLhFnrd3sF6vt77V2s2t3tkkrMayCzMePYW7dsywGZgGt/k5Dhdqvjp3CdIoUpxP6pk77HhLR1rxdoCBscWF5Fr6lXMeL7LZzjDpLOkAitSxqXhVXpKOIc1WGmKz3rbWEZlb38+7IaiQDUZQz0/NR8hQVSdov7wX1HaGVVPxG3ZIZ5itNMjpaoKNefOE9VmGtVA3yapTkuiRhyZE/jbwcf6rxMEwZst3UmccJM6JsQeJCtkVGx87zWFSHHVFZku9xYEjAwrWHEDgfZ1uAzUhdn1/IWghTZXd+EW5huZtoPqtF46CMbpk6b0fHnXjX07HxzbeE1IWWVn7MMGVa7psxrdIilmm0a10VwOHBpEllJLeeecoybDNcLbpe3iVyUZZMlNvpbz8CzIvkQYP1NyzUgxx7pZfPe3dB3XpmMrNBQFGq9c9zVuGdNAqneCHZOmCkkxY9gkD28EwXA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199024)(186009)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(54906003)(70206006)(70586007)(40480700001)(316002)(81166007)(478600001)(26005)(36860700001)(356005)(82740400003)(41300700001)(53546011)(86362001)(6486002)(2906002)(6506007)(6512007)(4326008)(6862004)(8676002)(8936002)(40460700003)(2616005)(107886003)(5660300002)(83380400001)(33656002)(36756003)(336012)(47076005)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:46:41.0570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667cce57-7d93-4a9b-4ba5-08dba48704c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5682

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMDI6MzIsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAxNC8wOC8yMDIzIDA1
OjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5n
QGFybS5jb20+DQo+PiBBcyBwcmVwYXJhdGlvbiBmb3IgTVBVIHN1cHBvcnQsIHdoaWNoIHdpbGwg
dXNlIHNvbWUgdmFyaWFibGVzL2Z1bmN0aW9ucw0KPj4gZm9yIGJvdGggTU1VIGFuZCBNUFUgc3lz
dGVtLCBXZSByZW5hbWUgdGhlIGFmZmVjdGVkIHZhcmlhYmxlL2Z1bmN0aW9uDQo+PiB0byBtb3Jl
IGdlbmVyaWMgbmFtZXM6DQo+PiAtIGluaXRfdHRiciAtPiBpbml0X21tLA0KPiANCj4gWW91IG1v
dmVkIGluaXRfdHRiciB0byBtbS9tbXUuYy4gU28gd2h5IGRvZXMgdGhpcyBuZWVkIHRvIGJlIHJl
bmFtZWQ/DQo+IA0KPiBBbmQgaWYgeW91IHJlYWxseSBwbGFubmVkIHRvIHVzZSBpdCBmb3IgdGhl
IE1QVSBjb2RlLiBUaGVuIGluaXRfdHRiciBzaG91bGQgbm90IGhhdmUgYmVlbiBtb3ZlZC4NCg0K
WW91IGFyZSBjb3JyZWN0LiBJIHRoaW5rIHdlIG5lZWQgdG8gdXNlIHRoZSDigJxpbml0X21t4oCd
IGZvciBNUFUgU01QIHN1cHBvcnQsDQpzbyBJIHdvdWxkIG5vdCBtb3ZlIHRoaXMgdmFyaWFibGUg
aW4gdjYuDQoNCj4gDQo+PiAtIG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSAtPiBtbV9pbml0X3Nl
Y29uZGFyeV9jcHUoKQ0KPj4gLSBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKCkgLT4gaW5pdF9z
ZWNvbmRhcnlfbW0oKQ0KPiANCj4gVGhlIG9yaWdpbmFsIG5hbWluZyB3ZXJlIG5vdCBncmVhdCBi
dXQgdGhlIG5ldyBvbmUgYXJlIGEgbG90IG1vcmUgY29uZnVzaW5nIGFzIHRoZXkgc2VlbSB0byBq
dXN0IGJlIGEgcmVzaHVmZmxlIG9mIHdvcmQuDQo+IA0KPiBtbV9pbml0X3NlY29uZGFyeV9jcHUo
KSBpcyBvbmx5IHNldHRpbmcgdGhlIFd4TiBiaXQuIEZvciB0aGUgTU1VLCBJIHRoaW5rIGl0IGNh
biBiZSBkb25lIG11Y2ggZWFybGllci4gRG8geW91IGhhdmUgYW55dGhpbmcgdG8gYWRkIGluIGl0
PyBJZiBub3QsIHRoZW4gSSB3b3VsZCBjb25zaWRlciB0byBnZXQgcmlkIG9mIGl0Lg0KDQpJ4oCZ
dmUgZ290IHJpZCBvZiBtbXVfaW5pdF9zZWNvbmRhcnlfY3B1KCkgZnVuY3Rpb24gaW4gbXkgbG9j
YWwgdjYgYXMgaXQgaXMgbm93DQpmb2xkZWQgdG8gdGhlIGFzc2VtYmx5IGNvZGUuDQoNCj4gDQo+
IEZvciBpbml0X3NlY29uZGFyeV9tbSgpLCBJIHdvdWxkIHJlbmFtZWQgaXQgdG8gcHJlcGFyZV9z
ZWNvbmRhcnlfbW0oKS4NCg0KU3VyZSwgdGhhbmtzIGZvciB0aGUgbmFtZSBzdWdnZXN0aW9uLg0K
DQo+IA0KPj4gIC12b2lkIHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKGJvb2wgZW5hYmxlKQ0KPj4g
K3N0YXRpYyB2b2lkIHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKGJvb2wgZW5hYmxlKQ0KPiANCj4g
V2h5IG5vdCBzaW1wbHkgcmVuYW1pbmcgdGhpcyBmdW5jdGlvbiB0byB1cGRhdGVfbW1fbWFwcGlu
ZygpPyBCdXQuLi4NCj4gDQo+PiAgew0KPj4gICAgICBwYWRkcl90IGlkX2FkZHIgPSB2aXJ0X3Rv
X21hZGRyKF9zdGFydCk7DQo+PiAgICAgIGludCByYzsNCj4+IEBAIC0xMjAsNiArMTIwLDExIEBA
IHZvaWQgdXBkYXRlX2lkZW50aXR5X21hcHBpbmcoYm9vbCBlbmFibGUpDQo+PiAgICAgIEJVR19P
TihyYyk7DQo+PiAgfQ0KPj4gICt2b2lkIHVwZGF0ZV9tbV9tYXBwaW5nKGJvb2wgZW5hYmxlKQ0K
PiANCj4gLi4uIHRoZSBuZXcgbmFtZSBpdCBxdWl0ZSBjb25mdXNpbmcuIFdoYXQgaXMgdGhlIG1h
cHBpbmcgaXQgaXMgcmVmZXJyaW5nIHRvPw0KDQpTbyBJIGNoZWNrZWQgdGhlIE1QVSBTTVAgc3Vw
cG9ydCBjb2RlIGFuZCBub3cgSSB0aGluayBJIHVuZGVyc3RhbmQgdGhlIHJlYXNvbg0Kd2h5IHVw
ZGF0ZV9tbV9tYXBwaW5nKCkgd2FzIGludHJvZHVjZWQ6DQoNCkluIHRoZSBmdXR1cmUgd2UgZXZl
bnR1YWxseSBuZWVkIHRvIHN1cHBvcnQgU01QIGZvciBNTVUgc3lzdGVtcywgd2hpY2ggbWVhbnMN
CndlIG5lZWQgdG8gY2FsbCBhcmNoX2NwdV91cCgpIGFuZCBhcmNoX2NwdV91cF9maW5pc2goKS4g
VGhlc2UgdHdvIGZ1bmN0aW9ucyBjYWxsDQp1cGRhdGVfaWRlbnRpdHlfbWFwcGluZygpLiBTaW5j
ZSB3ZSBiZWxpZXZlICJpZGVudGl0eSBtYXBwaW5nIiBpcyBhIE1NVSBjb25jZXB0LA0Kd2UgY2hh
bmdlZCB0aGlzIHRvIGdlbmVyaWMgbmFtZSAibW0gbWFwcGluZ+KAnSBhcyBhcmNoX2NwdV91cCgp
IGFuZCANCmFyY2hfY3B1X3VwX2ZpbmlzaCgpIGlzIGEgc2hhcmVkIHBhdGggYmV0d2VlbiBNTVUg
YW5kIE1QVS4NCg0KQnV0IEkgdGhpbmsgTVBVIHdvbuKAmXQgdXNlIHVwZGF0ZV9tbV9tYXBwaW5n
KCkgZnVuY3Rpb24gYXQgYWxsLCBzbyBJIHdvbmRlciBkbw0KeW91IHByZWZlciBjcmVhdGluZyBh
biBlbXB0eSBzdHViIHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKCkgZm9yIE1QVT8gT3IgdXNlICNp
ZmRlZg0KYXMgc3VnZ2VzdGVkIGluIHlvdXIgcHJldmlvdXMgZW1haWwuLi4NCg0KPiANCj4gSWYg
eW91IGRvbid0IHdhbnQgdG8ga2VlcCB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZygpLCB0aGVuIEkg
d291bGQgY29uc2lkZXIgdG8gc2ltcGx5IHdyYXAuLi4NCg0K4oCmaGVyZSBhbmQgLi4uDQoNCj4g
DQo+PiArew0KPj4gKyAgICB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZyhlbmFibGUpOw0KPj4gK30N
Cj4+ICsNCj4+ICBleHRlcm4gdm9pZCBzd2l0Y2hfdHRicl9pZCh1aW50NjRfdCB0dGJyKTsNCj4+
ICAgIHR5cGVkZWYgdm9pZCAoc3dpdGNoX3R0YnJfZm4pKHVpbnQ2NF90IHR0YnIpOw0KPj4gQEAg
LTEzMSw3ICsxMzYsNyBAQCB2b2lkIF9faW5pdCBzd2l0Y2hfdHRicih1aW50NjRfdCB0dGJyKQ0K
Pj4gICAgICBscGFlX3QgcHRlOw0KPj4gICAgICAgIC8qIEVuYWJsZSB0aGUgaWRlbnRpdHkgbWFw
cGluZyBpbiB0aGUgYm9vdCBwYWdlIHRhYmxlcyAqLw0KPj4gLSAgICB1cGRhdGVfaWRlbnRpdHlf
bWFwcGluZyh0cnVlKTsNCj4+ICsgICAgdXBkYXRlX21tX21hcHBpbmcodHJ1ZSk7DQo+PiAgICAg
ICAgLyogRW5hYmxlIHRoZSBpZGVudGl0eSBtYXBwaW5nIGluIHRoZSBydW50aW1lIHBhZ2UgdGFi
bGVzICovDQo+PiAgICAgIHB0ZSA9IHB0ZV9vZl94ZW5hZGRyKCh2YWRkcl90KXN3aXRjaF90dGJy
X2lkKTsNCj4+IEBAIC0xNDgsNyArMTUzLDcgQEAgdm9pZCBfX2luaXQgc3dpdGNoX3R0YnIodWlu
dDY0X3QgdHRicikNCj4+ICAgICAgICogTm90ZSBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGRpc2Fi
bGUgaXQgaW4gdGhlIGJvb3QgcGFnZSB0YWJsZXMNCj4+ICAgICAgICogYmVjYXVzZSB0aGV5IGFy
ZSBub3QgZ29pbmcgdG8gYmUgdXNlZCBieSB0aGlzIENQVSBhbnltb3JlLg0KPj4gICAgICAgKi8N
Cj4+IC0gICAgdXBkYXRlX2lkZW50aXR5X21hcHBpbmcoZmFsc2UpOw0KPj4gKyAgICB1cGRhdGVf
bW1fbWFwcGluZyhmYWxzZSk7DQo+PiAgfQ0KPj4gICAgLyoNCj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtNjQvc21wYm9vdC5jIGIveGVuL2FyY2gvYXJtL2FybTY0L3NtcGJvb3QuYw0K
Pj4gaW5kZXggOTYzN2Y0MjQ2OS4uMmIxZDA4NmExZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9hcm02NC9zbXBib290LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9zbXBib290
LmMNCj4+IEBAIC0xMTEsMTggKzExMSwxOCBAQCBpbnQgYXJjaF9jcHVfdXAoaW50IGNwdSkNCj4+
ICAgICAgaWYgKCAhc21wX2VuYWJsZV9vcHNbY3B1XS5wcmVwYXJlX2NwdSApDQo+PiAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCj4+ICAtICAgIHVwZGF0ZV9pZGVudGl0eV9tYXBwaW5nKHRydWUp
Ow0KPj4gKyAgICB1cGRhdGVfbW1fbWFwcGluZyh0cnVlKTsNCj4gDQo+IC4uLiB3aXRoICNpZmRl
ZiBDT05GSUdfTU1VIGhlcmUuLi4NCj4gDQo+PiAgICAgICAgcmMgPSBzbXBfZW5hYmxlX29wc1tj
cHVdLnByZXBhcmVfY3B1KGNwdSk7DQo+PiAgICAgIGlmICggcmMgKQ0KPj4gLSAgICAgICAgdXBk
YXRlX2lkZW50aXR5X21hcHBpbmcoZmFsc2UpOw0KPj4gKyAgICAgICAgdXBkYXRlX21tX21hcHBp
bmcoZmFsc2UpOw0KPiANCj4gLi4uIGhlcmUgYW5kIC4uLg0KPiANCj4gDQo+PiAgICAgICAgcmV0
dXJuIHJjOw0KPj4gIH0NCj4+ICAgIHZvaWQgYXJjaF9jcHVfdXBfZmluaXNoKHZvaWQpDQo+PiAg
ew0KPj4gLSAgICB1cGRhdGVfaWRlbnRpdHlfbWFwcGluZyhmYWxzZSk7DQo+PiArICAgIHVwZGF0
ZV9tbV9tYXBwaW5nKGZhbHNlKTsNCj4gDQo+IC4uLiBoZXJlLg0KDQrigKZhbGwgaGVyZT8NCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo=

