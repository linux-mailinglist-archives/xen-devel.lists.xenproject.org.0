Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539966A145
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 18:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477513.740249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGOI3-0000bP-0I; Fri, 13 Jan 2023 17:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477513.740249; Fri, 13 Jan 2023 17:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGOI2-0000Yl-Ti; Fri, 13 Jan 2023 17:56:30 +0000
Received: by outflank-mailman (input) for mailman id 477513;
 Fri, 13 Jan 2023 17:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGOI1-0000Yf-MM
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 17:56:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060.outbound.protection.outlook.com [40.107.241.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3372fb-936b-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 18:56:27 +0100 (CET)
Received: from FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::15)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 17:56:25 +0000
Received: from VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::eb) by FR0P281CA0129.outlook.office365.com
 (2603:10a6:d10:97::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 17:56:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT046.mail.protection.outlook.com (100.127.144.113) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 17:56:24 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Fri, 13 Jan 2023 17:56:23 +0000
Received: from 25bd8c2327b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D158C65D-991A-46B8-96ED-7E9DFBD759AE.1; 
 Fri, 13 Jan 2023 17:56:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 25bd8c2327b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 17:56:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8312.eurprd08.prod.outlook.com (2603:10a6:20b:557::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 17:56:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 17:56:14 +0000
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
X-Inumbo-ID: 9a3372fb-936b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ftqnv430xgPDOb82cDspMu86/q6iSrZZG8X7J02lw+A=;
 b=G97E0oKf89gyXSz7C0ZfVbji1lZRXPdPhkJ/33Ga9Kge3HQAEB5nGnr+t82VU1ddcgaAtj/Cx840V+cLKibYD8nNq95qQxb+aO9XgNPvesUXsIVCSMc8fBnWbjiVR8mqFZKFN3tBGFhkJCOj5H7DQxSm43rCZO07CrrB5QW9Uak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aafe227caa084974
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1e9qv/HAx6E3gthVqM7mIDVgHowF6r/mzPEAYcmu2EEt0YjVpIvJX7xPTs3DIBvCQXwLXFEelvoHvmgySyosM9qQJFQ220CT07FAF0Vf4W3fzVp02rjfNHtuGjjE0tD6mdEo8Qb9knFVch15c4UES6ICEaPvCBfqCqUVaFzy7a9RIcfJ78goZMQ/9CeI1juH5bu2icoD87+qHg1fI8nuiBpViL6GdwjmZlhRGlo5JRnJmq8KsAIHBr9Ln+g91Sml9aScN18yGiWVi//VatdcLu3zMBiHiPK+9NGivsjIX1bS/XncR4WIt0GDPRM02iIS84p9XoSawjErze4Nk3EUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ftqnv430xgPDOb82cDspMu86/q6iSrZZG8X7J02lw+A=;
 b=c0zl0yPcmpcvtJaL4MuNEk3a8YT/IQ07yKukPfmyA+8679sT6J5ouqucUTnIRx+GMgGBOCpqIRT5kfT40K61WZPNOQs/LXhBua410lEpkUWwYm9YyZjE4/pXQtU/X//XODKFyphzwOC832h43hasNejYBQH6NYkc8YFi9yI/fXzODUdQn/jeZHp47VaZkqzDL/QgaPXllOeTmTpToRTEptZSJNuwoIQH14MKQoBi66owwWvO51Sw9R/Apx/1R/MCRPm0893fQtknaGA0sFU1q1gkt2IUcJLcuXW72cTQgoz9fCuawbYLkrPIyvvjORUjmmUIyaXdKsG81pjLZle3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ftqnv430xgPDOb82cDspMu86/q6iSrZZG8X7J02lw+A=;
 b=G97E0oKf89gyXSz7C0ZfVbji1lZRXPdPhkJ/33Ga9Kge3HQAEB5nGnr+t82VU1ddcgaAtj/Cx840V+cLKibYD8nNq95qQxb+aO9XgNPvesUXsIVCSMc8fBnWbjiVR8mqFZKFN3tBGFhkJCOj5H7DQxSm43rCZO07CrrB5QW9Uak=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
Thread-Topic: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
Thread-Index: AQHZJzd3IAQCrI1EqUyCJy1AVoViEq6coiuA
Date: Fri, 13 Jan 2023 17:56:14 +0000
Message-ID: <C8CAEAFE-50FB-4DBB-8EDC-8AB87920EB06@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-3-julien@xen.org>
In-Reply-To: <20230113101136.479-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8312:EE_|VI1EUR03FT046:EE_|AS4PR08MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 36861094-4ad7-40d2-c52d-08daf58f7c6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RIyZDSpTRtzIqmjg2tQu4TIWSLwSHFn1HojZn2lcozqlHJ8JBq3VrKY+rAwoLE4ti3DSH6/+QZQHWI9aO2R+71QmgCaWhFRw8JNdIuhjLpWoEv5bD813wVMqGwiCzEn4QmEeQnuDowtAhFHm8tWgowT8j3k82Nq3fMAhsJGQz1prUYT/56CSzEL9+f3q6xLiTtbhSB/ZLOugLI1C63CtL2YPUo5/9BqNi9lDLy4sRVXJlF2EvyWnEOorsSCWUqvjx0rAflmFxhp0LWq1fW+Ode3gSp+H5kCxRliniZh1esHjA9K3PIZkhvkqtoIyd/eswkbDwKYsazRErKuM8EdnQRJ4MpA5s54GIcY63UOK3vv5/SXwlux//Nss0d92Ua7+m/WRHXVlPMMsgoxFdqwjoW4yqKlAvahKqNtJzMBhcqNVe8SoI4/T6+eFtXGK5vlksPK3sgW3FB7Pefswoc+EGuAln2VWJciwvt5vVBkrG/BktETZNAOidytI7hD44V7HzQs1SCUtGpgVgAh2+lZT+BSTFibdKe7s0sLNbsCbKk/AEcNfLUBS4w2iA2FCwH5BkcdLXOzWhnO9MBM6WS6RSLPV6tzHqjpM0U7u5EjMrmQsLAuvJ6UvzEauArLfg6OLsmnUlrZQgyzbYHNOOdcbWmovDDs/WVaR2rSFAQGf4zVW/ndrZqa/DEGt0kLAAAUuNYjFIMaGt2grcjCm3LXUrfOqZhOpxPnGFY162WTOGDw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(8936002)(76116006)(91956017)(66556008)(41300700001)(66476007)(8676002)(66946007)(4326008)(6916009)(66446008)(64756008)(38070700005)(54906003)(6506007)(2906002)(53546011)(316002)(2616005)(36756003)(4744005)(5660300002)(33656002)(71200400001)(86362001)(6486002)(478600001)(186003)(26005)(6512007)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED224D10F910A54E94D4FE340F015308@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cea8d3d-2ee7-4ede-be62-08daf58f76b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBhTdXuuu+07M8qJuSYKixQ8znrKrNpsgd6OYL7DcU5b4UHKIciKEZa7P+iLwyPGzYF/QjeIR5kjNKS18/6zWTckfTHPaOztArYXznrVZPEhOeQYLb3KaT0U+rbBM3oNZGcD6yDJ/pvIwNkLTrDLFzaKopwIJ2IAFpNZ/aBcIyUsqPyJhVuKXNJcL7lw8sZSakChwvDxTPDK5RcC/OCT+Zh+jOn3DVzbsX1VT0Vuf1VdKWLqyc22394B4HlXihiCBYeO+EC6yQNwxkKsLO6P8gyAlm50/fqqADO7jcZkNAYMjHbSGi6DmA20JrqY7ih6UuEwsq/VuDV/rrQvxZOwYJ7Kd296UU6rAic8aP9tCJOJUyKLHkpyqQSHPlJCielSpupwgZHcnIS3CltdCCiqwVSX1rXw1pDeXd6ZLfC9m1XQ6gMFd2ZK+uvVUWfS1IbwtLR0kxuVAW1Yk6K3otMyjzFJAHr8Hl46cmI+JB9DFZn11c+vBCbs6lbK9MfyCwRl/9PpkEK2bhUbIVju3v15+8ba5P8comC85cffMeyi4OGI3yxCKTTAzoO+gpDvVJGV5l+qkR6RJ33nUvGoQ0dvNirtwtECWsOnHQQbZ/jwU0d9ZdXJiookbMTfdUXpbw67Q3K9WKTQP5eMHnYfb6hyB+S4zXJDA4uFN04+kinS0RqoKqdr/j1v4qX+GHtC+yn0xFi6AX1yJWQss+P9ndgQNA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(82310400005)(81166007)(356005)(316002)(40480700001)(33656002)(40460700003)(2616005)(54906003)(8676002)(47076005)(336012)(186003)(26005)(478600001)(6506007)(53546011)(6512007)(6486002)(36860700001)(70206006)(82740400003)(36756003)(70586007)(41300700001)(4326008)(8936002)(4744005)(2906002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 17:56:24.2081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36861094-4ad7-40d2-c52d-08daf58f7c6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904



> On 13 Jan 2023, at 10:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Looking at the Neoverse N1 errata document, it is not clear to me
> why the TLBI repeat workaround is not applied for TLB flush by VA.
>=20
> The TBL flush by VA helpers are used in flush_xen_tlb_range_va_local()
> and flush_xen_tlb_range_va(). So if the range size if a fixed size smalle=
r

NIT: is a fixed size



