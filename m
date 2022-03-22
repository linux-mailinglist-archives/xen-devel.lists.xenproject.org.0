Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137124E3ABA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 09:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293324.498261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZzE-0005Zu-59; Tue, 22 Mar 2022 08:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293324.498261; Tue, 22 Mar 2022 08:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZzE-0005X6-0L; Tue, 22 Mar 2022 08:35:28 +0000
Received: by outflank-mailman (input) for mailman id 293324;
 Tue, 22 Mar 2022 08:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nWZzC-0005Wy-D6
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 08:35:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ffbd21-a9bb-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 09:35:25 +0100 (CET)
Received: from AS9PR06CA0186.eurprd06.prod.outlook.com (2603:10a6:20b:45d::33)
 by AM4PR08MB2804.eurprd08.prod.outlook.com (2603:10a6:205:d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Tue, 22 Mar
 2022 08:35:21 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::d1) by AS9PR06CA0186.outlook.office365.com
 (2603:10a6:20b:45d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Tue, 22 Mar 2022 08:35:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 08:35:21 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Tue, 22 Mar 2022 08:35:21 +0000
Received: from b0a97d7e1b10.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0171301E-F3B4-4DDA-9B96-F77D8E2DF056.1; 
 Tue, 22 Mar 2022 08:35:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0a97d7e1b10.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 08:35:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 08:35:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:35:08 +0000
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
X-Inumbo-ID: 04ffbd21-a9bb-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ceL6lMBl7nXAqR7gjXPoo6OJ6pxgPRimxEs7KYgeZQ=;
 b=Ny7jbhxSB3eDQHbfhAOrjMH+S5mwylWKbwkfX4GWOROvJzNEPIc3xrrOd134JVvtth17+mRU6J5FQzBUDLgnpZ990m5UdSj8ruaDiyuA6Bd/+VcIomijmX7EtdeYonihXJwDHkI/oeVubarzzM+i6AfxAhVglIT29h2uOJEdn9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22a2fb80180b2298
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+I6Xet8Zn3W9tJ2tQ71mBVcrPv2pvwyg+z6YX+ZdO8z5bzJhBfY4woLhdS1FrV+BOYMFiG6pTdyGDX5Xu6/DFb1AiPdDJOoRt25OkaHiZFCq+WfA6qPNiyUUNEN3iuFmCxQ9bZHDg8Y5xs4wRLi4NLwS7OoJgYxJUXMD/pxB5egY8uIMTfEoc4keWTaSSvLm/a9OnXzEX0KcFYQZJIP3Ecn50nU+xkjvUA2z5R4LOUyA6WKoeuy9/K2Oj3n2ZrwgLh7WCULKVbLN5XLLVBgChFTxVP+26EUnK9Vw7C/IPEMe/kSPtbPjkHffEO2gsGWk0xjquF/+o0taoEkx1BBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ceL6lMBl7nXAqR7gjXPoo6OJ6pxgPRimxEs7KYgeZQ=;
 b=HqCqVBRvFxn176ea7yIouAX1zUgohQDv3Hg2NOzx8lSt5+7MXBBiU4CIGph25eCNgkwRMv29n4L3ZlEzxoxm84JBleqzvUWCPnHaqI2EQfD+q2Y2E/2PZkuq47Mprt0Xc6hU4uHU1+KbNyGRMdBbmFGsunzzjGuIGReHgij/xuuqks7EafVLmnlickVPDi+0B0colcGiOdY74N837i2jHO0tJURbRxNofF+YjyLRLECOX3cnT4NDluHYY3VUAJxCbsWvDuAT8i0815JmAUan/ivsiO0xfei0Hkc8rV2M//48eNUKNT5reng/FPyS7qLic3+9cwSkDfXbTlBZGZIeSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ceL6lMBl7nXAqR7gjXPoo6OJ6pxgPRimxEs7KYgeZQ=;
 b=Ny7jbhxSB3eDQHbfhAOrjMH+S5mwylWKbwkfX4GWOROvJzNEPIc3xrrOd134JVvtth17+mRU6J5FQzBUDLgnpZ990m5UdSj8ruaDiyuA6Bd/+VcIomijmX7EtdeYonihXJwDHkI/oeVubarzzM+i6AfxAhVglIT29h2uOJEdn9s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYOtyBwlLK7ts4vEKxgpEPsRlgQ6zFUCoAgASzLwCAAAp/AIAADB+AgAAHFICAAPi1AA==
Date: Tue, 22 Mar 2022 08:35:08 +0000
Message-ID: <9ABBD292-A77F-4CDC-B096-546516114D42@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
 <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
In-Reply-To: <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dcf62528-27a3-4368-aa66-08da0bdee747
x-ms-traffictypediagnostic:
	AM0PR08MB5362:EE_|AM5EUR03FT052:EE_|AM4PR08MB2804:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB28041749D20A719080016B309D179@AM4PR08MB2804.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DgcDD1zZbiHonAbi8FEHNaVzJviOb6rDHf4xOKuDbMXvEXZM2sz2rPMblGi5m+ltHhRWpVPW7axMUWgmDnzevrMnYapl+yGzGPgKnDZ4zkcDS0NVrLW1fZ0ELYfFmzKFa8lY8oDoCdEL6NldAhM9Tacmbla6rGHjo58Bu+HOxlNcE5vLEUdxVrqp2JqxPGnGSW++gK3wnAJYh7W/SwcBP0IMiMWFRbmAuCkNchF9SunEOOTLDwdu/EmtC3OQh5hZMvG5J9JLOiUO/CdFEHB4HxN/4x3Qgl18T+p3ANxyempScykE86tSOM/m16upZui1lncDC/Lq82CO2WL0SAJTmqWDFaJwHvhlztY2Hpwf7h8/9ZOwUMpsZeObpXiUuV3S4Oms7q4uAw36n4PEImbz2BAnKL/FaqggIxoQeMHZLYmUY3imnC4fD47vXKUB/4XoRVQOq/1oAaylzwYa5qH0HzthwiAhNGlBR1Q1FQrXZtkBhkETqMp4X/yaoBxK8aG2Jn5Hmm6941sfWmk16JJKTJpmedxxOgD4qzKip3oEc7OOofWocnns3Qc6NECEmcQ14qRSQCFJJ0c+XGMCmExpS1wN4OlCxb3ljYyThN0GFDoZvo6+Ja/+9ZrIKydXLQmH9W2rOw9uQ4Rxf9yYM0nwwjBR9huJn3KWc4hYJhKTsgeCyLfwaVFn6Rh41puaE4nEJaLm1X3kYz21x+aUpbvlWcELz+yChvemZKX3eN58YSmXtzBmU5VUvahjSFAHgpkk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(122000001)(508600001)(71200400001)(6486002)(54906003)(6916009)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(4326008)(91956017)(76116006)(8936002)(7416002)(83380400001)(5660300002)(6512007)(6506007)(53546011)(186003)(26005)(2616005)(38100700002)(33656002)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7342232D9DAB4A4B96574D9B400A8A72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f3d3afb-76c0-4071-ef3c-08da0bdedf8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3JV+pt+6MZ+ABb40w4DwPM7y0cy/vkaD+v/toUqKITjAIdatLKv3/T27bg27eYYzH2Uw15ZU8XDnBrZQPOMljbDF+rxTIl3YCDLVOS19l6ZJJLtYB3qfdnHX34N3Wp6HbYqxpqUP3jGubkOY3piAADcYBFedfH4B0GqQGVbgxzgHgghxTf7VZPeEP47AxQwUX74nHxRf8+su7fJUNBpRwTTi0Nb0noblOUdJU5NYEFkw1AVmB78/N4hV2zfFSDRPD23cTU3RGpr0IcQNTZ1TqSDegOLvln2MDsql7xYnwRcLWhhDFO4PKnR8mqp881zpNhNRRDDRN0y8lKPFOOGv+NOqtsvSwzZQ4ESj59/RRIcXltEjJsXDIqMMYSCvJpuihrYGy5hmCdf+/IwxgblLMapjIGbC9BR9gm3Xp9xxVzpwrUfaOmN8MRcCIhGRt4kH9NvZcEqVhMvUVbfJ+pJZtWjGodLIW4+DkH0otwpqSXPClmqP289hG9Qo9Sir8KMzqPIBc1DFeLd0IkuiygJwu8DvAO0dzYkY9vGCQIGNUNJc2nn0O46EG9lD3tOtBi7nZnT3MkTgUDssbu4GGLpcFa3mLVZqyYIf/+W5pcTDtTY2NR/AONKBUsvaily84R36xN98UKt54AngixNZ/tT0iqxrIM4suTkXbb9/HgfZiRFhQBub0tu1/aaT0lmisTIr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(107886003)(83380400001)(26005)(186003)(2616005)(336012)(356005)(81166007)(47076005)(40460700003)(86362001)(82310400004)(53546011)(70586007)(70206006)(6486002)(6506007)(36860700001)(6862004)(8676002)(508600001)(4326008)(5660300002)(2906002)(33656002)(54906003)(36756003)(316002)(6512007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:35:21.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf62528-27a3-4368-aa66-08da0bdee747
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2804

SGkgSnVsaWVuLA0KDQo+IE9uIDIxIE1hciAyMDIyLCBhdCAxODo0NCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDIxLzAz
LzIwMjIgMTc6MTksIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMjEgTWFyIDIwMjIs
IGF0IDE3OjM2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gU28g
SSBkb27igJl0IGtub3cgd2h5IG9uIHg4NiB3ZSBtdXN0IGhhdmUgY3B1MCBpbiBjcHVwb29sMCwg
bWF5YmUgeDg2IG1haW50YWluZXIgaGF2ZSBtb3JlIGtub3dsZWRnZSBhYm91dCB0aGF0IGFuZA0K
Pj4+PiBJIGNhbiBwdXQgYSBjb21tZW50IGhlcmUuDQo+Pj4gDQo+Pj4gT24gQXJtLCB3ZSBhcmUg
bm90IHlldCBzdXBwb3J0aW5nIGFsbCB0aGUgQ1BVIGZlYXR1cmVzIHRoYXQgeDg2IHN1cHBvcnRz
IChlLmcuIENQVSBob3RwbHVnLCBzdXNwZW5kL3Jlc3VtZS4uLikuIFNvIEkgYSBhbSBiaXQgY29u
Y2VybmVkIHRoYXQgdGhlIHJlc3RyaWN0aW9uIGlzIGp1c3Qgbm90IHRoZXJlIHlldCAob3IgcG9z
c2libHkgaGlkZGVuKS4NCj4+PiANCj4+PiBUaGVyZWZvcmUsIGJlZm9yZSBsaWZ0aW5nIHRoZSBy
ZXN0cmljdGlvbiBvbiBBcm0gKGFuZCBvdGhlciBhcmNoKSwgSSB3b3VsZCBsaWtlIHVzIHRvIHVu
ZGVyc3RhbmQgd2h5IGl0IGlzIG5lY2Vzc2FyeSBvbiB4ODYuDQo+Pj4gDQo+Pj4gV2UgbWF5IG5v
dCBoYXZlIHRoZSBhbnN3ZXIgcXVpY2tseSwgc28gaXMgaXQgZ29pbmcgdG8gYmUgYSBwcm9ibGVt
IHRvIGtlZXAgdGhlIHJlc3RyaWN0aW9uIG9uIEFybT8NCj4+IEkgYW0gb2sgdG8ga2VlcCB0aGUg
bGltaXRhdGlvbiB0byBoYXZlIGRvbTAgYWx3YXlzIHJ1bm5pbmcgb24gY3B1MC4NCj4+IE9ubHkg
bGltaXRhdGlvbiBJIGNhbiBzZWUgaXMgdGhhdCBvbiBhIGJpZyBsaXR0bGUgc3lzdGVtLCBkb20w
IG5lZWRzIHRvIHN0YXkgb24gdGhlIHR5cGUgb2YgY29yZSBvZiB0aGUgZmlyc3QgYm9vdGVkIGNv
cmUuDQo+IA0KPiBXaGVyZSBkb2VzIHRoaXMgbGltaXRhdGlvbiBjb21lIGZyb20/DQoNCklmIGRv
bTAgbXVzdCBydW4gb24gY29yZTAgYW5kIGNvcmUwIGlzIExpdHRsZSB0aGVuIHlvdSBjYW5ub3Qg
YnVpbGQgYSBzeXN0ZW0gd2hlcmUgZG9tMCBpcyBydW5uaW5nIG9uIGJpZyBjb3Jlcy4NCklmIHRo
ZSBsaW1pdGF0aW9uIGlzIG5vdCB0aGVyZSwgeW91IGNhbiBidWlsZCBzdWNoIGEgY29uZmlndXJh
dGlvbiB3aXRob3V0IGFueSBkZXBlbmRlbmN5IHRvIHRoZSBib290IGNvcmUgdHlwZS4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxs
DQoNCg==

