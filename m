Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FB7CF769
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619264.964072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRXB-0000on-4r; Thu, 19 Oct 2023 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619264.964072; Thu, 19 Oct 2023 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRXB-0000mb-2D; Thu, 19 Oct 2023 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 619264;
 Thu, 19 Oct 2023 11:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtRX9-0000mV-JQ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:49:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 996709ca-6e75-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:49:46 +0200 (CEST)
Received: from AS8PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:312::22)
 by AM7PR08MB5479.eurprd08.prod.outlook.com (2603:10a6:20b:104::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 11:49:16 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:312:cafe::b7) by AS8PR04CA0047.outlook.office365.com
 (2603:10a6:20b:312::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Thu, 19 Oct 2023 11:49:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 11:49:14 +0000
Received: ("Tessian outbound 9e011a9ddd13:v215");
 Thu, 19 Oct 2023 11:49:14 +0000
Received: from a3c853deeccc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3983F61F-0C36-483A-AB3C-ABA43DFB2EDF.1; 
 Thu, 19 Oct 2023 11:49:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3c853deeccc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 11:49:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU5PR08MB10515.eurprd08.prod.outlook.com (2603:10a6:10:529::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 11:49:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:49:06 +0000
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
X-Inumbo-ID: 996709ca-6e75-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXin2IsumT0ldkqAtVH7Y+bxdFf/GfBf2HlSmfwZ1hA=;
 b=YCcwv5rCYNYI74alw1jgQwI9tQs6sjwQGcsznRLVKP2ZUPmybSigp394uHrPvzj26BSg8VFWSKhIbrcaMkvpmVjXNUayE66rtv/LrlEmka1tpNmMEVhJgN1QZ6R2Vdvxk/C8ZwX9D1X/YRRQJVTNAiKGrgTuFhJJgxLxz4G2Rlo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 478887602acb7ec8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMP6PLzEjroQKNtdiPI03kbqg6MKptpECwBcItQjSX0CWMvUTbocotNl6focW1+N9l6cS765uaGOQ/BPZMcgpQMlNTYsGA/EOI9mTbshqN9cij1IZnYERN393PYpxHialJzibpRwFPoi5VlW8QZy+7j79Udgf3PCJfgeOY0g29zIS8E7k3re8hsjVmKdidMboWFMX+SM3y9et1AYp9oDE9LCNQtgq8tvg1oW77sbRizQ8ae4Fp5UZ17F/T6YgQTchaQE0nvBhOURTUG9Qx8V+q1AV7IBPEpwILZmw4JYu/ToUeF6UA0Xh0XaSpOSUfY135ApgLjlHCEdWOaadpbI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXin2IsumT0ldkqAtVH7Y+bxdFf/GfBf2HlSmfwZ1hA=;
 b=lp8xmFXbpZSCFsFULHyBJjnjRDaTVPyTnvFaYSI7FIBymGrKgxvnr1IH8Je3g+BRJrlMu3MvwnejS8E6Jas6/KRsWdvrIZ7jkle68F3SJPuNZaF+FxpkLQLRTe9FvgTdnm1Z0cD55CvMxD9cA7PLDTVyakSg11m6QeP+du7MFOWnrfMjqAlVL0X/fAJa5BGxbH/WaZLKzDMVVDIo/UarvUmKEZwS16h5ETLdzF59Rx7ClyXkgGM8BBU0nFf7T0OF/5ELIw12Tz+OANM0nUcvcdHIzecv56dPl8tqyuS9MGvy5pgTLOl1Lt6lIYIUoDC8OhE2ALMODywtd8r2sQb7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXin2IsumT0ldkqAtVH7Y+bxdFf/GfBf2HlSmfwZ1hA=;
 b=YCcwv5rCYNYI74alw1jgQwI9tQs6sjwQGcsznRLVKP2ZUPmybSigp394uHrPvzj26BSg8VFWSKhIbrcaMkvpmVjXNUayE66rtv/LrlEmka1tpNmMEVhJgN1QZ6R2Vdvxk/C8ZwX9D1X/YRRQJVTNAiKGrgTuFhJJgxLxz4G2Rlo=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Thread-Topic: [PATCH] xen/sched: fix sched_move_domain()
Thread-Index: AQHaAn6ufpdY+57bqkWZN4b9/h1wsrBQ+nMAgAACLYCAAALdAA==
Date: Thu, 19 Oct 2023 11:49:06 +0000
Message-ID: <83E6DCF6-926C-43A6-94D2-EB3B2C444309@arm.com>
References: <20231019112314.22665-1-jgross@suse.com>
 <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
 <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
In-Reply-To: <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU5PR08MB10515:EE_|AM2PEPF0001C716:EE_|AM7PR08MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf98942-7011-4430-16ec-08dbd0996b32
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HQc94hISsuumuCJpwOr2f46FjhSskaK6v9b9WVHu2fgJJ8mlqr91ltyGacwqqurgo/v66gbDEm7uHs8cnGp6j4qZuGYPIfE0NUpVOic13E0YNBal6x7PRcqP5r4TQJvJsHNKd2QJa+CXbzzNa5nTCa0hmJjIyF7Now5SUu3ioHonzBS3/YDehLv4KzdwhzRrr2COI9AxkVYPQL5VFZ23pjiWUK7/VRQGhOJ6kZjwI3UkTcrXdO+X+qmsKYuEul/FlPBY5YzollIO3R5foItMbX+H+QdtnhIGE7bfiiDo03jCPXF0cXvPikG8nrLe0s+idDPFwT8in7qMFg8GU+zn3AFMo21aZaJ0FZZq6V4tzTcPt/vmEJ7ESeLwXw9IC3kZ+xpHNzhcxbIVMLrCXZl49BN9d76sRqn4jimI5KAAW+YDxY+oqJxq4y6A+gmbkDg3Q2RpPfOzJpC6fzuL7FOtYV9qZEfqzislLG8XYteBvQcunkIe54RuM308ZbHxu9JpS/dy6GfnHtB6JjdzBsYNOCzdrgHl5w37RJZaHJFUmnfywaLouXpC65//yevoZxcRVCIWhahKm5fFeeZEx2+sKPbQfBpNwA3BASelcYMFqxWqJyym3Ad68PgQnusd3zOvpfjti58z6SEAN4rsKPxIGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(66476007)(38100700002)(36756003)(38070700005)(2616005)(122000001)(6512007)(6916009)(86362001)(2906002)(66556008)(316002)(8676002)(41300700001)(76116006)(54906003)(8936002)(66946007)(5660300002)(66446008)(91956017)(4326008)(64756008)(478600001)(6506007)(71200400001)(53546011)(6486002)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D49760BF1952247A451B8D2CB3B1ABD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6821ad0c-0fea-403d-3079-08dbd0996639
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdCskVGqtD11NuSbNTs731ic0X654XrPZRvqAzLxM1LN1/gC06sT44qHmwT6aoV5dCgbcxlxsk+yO+Aj4YSJUvYXj+kHmpeOSpCj6jubg+lqPM5TZ+2/HFcrowvRo2FnDOSz5KDrhArl+vDcF5kpLDR3UvYoOND63fHeztIRcxi/eu7b5kCFOxM8ujkyEzDMFjH3MbWDNWZJU+nA/rytQIToXXGa2a+/BeTiqbTfc+qKAwYV8By36vBjlz+x0fFJXWSQD6FDCeRQxiGRCl2Gwc5nzlHpANAdFzsVpgUMhDSdhq7WmOHnfbBNpc00tM9ZtCnE3FyfEEE+7/i+6YiDdbHeFWZRs7s2QLpeEvL30kDDJFTsn0VCC44ngLy2qvhNgF4OblDArHjcCZNKSkwbvqBgFYunJHBzgQ0Q+0tNXoTFapZMyAs3f6zWg++GlbTIeZWAiycSssRlTjgBkPkcSXzvtZsNLttPGpILxyasjB1XDcK+humPhZqQD03b4IAFYeOMXsO5IGjyIELxypI6gNWuHwrFNXF5AKtWzu15u8PpG0YnEELd9L65/5j09RYnRXCpROaX9sKKx5VpxRBXJ3dhJCwMsljTv9WB9D6K3Z8EmUqJqXYIFuyIc75LXF4EVpOBtHBgGIJx7QArC+ys/Tw/+SIJWTzM8pJ2g7fDodEVIWRpAn37yH/I89hXHEMmMrlxFor2LMzmfpiwkb0xAZlx4o5nijfOBKWRX2CpDbk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(36840700001)(46966006)(40470700004)(316002)(70586007)(70206006)(54906003)(5660300002)(8676002)(40460700003)(478600001)(8936002)(6862004)(6486002)(4326008)(40480700001)(82740400003)(83380400001)(81166007)(6512007)(356005)(36860700001)(86362001)(336012)(2906002)(107886003)(33656002)(53546011)(41300700001)(26005)(6506007)(47076005)(2616005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:49:14.9294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf98942-7011-4430-16ec-08dbd0996b32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5479

SGkgSnVlcmdlbiwNCg0KPiBPbiBPY3QgMTksIDIwMjMsIGF0IDE5OjM4LCBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMTAuMjMgMTM6MzEsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+PiBIaSBKdWVyZ2VuLA0KPj4+IE9uIE9jdCAxOSwgMjAyMywgYXQgMTk6
MjMsIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gV2hl
biBtb3ZpbmcgYSBkb21haW4gb3V0IG9mIGEgY3B1cG9vbCBydW5uaW5nIHdpdGggdGhlIGNyZWRp
dDINCj4+PiBzY2hlZHVsZXIgYW5kIGhhdmluZyBtdWx0aXBsZSBydW4tcXVldWVzLCB0aGUgZm9s
bG93aW5nIEFTU0VSVCgpIGNhbg0KPj4+IGJlIG9ic2VydmVkOg0KPj4+IA0KPj4+IChYRU4pIFhl
biBjYWxsIHRyYWNlOg0KPj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIzYTcwMD5dIFIgY3JlZGl0
Mi5jI2NzY2hlZDJfdW5pdF9yZW1vdmUrMHhlMy8weGU3DQo+Pj4gKFhFTikgICAgWzxmZmZmODJk
MDQwMjQ2YWRiPl0gUyBzY2hlZF9tb3ZlX2RvbWFpbisweDJmMy8weDViMQ0KPj4+IChYRU4pICAg
IFs8ZmZmZjgyZDA0MDIzNGNmNz5dIFMgY3B1cG9vbC5jI2NwdXBvb2xfbW92ZV9kb21haW5fbG9j
a2VkKzB4MWQvMHgzYg0KPj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIzNjAyNT5dIFMgY3B1cG9v
bF9tb3ZlX2RvbWFpbisweDI0LzB4MzUNCj4+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMDY1MTM+
XSBTIGRvbWFpbl9raWxsKzB4YTUvMHgxMTYNCj4+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMzJi
MTI+XSBTIGRvX2RvbWN0bCsweGU1Zi8weDE5NTENCj4+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAy
Mjc2YmE+XSBTIHRpbWVyLmMjdGltZXJfbG9jaysweDY5LzB4MTQzDQo+Pj4gKFhFTikgICAgWzxm
ZmZmODJkMDQwMmRjNzFiPl0gUyBwdl9oeXBlcmNhbGwrMHg0NGUvMHg0YTkNCj4+PiAoWEVOKSAg
ICBbPGZmZmY4MmQwNDAyMDEyYjc+XSBTIGxzdGFyX2VudGVyKzB4MTM3LzB4MTQwDQo+Pj4gKFhF
TikNCj4+PiAoWEVOKQ0KPj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCj4+PiAoWEVOKSBQYW5pYyBvbiBDUFUgMToNCj4+PiAoWEVOKSBBc3NlcnRpb24g
J3N2Yy0+cnFkID09IGMycnFkKHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpKScgZmFpbGVkIGF0IGNv
bW1vbi9zY2hlZC9jcmVkaXQyLmM6MTE1OQ0KPj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioNCj4+PiANCj4+PiBUaGlzIGlzIGhhcHBlbmluZyBhcyBzY2hl
ZF9tb3ZlX2RvbWFpbigpIGlzIHNldHRpbmcgYSBkaWZmZXJlbnQgY3B1DQo+Pj4gZm9yIGEgc2No
ZWR1bGluZyB1bml0IHdpdGhvdXQgdGVsbGluZyB0aGUgc2NoZWR1bGVyLiBXaGVuIHRoaXMgdW5p
dCBpcw0KPj4+IHJlbW92ZWQgZnJvbSB0aGUgc2NoZWR1bGVyLCB0aGUgQVNTRVJUKCkgd2lsbCB0
cmlnZ2VyLg0KPj4+IA0KPj4+IEluIG5vbi1kZWJ1ZyBidWlsZHMgdGhlIHJlc3VsdCBpcyB1c3Vh
bGx5IGEgY2xvYmJlcmVkIHBvaW50ZXIsIGxlYWRpbmcNCj4+PiB0byBhbm90aGVyIGNyYXNoIGEg
c2hvcnQgdGltZSBsYXRlci4NCj4+PiANCj4+PiBGaXggdGhhdCBieSBzd2FwcGluZyB0aGUgdHdv
IGludm9sdmVkIGFjdGlvbnMgKHNldHRpbmcgYW5vdGhlciBjcHUgYW5kDQo+Pj4gcmVtb3Zpbmcg
dGhlIHVuaXQgZnJvbSB0aGUgc2NoZWR1bGVyKS4NCj4+PiANCj4+PiBDYzogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KPj4gRW1tbSwgSSB0aGluayBeIHRoaXMgQ0MgaXMgYmV0dGVy
IHRvIG1lIG1vdmVkIHRvIHRoZSBzY2lzc29ycyBsaW5lLCBvdGhlcndpc2UNCj4+IGlmIHRoaXMg
cGF0Y2ggaXMgY29tbWl0dGVkLCB0aGlzIGxpbmUgd2lsbCBiZSBzaG93biBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuLi4NCj4+PiBGaXhlczogNzBmYWRjNDE2MzViICgieGVuL2NwdXBvb2w6IHN1cHBv
cnQgbW92aW5nIGRvbWFpbiBiZXR3ZWVuIGNwdXBvb2xzIHdpdGggZGlmZmVyZW50IGdyYW51bGFy
aXR5IikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQo+Pj4gLS0tDQo+Pj4gVGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBpbiBYZW4g
NC4xNS4gVGhlIGZpeCBpcyB2ZXJ5IHNpbXBsZQ0KPj4+IGFuZCBpdCB3aWxsIGFmZmVjdCBvbmx5
IGNvbmZpZ3VyYXRpb25zIHdpdGggbXVsdGlwbGUgY3B1cG9vbHMuIEkgdGhpbmsNCj4+PiB3aGV0
aGVyIHRvIGluY2x1ZGUgaXQgaW4gNC4xOCBzaG91bGQgYmUgZGVjaWRlZCBieSB0aGUgcmVsZWFz
ZSBtYW5hZ2VyDQo+Pj4gYmFzZWQgb24gdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIHJlbGVhc2Ug
KEkgdGhpbmsgSSB3b3VsZG4ndCBoYXZlDQo+Pj4gYWRkZWQgaXQgdGhhdCBsYXRlIGluIHRoZSBy
ZWxlYXNlIHdoaWxlIGJlaW5nIHRoZSByZWxlYXNlIG1hbmFnZXIpLg0KPj4gVGhhbmtzIGZvciB0
aGUgcmVtaW5kZXIgOikNCj4+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcsIGlmIHRo
aXMgaXMgZml4aW5nIHRoZSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4NCj4+IDQuMTUsIHNob3Vs
ZG7igJl0IHRoaXMgcGF0Y2ggYmVpbmcgYmFja3BvcnRlZCB0byA0LjE1LCA0LjE2LCA0LjE3IGFu
ZCBzb29uDQo+PiA0LjE4PyBTbyBob25lc3RseSBJIHRoaW5rIGF0IGxlYXN0IGZvciA0LjE4IGVp
dGhlciBhZGQgdGhpcyBwYXRjaCBub3cgb3INCj4+IGxhdGVyIHdvbuKAmXQgbWFrZSBtdWNoIGRp
ZmZlcmVuY2XigKZJIGFtIG9rIGVpdGhlciB3YXkgSSBndWVzcy4NCj4gDQo+IFlvdSBhcmUgcmln
aHQsIHRoZSBwYXRjaCBuZWVkcyB0byBiZSBiYWNrcG9ydGVkLg0KPiANCj4gT1RPSCBub2JvZHkg
bm90aWNlZCB0aGUgcmVncmVzc2lvbiB1bnRpbCBhIGZldyBkYXlzIGFnby4gU28gZGVsYXlpbmcg
dGhlIGZpeA0KPiBmb3IgYSBmZXcgd2Vla3Mgd291bGQgcHJvYmFibHkgbm90IGh1cnQgdG9vIG1h
bnkgcGVvcGxlLg0KDQpJIGFtIHBsYW5uaW5nIHRvIGJyYW5jaCBuZXh0IHdlZWssIHNvIEkgd291
bGQgc2F5IHRoaXMgcGF0Y2ggcHJvYmFibHkgd2lsbCBiZQ0KZGVsYXllZCBtYXggMSB3ZWVrIEkg
Z3Vlc3MuDQoNCj4gRWFjaCBwYXRjaCBjaGFuZ2luZw0KPiBjb2RlIGlzIGEgcmlzayB0byBpbnRy
b2R1Y2UgYW5vdGhlciByZWdyZXNzaW9uLCBzbyBpdHMgeW91ciBkZWNpc2lvbiB3aGV0aGVyDQo+
IHlvdSB3YW50IHRvIHRha2UgdGhpcyByaXNrLiBFc3BlY2lhbGx5IGNoYW5nZXMgbGlrZSB0aGlz
IG9uZSB0b3VjaGluZyB0aGUNCj4gY29yZSBzY2hlZHVsaW5nIGNvZGUgYWx3YXlzIGhhdmUgYSBs
YXRlbnQgcmlzayB0byBvcGVuIHVwIGEgc21hbGwgcmFjZSB3aW5kb3cNCj4gKHRoaXMgY291bGQg
YmUgc2FpZCBmb3IgdGhlIG9yaWdpbmFsIHBhdGNoIEknbSBmaXhpbmcgaGVyZSwgdG9vIDotKSAp
Lg0KDQpUaGF0IHNhaWQsIGdpdmVuIHRoZSBmYWN0IHRoYXQgdGhpcyBwYXRjaCBpcyBmaXhpbmcg
YSByZWdyZXNzaW9uIHllYXJzIGFnbyBhbmQNCndpbGwgYmUgYmFja3BvcnRlZCB0byB0aGUgc3Rh
YmxlIHJlbGVhc2VzLCBJIGFtIG1vcmUgbGVhbmluZyB0b3dhcmRzIG1lcmdpbmcNCnRoaXMgcGF0
Y2ggd2hlbiB0aGUgdHJlZSByZW9wZW5zICh1bmxlc3Mgb3RoZXJzIHN0cm9uZ2x5IG9iamVjdCks
IHNvIHRoYXQgdGhpcw0KcGF0Y2ggd2lsbCBnZXQgdGhlIG9wcG9ydHVuaXR5IHRvIGJlIHRlc3Rl
ZCBwcm9wZXJseSwgYW5kIHdlIHdvbuKAmXQgdGFrZSB0b28gbXVjaA0KcmlzayB0byBkZWxheSB0
aGUgNC4xOCByZWxlYXNlLiBBbHNvIHRoaXMgZGVjaXNpb24gaXMgY29uc2lzdGVudCB3aXRoIHlv
dXIgKGFuDQpleCByZWxlYXNlIG1hbmFnZXIpIGFib3ZlIHdvcmRzIGluIHRoZSBzY2lzc29ycyBs
aW5lIDopDQoNCkhvcGVmdWxseSB5b3Ugd2lsbCBhbHNvIGJlIG9rIHdpdGggdGhhdC4NCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gDQo+IEp1ZXJnZW4NCj4gPE9wZW5QR1BfMHhCMERF
OURENjI4QkYxMzJGLmFzYz4NCg0K

