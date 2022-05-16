Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E05283DB
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 14:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329814.553076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZV5-0001WX-7h; Mon, 16 May 2022 12:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329814.553076; Mon, 16 May 2022 12:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZV5-0001UG-4F; Mon, 16 May 2022 12:06:59 +0000
Received: by outflank-mailman (input) for mailman id 329814;
 Mon, 16 May 2022 12:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HoMZ=VY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nqZV4-0001UA-23
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 12:06:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae0c8991-d510-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 14:06:56 +0200 (CEST)
Received: from AM7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:100::16)
 by AM0PR08MB3828.eurprd08.prod.outlook.com (2603:10a6:208:108::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 12:06:53 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::4) by AM7PR02CA0006.outlook.office365.com
 (2603:10a6:20b:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 12:06:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 12:06:52 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Mon, 16 May 2022 12:06:51 +0000
Received: from e147d98fd594.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0AF5F89-0F3F-4477-BE0F-2B5F5DFBE8B5.1; 
 Mon, 16 May 2022 12:06:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e147d98fd594.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 May 2022 12:06:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5154.eurprd08.prod.outlook.com (2603:10a6:208:15d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 12:06:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 12:06:42 +0000
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
X-Inumbo-ID: ae0c8991-d510-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RGYWiZPqgmdvDUhUFoiXp9Ye5ItdLAoh2doSQ0eATwZ6sDUhRQpY1c4D3usXU5P4wHEy5im0btpZzWi2JXTDMfQ04fYtMQzAj3SHBcjIyIEUZevjTtmkojYNl6MnlZI68I1SqUjWIHwiBK+BFV8e0+celXG+kKil4lbgVe83mEEn3Kv446F7DtpgU7dzKkkpS2w3vr+kl9ioQYBCENI6MzgczSIVAIneho5guMbAr+A/VGQ+jqKaUvk2vdPplJ5dF0tGtHNR27PDDdkmON0armND5oCbJS2Nj4HdcqjMvRi/e0pD6TVfioIZQp33d/ELv5vCxNgbJaJpR3vXLUHiCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbzq96OHyB86eOvTJasK8OYjYHkVSJJ2op2IQBdMr6Y=;
 b=DW3V2HzAJpw6MujIZndbEKRHnkS10m2HRW/JSHTgZTqHheNY2xmE0R+2Zmpd+w8MfAdNa+zGFhOXR1XNUPc0v5QCYqKEZ09JSDURz42+75F9c8yf62oeYgbDy0bxCdd5LuzRqRDJVBN9zZ6TMXfA9Z5D4tJiM3LLAY0F22llDpfEjI3Y+xgVKGQFMo0qPYcPY1F3TehAdUcVThDwPL6egMUyhpkfOohCssVwSeeTGm8e179b+4BJsAQPbeJMcdjXOUpJLxat3OzfRuMWJOvAkxJq1D2TcmIZzBIwUvtsZnwgcV+Zkh9WKHEvtIvda/psQQ1+kPeQXPyp2N0MGhZI4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbzq96OHyB86eOvTJasK8OYjYHkVSJJ2op2IQBdMr6Y=;
 b=vjRhInMQtR7SXYSyyx/gutC40xQC4JyuiLbR59S/0wAPjM9DD6EbtEE5ZZjHfBjC3025GAbnQ4z3LCR25cr4yu0MUYv6vMbRgqr2akTZH8/e7iSVIpvfdQEvkuDQyNP4ZyJc5o9EaJaw18V8Wx2XhX9rN1Pu0lLwqAU9uwB/JgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b04134b4ea7585d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNWHG10NbMCZwZn7SylC4+6xZ32YIK+/vo9AIvDBQ5ofbmNU4/wZzdlppzrnRXn5cbECxbIzy0P/ysAgkh2y+135xDiMuUWnI535v1Nw5rforUD4A5y7NVU5h2TKAR01t0PJh1dgJB4kmA43LV1s589rhsb2pWYe4aUC3t8AVRpAfMiYkLF1PR6j1N7GkIvigjliqK8rR3RxBNQzr21TkWTJvCWzAQ3pS6nfcYdOKjDPL5t8NDoaPkcDacipQjpNoZGfWfY1rJGhwOynD6i0FyhUiXx4y0ZAMVbefo1fQSaxcRNvlJgy279MGkX9ZpueT+SL89Jt5WvfPtrDrtp0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbzq96OHyB86eOvTJasK8OYjYHkVSJJ2op2IQBdMr6Y=;
 b=NbUF4zg1NLJgUk/CHZXBFcQysLxvDBe6kRCzTu4I0m1BVV/6pYedMTLyra+H62Sk8nvn5kwhFZRc85iJzOeLQAXENUTaoXTY5fmJyipKh16OHDt0n3Hl/6hUO9LIOJplEXq0b1uNu8Frzv+1llm8psPogdbwiSn4A2KlpJVeI8YMEMZ5W6LWJ+vZTPM3bxnjMH5bVj+ag0KMB4whxjjj+tbkgnRkLNbiSlfDwvyEgr4Ox/TfBGPibz8asHfVGW3eNiyCluBWSNS1k6+dRiaUprY9mmsDTGAS1EkUWR5VQN8poDFAGImvunUq01YHOcFUolqiJREtOhRUd6hZyucrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbzq96OHyB86eOvTJasK8OYjYHkVSJJ2op2IQBdMr6Y=;
 b=vjRhInMQtR7SXYSyyx/gutC40xQC4JyuiLbR59S/0wAPjM9DD6EbtEE5ZZjHfBjC3025GAbnQ4z3LCR25cr4yu0MUYv6vMbRgqr2akTZH8/e7iSVIpvfdQEvkuDQyNP4ZyJc5o9EaJaw18V8Wx2XhX9rN1Pu0lLwqAU9uwB/JgI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Topic: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Thread-Index: AQHYaQFPaa+cmN6NyUGhGvdTzOfzhq0hO1kAgAAHagCAACYIgA==
Date: Mon, 16 May 2022 12:06:42 +0000
Message-ID: <EE8A0374-89DA-4FA6-8B8E-1B9F4A688D08@arm.com>
References: <20220516084517.76071-1-julien@xen.org>
 <2E233152-FF46-42CF-B2CD-62E0BBE793C3@arm.com>
 <d6457564-d29b-9dc5-7338-b06808bd7a6c@xen.org>
In-Reply-To: <d6457564-d29b-9dc5-7338-b06808bd7a6c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d6ae4164-1613-4f64-b876-08da37349025
x-ms-traffictypediagnostic:
	AM0PR08MB5154:EE_|AM5EUR03FT011:EE_|AM0PR08MB3828:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3828C3AF592B519910B3FC259DCF9@AM0PR08MB3828.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ep9wSPGBEGC2JB65KO68v6GG1C5T1tE9pTFDsrY6qreUtkaY9SmCtKhEnOC3EoFK4nH7rrbTOJ7cy7RIqjshThFiOr0hyYq0mC2lGgx2QdLmuwGb+8wFY7d0jb4H3Ph7PZbwETgsFA43JwKD/4FD8PY9pWnVIu3/1L8JFTjwNeBPfJLHlQL81sFxroZVmtizYHkvMrGnH4xoX21PvslwRcIUGULXMh4wjnuyCEKPSD+pCX0Y8E84yioKPVMDac1PZZf22dxMj81J7kDw9tODrHH7Y7z0EbHjY1Hihq/kosMmYiZeYsyDOpIOtQeuK9Nq7i6r+POCZr/DwiunSwPeuJcaJ4Aif6UIYJTYL8YIiSN7TIFAQSW3M7kcNjSkAwNwgFeCdcq9cDdp9mUVMMAKJRMEUo0thO4Ww5q5xyrFh29JQFcni6s+QwbYSzmvqta+d2QDxxIvV+ObuSJlsgfrfHNdtP1l4mLIYkhfRwb3bl6mo/F6Fot/0k3FELjt2T1UzssQBXMn9eHgrcXXdawPSqf2Xt3uWIgjuB1jaZlxiaoikmEr3IGc2Mpm1G0kEiaaU8T9+l/PAA6GPXscivmWU4ZFMw1lno8Ab9BBQa80/fSp7cJWa3G+bRQbX6LZe54lEtfjiclDti++oQiTajQsNPL17gmxGJrPm67c8QZgKIrFBZQgzYy1pzD0tpaxX8XRtmaZuq1X6/+pazI3eDmmTFt15C1AkaHdHpnjlbR1rUwgGIkSDS6TaCAtT2CapbQjAPhHYryq+VDwq/UczQfM2qxMcAWvLuaFvJ91zc4T4UIUd9T4bMpujQXjgblZPgot
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(186003)(508600001)(316002)(38100700002)(5660300002)(38070700005)(83380400001)(26005)(8936002)(6486002)(6506007)(66946007)(66476007)(66446008)(66556008)(64756008)(76116006)(54906003)(71200400001)(53546011)(6916009)(33656002)(91956017)(36756003)(8676002)(2906002)(122000001)(2616005)(4326008)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6487FC367F4BA94CBB8464F6589025A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5154
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d178d08d-b0e2-42bc-08c3-08da37348a26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ha/6ziVZr2Hauh+OkYqJoKAKDXIhsRIhbjOpimxxpnY7tpsNFGkeFr28CW6D+o9IMxE+F5JuEPbnlN2HZU8rky3NxNbcK4Were9PAM9Dfc2qluTMSrYKy36AL+QBOl5bXREVmefTqM/Ixy/1cZCoz1hpuKPnMOsmI+ORlEomrTU1hx+5mhH4Hfa7xP24Nl4nnxToYfXr58DWuR3sRkG6fGoVwIlml5SBbyh8mKGSIr7eARAvyweH4hIcBC4JI+NFykY74hb5vlWYM5EmuVohlnAf10wiD02PgMArxqZO9t6USe2da7g8z/MSVcQ22VyDgzMMSM8gxThO9UBRCJPPWzXGkCeIgrWg8McZvZ2LJYnLXe9h8sFzjiJFQqNtqd3LeswYxWNeZf2OFoozbvKhRkjUr5W7akrdQZXP6YAwabIPbjf9wKvhkIsqS9wrc6fnuRRbR8lK3SXgZTRqOxsD7VcpohPJQPODQ5YyZmTZ434g9n/cLLlys4AgcFvihSitg69sEoKMW10GhmKxG49m1zAwD+LLSc0nRy+ZcJck/tcyfe9eNmI7WMetU9rHfgc0u1iCc/7uX/hKiQ18IT89ViG4wL9MJGwt4+oUSPxcexZNApv987O50ggtInBuRw3kz/DqloOULW8sf8yAb2vlExsNYowOPD5ILKX3nFHSVzeoCilACUNNgczpFP3M/EL7RrheH8TA+WUrBbICkZ5nHNPu+JEHF96g7iA3FcYg2/wOqx+B1VeQ2jeVYas953Po
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(6486002)(6512007)(6506007)(53546011)(47076005)(83380400001)(54906003)(36860700001)(26005)(8936002)(316002)(86362001)(356005)(40460700003)(36756003)(82310400005)(81166007)(6862004)(4326008)(8676002)(107886003)(2616005)(5660300002)(70206006)(70586007)(33656002)(2906002)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 12:06:52.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ae4164-1613-4f64-b876-08da37349025
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3828

Hi Julien,

> On 16 May 2022, at 10:50, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/05/2022 10:24, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 16 May 2022, at 09:45, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
>>> alloc/free" extended the checks in the buddy allocator to catch any
>>> use of the helpers from context with interrupts disabled.
>>>=20
>>> Unfortunately, the rule is not followed in the LPI code when allocating
>>> the pending table:
>>>=20
>>> (XEN) Xen call trace:
>>> (XEN) [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
>>> (XEN) [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
>>> (XEN) [<0000000000237770>] _xmalloc+0x144/0x294
>>> (XEN) [<00000000002378d4>] _xzalloc+0x14/0x30
>>> (XEN) [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
>>> (XEN) [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
>>> (XEN) [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0=
x20/0x50
>>> (XEN) [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
>>> (XEN) [<0000000000284518>] start_secondary+0x1a8/0x234
>>> (XEN) [<0000010722aa4200>] 0000010722aa4200
>>> (XEN)
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 2:
>>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpu=
s() <=3D 1)' failed at common/page_alloc.c:2212
>>> (XEN) ****************************************
>>>=20
>>> For now the patch extending the checks has been reverted, but it would
>>> be good to re-introduce it (allocation with interrupt is not desirable)=
.
>>>=20
>>> The logic is reworked to allocate the pending table when preparing the
>>> CPU.
>>>=20
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>> xen/arch/arm/gic-v3-lpi.c | 81 ++++++++++++++++++++++++++++-----------
>>> 1 file changed, 59 insertions(+), 22 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>>> index e1594dd20e4c..77d9d05c35a6 100644
>>> --- a/xen/arch/arm/gic-v3-lpi.c
>>> +++ b/xen/arch/arm/gic-v3-lpi.c
>>> @@ -18,6 +18,7 @@
>>> * along with this program; If not, see <http://www.gnu.org/licenses/>.
>>> */
>>>=20
>>> +#include <xen/cpu.h>
>>> #include <xen/lib.h>
>>> #include <xen/mm.h>
>>> #include <xen/param.h>
>>> @@ -234,18 +235,13 @@ void gicv3_lpi_update_host_entry(uint32_t host_lp=
i, int domain_id,
>>> write_u64_atomic(&hlpip->data, hlpi.data);
>>> }
>>>=20
>>> -static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
>>> +static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>>> {
>>> - uint64_t val;
>>> void *pendtable;
>>>=20
>>> - if ( this_cpu(lpi_redist).pending_table )
>>> + if ( per_cpu(lpi_redist, cpu).pending_table )
>>> return -EBUSY;
>>>=20
>>> - val =3D GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_S=
HIFT;
>>> - val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABI=
LITY_SHIFT;
>>> - val |=3D GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIF=
T;
>>> -
>>> /*
>>> * The pending table holds one bit per LPI and even covers bits for
>>> * interrupt IDs below 8192, so we allocate the full range.
>>> @@ -265,13 +261,38 @@ static int gicv3_lpi_allocate_pendtable(uint64_t =
*reg)
>>> clean_and_invalidate_dcache_va_range(pendtable,
>>> lpi_data.max_host_lpi_ids / 8);
>>>=20
>>> - this_cpu(lpi_redist).pending_table =3D pendtable;
>>> + per_cpu(lpi_redist, cpu).pending_table =3D pendtable;
>>>=20
>>> - val |=3D GICR_PENDBASER_PTZ;
>>> + return 0;
>>> +}
>>> +
>>> +static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
>>> +{
>>> + const void *pendtable =3D this_cpu(lpi_redist).pending_table;
>>> + uint64_t val;
>>> +
>> Should we add an assert here to check if we are to early in boot ?
>> That would also implicitly explain that allocation is done during CPU_PR=
EPARE so this should not be called before.
>=20
> Do you mean something like:
>=20
> if ( !pendtable )
> {
> ASSERT_UNREACHABLE();
> return -ENOMEM;
> }

Yes that would work so that we could at least identify the origin.

>=20
>>> + if ( !pendtable )
>>> + return -ENOMEM;
>>>=20
>>> + ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
>> This ASSERT is already done in gicv3_lpi_allocate_pendtable but it makes=
 sense to have it closer to the place where we actually set the register.
>> Otherwise this assert can never be triggered.
>=20
> So the ASSERT() would end up to be triggered if the code in gicv3_allocat=
e_pendtable() is incorrect.
>=20
>> Can you remove the one in the allocation function and also copy the comm=
ent that was on top of it here ?
>=20
> I would like to the keep as it is. The check in gicv3_allocate_pendtable(=
) happens also in debug build and would allow to catch any problem before t=
he CPU is even running.
>=20
> In general, I would like to move to most of the checks when preparing the=
 CPU so there are less chance for failures when the CPU is booting.
>=20
> The ASSERT is here only to catch any misuse of the function.

Ok make sense, I am ok with it.

>=20
>>> @@ -381,6 +410,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
>>> int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>> {
>>> unsigned int nr_lpi_ptrs;
>>> + int rc;
>>>=20
>>> /* We rely on the data structure being atomically accessible. */
>>> BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>>> @@ -413,7 +443,14 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi=
_bits)
>>>=20
>>> printk("GICv3: using at most %lu LPIs on the host.\n", MAX_NR_HOST_LPIS=
);
>>>=20
>>> - return 0;
>>> + /* Register the CPU notifier and allocate memory for the boot CPU */
>>> + register_cpu_notifier(&cpu_nfb);
>>> + rc =3D gicv3_lpi_allocate_pendtable(smp_processor_id());
>>> + if ( rc )
>>> + printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
>>> + smp_processor_id());
>> On secondary cores nothing equivalent will be printed and in the cal pat=
h there
>> will be nothing printed at all which could make debugging complex.
>> Can you move this print into gicv3_lpi_allocate_pendtable ?
>=20
> Good point. I will do that in the next version.

Thanks

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


