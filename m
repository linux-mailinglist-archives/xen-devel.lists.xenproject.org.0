Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC1C544C7B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345436.570992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHb1-0002Zn-Ud; Thu, 09 Jun 2022 12:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345436.570992; Thu, 09 Jun 2022 12:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHb1-0002Wh-QT; Thu, 09 Jun 2022 12:49:07 +0000
Received: by outflank-mailman (input) for mailman id 345436;
 Thu, 09 Jun 2022 12:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzHaz-0002Wb-Q9
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:49:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b35935d-e7f2-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 14:49:05 +0200 (CEST)
Received: from DB6P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::24) by
 PR3PR08MB5851.eurprd08.prod.outlook.com (2603:10a6:102:85::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.14; Thu, 9 Jun 2022 12:49:02 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::3d) by DB6P193CA0014.outlook.office365.com
 (2603:10a6:6:29::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 12:49:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 12:49:01 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Thu, 09 Jun 2022 12:49:01 +0000
Received: from 9678aac2f36e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAECB23A-DD3A-4636-9495-CFA4C3E491A7.1; 
 Thu, 09 Jun 2022 12:48:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9678aac2f36e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 12:48:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4439.eurprd08.prod.outlook.com (2603:10a6:20b:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 12:48:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 12:48:51 +0000
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
X-Inumbo-ID: 8b35935d-e7f2-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Gx1VdRmOidvUWYcCvUXXhOqmG+4jNoEK9RmfQ5yWgoc5ys5/nUkXoi88TD3NvFev/s8dYaay+wKUL1AbyiRW1CzatIIA2zgAtoiiThlx89ote9kh1diTgb67yJ0hW21i4vt0BPlCkETWXy0xjQO0dhzwqCcZ5NmvPzCYH4npQLlx7XvxuOJpiwo1ldyooTa+9JXekVxc6cCzbc+sY7o2Umz1feLja5Cq4H8X4zaB0l8iT+38RiRyJeeFgX1KnwR/rrB5U6Ew8mc3ZNikQn5LCZzIyQb38ICYfLGBGpEUBqiKI4vb7zJ6RRut8Fjff5rkIS0hDBewurCqtaucuJnxYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmCiZoGXLgvkl8dlFwwrWhVN4bP43LI+QBrB4IVGc3Y=;
 b=KG8JZurbTVC9caqrKknY/LTBpxVCN6p3nWGMVgPiI2IGehNj+5ftL27/phwH6UGnTyoaujI7O27Qgt4EStNnEkQeTp7w6TS9E43gQ3BJSUK67+bRmNlCAU/S5NLMAWkA6vbVaLw9xKtyuFOBwmaHGC1X5ecVILwonnc9rLOHAY1LH+q/fGouTjyDx1d1J+JMlmWshSeGhwHzQjYyBAoAobjSw8Li560NP53A1wuLFwVaylZIfWij2TvHLY7vCgkmYiS6r3bCv3oiLexH3LvXP2fcrd+aXUh5kAby1c7LrccgJokKcMlqs3694fIsUdSEqFIP8h6+nmGcznDXjVhCRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmCiZoGXLgvkl8dlFwwrWhVN4bP43LI+QBrB4IVGc3Y=;
 b=EgHNzgmxwYP/cEzV5bceG9vAsVN6/9/C9VNwJS5/jU2A+2Sj0smxgNESHm7SrV76ttpk2L3EbntkKZgfUQRoLLUBRaRyOaPma5JtBGxKPeh9vnT2Hfo2f5+yMo/v+MNWnHI1K/jqIAvr3bEY+Q3mmXubrxbNhhWg1oq1GTVN9Ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 325295dfe50e2976
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAYz8NKSn7OI2QZp7OgRLuBuQD6DwAn+jaGAG+5rHozL9ujzUJtd+8DBURrCkRkTy7Q0G1vMmohjvMwkyD8nNiY/Q0Fq8jjqkc0dQvuhljEVGaxfdlbOxAJVK+rW+hnM2fH8vZfZ36LVL0oANg5HvK2AN3UDTribNwIw0y77y7CcjtVZJ2BfmmxdEVteC6we67JlhMQcXwWa3iRcdFFJXE3fEIGL7UxU8oE+gv83yMImmepfg6mqMhTPNpbiVl77mOIHlWfQ4Yzc85h8GtqvPviDBmDWdTw+wVBEWEbLdcdqQTncchMpNh7/AmPX5O8dualExSLE3JpTZI4KeyPnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmCiZoGXLgvkl8dlFwwrWhVN4bP43LI+QBrB4IVGc3Y=;
 b=SUAP0BDYpOcr5wMukAl6inp9JNItscrgitQRGlzdoGUr8HvcZGq++ohzr8aIK5HbzAwdMxRCnOa9yGVj4QMpLfPBvK2oERIK1VCpEL5xs7/NNTvTzLQSsIjAiCk7mgZjTNwjM+O14D0uxEj6xg7dPmKcnO/PMuacgwRFZwcSnt1ICIE7yVyiI4m0m3i3WxkcikCanO/h8eQVkKi+5bGvOaOKhPLkQLsTcdbLUEvC9RiSvyFrk614PU+yZ1ugPDOOWcT9nnmBhZ7HO91i1HrH60/xv2mnBoghpqdVCfk58DbS8Ss72ZyZIBVLXKmz1v5d+9pFWJeBYa/jgLQgOu0+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmCiZoGXLgvkl8dlFwwrWhVN4bP43LI+QBrB4IVGc3Y=;
 b=EgHNzgmxwYP/cEzV5bceG9vAsVN6/9/C9VNwJS5/jU2A+2Sj0smxgNESHm7SrV76ttpk2L3EbntkKZgfUQRoLLUBRaRyOaPma5JtBGxKPeh9vnT2Hfo2f5+yMo/v+MNWnHI1K/jqIAvr3bEY+Q3mmXubrxbNhhWg1oq1GTVN9Ug=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Topic: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Index: AQHYddkD4JsESJA0gkGnWWwykzQjSK1G6E+AgAAC3wCAABeVAIAABweAgAAJDAA=
Date: Thu, 9 Jun 2022 12:48:51 +0000
Message-ID: <09F76BE7-6BC4-4D95-B79D-F60FB375D074@arm.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
 <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
 <5195b659-ae2f-be1f-eb5a-bbe3e4b5d9fb@suse.com>
In-Reply-To: <5195b659-ae2f-be1f-eb5a-bbe3e4b5d9fb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 64648533-773b-451a-b415-08da4a166dc2
x-ms-traffictypediagnostic:
	AM6PR08MB4439:EE_|DBAEUR03FT027:EE_|PR3PR08MB5851:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5851A9BEFB8ECE9148F598C29DA79@PR3PR08MB5851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T1cKPVTv7rTDKKT+byAiEZOVWpimF308QK8mrS6JRR0Ph1/Zgqph0x53eAFvgOLg0Ad00UKHfzDnMt9I3204xEy0cxLKP9ZSrAdUr7QJkC+NpL4hCEfw8boEKgjiBLaKg0RtB3HpFnBTOayMfUZFZ15+a/aZtcccVeKiuV1D4SgdI3vj9Q/0Uh0on9w53G+vRyxNDS1RL2y34S4Evb/SO5fpJhcd8J2Ewyo+HZ0G8mYt9y9N7dY9w1pM6aOIEEmW9HOd6uFxJ7LH+62DicTqK/iB1jJ1OAPiI2e56Fb+DF1WiBM7FdccsdIDk8U5E9YrhDP6eNz5mhIwzkt3fCTa46bg5My7mVwUU92xMZg4G75wmJbHscO30+ELje7Xiyzfg1QTJqu4HwnsIOjftKNk0bIz5WaBCE9PVKZrYsjXP6MTxsGSOoFqeH+xWNo07c7P3/yRzCkOhWvXhhBWFQm/b8KNX/H1P4gs66CX7iVS12JwXNQJy6wHWsrjd8PbBTij13dEig7nrcdXraPr6MCkbRepAsmxaZ3CmvJPWGES/grtAk2fwteWmxEngpY0dqGs5GFAu8sJdIj/JeSnQuTGj+LeAC7crWEV4mbdY2hLJQ/y2S9O6kEB/lrJ5ikk+z2zHLOJoEYK3Fy8pn3wYPcp60p48KtrzQpbAw1GBNP3x8Yf5PXveid0uNONfRJR2Hlr3m/xd3bDH6nTSSto3Shc+tlm7P7h8ehMAOrNIXnqK0umOlwUKZcBzwppL8PtNgqA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(33656002)(316002)(38100700002)(4326008)(8676002)(86362001)(66446008)(66946007)(66476007)(64756008)(76116006)(66556008)(122000001)(54906003)(6916009)(91956017)(36756003)(71200400001)(2616005)(186003)(53546011)(2906002)(83380400001)(6506007)(6512007)(26005)(508600001)(8936002)(6486002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87E4BB5D84CC294A8F9694E12A1A9B17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5416a52a-7f29-456c-1818-08da4a16679a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f3N588KlRrOMbKUsrvqaYdmc2lD59oYOjdswjLmdYXMWH7VsfhHm0kYeznRki4emMmfPpVHgb4hqMFPqSgwLbe31RuJSDCbJ9M0z+MdLLfj9qFQamgkWH4vqGrwBRtBioUnX2LjRsFP/cD7Oxj43mNHZUm98q87BdgyqixXvgy1HM278KoMq0ciSRv9oHuHy0NZ0tXchpgD5Ti9E2KPtGNA7Sepof896uOUheRgo2PLVZXTt9PawF3cJ29oxJk1yPjRpiCcnDHEHusavBHW0sqXG10EtOZ+jlShz+O7ZrJNDX+5ZeqpxX5KEEOXq81B8Bqx/id5WoYXYjQe+C0EWSShtLTC+EWEaVW2eZ2dmKCULVTqQLD+TvXsYKtrggqlb20p43LrJS6ga4l/1WpM3s+bNuVZvb4UMiUISc/RpmJzkCH11zSmkj+bTzaa8PtKGWTTGM0qjBkvOg2NBgktYxYfE/+LVWW+k8aVFbKrJKWAmzyXCT92oosgdcp7Z4JILDFVK+i6kDlXzhx74dZVSn4dSm3ZORFZc7/CHAxBDXPaVnFrdK1DtlZs6oGATceyOPVx/8oQIwdw6esW8xCuhlKFaQON1OzvxFC44s1dLyz0hAve6sWdUoeRSr7EyyonPj/JwcCPk+yjbQwLhJu6CEVqwsHwqzR8SRCRc7l3P5UUdgnjzRjba2bY7xyld05Cj
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(508600001)(2616005)(70206006)(6862004)(6512007)(82310400005)(2906002)(186003)(316002)(26005)(8936002)(336012)(83380400001)(81166007)(356005)(54906003)(40460700003)(36860700001)(107886003)(53546011)(33656002)(36756003)(70586007)(8676002)(47076005)(6486002)(4326008)(6506007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 12:49:01.7559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64648533-773b-451a-b415-08da4a166dc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5851

Hi,

> On 9 Jun 2022, at 13:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.06.2022 13:51, Bertrand Marquis wrote:
>>> On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 09.06.2022 12:16, Bertrand Marquis wrote:
>>>>> On 1 Jun 2022, at 17:59, Anthony PERARD <anthony.perard@citrix.com> w=
rote:
>>>>>=20
>>>>> Use "define" for the headers*_chk commands as otherwise the "#"
>>>>> is interpreted as a comment and make can't find the end of
>>>>> $(foreach,).
>>>>>=20
>>>>> Adding several .PRECIOUS as without them `make` deletes the
>>>>> intermediate targets. This is an issue because the macro $(if_changed=
,)
>>>>> check if the target exist in order to decide whether to recreate the
>>>>> target.
>>>>>=20
>>>>> Removing the call to `mkdir` from the commands. Those aren't needed
>>>>> anymore because a rune in Rules.mk creates the directory for each
>>>>> $(targets).
>>>>>=20
>>>>> Remove "export PYTHON" as it is already exported.
>>>>=20
>>>> With this change, compiling for x86 is now ending up in:
>>>> CHK     include/headers99.chk
>>>> make[9]: execvp: /bin/sh: Argument list too long
>>>> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>>>=20
>>>> Not quite sure yet why but I wanted to signal it early as other might =
be impacted.
>>>>=20
>>>> Arm and arm64 builds are not impacted.
>>>=20
>>> Hmm, that patch has passed the smoke push gate already, so there likely=
 is
>>> more to it than there being an unconditional issue. I did build-test th=
is
>>> before pushing, and I've just re-tested on a 2nd system without seeing =
an
>>> issue.
>>=20
>> I have the problem only when building using Yocto, I did a normal build =
and the
>> issue is not coming.
>>=20
>> Doing a verbose compilation I have this (sorry for the long lines):
>>=20
>> for i in include/public/vcpu.h include/public/errno.h include/public/kex=
ec.h include/public/argo.h include/public/xen.h include/public/nmi.h includ=
e/public/xencomm.h include/public/xenoprof.h include/public/device_tree_def=
s.h include/public/version.h include/public/memory.h include/public/feature=
s.h include/public/sched.h include/public/xen-compat.h include/public/callb=
ack.h include/public/vm_event.h include/public/grant_table.h include/public=
/physdev.h include/public/tmem.h include/public/hypfs.h include/public/plat=
form.h include/public/pmu.h include/public/elfnote.h include/public/trace.h=
 include/public/event_channel.h include/public/io/vscsiif.h include/public/=
io/kbdif.h include/public/io/protocols.h include/public/io/ring.h include/p=
ublic/io/displif.h include/public/io/fsif.h include/public/io/blkif.h inclu=
de/public/io/console.h include/public/io/sndif.h include/public/io/fbif.h i=
nclude/public/io/libxenvchan.h include/public/io/netif.h include/public/io/=
usbif.h include/public/io/pciif.h include/public/io/tpmif.h include/public/=
io/xs_wire.h include/public/io/xenbus.h include/public/io/cameraif.h includ=
e/public/hvm/pvdrivers.h include/public/hvm/e820.h include/public/hvm/hvm_x=
s_strings.h include/public/hvm/dm_op.h include/public/hvm/ioreq.h include/p=
ublic/hvm/hvm_info_table.h include/public/hvm/hvm_vcpu.h include/public/hvm=
/hvm_op.h include/public/hvm/params.h; do x86_64-poky-linux-gcc  --sysroot=
=3D/home/bermar01/Development/xen-dev/build/profile-qemu-x86_64.prj/tmp/wor=
k/core2-64-poky-linux/xen/4.17+git1-r0/recipe-sysroot  -x c -ansi -Wall -We=
rror -include stdint.h -S -o /dev/null $i || exit 1; echo $i; done >include=
/headers.chk.new; mv include/headers.chk.new include/headers.chk
>> |       rm -f include/headers99.chk.new;  echo "#include "\"include/publ=
ic/io/9pfs.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Developm=
ent/xen-dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/=
4.17+git1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.=
h  -include string.h -S -o /dev/null - || exit $?; echo include/public/io/9=
pfs.h >> include/headers99.chk.new;  echo "#include "\"include/public/io/pv=
calls.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Development/x=
en-dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/4.17+=
git1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.h  -i=
nclude string.h -S -o /dev/null - || exit $?; echo include/public/io/pvcall=
s.h >> include/headers99.chk.new; mv include/headers99.chk.new include/head=
ers99.chk
>> | make[9]: execvp: /bin/sh: Argument list too long
>> | make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>> | make[9]: *** Waiting for unfinished jobs....
>>=20
>> So the command passed to the sub shell by make is quite long.
>>=20
>> No idea why this comes out only when building in Yocto but I will dig a =
bit.
>=20
> Maybe Yocto has an unusually low limit on command arguments' total size?
> The whole thing is just over 2500 chars, which doesn't look to be unusual=
ly
> long for Unix-like environments.
>=20

Actually the command to generate headers++.chk is 15294 characters when I b=
uild xen normally.
In Yocto it becomes a lot bigger as CC includes a sysroot parameter with a =
path.

Bertrand


