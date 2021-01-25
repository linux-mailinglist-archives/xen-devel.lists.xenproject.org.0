Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21BE3023BF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 11:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73991.132980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zGn-0000EI-8H; Mon, 25 Jan 2021 10:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73991.132980; Mon, 25 Jan 2021 10:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zGn-0000Dt-4b; Mon, 25 Jan 2021 10:38:53 +0000
Received: by outflank-mailman (input) for mailman id 73991;
 Mon, 25 Jan 2021 10:38:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMK+=G4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l3zGl-0000Do-VF
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 10:38:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1386a24-f5cf-44a6-ae9b-91c3b4e7bb62;
 Mon, 25 Jan 2021 10:38:50 +0000 (UTC)
Received: from DB9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:1da::23)
 by AS8PR08MB6183.eurprd08.prod.outlook.com (2603:10a6:20b:29e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 10:38:47 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::96) by DB9PR05CA0018.outlook.office365.com
 (2603:10a6:10:1da::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 10:38:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 10:38:47 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Mon, 25 Jan 2021 10:38:47 +0000
Received: from 68d9c6f42e35.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2002262-7EC7-4A09-A110-398444607679.1; 
 Mon, 25 Jan 2021 10:38:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68d9c6f42e35.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Jan 2021 10:38:38 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3790.eurprd08.prod.outlook.com (2603:10a6:803:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 10:38:36 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 10:38:36 +0000
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
X-Inumbo-ID: d1386a24-f5cf-44a6-ae9b-91c3b4e7bb62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM5BOd395Ef9nR+um9E7HrB1XQgiveG8as4ljHQ9mbQ=;
 b=6D+FZ3wemHOOpF+dt4IT8v4ym2ZYZbIij1K3M4CFQaCUB9ZOyC6qbCO/u75bagTR8tTtExRpKLbK2mqNxpGeGvM9jk3BIbm5mQMlRnuY5pkjfXP8+F2mD3fn20idAdn4g7SrJkZ1if7xycOcr0u9XYdRoOsMway8aXMMHelC2zE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c47b21412aef9df9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32x3fVL8Gl10Ei+CNpPnEObms/Ozgaj02pPA+1EHIZw+GuRDBxKBq+wEmT5T3Io/IzxZ4CwhQ0e6hUfrq95NqkpWtVRJRAwhdcXd27J6VHXIWmrXMNr2Cmh3wiYMNOcOJZc9BvZcyY2o3HUp8jgXWNWK/tHMNZJX+8SJykCwGEHebAj/9lbI3Z/0f1H4wGOXj334HHwzTx2W/28JxjB76ITNvbZjGmbf1UginUFLsFYsv2Q5Dl1BV36Cw4Hvd0RR9nylspTlY1pIcgFEKquY27mUofOBgC1m/PB/ks8P5PLcVq1+bRVS1DnEPatjd2Qg8qZmvidgP/fFFut/FYQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM5BOd395Ef9nR+um9E7HrB1XQgiveG8as4ljHQ9mbQ=;
 b=IlUiPsfH88G3xT9FE1Bff3yQqMqyvmSX8wTkNQFvN0G3re33Wr3PlP28+SQt2R5Es0tm52Ko0bCq8XGyDXI5IbfUdOoZXsdrPfj4z4OzlBb0mnzML9KMyLE4aml7YZeCOwR30sSdU2cOjHxJdi0R6MUtP/udGCuk0bwrU71hfutPdg7wIfpPR+xLOLIGi2ICmdi4bdPBSNX5c/pUOGuNUZ4Z7rZ0gvZUoOmhgi2RkUGN5WcnXMJzGvTkasHDpIpVurml4CaG41daA3E0sQJDKy1/yIROFKvjdunb5a9u9zsomZSr2v20redY2llTjQZThSvxo9HgncMu8HzWPUi8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM5BOd395Ef9nR+um9E7HrB1XQgiveG8as4ljHQ9mbQ=;
 b=6D+FZ3wemHOOpF+dt4IT8v4ym2ZYZbIij1K3M4CFQaCUB9ZOyC6qbCO/u75bagTR8tTtExRpKLbK2mqNxpGeGvM9jk3BIbm5mQMlRnuY5pkjfXP8+F2mD3fn20idAdn4g7SrJkZ1if7xycOcr0u9XYdRoOsMway8aXMMHelC2zE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHW8S5FxTPe7ge7vkW4bX7Gj58A7ao4KhqA
Date: Mon, 25 Jan 2021 10:38:36 +0000
Message-ID: <E52EF1AE-3CBE-4E21-A81A-1BE5E19D6E62@arm.com>
References: <20210123021950.1270-1-sstabellini@kernel.org>
In-Reply-To: <20210123021950.1270-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d261ca75-0a94-49a3-cdd0-08d8c11d6599
x-ms-traffictypediagnostic: VI1PR08MB3790:|AS8PR08MB6183:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB61838C9BA13E2F2264B171069DBD0@AS8PR08MB6183.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rsnF5A3laTD877+7SWkgqR+LAe3iYMuYscydrh1kopOQaxQuEPCiw9xPpstHcrNB2n3HPS+N5FM10HuCYxU6aNcgj1WB+NYipie/eQv3nXj7B+9w0qQvEd2yL3oa3Z1lCOHPboaobgmNNO/YpC7FNZS927Qr5xIEXFldunxahXWo8wtr/JxNdTdedBLnU6ON7acDiocKgWzLNmX3u0Ms4z6uuAJMqHs9CcmZ8LYX2SuASdwZWrtjlC1afbfSdaSezSKSM+84tc6Mg6QvFOpyEJJN9rDmiTxqInZmWr3pGG9Ai4l3RqUb9pJhKIpTlDxJgEO6rzWAI3w7hRkLLYo+B5FRGcmiJrsxpWoxFPlwCJ0/syDTVn7XGyG5grUtTJNeUVzVwj6yalIldeUunfehGTaR1/qzD9a/t5oOGgw16OQIAKtVAko+nMV/cMAi7Wmx63oeVTigJ7geNGwMzUZiZ4n3UF2k9gltqWNlnnuWskljvAqo1WgNQI5W66FN1wZ9bD8jh8RcET7/8uafEVKkWaG243YnmDT9F32uTsKfCuE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(86362001)(71200400001)(2906002)(64756008)(54906003)(91956017)(5660300002)(76116006)(966005)(33656002)(66476007)(316002)(66556008)(6486002)(4326008)(6916009)(8676002)(186003)(6512007)(26005)(66446008)(53546011)(6506007)(83380400001)(2616005)(8936002)(66946007)(36756003)(55236004)(478600001)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?N05HeFdEVHBCYWdIekNhZDRYU3NESnFGN3FxVUNFYWZxbUtMOGY5MXhMSDhO?=
 =?utf-8?B?RmJYVUNYNDdHUC8xdkM0emUwbmkrbE42M1dXTFA5elBSZ1VaaGI1VjVyV2h4?=
 =?utf-8?B?WENKYnZPVzJKTFZDSUhZcGw2aUNMV0dTU3pGQXJyM213dVNwd2ZETzFsNU5O?=
 =?utf-8?B?M3pGOHJnUTBLVnEybEVzU0R1SGdxdDFlRFlHT1VUYXVXWC8vNk50TkFqUmI3?=
 =?utf-8?B?czFYR3ROaHFlQmRmWEVteitSVjdFaFZkQTNBQWhjeGhycmtDQldhRllnalpC?=
 =?utf-8?B?c1B1RzduajlWM1BCbjhXL0JyRlZpa0R0enVCYjRmTG1kQ3RGclB4dm5zbEVl?=
 =?utf-8?B?UzUzak5mSGZ6Z3JNN2xnUHc3VURqa2xnR3dWL0lSSVRpN3VxYW9GV0RpSGRh?=
 =?utf-8?B?YnVmL3FwaDIwV0FkZUg3d3BEczNtQVVRY1haejRQeW5xSGhNRFR1OFZ5MnBF?=
 =?utf-8?B?VTc4a2U1cFF3a1oxcmxQQXV5YU83VkNFdDdic1RUWW9mcWRRTWpNVjd0ZEpN?=
 =?utf-8?B?RlNxcmZNRnd4V01GVFhNYlFVbTZiRVpuclY1Wmx6djdnbURqM3hON1Z1MFM1?=
 =?utf-8?B?eEFXVkRBQzhPZmlzaWZSanN6MEpIeDFiRVZBTk1wTUZieTlpdGxpbWNBeXg3?=
 =?utf-8?B?ZzRwVUJLemUyU3ZvM1ZZUkdmaTVUUlc1RXNVZi9SWlYwK2ZFa0Fnc3RvRmRD?=
 =?utf-8?B?bUNxMXhtY08zUTlWMUxtNDhUN1hGMDJhZ0ZqemNDd0d6Zyt2c3d6VEtCZ2tm?=
 =?utf-8?B?SDlsQWFNcHJvaS81aDFCckh4aHZkOW81OVMxNk1mb3FRbDFtSkVFR0ZxTW5q?=
 =?utf-8?B?UWlGNFY0aEx1S2VoT01MMUxSM1FzL2tVQThuRzBNSTlWZFBKK21SRUJObGRH?=
 =?utf-8?B?SnQxQWV6WkNSOEpaZjRyUGpFMENzclIwYTBKYmVZNWNzMnZhdnJ6bEh2R2ZW?=
 =?utf-8?B?c2tSMWs3RE1XcFNhQk5iT0dDZWw3QW9odlhVRzFjc3NyODZFUGk3ZXJ5SDBD?=
 =?utf-8?B?QnduZ2tscWYzZVJIcDhCZDhpWVdybHd5YUVvRm1ieU8vTzlpM2FDTGxEUlgr?=
 =?utf-8?B?UU8xaVpsZVNQc0pXQWtaYUx2Y3JLUjd1RGZZMzliaDRNdjhsbnZSZDg1ZDV0?=
 =?utf-8?B?Nys4ckVsSndRUXU0eFlGcURHVFcvSzc5cjRlTXg3VkRFaWNGQzgvMnZReEFE?=
 =?utf-8?B?dGdzV2J6TGwyUEw2bXk5VFhvTXVHTmpobmRWNHlicmo5NjAyMTJqZUtOamJT?=
 =?utf-8?B?Tmg1ZHVWS2diZ3lSQWphclZzTmsvYWVJQmFSNFZiQlRZNUxWRFRSMFZHMU1E?=
 =?utf-8?Q?p6Xw1K1b1ZnoCJCiWr3DBZAa4YbWV0Xjtg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E46E064B1C1EA94996166D85C4DD1138@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3790
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffef9d2e-5b5e-4465-1cdb-08d8c11d5ee4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	umUOIrFy8qpwiIope4dVWVGWtdNns9/aCsbUyNu4kGr+q/Uwo3Io7hwTz0RHvZlbGo9VIF+WfGEMGnuadWPjPWDMvqDrxUrNoS+tEt/WUOAas5O6fgZ8A6E459qYiTtnghPJ7poc6g+8TctCQe9mjlkXhmQNpWFB+wsLDFfFwi/gM/3hGemtGwvJX1GddfFE/vizDcqsnCH6OlnKn35tjtxrj3AxiotybmQt6mzJYxCaOzQn7XCEqNVN0sGilRNYp9iYRmjZPKVgYJL5Yg3nj05BNp8XxcIYUHaE7EOrOJnheO5V/iTbWrd4nYIEmHReZyP3HHeQJcqOeN0HmBjFVO2ZUeBYpajAdKodDRVWr9g9sa9UBwbgxpI0xfcLK9HEwy3vcrfcJL5NdItA4J1QuvO5Bje7Th0jk02qoeARkb4+FY4Lw9mLiiGLFvb4bpNOFWiXi4LgQWGOjLblfmrdvxaURNyXzsmapqTJfgySAP9w7MT4CyOqYjVJPJK0pwqy6ViXM5sFkJVJ0vp+pc88CSZhwf3XkGntazCbcykOCvAkmr7BqcuXJK957yRR4JdU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(82740400003)(6512007)(86362001)(6486002)(966005)(83380400001)(356005)(316002)(70586007)(33656002)(6862004)(4326008)(336012)(36756003)(55236004)(47076005)(82310400003)(478600001)(6506007)(26005)(5660300002)(186003)(2906002)(8676002)(8936002)(54906003)(2616005)(81166007)(70206006)(53546011)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 10:38:47.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d261ca75-0a94-49a3-cdd0-08d8c11d6599
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6183

SGkgU3RlZmFubywNCg0KPiBPbiAyMyBKYW4gMjAyMSwgYXQgMDI6MTksIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBBIHJlY2VudCB0aHJl
YWQgWzFdIGhhcyBleHBvc2VkIGEgY291cGxlIG9mIGlzc3VlcyB3aXRoIG91ciBjdXJyZW50IHdh
eQ0KPiBvZiBoYW5kbGluZyBFWFBFUlQuDQo+IA0KPiAxKSBJdCBpcyBub3Qgb2J2aW91cyB0aGF0
ICJDb25maWd1cmUgc3RhbmRhcmQgWGVuIGZlYXR1cmVzIChleHBlcnQNCj4gdXNlcnMpIiBpcyBh
Y3R1YWxseSB0aGUgZmFtb3VzIEVYUEVSVCB3ZSBrZWVwIHRhbGtpbmcgYWJvdXQgb24geGVuLWRl
dmVsDQo+IA0KPiAyKSBJdCBpcyBub3Qgb2J2aW91cyB3aGVuIHdlIG5lZWQgdG8gZW5hYmxlIEVY
UEVSVCB0byBnZXQgYSBzcGVjaWZpYw0KPiBmZWF0dXJlDQo+IA0KPiBJbiBwYXJ0aWN1bGFyIGlm
IHlvdSB3YW50IHRvIGVuYWJsZSBBQ1BJIHN1cHBvcnQgc28gdGhhdCB5b3UgY2FuIGJvb3QNCj4g
WGVuIG9uIGFuIEFDUEkgcGxhdGZvcm0sIHlvdSBoYXZlIHRvIGVuYWJsZSBFWFBFUlQgZmlyc3Qu
IEJ1dCBzZWFyY2hpbmcNCj4gdGhyb3VnaCB0aGUga2NvbmZpZyBtZW51IGl0IGlzIHJlYWxseSBu
b3QgY2xlYXIgKHR5cGUgJy8nIGFuZCAiQUNQSSIpOg0KPiBub3RoaW5nIGluIHRoZSBkZXNjcmlw
dGlvbiB0ZWxscyB5b3UgdGhhdCB5b3UgbmVlZCB0byBlbmFibGUgRVhQRVJUIHRvDQo+IGdldCB0
aGUgb3B0aW9uLg0KPiANCj4gU28gdGhpcyBwYXRjaCBtYWtlcyB0aGluZ3MgZWFzaWVyIGJ5IGRv
aW5nIHR3byB0aGluZ3M6DQo+IA0KPiAtIGludHJvZHVjZSBhIG5ldyBrY29uZmlnIG9wdGlvbiBV
TlNVUFBPUlRFRCB3aGljaCBpcyBjbGVhcmx5IHRvIGVuYWJsZQ0KPiAgVU5TVVBQT1JURUQgZmVh
dHVyZXMgYXMgZGVmaW5lZCBieSBTVVBQT1JULm1kDQoNClRoYXTigJlzIGEgZ3JlYXQgY2hhbmdl
IHdoaWNoIHdpbGwgaW1wcm92ZSB1c2VyIGV4cGVyaWVuY2UuDQoNCj4gDQo+IC0gY2hhbmdlIEVY
UEVSVCBvcHRpb25zIHRvIFVOU1VQUE9SVEVEIHdoZXJlIGl0IG1ha2VzIHNlbnNlOiBrZWVwDQo+
ICBkZXBlbmRpbmcgb24gRVhQRVJUIGZvciBmZWF0dXJlcyBtYWRlIGZvciBleHBlcnRzDQo+IA0K
PiAtIHRhZyB1bnN1cHBvcnRlZCBmZWF0dXJlcyBieSBhZGRpbmcgKFVOU1VQUE9SVEVEKSB0byB0
aGUgb25lLWxpbmUNCj4gIGRlc2NyaXB0aW9uDQo+IA0KDQpTaG91bGRu4oCZdCB3ZSBhZGQgIChF
WFBFUlQpIGZvciBleHBlcnQgb3B0aW9ucyBpbiB0aGUgc2FtZSB3YXkgZm9yIGNvaGVyZW5jeSA/
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiAtIGNsYXJpZnkgdGhlIEVYUEVSVCBvbmUtbGluZSBk
ZXNjcmlwdGlvbg0KPiANCj4gWzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE2
MDMzMzEwMTIyODk4MQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20NCj4gQ0M6IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbQ0KPiBDQzogaXdqQHhlbnByb2pl
Y3Qub3JnDQo+IENDOiBqYmV1bGljaEBzdXNlLmNvbQ0KPiBDQzoganVsaWVuQHhlbi5vcmcNCj4g
Q0M6IHdsQHhlbi5vcmcNCj4gQ0M6IEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbQ0KPiANCj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54
LmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gaW1wcm92ZSBVTlNVUFBPUlRFRCB0
ZXh0IGRlc2NyaXB0aW9uDQo+IC0gYXZvaWQgY2hhbmdpbmcgWEVOX1NIU1RLIGFuZCBFRklfU0VU
X1ZJUlRVQUxfQUREUkVTU19NQVANCj4gLSB1cGRhdGUgSFZNX0ZFUCB0byBiZSBVTlNVUFBPUlRF
RA0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBpbnRyb2R1Y2UgVU5TVVBQT1JURUQNCj4gLSBk
b24ndCBzd2l0Y2ggYWxsIEVYUEVSVCBvcHRpb25zIHRvIFVOU1VQUE9SVEVEDQo+IA0KPiBTZWUg
YXMgcmVmZXJlbmNlIHRoZSB2MiB0aHJlYWQgaGVyZToNCj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9
eGVuLWRldmVsJm09MTYwNTY2MDY2MDEzNzIzDQo+IC0tLQ0KPiB4ZW4vS2NvbmZpZyAgICAgICAg
ICAgICAgfCAgOSArKysrKysrKy0NCj4geGVuL2FyY2gvYXJtL0tjb25maWcgICAgIHwgMTAgKysr
KystLS0tLQ0KPiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgfCAgNiArKystLS0NCj4geGVuL2Nv
bW1vbi9LY29uZmlnICAgICAgIHwgIDIgKy0NCj4geGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnIHwg
IDYgKysrLS0tDQo+IDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcgYi94ZW4vS2NvbmZpZw0KPiBp
bmRleCAzNGMzMThiZmEyLi40YTNkOTg4MzUzIDEwMDY0NA0KPiAtLS0gYS94ZW4vS2NvbmZpZw0K
PiArKysgYi94ZW4vS2NvbmZpZw0KPiBAQCAtMzQsOCArMzQsMTUgQEAgY29uZmlnIERFRkNPTkZJ
R19MSVNUDQo+IAlvcHRpb24gZGVmY29uZmlnX2xpc3QNCj4gCWRlZmF1bHQgQVJDSF9ERUZDT05G
SUcNCj4gDQo+ICtjb25maWcgVU5TVVBQT1JURUQNCj4gKwlib29sICJDb25maWd1cmUgVU5TVVBQ
T1JURUQgZmVhdHVyZXMiDQo+ICsJaGVscA0KPiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIGNlcnRh
aW4gdW5zdXBwb3J0ZWQgWGVuIG9wdGlvbnMgdG8gYmUgY2hhbmdlZCwNCj4gKwkgIHdoaWNoIGlu
Y2x1ZGVzIG5vbi1zZWN1cml0eS1zdXBwb3J0ZWQsIGV4cGVyaW1lbnRhbCwgYW5kIHRlY2gNCj4g
KwkgIHByZXZpZXcgZmVhdHVyZXMgYXMgZGVmaW5lZCBieSBTVVBQT1JULm1kLg0KPiArDQo+IGNv
bmZpZyBFWFBFUlQNCj4gLQlib29sICJDb25maWd1cmUgc3RhbmRhcmQgWGVuIGZlYXR1cmVzIChl
eHBlcnQgdXNlcnMpIg0KPiArCWJvb2wgIkNvbmZpZ3VyZSBFWFBFUlQgZmVhdHVyZXMiDQo+IAlo
ZWxwDQo+IAkgIFRoaXMgb3B0aW9uIGFsbG93cyBjZXJ0YWluIGJhc2UgWGVuIG9wdGlvbnMgYW5k
IHNldHRpbmdzDQo+IAkgIHRvIGJlIGRpc2FibGVkIG9yIHR3ZWFrZWQuIFRoaXMgaXMgZm9yIHNw
ZWNpYWxpemVkIGVudmlyb25tZW50cw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25m
aWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiBpbmRleCBjM2ViMTNlYTczLi5jY2E3NjA0MGU1
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiArKysgYi94ZW4vYXJjaC9h
cm0vS2NvbmZpZw0KPiBAQCAtMzIsNyArMzIsNyBAQCBtZW51ICJBcmNoaXRlY3R1cmUgRmVhdHVy
ZXMiDQo+IHNvdXJjZSAiYXJjaC9LY29uZmlnIg0KPiANCj4gY29uZmlnIEFDUEkNCj4gLQlib29s
ICJBQ1BJIChBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRlcmZhY2UpIFN1cHBv
cnQiIGlmIEVYUEVSVA0KPiArCWJvb2wgIkFDUEkgKEFkdmFuY2VkIENvbmZpZ3VyYXRpb24gYW5k
IFBvd2VyIEludGVyZmFjZSkgU3VwcG9ydCAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0K
PiAJZGVwZW5kcyBvbiBBUk1fNjQNCj4gCS0tLWhlbHAtLS0NCj4gDQo+IEBAIC00OSw3ICs0OSw3
IEBAIGNvbmZpZyBHSUNWMw0KPiAJICBJZiB1bnN1cmUsIHNheSBZDQo+IA0KPiBjb25maWcgSEFT
X0lUUw0KPiAtICAgICAgICBib29sICJHSUN2MyBJVFMgTVNJIGNvbnRyb2xsZXIgc3VwcG9ydCIg
aWYgRVhQRVJUDQo+ICsgICAgICAgIGJvb2wgIkdJQ3YzIElUUyBNU0kgY29udHJvbGxlciBzdXBw
b3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+ICAgICAgICAgZGVwZW5kcyBvbiBH
SUNWMyAmJiAhTkVXX1ZHSUMNCj4gDQo+IGNvbmZpZyBIVk0NCj4gQEAgLTc3LDcgKzc3LDcgQEAg
Y29uZmlnIFNCU0FfVlVBUlRfQ09OU09MRQ0KPiAJICBTQlNBIEdlbmVyaWMgVUFSVCBpbXBsZW1l
bnRzIGEgc3Vic2V0IG9mIEFSTSBQTDAxMSBVQVJULg0KPiANCj4gY29uZmlnIEFSTV9TU0JEDQo+
IC0JYm9vbCAiU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzIERpc2FibGUiIGlmIEVYUEVSVA0KPiAr
CWJvb2wgIlNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyBEaXNhYmxlIChVTlNVUFBPUlRFRCkiIGlm
IFVOU1VQUE9SVEVEDQo+IAlkZXBlbmRzIG9uIEhBU19BTFRFUk5BVElWRQ0KPiAJZGVmYXVsdCB5
DQo+IAloZWxwDQo+IEBAIC04Nyw3ICs4Nyw3IEBAIGNvbmZpZyBBUk1fU1NCRA0KPiAJICBJZiB1
bnN1cmUsIHNheSBZLg0KPiANCj4gY29uZmlnIEhBUkRFTl9CUkFOQ0hfUFJFRElDVE9SDQo+IC0J
Ym9vbCAiSGFyZGVuIHRoZSBicmFuY2ggcHJlZGljdG9yIGFnYWluc3QgYWxpYXNpbmcgYXR0YWNr
cyIgaWYgRVhQRVJUDQo+ICsJYm9vbCAiSGFyZGVuIHRoZSBicmFuY2ggcHJlZGljdG9yIGFnYWlu
c3QgYWxpYXNpbmcgYXR0YWNrcyAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAJZGVm
YXVsdCB5DQo+IAloZWxwDQo+IAkgIFNwZWN1bGF0aW9uIGF0dGFja3MgYWdhaW5zdCBzb21lIGhp
Z2gtcGVyZm9ybWFuY2UgcHJvY2Vzc29ycyByZWx5IG9uDQo+IEBAIC0xMDQsNyArMTA0LDcgQEAg
Y29uZmlnIEhBUkRFTl9CUkFOQ0hfUFJFRElDVE9SDQo+IAkgIElmIHVuc3VyZSwgc2F5IFkuDQo+
IA0KPiBjb25maWcgVEVFDQo+IC0JYm9vbCAiRW5hYmxlIFRFRSBtZWRpYXRvcnMgc3VwcG9ydCIg
aWYgRVhQRVJUDQo+ICsJYm9vbCAiRW5hYmxlIFRFRSBtZWRpYXRvcnMgc3VwcG9ydCAoVU5TVVBQ
T1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAJZGVmYXVsdCBuDQo+IAloZWxwDQo+IAkgIFRoaXMg
b3B0aW9uIGVuYWJsZXMgZ2VuZXJpYyBURUUgbWVkaWF0b3JzIHN1cHBvcnQuIEl0IGFsbG93cyBn
dWVzdHMNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2
L0tjb25maWcNCj4gaW5kZXggNzhmMzUxZjk0Yi4uMzAyMzM0ZDNlNCAxMDA2NDQNCj4gLS0tIGEv
eGVuL2FyY2gveDg2L0tjb25maWcNCj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4gQEAg
LTE0Nyw3ICsxNDcsNyBAQCBjb25maWcgQklHTUVNDQo+IAkgIElmIHVuc3VyZSwgc2F5IE4uDQo+
IA0KPiBjb25maWcgSFZNX0ZFUA0KPiAtCWJvb2wgIkhWTSBGb3JjZWQgRW11bGF0aW9uIFByZWZp
eCBzdXBwb3J0IiBpZiBFWFBFUlQNCj4gKwlib29sICJIVk0gRm9yY2VkIEVtdWxhdGlvbiBQcmVm
aXggc3VwcG9ydCAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBPUlRFRA0KPiAJZGVmYXVsdCBERUJV
Rw0KPiAJZGVwZW5kcyBvbiBIVk0NCj4gCS0tLWhlbHAtLS0NCj4gQEAgLTE2Niw3ICsxNjYsNyBA
QCBjb25maWcgSFZNX0ZFUA0KPiAJICBJZiB1bnN1cmUsIHNheSBOLg0KPiANCj4gY29uZmlnIFRC
T09UDQo+IC0JYm9vbCAiWGVuIHRib290IHN1cHBvcnQiIGlmIEVYUEVSVA0KPiArCWJvb2wgIlhl
biB0Ym9vdCBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+IAlkZWZhdWx0
IHkgaWYgIVBWX1NISU1fRVhDTFVTSVZFDQo+IAlzZWxlY3QgQ1JZUFRPDQo+IAktLS1oZWxwLS0t
DQo+IEBAIC0yNTIsNyArMjUyLDcgQEAgY29uZmlnIEhZUEVSVl9HVUVTVA0KPiBlbmRpZg0KPiAN
Cj4gY29uZmlnIE1FTV9TSEFSSU5HDQo+IC0JYm9vbCAiWGVuIG1lbW9yeSBzaGFyaW5nIHN1cHBv
cnQiIGlmIEVYUEVSVA0KPiArCWJvb2wgIlhlbiBtZW1vcnkgc2hhcmluZyBzdXBwb3J0IChVTlNV
UFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+IAlkZXBlbmRzIG9uIEhWTQ0KPiANCj4gZW5kbWVu
dQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmln
DQo+IGluZGV4IGI1YzkxYTE2NjQuLjM5NDUxZTgzNTAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21t
b24vS2NvbmZpZw0KPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gQEAgLTI3Miw3ICsyNzIs
NyBAQCBjb25maWcgTEFURV9IV0RPTQ0KPiAJICBJZiB1bnN1cmUsIHNheSBOLg0KPiANCj4gY29u
ZmlnIEFSR08NCj4gLQlib29sICJBcmdvOiBoeXBlcnZpc29yLW1lZGlhdGVkIGludGVyZG9tYWlu
IGNvbW11bmljYXRpb24iIGlmIEVYUEVSVA0KPiArCWJvb2wgIkFyZ286IGh5cGVydmlzb3ItbWVk
aWF0ZWQgaW50ZXJkb21haW4gY29tbXVuaWNhdGlvbiAoVU5TVVBQT1JURUQpIiBpZiBVTlNVUFBP
UlRFRA0KPiAJLS0taGVscC0tLQ0KPiAJICBFbmFibGVzIGEgaHlwZXJjYWxsIGZvciBkb21haW5z
IHRvIGFzayB0aGUgaHlwZXJ2aXNvciB0byBwZXJmb3JtDQo+IAkgIGRhdGEgdHJhbnNmZXIgb2Yg
bWVzc2FnZXMgYmV0d2VlbiBkb21haW5zLg0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZC9LY29uZmlnIGIveGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnDQo+IGluZGV4IDYxMjMxYWFjYWEu
Ljk0YzllMjAxMzkgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvS2NvbmZpZw0KPiAr
KysgYi94ZW4vY29tbW9uL3NjaGVkL0tjb25maWcNCj4gQEAgLTE1LDcgKzE1LDcgQEAgY29uZmln
IFNDSEVEX0NSRURJVDINCj4gCSAgb3B0aW1pemVkIGZvciBsb3dlciBsYXRlbmN5IGFuZCBoaWdo
ZXIgVk0gZGVuc2l0eS4NCj4gDQo+IGNvbmZpZyBTQ0hFRF9SVERTDQo+IC0JYm9vbCAiUlREUyBz
Y2hlZHVsZXIgc3VwcG9ydCAoRVhQRVJJTUVOVEFMKSINCj4gKwlib29sICJSVERTIHNjaGVkdWxl
ciBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+IAlkZWZhdWx0IHkNCj4g
CS0tLWhlbHAtLS0NCj4gCSAgVGhlIFJURFMgc2NoZWR1bGVyIGlzIGEgc29mdCBhbmQgZmlybSBy
ZWFsLXRpbWUgc2NoZWR1bGVyIGZvcg0KPiBAQCAtMjMsMTQgKzIzLDE0IEBAIGNvbmZpZyBTQ0hF
RF9SVERTDQo+IAkgIGluIHRoZSBjbG91ZCwgYW5kIGdlbmVyYWwgbG93LWxhdGVuY3kgd29ya2xv
YWRzLg0KPiANCj4gY29uZmlnIFNDSEVEX0FSSU5DNjUzDQo+IC0JYm9vbCAiQVJJTkM2NTMgc2No
ZWR1bGVyIHN1cHBvcnQgKEVYUEVSSU1FTlRBTCkiDQo+ICsJYm9vbCAiQVJJTkM2NTMgc2NoZWR1
bGVyIHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gCWRlZmF1bHQgREVC
VUcNCj4gCS0tLWhlbHAtLS0NCj4gCSAgVGhlIEFSSU5DNjUzIHNjaGVkdWxlciBpcyBhIGhhcmQg
cmVhbC10aW1lIHNjaGVkdWxlciBmb3Igc2luZ2xlDQo+IAkgIGNvcmVzLCB0YXJnZXRlZCBmb3Ig
YXZpb25pY3MsIGRyb25lcywgYW5kIG1lZGljYWwgZGV2aWNlcy4NCj4gDQo+IGNvbmZpZyBTQ0hF
RF9OVUxMDQo+IC0JYm9vbCAiTnVsbCBzY2hlZHVsZXIgc3VwcG9ydCAoRVhQRVJJTUVOVEFMKSIN
Cj4gKwlib29sICJOdWxsIHNjaGVkdWxlciBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQ
UE9SVEVEDQo+IAlkZWZhdWx0IHkNCj4gCS0tLWhlbHAtLS0NCj4gCSAgVGhlIG51bGwgc2NoZWR1
bGVyIGlzIGEgc3RhdGljLCB6ZXJvIG92ZXJoZWFkIHNjaGVkdWxlciwNCj4gLS0gDQo+IDIuMTcu
MQ0KPiANCg0K

