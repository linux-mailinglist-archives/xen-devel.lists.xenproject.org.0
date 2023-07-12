Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD4750939
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562501.879209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZZC-0002fz-Ro; Wed, 12 Jul 2023 13:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562501.879209; Wed, 12 Jul 2023 13:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZZC-0002d5-OH; Wed, 12 Jul 2023 13:07:38 +0000
Received: by outflank-mailman (input) for mailman id 562501;
 Wed, 12 Jul 2023 13:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3yk=C6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJZZB-0002cx-2J
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:07:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10fbce83-20b5-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 15:07:34 +0200 (CEST)
Received: from AS8PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:20b:313::33)
 by DBAPR08MB5720.eurprd08.prod.outlook.com (2603:10a6:10:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 13:07:32 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::7b) by AS8PR04CA0088.outlook.office365.com
 (2603:10a6:20b:313::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22 via Frontend
 Transport; Wed, 12 Jul 2023 13:07:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 13:07:31 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Wed, 12 Jul 2023 13:07:31 +0000
Received: from b5bca23b3591.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32EC7689-68E6-4C98-B521-9AF1EBB92D37.1; 
 Wed, 12 Jul 2023 13:07:25 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5bca23b3591.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 13:07:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB8917.eurprd08.prod.outlook.com (2603:10a6:102:329::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 13:07:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 13:07:21 +0000
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
X-Inumbo-ID: 10fbce83-20b5-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7sxzEnJBUbFyZE9Gnvw00wk87w+WC+5rGx61zkBmuM=;
 b=dyeQJk6qePFvE3BIBZ0E9EBaPjM6zTJkpuzazmvVV8sXtaRUR8UBfOjaavyD1BDvoALU9n9A3L5oO3zZrbnewWSm14vO2czSWL84vr3EtBuFNzIXgfW6b4k0IKD/5/ehGRVtarcaQyn5Mw/S6oX4EkEBqIbizwjxJQFZ6+es4jw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 279bde3e4e6c11ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH2W7rWtgM12E7MbkgabMhSFfkHQmVzCfRu09ba8sA4YE+IX6TyEt7bta1w8Yxp3wmw/zsvwlmZun3LjJj9b23cKv20m6XJloZrIAoL1YsArN3WUxG3YVNQKFw5KLOt1uni/mWZKwFtQP7BOSZFY4OsdkljI8L5CvU0fVk55eXHuD/dfnBFQmcPDVHehxjftpA8qIBz4vc5zESp9Fy4j2UHqtYa4op0TmxoItP0N8ytLRAMwVPecWUhV1UMwLIbkoR0OYu4syJPmZVFfU12k15QVWq+K7TLEhgawc8T1G/iHiNmxI1CPIFQ2Bz5ByuxjLD/j5XcRxTsJIc0FDoNKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7sxzEnJBUbFyZE9Gnvw00wk87w+WC+5rGx61zkBmuM=;
 b=E3Na+1iX8QGT147I8a38VuFdf0Hvt22hLkre62697yKydrN24xObOjkE+cE6nkXtIeIq+Z3FWtY3rp/uThvx/1s6OAj+79ItZ+roBSkHZjAL45kULXoeVJUPbkatQ9/T5HvLWDMvvlicYvHLzGjs2u1e+VrCcZYg2w9qDJg+B/Stzwr4V+lc5SYCkIQjG1gLOFWHWFF/MWR2ZCYYuHdGo2GXUnodCQfCjxOeNqP1WcuURqLwWZXojgQGGL1AlP049sw22qFalra9APq8HZDGbTefbqFkQVX9lvYjiM/5osJ8aKFD15Nonxrqi6bpUFJYu3vU5dh/troWmhYyHDLfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7sxzEnJBUbFyZE9Gnvw00wk87w+WC+5rGx61zkBmuM=;
 b=dyeQJk6qePFvE3BIBZ0E9EBaPjM6zTJkpuzazmvVV8sXtaRUR8UBfOjaavyD1BDvoALU9n9A3L5oO3zZrbnewWSm14vO2czSWL84vr3EtBuFNzIXgfW6b4k0IKD/5/ehGRVtarcaQyn5Mw/S6oX4EkEBqIbizwjxJQFZ6+es4jw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
Thread-Topic: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
Thread-Index: AQHZtLkqrH81SiNKb0iqu22X4/KYPK+2GV+AgAAAuIA=
Date: Wed, 12 Jul 2023 13:07:21 +0000
Message-ID: <AFE6AA84-4ADE-4496-896A-8843575C962E@arm.com>
References: <20230712120440.1815240-1-luca.fancellu@arm.com>
 <c139abd7-bd27-f8cf-b561-5c795bb663a7@amd.com>
In-Reply-To: <c139abd7-bd27-f8cf-b561-5c795bb663a7@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB8917:EE_|AM7EUR03FT052:EE_|DBAPR08MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe3b6ee-55ad-4917-29a2-08db82d8f3bb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +w+wdlZzSMZKX1oGV895T435b9aEX8r3Qgc6Uqjul2fp8To20wcf1dEa08DqwzVfM2AUA63xF8jf6pm/m5233cvAF/wM/WKLFGvFzut8N4DkwP43iIB+zHuovf2RwIknEIj+Vh/Os4RfjEd4jS+W710cMZSb3x0xZ1VJgCNJ0MKYNdGoJPB/4EgCg6KSEdQBwk+7gqDHrXJ0q7qVMdXtOTcMxuU+SJmB/gQ5iMt+JL8H2VuH8f9eIC8ZKuD9epSpEZAmDYuLWqbyDEKHUf3KBenkTvuJ+7iZ+IyzbXcSPQKkmkWxzxxzYrAP5TBnmfH9yIkvaCwk52il3RruNri1Tj89JoRy1jLZcJmNFMorp8h/JtmToBJ+zNWgGU9toR7KE9/WtCgECPQapz+0OgVSH+ouUMl8blvf9T0co0TKJh2bOHGiLYGglgXb1w138D7k7LTGO4DxF0FfD/7wPJrh5+K1kVY2VzKWoagZnE9BKy9pJJ0U6OljeUa+v3YWmikvSPQV66xRdRneLVaWc+i9k+gS7sfne9qU5cpBstTCKwoRMNPbnkhdQbzjnTxbdRPvHgjOyYkr8gGiRv+ICXT4ctX8MWI/3FmUN12519O0ABRlxoOCC59BDdy7b+GoN27gHQVAbGVPs4RIDlOR5e4eJA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(6486002)(478600001)(91956017)(71200400001)(54906003)(83380400001)(2616005)(33656002)(36756003)(86362001)(38070700005)(4744005)(2906002)(76116006)(26005)(186003)(53546011)(6512007)(6506007)(38100700002)(122000001)(66476007)(66446008)(64756008)(6916009)(4326008)(66556008)(316002)(41300700001)(8936002)(8676002)(66946007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD971BCAA7C42244ABB99D107B877107@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8917
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48baa0bd-e709-4503-7b95-08db82d8edb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qhbDvWtv9zPqnP212rV/1Nm5gKuTcbFwkQmOBypACZwNDF5q4cqlijF36yFoxXKGK+yd+L1xQnngq6XCC3+1DL2y290LbhvsELK7K1ZaUuY1n/WvrWu59u0GkIP6MuJW797JcBNtzr6EJzjAthO6h+bz4pmB/dKfv1dKp+UwaiZHRLGX/QEFw/59f/yj9AJ+yu+nrzo1+8M57CcqNFIy9LJY+1mRbpJbylrzjuqnySU+QiYiXI/8D+Fe2lE/VKOBYyfV8lJI9Nm9gqHNo4PWC1LuQmSzJIB7nnCndsB/sTjtofaw3iLcLrfZRylDf7CO3beCVoXmMAVeQUXzFz4tqeLfdmntZABSmmvncb5UAFMPBrcllJxX+H4/wfR5YdGQWxLB0mOCskBo3OJQgfImE/+N41YOsIIjLnWIYDDlXCQIZonH94Gpgw/WyQlkgKad0U56Df06fYCzX3siKQTRenGyfzh3vg9SBuPesxWNg427P2a8AknsMyKzt++Qwb6FWuUFxyxUldPhESn54XKgsmdETvpzo1831JU9Nd4TMtWX1ry1EpJdMdqBOLSLoJmI2ilpNOQSfG57TodwfYRBZGixfwHVILT/wsNZ3kAdwctlR2yo9ITkBi5JHI3g/dUC6YjkcjZETRquYshs1ReEgplrSyDux/RJNRMyU919+HqBLRbu9kK5gPAN2q73/7DlvTZrwpMdEkcr4BEnXM2uDwytm3csAapcprPPv6yHl92KhuQCGGyc7V+78MUJOu3A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(4326008)(70586007)(70206006)(316002)(4744005)(41300700001)(2906002)(8676002)(6862004)(8936002)(5660300002)(478600001)(54906003)(36860700001)(6486002)(40460700003)(6512007)(107886003)(40480700001)(26005)(53546011)(186003)(36756003)(83380400001)(336012)(6506007)(33656002)(47076005)(81166007)(356005)(82740400003)(82310400005)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:07:31.6108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe3b6ee-55ad-4917-29a2-08db82d8f3bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5720

DQoNCj4gT24gMTIgSnVsIDIwMjMsIGF0IDE0OjA0LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMi8wNy8yMDIzIDE0
OjA0LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEZpeCB0aGUgcmlnaHQgYm9y
ZGVyIG9mIHRoZSBzaWxpY29uLWVycmF0YS50eHQgdGFibGUNCj4+IA0KPj4gRml4ZXM6IDE4MTRh
NjI2ZmI1OCAoInhlbi9hcm06IFVwZGF0ZSBzaWxpY29uLWVycmF0YS50eHQgd2l0aCB0aGUgTmVv
dmVycyBBVCBlcnJhdHVtIikNCj4gRml4ZXMgdGFnIGlzIGZvciBidWdzIGFuZCB0aGlzIG9uZSBp
cyBjbGVhcmx5IG5vdC4NCj4gV2l0aCB0aGF0IHJlbW92ZWQ6DQo+IFJldmlld2VkLWJ5OiBNaWNo
YWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGFuayB5b3UsIHllYWggd2VsbCBJ
IGRpc2NvdmVyZWQgaXQgY2FuIGJlIHVzZWQgYWxzbyBvbiBiYWNrLXBvcnRzLCBzbyBJ4oCZdmUg
YWRkZWQgaXQsIGFueXdheQ0KSWYgbWFpbnRhaW5lciBhcmUgb2ssIGl0IGNhbiBiZSBhZGRyZXNz
ZWQgb24gY29tbWl0DQoNCj4gDQo+IH5NaWNoYWwNCj4gDQoNCg==

