Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2E5B3BB0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 17:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404459.646940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfko-0001PO-9g; Fri, 09 Sep 2022 15:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404459.646940; Fri, 09 Sep 2022 15:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfko-0001Mt-5P; Fri, 09 Sep 2022 15:17:14 +0000
Received: by outflank-mailman (input) for mailman id 404459;
 Fri, 09 Sep 2022 15:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWfkl-0001Mn-Vd
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 15:17:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 797492bc-3052-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 17:17:10 +0200 (CEST)
Received: from FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::16)
 by GVXPR08MB7799.eurprd08.prod.outlook.com (2603:10a6:150:3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 9 Sep
 2022 15:16:59 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::4e) by FR0P281CA0149.outlook.office365.com
 (2603:10a6:d10:96::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.6 via Frontend
 Transport; Fri, 9 Sep 2022 15:16:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 15:16:58 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 09 Sep 2022 15:16:58 +0000
Received: from 4a130cf63d38.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B50A033-6570-4C3A-B902-F14449C367B7.1; 
 Fri, 09 Sep 2022 15:16:51 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a130cf63d38.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 15:16:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7842.eurprd08.prod.outlook.com (2603:10a6:10:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 15:16:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 15:16:47 +0000
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
X-Inumbo-ID: 797492bc-3052-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a/+8TaFMSgaYX8+PkJ4+sSxRa0ZzcpZCCvJpX99jZ4D8YAJdd42yREHHEGJFEJ9QfIzo/JgKFmSzQNnmZAWwOYBgA0eONpXxWXhNyHZatGv8hdrw9qXd6wtrdjM3O1urqoLoBoZPsu0U0SpGTiHWsi9ftV3PwP2+e9ohrpMlrburawydfBc3JdWFrXfMOxOqdKLlPm8dm0dA3eoumPZJRGcDZndSstMMBQW7IdcZO5k024axE1q4/l8oOK/BNIX7XcrtIc97gtwCsnjEwYCNsDKUk7POL3eC6hi8ey4pOvombGIIhgLrF5wWt5C294NzS/KW/+DF0hIPgmo3CRjLUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAl+f5st5eun8xlveCvD5yisKbUcWG5fVqAhKmjBIxo=;
 b=RNtFdD7cpkww8jCrzFC67GkyOyv8imhMZIZnhgGCe7CnYjAMg9farq1CTp+TxSuq0/VLeTb+eO6MP5KGUhd2AcIyG5qQ4MW3OeLcNKy5v5APKVym7cTUFE9UQN2pmieT/s77s/MAb5pZTlBC1ipKpE5JsCSjPxIsHlElu6noPZZYwdRUItaJXK6CoUodXpQSwSHITDmnqNAAViuwroj82FwkQ6f6JVL8FVRyuWMm3G/pg1rAcF6zKc3Ptg+WT7c+wXMizoDEd8VrHXbMfJ1k7Zik+vlZD0w5ZTRCXLqxdKoNC2gVN7S1qg2T8ql5SlbJoEFPW65ZiCQKSvxpJYCo2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAl+f5st5eun8xlveCvD5yisKbUcWG5fVqAhKmjBIxo=;
 b=A/ldZvzo7SCbGtvw93LXzM0aijXXRxix6WKLGeKZ824FrO+1mwx03Bde7VfbeQce7yUyULA4swOXnZ8MklWxh35LSRf5jAiO1VfFxjFw+KIJyobrNRXk2hTbhtni0V3pYAxGXqew14MKrFhDu2DH4apb9vOxqa1oT9t/Ke8xiuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 845688f6fef5917d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4/HG59mo3c7gM011IIWn9nEC2G2r3qLY53q8fi6MjcXWzPSBHLAfkMfFiY0Niuw//qInbmZCsGF5KcsBwdHrfC6WRK2dX9GdA/PjfkmDr8iUSu5GRB7hNd2JTGQj3er6WbB+FbIbd6pR4MWLEXDHJORL0SUTZa+Qo/HzLH8psT9eQYa2QKOKNK/l3VI82/URVoLNSkb0k8+sNQSwHjxZ4IizQSDSfw8Q6GREj1Tjap35pu3lfkW23PH2jkwmMB+1Ei53Rc1rfbMuGleyr+wFpXNwN/eLKoTvdN6EBGaYWLxWFYwoxkVQ8LxPx5AYvjsgZ9QJwDRvPX2UC8OcxCMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAl+f5st5eun8xlveCvD5yisKbUcWG5fVqAhKmjBIxo=;
 b=df74GvBV1a2BBPUNo/kWtQVc2IXpKWZcIUNpffORde+xXKo0WVifLsvUEIXk9hycgrfhYK5yOi5DubNKVM9jduYO6hG6IllcWfY889iIUYlngIJoJh5hKjT8UOPpwTjEjBGaOHY4Y5sjVoclc7HO0AxaCG0QRB8BWyn3XS1+hSjfnDuQtUvCwfMMPrQvavIloOD3Q+2S9xSbbgIzhOgYjFt6n2N8wN1l2RNU7nmNBugUkpMs4ZmHO9Gbzg41VZB9/+tpIR8J1rGO/kbpEmzY+c9lmmP4CASxbjXjHSEAH8fzLjQ82St/5dFk5jiD8X/byN8GNfDeEWZIp5lm7wt7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAl+f5st5eun8xlveCvD5yisKbUcWG5fVqAhKmjBIxo=;
 b=A/ldZvzo7SCbGtvw93LXzM0aijXXRxix6WKLGeKZ824FrO+1mwx03Bde7VfbeQce7yUyULA4swOXnZ8MklWxh35LSRf5jAiO1VfFxjFw+KIJyobrNRXk2hTbhtni0V3pYAxGXqew14MKrFhDu2DH4apb9vOxqa1oT9t/Ke8xiuY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] build: correct cppcheck-misra make rule
Thread-Topic: [PATCH] build: correct cppcheck-misra make rule
Thread-Index: AQHYxFHaJwlnNsxgQECM5kPu4Ki3xq3XHaOAgAAJ7oCAAA4kAA==
Date: Fri, 9 Sep 2022 15:16:47 +0000
Message-ID: <0EA88427-788A-4B67-88F9-B96FB8BBFEF6@arm.com>
References: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
 <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>
 <d56764e8-05ae-b097-fcfc-eb178ec71b51@suse.com>
In-Reply-To: <d56764e8-05ae-b097-fcfc-eb178ec71b51@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7842:EE_|VE1EUR03FT008:EE_|GVXPR08MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c122c1-3aad-4724-614a-08da927656c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T/JpkbbJhlcWDwgvl3yxnwZG34Ls3PXCJ3DBRUzdwQDJbCaIZ4cCP+QtyVU7wQDBJmZmjcX0MjCjVPiiI1Y7ZD6bqkirDZUYmMrxfZRFA/e+jp2mKvNRdNDpMwU+RW5DFOe7OQsxiShbopX4MKsNvzjImYSVHj9qrMrAYhutREwW9PyN2DWSx/wscb0ktio418GB18yZj/YdWc342MGXjYYrGkwBeBdvvzJwmk3Oyti+c2ykxYKD2TjiFrDpUvf68jG+o4KOL10CQ51Afo0iZZcujq37H9aBwlmJgV4/6qvAOK0BbjaQ47LroXO8QulPHN5zcvhQeX6E9W1DpwSdfIR5IJfh5ZrQFCgrVkbHrU3oVzlKq60ttEA0mv3W5kMYDqrVw0W3WehFptvvhdU4kgiYFFTkWDFJcay56QbswUKtc96Cp31DnZmW8Cbh6pEW6f9Lzfe/Khzn9AdiIFCMWJ4rk+lfLcj/I1dXiLS3igU6a4FjpVbhWv3jgvbi/jHvG3cu6nat0KXZpoRKLDLnxCDpay2vy0aFjYyOmQBGua3nX1tND9aYMoi/IfyAa8xbbzvhjw2XXpDe5cFhfzEJny6oZZA1FySIFNnCZVBlsvi4E2jmgL5bqeQcX6gAVbhk4bswEd0Ag5WSEXp6ghoTqsyIMevOuEDHlqUuFfNDFnIOv6B9VZ3jQy2dNpAkcw/yG1ey+p2n61O2gnUev0knDJRmxLbPd7Wv9bIg+k0aPf9xG5teFy9Xt3+hb7vv08n5PZ9h8G3OUuglzB7ft2WgWyuJrY/V1G7yazaW5s4+Vfc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(64756008)(4326008)(66556008)(66476007)(66446008)(8676002)(86362001)(54906003)(76116006)(91956017)(38070700005)(6916009)(66946007)(53546011)(83380400001)(6506007)(316002)(41300700001)(26005)(6512007)(2616005)(186003)(71200400001)(6486002)(122000001)(38100700002)(5660300002)(8936002)(2906002)(33656002)(36756003)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <88EF1E857FEEFB4AA2763924F3C123D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7842
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0de1796-e674-4ef1-4488-08da92764fea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jMYIR4qAWw1WE5uMxX6Nzjr2NwyRj9cm5hc/7mXa+kAEJysh4Gilk0h3YMhyJ9uRxIHjYGSJjr3d0HA2L2ZPH9MoRtm0+0iTOH6cF3hHH+wxpoBlVX4sVBSWzfNbohH4xsCd+1lQQrgLQfSsxZInICsxKWXU7DAIWHW4pEzY/bgxSiOSPeGZTqCyXMGB2/WN3esSvuB/p5VqczlTkxrimzGlEE/6woq/c2RsMwyy+VduZkn+QYuOC6Sf4OKdZqSpCy+WF90ekSrC/eDJ319d+yrtUUjr7z/AJG0eJKRIa2u0X4VWrfGJNDus5JJY9lTD9NvxQaHVtqC5w3d/xusS3heSdv3FrvCaM/nZ3BZy01IxhbIDxcIwDCYpd4t6SsWtLsOt1fvoCC2S2ivyX+0sx8WDUfPgcj9QXIojlcWMBNXdqMJPdsWQDAlKb5fj8+Rjf4rtwk/LewkmWDexGLsPU58lB40eqMT8JyRilEhOh67GzihViIkBRPdkH7QUjpM84wo4Wrj36ObdjLDGMoZ3+4boJYFqPRs53/AFrWNDk999WoUm7irCBPcoyh7tsW7SygOHweNKxa7n51mywmDGJJIZSS718f/fRL7gbMznjoxQq+PDgskzbJEZDogYriOuc/5OK8RrQ9ZMPLI1GSbszkQBzd+kYrVfWvVMP0/8CQzchRNWntJ5Or9ep95xxPQG7/GwCErZhRNFmN8X1sjyB3KBvboHQvMTdZmilcXJwH0xjTSEQgd5wrNCX985wMyQbdFLpyht61BktsbToPIIAQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(40470700004)(36840700001)(26005)(6506007)(83380400001)(107886003)(6512007)(2616005)(186003)(336012)(86362001)(81166007)(47076005)(356005)(41300700001)(53546011)(82740400003)(36860700001)(36756003)(8676002)(40480700001)(40460700003)(70586007)(70206006)(2906002)(4326008)(478600001)(8936002)(5660300002)(6862004)(33656002)(316002)(54906003)(82310400005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 15:16:58.4497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c122c1-3aad-4724-614a-08da927656c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7799

SGkgSmFuLA0KDQo+IE9uIDkgU2VwIDIwMjIsIGF0IDE1OjI2LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDkuMjAyMiAxNTo1MCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+PiBPbiA5IFNlcCAyMDIyLCBhdCAxNDo0MSwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBJdCBoYXMgYmVlbiBib3RoZXJp
bmcgbWUgZm9yIGEgd2hpbGUgdGhhdCBJIG1hZGUgYSBiYWQgc3VnZ2VzdGlvbiBkdXJpbmcNCj4+
IA0KPj4gVGhpcyBpcyBub3QgYSBzZW50ZW5jZSBmb3IgYSBjb21taXQgbWVzc2FnZS4NCj4gDQo+
IEhvdyBlbHNlIHNob3VsZCBJIGV4cHJlc3MgdGhlIG1vdGl2YXRpb24gZm9yIHRoZSBjaGFuZ2U/
DQoNCkkgd291bGQgc2F5LCBzdGFydCB3aXRoIOKAnGNwcGNoZWNrLW1pc3JhLmpzb24gZGVwZW5k
IG9uIOKApuKAnSBhbmQgcmVtb3ZlIGV2ZXJ5dGhpbmcgYmVmb3JlLg0KDQpCZWluZyBib3RoZXJl
ZCBpcyBub3QgcmVhbGx5IHNvbWV0aGluZyBpbnRlcmVzdGluZyB0byByZWFkIGluIHRoZSBnaXQg
bG9nLg0KDQo+IA0KPj4+IHJldmlldzogSGF2aW5nIGNwcGNoZWNrLW1pc3JhLmpzb24gZGVwZW5k
IG9uIGNwcGNoZWNrLW1pc3JhLnR4dCBkb2VzIG5vdA0KPj4+IHByb3Blcmx5IGFkZHJlc3MgdGhl
IG11bHRpcGxlIHRhcmdldHMgcHJvYmxlbS4gSWYgY3BwY2hlY2stbWlzcmEuanNvbg0KPj4+IGlz
IGRlbGV0ZWQgZnJvbSB0aGUgYnVpbGQgdHJlZSBidXQgY3BwY2hlY2stbWlzcmEudHh0IGlzIHN0
aWxsIHRoZXJlLA0KPj4+IG5vdGhpbmcgd2lsbCByZS1nZW5lcmF0ZSBjcHBjaGVjay1taXNyYS5q
c29uLg0KPj4+IA0KPj4+IFdpdGggR05VIG1ha2UgNC4zIG9yIG5ld2VyIHdlIGNvdWxkIHVzZSB0
aGUgJjogZ3JvdXBlZCB0YXJnZXQgc2VwYXJhdG9yLA0KPj4+IGJ1dCBzaW5jZSB3ZSBzdXBwb3J0
IG9sZGVyIG1ha2UgYXMgd2VsbCB3ZSBuZWVkIHRvIHVzZSBzb21lIG90aGVyDQo+Pj4gbWVjaGFu
aXNtLiBDb252ZXJ0IHRoZSBydWxlIHRvIGEgcGF0dGVybiBvbmUgKHdpdGggImNwcGNoZWNrIg0K
Pj4+IGFyYml0cmFyaWx5IGNob3NlbiBhcyB0aGUgc3RlbSksIHRodXMgbWFraW5nIGtub3duIHRv
IG1ha2UgdGhhdCBib3RoDQo+Pj4gZmlsZXMgYXJlIGNyZWF0ZWQgYnkgYSBzaW5nbGUgY29tbWFu
ZCBpbnZvY2F0aW9uLiBTaW5jZSwgYXMgYSByZXN1bHQsDQo+Pj4gdGhlIEpTT04gZmlsZSBpcyBu
b3cgImludGVybWVkaWF0ZSIgZnJvbSBtYWtlJ3MgcGVyc3BlY3RpdmUsIHByZXZlbnQgaXQNCj4+
PiBiZWluZyBkZWxldGVkIGFnYWluIGJ5IG1ha2luZyBpdCBhIHByZXJlcSBvZiAuUFJFQ0lPVVMu
DQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPj4+IC0tLQ0KPj4+IEkndmUgbm90IGJlZW4gYWJsZSB0byBzcG90IHdoZXJlIC8gaG93IGNw
cGNoZWNrLW1pc3JhLnR4dCBpcyB1c2VkLiBJZg0KPj4+IGl0J3MgaW5kZWVkIHVudXNlZCwgYSBw
ZXJoYXBzIGJldHRlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjb252ZXJ0IHRoZQ0KPj4+IG9y
aWdpbmFsIHJ1bGUgdG8gc3BlY2lmeSBjcHBjaGVjay1taXNyYS5qc29uIGFzICh0aGUgb25seSkg
dGFyZ2V0LiBPbmUNCj4+PiBtaWdodCB0aGVuIGV2ZW4gY29uc2lkZXIgdXNpbmcgIi1vIC9kZXYv
bnVsbCIgaW5zdGVhZCBvZiBwcm9kdWNpbmcgYW4NCj4+PiB1bnVzZWQgKi50eHQgZmlsZS4NCj4+
IA0KPj4gVHh0IGZpbGUgaXMgdXNlZCBieSBjcHBjaGVjayB0byBnaXZlIGEgdGV4dCBkZXNjcmlw
dGlvbiBvZiB0aGUgcnVsZS4NCj4+IElmIHlvdSBsb29rIGluc2lkZSB0aGUganNvbiBjb250ZW50
IHlvdSB3aWxsIHNlZSBpdCBtZW50aW9uZWQuDQo+IA0KPiBPaCwgdGhhdCdzIHByb3Blcmx5IGhp
ZGRlbiB0aGVuLg0KDQpUaGlzIGlzIGhvdyBjcHBjaGVjayBuZWVkcyBpdCBhbmQgd2h5IEkgYWRk
ZWQgYSBjb21tZW50IGJ1dCBpdCBtaWdodCBuZWVkcyBpbXByb3ZpbmcuDQoNCj4gDQo+Pj4gLS0t
IGEveGVuL01ha2VmaWxlDQo+Pj4gKysrIGIveGVuL01ha2VmaWxlDQo+Pj4gQEAgLTc0NiwxMSAr
NzQ2LDkgQEAgY3BwY2hlY2stdmVyc2lvbjoNCj4+PiAjIGRvY3VtZW50YXRpb24gZmlsZS4gQWxz
byBnZW5lcmF0ZSBhIGpzb24gZmlsZSB3aXRoIHRoZSByaWdodCBhcmd1bWVudHMgZm9yDQo+Pj4g
IyBjcHBjaGVjayBpbiBqc29uIGZvcm1hdCBpbmNsdWRpbmcgdGhlIGxpc3Qgb2YgcnVsZXMgdG8g
aWdub3JlLg0KPj4+ICMNCj4+PiAtY3BwY2hlY2stbWlzcmEudHh0OiAkKFhFTl9ST09UKS9kb2Nz
L21pc3JhL3J1bGVzLnJzdCAkKHNyY3RyZWUpL3Rvb2xzL2NvbnZlcnRfbWlzcmFfZG9jLnB5DQo+
Pj4gLQkkKFEpJChQWVRIT04pICQoc3JjdHJlZSkvdG9vbHMvY29udmVydF9taXNyYV9kb2MucHkg
LWkgJDwgLW8gJEAgLWogJChAOi50eHQ9Lmpzb24pDQo+Pj4gLQ0KPj4+IC0jIGNvbnZlcnRfbWlz
cmFfZG9jIGlzIGdlbmVyYXRpbmcgYm90aCBmaWxlcy4NCj4+PiAtY3BwY2hlY2stbWlzcmEuanNv
bjogY3BwY2hlY2stbWlzcmEudHh0DQo+Pj4gKy5QUkVDSU9VUzogJS1taXNyYS5qc29uDQo+Pj4g
KyUtbWlzcmEudHh0ICUtbWlzcmEuanNvbjogJChYRU5fUk9PVCkvZG9jcy9taXNyYS9ydWxlcy5y
c3QgJChzcmN0cmVlKS90b29scy9jb252ZXJ0X21pc3JhX2RvYy5weQ0KPj4+ICsJJChRKSQoUFlU
SE9OKSAkKHNyY3RyZWUpL3Rvb2xzL2NvbnZlcnRfbWlzcmFfZG9jLnB5IC1pICQ8IC1vICQqLW1p
c3JhLnR4dCAtaiAkKi1taXNyYS5qc29uDQo+PiANCj4+IEFzIGZhciBhcyBJIGtub3csIHRoaXMg
aXMgbm90IHNheWluZyB0byBtYWtlIHRoYXQgYm90aCBmaWxlcyBhcmUgZ2VuZXJhdGVkIGJ5IHRo
aXMgcnVsZSwNCj4+IGJ1dCB0aGF0IHRoaXMgcnVsZSBjYW4gZ2VuZXJhdGUgYm90aCBmaWxlcyBz
byBub3RoaW5nIGlzIHRlbGxpbmcgbWFrZSBoZXJlIHRoYXQgY2FsbGluZw0KPj4gaXQgb25jZSBp
cyBlbm91Z2ggSSB0aGluay4NCj4gDQo+IEFzIHNhaWQgaW4gdGhlIGRlc2NyaXB0aW9uIC0gaXQg
c3BlY2lmaWNhbGx5IGhhcyB0aGlzIGVmZmVjdC4gV2UncmUNCj4gdXNpbmcgdGhpcyBlbHNld2hl
cmUgYWxyZWFkeSwgc2VlIGUuZy4gdG9vbHMvbGlicy9saWdodC9NYWtlZmlsZQ0KPiBnZW5lcmF0
aW5nIHRocmVlIGhlYWRlcnMgYW5kIGEgQyBmaWxlIGFsbCBpbiBvbmUgZ28uIElpcmMgdGhpcyBp
cw0KPiBhbHNvIGV4cGxpY2l0bHkgZGVzY3JpYmVkIGluIG1ha2UgZG9jdW1lbnRhdGlvbiAoYW5k
IGNvbnRyYXN0ZWQgdG8NCj4gdGhlIGRpZmZlcmVudCBiZWhhdmlvciBmb3Igbm9uLXBhdHRlcm4g
cnVsZXMpLg0KDQpUaGVuIEkgdGhpbmsgdGhlIGNvbW1lbnQgc3VnZ2VzdGVkIGJ5IEFudGhvbnkg
bWFrZXMgc2Vuc2UgdG8gYWRkLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

