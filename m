Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C440321598
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88007.165332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9rX-0002dG-UB; Mon, 22 Feb 2021 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88007.165332; Mon, 22 Feb 2021 11:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9rX-0002ct-Qv; Mon, 22 Feb 2021 11:58:51 +0000
Received: by outflank-mailman (input) for mailman id 88007;
 Mon, 22 Feb 2021 11:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ieRt=HY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lE9rW-0002co-El
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:58:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef804066-a81a-4f0e-80d3-870d6f1d9f50;
 Mon, 22 Feb 2021 11:58:48 +0000 (UTC)
Received: from AM6P194CA0062.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::39)
 by HE1PR0802MB2281.eurprd08.prod.outlook.com (2603:10a6:3:c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Mon, 22 Feb
 2021 11:58:42 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::29) by AM6P194CA0062.outlook.office365.com
 (2603:10a6:209:84::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 11:58:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 11:58:41 +0000
Received: ("Tessian outbound 46f6cf9da5e8:v71");
 Mon, 22 Feb 2021 11:58:41 +0000
Received: from a20266b377a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EE379F5-91BF-4013-8F49-FA06ED5BB9D8.1; 
 Mon, 22 Feb 2021 11:58:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a20266b377a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Feb 2021 11:58:35 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Mon, 22 Feb
 2021 11:58:33 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 11:58:33 +0000
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
X-Inumbo-ID: ef804066-a81a-4f0e-80d3-870d6f1d9f50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fndaDEo2QfTLg4yPXyoHD4mZ+VaKn/RmwZSeipwhK1s=;
 b=WrjBfAnjlzTfNEjR0Q/c2HeQ6qeUaPC6gp2yvFBEdiInfVYoUkmyK5Ur2cbNECv2qB+YNkimhCcbUa4tUykAna7akfflNooP0tlA9a3eG3G/GL7gwlR/7vG7iq4Ekm2cV4BuQ0VSDtgr9QHRyBrlbiCa6Ql5ApsqIf8B/XB0yR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b49ad20a5b3c66e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiWdzOV+D25//tT7MYET4UeC2GMmb4Fbt8XzQZ7rHo+ACkamheuZUaeQXeX/jD23GjS+Ivnke6xW06W46a8L1d3yg3o8q/R6m77OiapQXQbMCpyp4/Tjk+m2lONVF4pE9igkCx++JPDrUNbREWDkJF3SqWZKo9HNyGW8KCTpop5TQcAwyKSK1gtJn7JcBtGYSMaxuxxe9PbQLLjbCxBqoqJ1MnwVwMkSOW8ZsAsSKcSa335hMCvkhln9jazxM4Ik7IVoWlblZLXdH7pUqEj6doi+8Z9pvwi9s3PrLqNLb22dZnjXEQdaSE4T8HiyvqsBAhfpEQrxNdC9r8ePL5XkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fndaDEo2QfTLg4yPXyoHD4mZ+VaKn/RmwZSeipwhK1s=;
 b=croSNUEhmbz/nUv9FiTBNTQ6apJGbDpq0gGrYdIjGA5SMwOjrRnRg1HTgpHLwSNF1lOkF5ycXrEjA6hWH5dWgbC1ITyRIBxv3GogYEMdBOuZ1u1ubhptSs2zKIqpWnhlSVnpNAvMbF16xI0NbiI8CjrmOfPiDRg3Oc1iDtrLhKBxy+VJXMJqeqVytw11GOqQUystOzL+SuKZ5TcDRwTxJs/vN5AgQx7bzlkyXEH2RmsiMcIJ/s8dUcUV7QmDCdlMs3ThjwWSYG2DUC+GtAqsUif31zVkPpUhr8mn2aFfzxtB+nxuYAON72iW029KklglIVvEIzz463wttkDvccnhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fndaDEo2QfTLg4yPXyoHD4mZ+VaKn/RmwZSeipwhK1s=;
 b=WrjBfAnjlzTfNEjR0Q/c2HeQ6qeUaPC6gp2yvFBEdiInfVYoUkmyK5Ur2cbNECv2qB+YNkimhCcbUa4tUykAna7akfflNooP0tlA9a3eG3G/GL7gwlR/7vG7iq4Ekm2cV4BuQ0VSDtgr9QHRyBrlbiCa6Ql5ApsqIf8B/XB0yR4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
Thread-Topic: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
Thread-Index: AQHXB7GCcUtPYwKMVk+6z4A6IyPFF6pkFLEA
Date: Mon, 22 Feb 2021 11:58:33 +0000
Message-ID: <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com>
References: <20210220175413.14640-1-julien@xen.org>
In-Reply-To: <20210220175413.14640-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d7d4aa5-d91d-41c8-0e8e-08d8d729329e
x-ms-traffictypediagnostic: VI1PR08MB5422:|HE1PR0802MB2281:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB22813561F340F84D675389F59D819@HE1PR0802MB2281.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QkVGwGOZymRlL7fmA7f8kpGGuThkD9iw9V/umDZK10XhnNDLQxisp3+STAHfJpxdHT8gzH7qEwqJyEIS6Cy+Y5pq4FXSe0QGO0j5a6zXcDpbchtg/LnUyyG/dxBTGKhMMJ0gy3yVl9/55mqwUIbx0tXE3UHoKFm31JftbfvqMXvyclghZuIkY5EIhL6v0iOBIqyeEG8uWg7LhZgdqiOO7h62aVj2dRX5SbzcGpMuGUk5bSlfCWPyAIPAYfNxiEmTkj8bqGIh0FCICQl+N7qRZjow2oTSwGPWolQ6GCg/k9qnRxOlwPAke9jwi0+i3TVtLLQOcJ7IH5nI8FsJqR2yzqf+dGvhXkG0mF14T4QSPooGXN6xVM2CxG1vJf9bWdaI54aMpsRgiz6FxGC6LYGlWZdaz1K1WdNYpWC7+4WUy3XBMWu5VsXiqXy42ezzfUXmmN8qxSC8fQ6Pbt5mm8S0/rv7kGyKuG4muSa9Z365OPDlbDikLNwA3xw/uXvWZdu2OJjXFr0xUtWcbHuW0E4+/+CX0zG+Sbazrns+nfp3p0sJSFmAWbwbPs8OlCxQfxihhhwjEwRDsdr4lHXf4X/bhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(6916009)(83380400001)(26005)(36756003)(6486002)(71200400001)(53546011)(6506007)(6512007)(55236004)(2906002)(186003)(8676002)(54906003)(33656002)(86362001)(4326008)(66446008)(91956017)(5660300002)(76116006)(478600001)(316002)(8936002)(2616005)(66476007)(64756008)(66946007)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?0k2KizVrFufdKc9poOF4e9d4xvfRuV1Un+0yqzq4nga0aamsKPrSeBx/VrPr?=
 =?us-ascii?Q?x7WTO0/4omtKU/bLL1D1b8HFuG5IsENNr+TNBNswkpZCpR40h2s3pHzmnjsb?=
 =?us-ascii?Q?j/X4yUil50qS2Hec0H5sJDXO5Q304NFh+7flGlY2+jI7NzRr68Yx6OMh/PsI?=
 =?us-ascii?Q?1ZocBOzNR5PbjkKfQIOSZ5v0buwO8LWU8n4fxBgrbkEnMGwQpiyge5M60cho?=
 =?us-ascii?Q?RGSvIyebJom6iJ6OND4eeuA/6VvH3ASPTuzE49nQxH6jI+ydF6LRfroCjplc?=
 =?us-ascii?Q?lkeZDNudTlwz7rododGXNpXvETrKpnkX9zyvD6syFwLgrMKhqhqd9CMKlRHJ?=
 =?us-ascii?Q?YOxUieGsmjp9yi4C77FeDuy8uxVpwvUx3uJLEh1lNFIQ9sPujRGIVjm63h2c?=
 =?us-ascii?Q?u3a82+okdpT49G74bV1K9Rl7d3U9RgsiQuh6ibw8Ky1CT5cCjE6VPI3T0aRg?=
 =?us-ascii?Q?8iweD9Fajj6pq58Vl+UOsCG21vLkcCCuqM1nDa89U2DmbSeyiqalYhYgYpUK?=
 =?us-ascii?Q?iyub04LMDgImSCLRPt1PCdiY+UUNBZUMBsKJsU5yX4ae8kciMqTV+b+qVZR/?=
 =?us-ascii?Q?OPfiXAD9ryQa/2aLJD4JiLrG9Ax0TmKFqCIgTph4MIifBvodMj1Fe7tdAL7w?=
 =?us-ascii?Q?S51B/pVpNxHVIXGbPKFz1ssp8NogayLYdTCl9JdblsIkN82Qxgyc9mL+rA0v?=
 =?us-ascii?Q?Cp4DeLjJKvfpB+YP3tzfh0WFTIXGGDHgOyKOQvOwlXYB5XvMt/9O1NoER68c?=
 =?us-ascii?Q?RAz5rVxdDRZzMNKdxsGTOAIpdIKw1Sfq0pjSxBsLO7+HiqYAX3YoGG4VBknI?=
 =?us-ascii?Q?0ZOR+WxNqwsvnREAWN2kJbQizA9K19etpdmquVOvFViJ1VnWHwIHci0unmN2?=
 =?us-ascii?Q?0nx6PzEPtc0em2pl9zNya/I+ocJ2NshHaBy9QoKUkwv+GUgFzNPazuZnU2XU?=
 =?us-ascii?Q?vt1kgzTaIVSjAUxk/R5foPMZjXZly7Dliqw6fiH9BwlicfQwPtCKULhSf/P+?=
 =?us-ascii?Q?AeBzI1Ff22RI31ErEvgoHCK12jGNXUCcpHIuMNspM7DOEsKWxvew/AWl7IC7?=
 =?us-ascii?Q?a/1X3RZUKsv6frKhaFDSZXfKR5X+zpeWOH66Ff5A6z7rRwHlwbFwEr60q3ZD?=
 =?us-ascii?Q?i8msZFyxSR61WuOjhP7HG6r2ucERuoPn4Kj7OWYpvuMDfhIW1NWenJKT8rrA?=
 =?us-ascii?Q?UMHhixeCvISU87OQx3eISs10H5xM5NkPSjorfuf9JN3nYp/umyimB+eJTwa1?=
 =?us-ascii?Q?b8wtxVlfCh2PjdIYffVw/7jptJq9iwNcczp16dx0wdAORJ8VckbpIbbROR+/?=
 =?us-ascii?Q?Bh1yp+muMlJ4p9+QO/LHkwF7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7A93A220501F2542AB64B79A445C8A1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70104712-0f65-47db-c530-08d8d7292dd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOneqUhEpyoL3V97KUL51PSIQa0tn/NkQ/vfPhaRyOPS11Wsm7YQyVjXxwqsss/zQgQpNa/rvmZKynJd9q/Z+C62J9kc5RmqdPZf+yGChkzCdFmg2vUEJuS5i21khyiEqwddvusM+7XaCizTt2dtum5bWlQId4/1gIOriT9S2hwYGdjDhybjE8fVPTvghA281ft14DYrWQqZAJV65IsySWpXd0m13IVK3Gzmg9KMzKu/68m6KYUstCT+phosFvrgPVl8k03n46ZDQUdTSixIU/VNvGl4lZ4kFrxhvgrv1ddBtKCLB2l4PMHasdynH8g7gi6qrwY1f4ksfaOm8mn9nVFU5uHj7BUIWzd1A04qnHmhVOfz/RVhBmvxBmjjhqnxTGSKu/UgOW2cAYSDzo2iNFfvui5z0A2uBOuTPOxIsGDnvzObvJrsqmlDzEHM6zjIUffl32iD8DwHHGVlt6zuy6F5aX++XdXuU6oJfgUE8iPyuFk1dowd89YUQF3+pUAv43sjQcnfiYngMM1kjnQHdHVW0RC/2x+TIW9UasZ7BJ5Y4xjqOwQYLKk39eoCny1oYQqg1h6eXTl4uumzYdetp3UMHpnu1VuM3rJkFfrHqQ3JcwXcxEQSfaO3gA4QG1P5SkIheqiD9X8HkRt3uT1D4FWR3sWK5/eG6hjSNaIETpU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(6506007)(86362001)(26005)(82310400003)(54906003)(36860700001)(70586007)(5660300002)(83380400001)(70206006)(186003)(53546011)(82740400003)(336012)(107886003)(55236004)(356005)(81166007)(6862004)(36756003)(478600001)(4326008)(8676002)(6512007)(2906002)(2616005)(47076005)(8936002)(316002)(6486002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 11:58:41.4495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7d4aa5-d91d-41c8-0e8e-08d8d729329e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2281

Hi Julien,

> On 20 Feb 2021, at 17:54, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, flush_page_to_ram() is both cleaning and invalidate to
> PoC the page. However, the cache line can be speculated and pull in the
> cache right after as it is part of the direct map.

If we go further through this logic maybe all calls to
clean_and_invalidate_dcache_va_range could be transformed in a
clean_dcache_va_range.

>=20
> So it is pointless to try to invalidate the line in the data cache.
>=20

But what about processors which would not speculate ?

Do you expect any performance optimization here ?

If so it might be good to explain it as I am not quite sure I get it.

Cheers
Bertrand

> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> xen/arch/arm/mm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 59f8a3f15fd1..2f11d214e184 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -529,7 +529,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_i=
cache)
> {
>     void *v =3D map_domain_page(_mfn(mfn));
>=20
> -    clean_and_invalidate_dcache_va_range(v, PAGE_SIZE);
> +    clean_dcache_va_range(v, PAGE_SIZE);
>     unmap_domain_page(v);
>=20
>     /*
> --=20
> 2.17.1
>=20
>=20


