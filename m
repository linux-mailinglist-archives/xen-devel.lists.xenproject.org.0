Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA973BD7E0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151335.279692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lH7-0002tQ-Sc; Tue, 06 Jul 2021 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151335.279692; Tue, 06 Jul 2021 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lH7-0002rV-Oo; Tue, 06 Jul 2021 13:38:09 +0000
Received: by outflank-mailman (input) for mailman id 151335;
 Tue, 06 Jul 2021 13:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0lH5-0002rP-SY
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:38:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a31b604-187d-4ddd-aedc-891fc8eb7a9c;
 Tue, 06 Jul 2021 13:38:06 +0000 (UTC)
Received: from AM6P192CA0069.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::46)
 by VI1PR08MB4205.eurprd08.prod.outlook.com (2603:10a6:803:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 13:38:03 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::30) by AM6P192CA0069.outlook.office365.com
 (2603:10a6:209:82::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 13:38:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 13:38:02 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Tue, 06 Jul 2021 13:38:02 +0000
Received: from b07ebfc363ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D51EEE1D-976F-4A2A-83AF-B5F43B0361FB.1; 
 Tue, 06 Jul 2021 13:37:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b07ebfc363ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 13:37:33 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6720.eurprd08.prod.outlook.com (2603:10a6:102:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 13:37:23 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 13:37:23 +0000
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
X-Inumbo-ID: 6a31b604-187d-4ddd-aedc-891fc8eb7a9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByzAYF9Hgbj+GfgAXiW0e6h+IPSJGdCZi+t1r6SSpH4=;
 b=rM39+7GUghlcQaS9igZC7kHFUTlruFvWzMk8UuufrFqQ5IwEBCAqQY+kwGxwxysCpQl5OyXNq63gqWePOTmDBi32wgE0z15P7+haYSZpz3jvYK31hzySPXHwWzy9WZCCYltIUb9Oqzu0oKLctbNi47OyQ0kWsQDomTp5umdCEYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 353a7205e2d00aa4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNH64i51YcLuJgW1kZWiWsOg5CtynDupEnKf54VJsJLWwEfi9IoXl+HS+LjnYEf0WYG00EPROFBKiHGjRLQLAAc+hVU5sevzMR1UknKhl94KGIAcSpCfnaUE4HGFWyFk1dOLG+LKzd9LjH4xI5LcAUt+8kbBgDDkrHQrScaBbl+XVY2tg9x+Ncim8dEGo0myo6K7/dk6WpZujFGmvMmEwSQVyiqQn3X/2iqDy/ULM3pK0i0lm+08iFqG6w2nb/XuzSt/Z0XFcerRIvwvfKgiS3Siy6MhU4S2NC9JKBoz2yDuhRQDvNO79OnKEMHhkgnYkd4iZKqo4pOXCqziSaDYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByzAYF9Hgbj+GfgAXiW0e6h+IPSJGdCZi+t1r6SSpH4=;
 b=KrTcZFaGCAtF4cs67uF90LlxJI69C1TgT8vFyRznFlyBpSVuo3Tp3do+OxdWTbQLRshR9M8MlBGhoK6hwN6lU0F1GXXl9fuPu+ugau8Kyy3tQRbH9/OIYV5oFFnc+AUPt5/tvHTL/jMFzQY5P2VWtn3zI0w/ljoO5A9VkgyBqB6gP0yL5cBgBbhpytj79m3w0ckM7m+Nw2TQ1IcTQgB58l5MxjONUwlIyOk9Ec43AJpBwmx9xmKLq4jnSTycNLPOa8CgkmKtimKqfXSnr9esoGFtv6spc813nWglmsgrng10ghsfxtl4c4QTGp6GlwT/uEU3edEZLwj2Su/R/RPT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByzAYF9Hgbj+GfgAXiW0e6h+IPSJGdCZi+t1r6SSpH4=;
 b=rM39+7GUghlcQaS9igZC7kHFUTlruFvWzMk8UuufrFqQ5IwEBCAqQY+kwGxwxysCpQl5OyXNq63gqWePOTmDBi32wgE0z15P7+haYSZpz3jvYK31hzySPXHwWzy9WZCCYltIUb9Oqzu0oKLctbNi47OyQ0kWsQDomTp5umdCEYI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Michal Orzel <Michal.Orzel@arm.com>, "olaf@aepfle.de"
	<olaf@aepfle.de>
Subject: Re: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
Thread-Topic: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
Thread-Index: AQHXcmnBkkOFPux/UUWwb2d+hr5YRqs180IA
Date: Tue, 6 Jul 2021 13:37:23 +0000
Message-ID: <C830D549-EA52-4E06-B0F9-B3B1E8DDEAFC@arm.com>
References: <20210706132000.29892-1-julien@xen.org>
In-Reply-To: <20210706132000.29892-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a9169192-964a-4f78-faaa-08d940834734
x-ms-traffictypediagnostic: PAXPR08MB6720:|VI1PR08MB4205:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4205F4049C28A7A0630452C59D1B9@VI1PR08MB4205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hdz+o8IJSwzbY223AY0C+qQyzY1WWCZFOqM/Gd/kkBe7NA359nmFuoaMd5fR/DmRJiyVyn4ZtwSLuXhzQBZnlS/Ry0hVKqsxQgkNF+nIkub5Kc6ElSKylYrUu8kUDvkJBkn+rfNkVHrw1POLwyUuvb11rZ+GVR0EPmBx9y3CYgS81EsFiVGywrl7kDN1d8oeeDeYSt62KNodf7qODRmo8L8MwHvd0X02gSlFRxQ1ShY2q+QZQSamtu0n/Uw/JJo18yPz8eY0yIBDCsjaXEpUk/incO0Hjqxxc3fUax+Dn1LYYlJpgNO6RZd5K5h5iELLdhMzS2PDmki2FTSsOTaS4mmUiTjv+ByaRxFVLldB1Xl70pTzHNGpfzvWS/kOGsuIb82x78f7dYWsckYGOL4SHjNlq66dVJ2binic0HDgvY0co8dTT+d5RHqs0axeNMNwP25LmmXCXV+Hl7Pv943uyjaettZDW3Jwkz2O0Z8zB4+fpRkl/+NQuQLWEwAnuuR3M1iq0eXKv1+qdTx/5g5GVQk9I9yA1tGphOe2YZ9QS+S4nFKw1C/DRTt1B6gKqt7Qbw2eT11xlCbM5wYGtiEHoNBjoi9kPF75zGXTNzOlTPOiJ4shifhI2IhW/DpyEUys9XizMu7JHsFf6hKg8OjM/yC7akCf2evD5BR7vp4fIaeXZ1xsN1Fe0sJETsMf8BdKxmi1xoxTOWHefs6H+S8ezA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(66946007)(4326008)(8936002)(66446008)(5660300002)(76116006)(83380400001)(54906003)(316002)(33656002)(6512007)(15650500001)(66476007)(2906002)(91956017)(478600001)(6916009)(66556008)(186003)(64756008)(8676002)(38100700002)(6506007)(36756003)(53546011)(26005)(122000001)(71200400001)(6486002)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CElxRES/VQez+JIkKXfaafOP/xcGRrpAEgc5sTdUUFfsST/yQ4l/qZS7wlxV?=
 =?us-ascii?Q?pYKsEMFT49JfHv+shEG2C/QGV4xnRDHB4ivc44AKFDZbPLkNMRcLmU7TaQN6?=
 =?us-ascii?Q?6/PT4W7wILV6VZrgoMPH7ti0zKXlpmoJNE1WgMbu2KSoJKEgjkFf4u2u10rN?=
 =?us-ascii?Q?piMyHmmRv+l6yNsuDCCJPFIegI2a0JwGUfs5ZtV4jPBmYxeZAY1OtpdENdTw?=
 =?us-ascii?Q?I7xQ2JOBx31VAFnmycdzEInjohh+oPoH3xW2cW5D813sP5T/YJLfdw1/0ALP?=
 =?us-ascii?Q?Me9Fm14I5t/vgNIIqMvNNmQXUMcgqPDGPUoQ/iLVzkWHiukkURLTu63+BpC0?=
 =?us-ascii?Q?X8HzwUQTAbhmsnAk8GZJ91juEtZIv9gPhDYSDcTSTQdk/ofb7vCNuiU9avAY?=
 =?us-ascii?Q?kNKxwdQAnoASfNSNLslJ6NPHxxPfyMyVp7G+LCIPVPLIjJ/UlsA2OZWLfXtg?=
 =?us-ascii?Q?HkqXGdm4iWUuhsgcynIIXJRZi7zlBI+pLDO5LtWZijMXb057YnROlWrmHXE8?=
 =?us-ascii?Q?dJtsJ3NN8gmHV9DlAE1bmZwBp98MRRZLxrZQYA7AxfSXeThpcaChIu3lIT9i?=
 =?us-ascii?Q?01wromflKNgG0Mo0WkJs2EMT2C9q6OAcAbw2fU/Ja4aTXIZdelFuEMZsW6FB?=
 =?us-ascii?Q?YNQLopn4xDf/shknOYXUnF0gfL9/+TU7s3J3EvUYcfPkL/rkhuhTtBaoO1SO?=
 =?us-ascii?Q?YhyiX8J1cwc7B0/83Ue+YItaz8SR+xnwcRiHabKf6tZEg3EfyfMahVmuQqEf?=
 =?us-ascii?Q?lRS30G6NBpjPUr9uUKrAIZ2+bpHMfdjKZ08AohhQRbwf7MJaGNHFChHkFxcz?=
 =?us-ascii?Q?w0j0vS73BmaR8iAJGasn+HOWHxmEj+pdip6FxVrccm6K5JMhU+kx0scqCSOi?=
 =?us-ascii?Q?oxa3GYU1dB/0Hdxf290A9DTcx+gUOXqc51LByFaDv0vYP0Go/d69BEKaB2kr?=
 =?us-ascii?Q?zd76zoyWg3NVQF7/0tQFy2p8ktPyfSJpd3Yt8jD6W8eQSHCHA9XlDn7Otg5W?=
 =?us-ascii?Q?URk2NoWSm8ZxLi9zs6TWQ1yAkGtTP6stIfG40X8pxIcxk23F4UzdYl4gxF+f?=
 =?us-ascii?Q?KIc1uGR7C++GuLRVVwTb7HMPMEHFrVxS25aWh6nVFEZdxvK9gXk/rvp4aKrJ?=
 =?us-ascii?Q?z/2QZiVs2VAlV+64MeXQBJATxDuvxGkTKeOlCklFYASxdt6Cy1TWaxp3lCoG?=
 =?us-ascii?Q?p22DArNcBng9zAs9gscIWi76wXdXATmcX+f6VTqUA9QT89mGCHwXAP5wE+xu?=
 =?us-ascii?Q?0xy/JrCCvn1c3x188WXYKlAcSQU6B64IogOJ4phErEuF5qo74xC3NFwCE0mY?=
 =?us-ascii?Q?LNx+8vo76cwgTPUxKYfjmA7E?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85BC69CE5F04144FB728481695A32E3A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6720
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	823dedeb-4531-474c-b5af-08d940832fe6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7gxcJvujqCvOrgG32N/dmc79psZC3U+5tlHeM6eu66Sf55xnYSi9PIrOtISKEhLCrTGVOS4W7TMMU2fOf93R/Sc/ZDUkngHNEGGY5pc7HYZ74m6kfh3tkMEQmimhpzzswGFkxte5iAOjFmgobkESz63jKHQkA5/14XxbZmLmE9SF4hBMd2a1mBDyw38K3lZlbOttYF0ly1wvOkASv0FE2n1ezwJYIOgnZjYMhMh0amHqxtQtDJd0Yd6GkbddpWRebCl+kmo84irPx3XbmjJeX6/SdfuuU85+sy5H1gQfzWnJ6Au8Ipu2QODK1sgF2aQJNK42GRcr6ROKhjy4nMyc6LUWl3IVLb3tneK8A2hyDsjHJXwE0htCjPW5wmzT0WWojJuCUYFVVUHHzsW7QCwcNpUZP2fXhhz2zblxLv+LXNpQgEHuNUgTAWxAmFLwZPzVGbJD6eS/cyvucl/zz9h2JMjluBUmUJPxqRTTuZF7I5It9jbr9AGWhbqVePMvopvc8HXOPD9O1XlcL9AThNeBe48J0rYZZ8oebsWK/PTafZ2I7D0YN02mTzLaGR33ePAB2EDW+EF5OGYzpFS2gLt4YyLVAG2M/+VE5L15areLmgUubBkhNdF48XoMPZDLfSLhg9IjwC/kyzD5kiLH/EPU63EadBGGblvmeeAZHTS9G+4pR2mm0cWJ1lAxDcRIop8CN6GaaMfRHFyXkJcRqZZPaA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(4326008)(53546011)(86362001)(81166007)(83380400001)(6506007)(316002)(82310400003)(36860700001)(33656002)(54906003)(336012)(356005)(82740400003)(47076005)(15650500001)(6486002)(2906002)(26005)(478600001)(2616005)(36756003)(70206006)(8676002)(6862004)(70586007)(107886003)(5660300002)(186003)(6512007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:38:02.8034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9169192-964a-4f78-faaa-08d940834734
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4205

Hi Julien,

> On 6 Jul 2021, at 14:20, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
> uint64_t") updated the size of the structure vcpu_guest_core_regs and
> indirectly vcpu_guest_context.
>=20
> On Arm, the two structures are only accessible to the tools and the
> hypervisor (and therefore stable). However, they are still checked
> by the scripts in tools/include/xen-foreign are not able to understand
> that.
>=20
> Ideally we should rework the scripts so we don't have to update
> the size for non-stable structure. But I don't have limited time
> to spend on the issue. So chose the simple solution and update
> the size accordingly.
>=20
> Note that we need to keep vcpu_guest_core_regs around because
> the structure is used by vcpu_guest_context and therefore the
> scripts expects the generated header to contain it.
>=20
> Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64=
_t")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

But I have other issues now:
xg_dom_arm.c:143:15: error: format '%x' expects argument of type 'unsigned =
int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} [-W=
error=3Dformat=3D]
  143 |     DOMPRINTF("Initial state CPSR %#"PRIx32" PC %#"PRIx32,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
  144 |            ctxt->user_regs.cpsr, ctxt->user_regs.pc32);
      |            ~~~~~~~~~~~~~~~~~~~~
      |                           |
      |                           uint64_t {aka long long unsigned int}

We will work on a patch to fix those.

Cheers
Bertrand

>=20
> ---
>=20
> Cc: michal.orzel@arm.com
> Cc: olaf@aepfle.de
> ---
> tools/include/xen-foreign/reference.size | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen=
-foreign/reference.size
> index a0409db5c458..11a06a7a432c 100644
> --- a/tools/include/xen-foreign/reference.size
> +++ b/tools/include/xen-foreign/reference.size
> @@ -4,8 +4,8 @@ structs                   |   arm32   arm64  x86_32  x86_=
64
> start_info                |       -       -    1112    1168
> trap_info                 |       -       -       8      16
> cpu_user_regs             |       -       -      68     200
> -vcpu_guest_core_regs      |     304     304       -       -
> -vcpu_guest_context        |     344     344    2800    5168
> +vcpu_guest_core_regs      |     312     312       -       -
> +vcpu_guest_context        |     352     352    2800    5168
> arch_vcpu_info            |       0       0      24      16
> vcpu_time_info            |      32      32      32      32
> vcpu_info                 |      48      48      64      64
> --=20
> 2.17.1
>=20
>=20


