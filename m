Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAE3BC79C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150865.278893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0g2M-0006L7-KK; Tue, 06 Jul 2021 08:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150865.278893; Tue, 06 Jul 2021 08:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0g2M-0006IZ-GS; Tue, 06 Jul 2021 08:02:34 +0000
Received: by outflank-mailman (input) for mailman id 150865;
 Tue, 06 Jul 2021 08:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0g2L-0006IR-BA
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:02:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8400b060-de30-11eb-847b-12813bfff9fa;
 Tue, 06 Jul 2021 08:02:32 +0000 (UTC)
Received: from AM6P191CA0095.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::36)
 by AM6PR08MB4055.eurprd08.prod.outlook.com (2603:10a6:20b:a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Tue, 6 Jul
 2021 08:02:30 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::e8) by AM6P191CA0095.outlook.office365.com
 (2603:10a6:209:8a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 08:02:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 08:02:29 +0000
Received: ("Tessian outbound f29a5a293366:v97");
 Tue, 06 Jul 2021 08:02:28 +0000
Received: from 3455239b2192.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 334597A6-542B-4D1F-B026-94FC12A65D1A.1; 
 Tue, 06 Jul 2021 08:02:20 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3455239b2192.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 08:02:20 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR2PR08MB4699.eurprd08.prod.outlook.com (2603:10a6:101:1d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 08:02:11 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 08:02:11 +0000
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
X-Inumbo-ID: 8400b060-de30-11eb-847b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4IPHvn9kjIt6F7L5Y8SBUlRlI4UF9iILmKnab6OO+4=;
 b=napqe8c1+6WCGChDYU3j03YA9xlhS0NGmmvBTX6WcmBrQ+RWRWQBUmMUgldRARGR1U8AUTtyoKjwLqZ5MdY+CKjy4SegD4o4hEfc8nFAWRU8fUX0JCd3S7iTKaTA/cVbGIFd+KmAsxtzNPFLhuB2DwLGfkz1CkA/DOhp2dk9ieU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dec84ba91a61399b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmH8YevJYbLHKMmAeCQwRs+HaFD+DaUUAWqeoqTaU36fB32zPqjxEHYo2rxH2H+NXCYHahBkV7LTfJCTznx19eYqab7Jue3pfabK+T0rO0oU17qErU7CjhoWZSkIffPXRU+u5iEdLi07YIUQS5saf6bGED5sBuoItu9eVDzaLjgCFwhKN86FyKunWnUPfxL0IfU3MFyq6N0u0dqYaZQN/tNiiWELO3wNOsUsxf+7ip3hKKvnaP3YRktcyamnNIX5N27lO+wZhXpf39bg13BUIUWPSdg9aYIZlUTozcctVPlI9ZrzrlG15ONuP59/Oc57h4+l16lujwLbVwc3hyPygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4IPHvn9kjIt6F7L5Y8SBUlRlI4UF9iILmKnab6OO+4=;
 b=X82a410yCcq4/Sj5LSu9WArrkpGxNAbtgviRcTszfXCR5pXw4GrSoq+arNrwBiGnRx/GDW3nowlpO8KWXx9DWTTZPL6GZUZiwFrvRNPTPMvWxSA5ofIcEsQgIYhIkrLoI4+WxWVZPqSxQ22P6leT9mzdy1PyByAVGnNvhHbeIovm2zmioMrZkLgQNtazYDfzQXJGK4+atfml4wAzSiI+rvbDut4Zj/6uOlLPzJXPAylw5yo1cwRcx6cvgLacip5CXBVXvhiRAWgnL0tBGQLHx60IxyqwYujwj+z6FGjHQ7O6J9Eo+f0HznUpkUAbMSY2YtNGJBAbS0UwIAoajqjzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4IPHvn9kjIt6F7L5Y8SBUlRlI4UF9iILmKnab6OO+4=;
 b=napqe8c1+6WCGChDYU3j03YA9xlhS0NGmmvBTX6WcmBrQ+RWRWQBUmMUgldRARGR1U8AUTtyoKjwLqZ5MdY+CKjy4SegD4o4hEfc8nFAWRU8fUX0JCd3S7iTKaTA/cVbGIFd+KmAsxtzNPFLhuB2DwLGfkz1CkA/DOhp2dk9ieU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: bootfdt: Always sort memory banks
Thread-Topic: [PATCH V2] xen/arm: bootfdt: Always sort memory banks
Thread-Index: AQHXccYljzQk/sGJZEe7fPnXVyiC4as1lduA
Date: Tue, 6 Jul 2021 08:02:11 +0000
Message-ID: <0EDEB6A6-227D-4F89-A3BC-1FD73D458C68@arm.com>
References: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25a391ab-faf5-4f36-971b-08d9405466cb
x-ms-traffictypediagnostic: PR2PR08MB4699:|AM6PR08MB4055:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB40550126E293137D56939E6F9D1B9@AM6PR08MB4055.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VBn9T2Z7eBRrIum9vzCz4FlMi4z0Zk92VTxIHZXJDJB9sWqRyywyR3vtr5kPPjDknp56enjj3sEDyUeFNRd5FCTktFeffnnns3yjq8IVaJ/DnDO2x6Iq5c56Bh1Bro2OWjFCqHLrvTvQjpaWym/PI3lNLDoxFVAOtmIfzL777bTi99ARk/ScpxcKN/691wuAa6Q69aGCCHsb0hsg+aBQZ2KlLyb0wDEqRza3sXIbhLZXBnVjGfDUkSyY4TPr2N8CpCXi2zpzAkRbR8xjxMUXEl+FGw82XbZocJI+FAzIgVGBmQGsSpZRrCP5v7yAjMsYdaZWznn+gRy9nuMI97dmnsI+WZKmuGNxXKFwE5pqQsbiRTvjH7BLXT9rGYUziUtW3f3/PPq0pF5H/Re04lJpjcuJ+Va7f/kuYSkYn75+D1eohJskuhKUkI7Ww9qDjPLLfVBhsvQnIcdq/RCUhj6IhRYFv2Eh7uf3jdRx6G9yqwkFwrKlsda7yOGG9W8QcRplBahoRpCho94ujoCVh6S4NLAy6E1sgpYSK0QH0tNkd8N5qU0VzihRefjci2b87A4u/IY3ui8HIZMUwRa/LFlZe08xOz86Yw5BuYtBSUjZBaq0qKUWiLv/9zU5HiIcllAyHEXxvfvcn9/LTVxYJeWfCl/O0Ny7K966tVPpDx8BKqYVWmngcNpggAJwg7o+qrU0yJl+ycOaROau0T+hD3XuJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(110136005)(76116006)(83380400001)(54906003)(66446008)(66556008)(71200400001)(66476007)(5660300002)(4326008)(2616005)(478600001)(2906002)(91956017)(316002)(36756003)(66946007)(53546011)(6506007)(64756008)(26005)(38100700002)(122000001)(33656002)(6512007)(15650500001)(186003)(6486002)(8676002)(86362001)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZDrlA4Syedz9q+SdEEqFW7SRUNDStXSM/Ai2FeIQ1dcQoVRYerD1sNhk5CcW?=
 =?us-ascii?Q?PVoP1N70OJDF9bOkcA81gmX/wbVfINRtnQowfqq8ZHKbvTcGp1B6BFSFvFL1?=
 =?us-ascii?Q?gYpzG908zufFL1dmYwt1pAYuvAcvAY4BNZD+R1sQKpGYB0l9xaa3L/Wq36Hi?=
 =?us-ascii?Q?KefYFZf3Yk4H9ZrIp2HDbwXwwY4PFszJTm1Fzpj2A1EL/X7He1KiTSKq+4Ha?=
 =?us-ascii?Q?SgtiEm0KN5Bg2C6CG8Y5KOw45tOweA0Yk9c+XRAN4vVN6sei5qG94G7too7y?=
 =?us-ascii?Q?wuPBQhR24R3iR3WQbISDW7X2McRznnDSYAcZlLv8yLwUjwbANY01OCvD2ImP?=
 =?us-ascii?Q?fdO9FibUcN/cKqqU+szP37QoAl2gAmcTrZttadNQrOYLRxmxy0sVoYz+pdXX?=
 =?us-ascii?Q?w9RcxjNUNYpzH6iauNjQzF4tFERHHWsGlVqLypNxVTV/YKEI4hrceVLwxnWx?=
 =?us-ascii?Q?PqXGdzgyPfYd8r+PeaVdoAKRcOGaCk6R72oHobDlqT+++53gEzFg5F2LFpGt?=
 =?us-ascii?Q?MhUjLOeV3nlmQyBwZ1Rheb5BKcgS931Ev+0TVppOAAKItJIbz1QRsVSYkWeD?=
 =?us-ascii?Q?jB8HJkHh/+6nQcx7CNGdmSl0LrFeVP3qtQFPSm9VCh+omcuCUGpKlDH4gPbw?=
 =?us-ascii?Q?0SQmJUQYKUR3ltP4ZfMXnLUQr7s8smi0AfILyBQB/Y3pc66CDmuYkSZ+V/I6?=
 =?us-ascii?Q?8BzHgZ43puiDFN+ytV9TgCocv7O8bCl0rF8zLlvCyWBJ6uz0SVlTJs83vjmX?=
 =?us-ascii?Q?EPZA+Rigiwrc1YQhJQFYtpbjMuW+JDPSPR9JbSOgeZ2/+JWbr12G6LleZnnK?=
 =?us-ascii?Q?VhbMteYMKfqaHAhOr0hpkhL9RYcbqisWOQNoAKQ+NKghij4vhq9VdEu5OmBW?=
 =?us-ascii?Q?KzP+oCO4xx9YI9dpgmAroYc7mSoVfo7lPSDJAGvZRdpeMJ/Eq6k/xiCF3aXr?=
 =?us-ascii?Q?ms0ruTKCa9jeOIgs9CeOf2PeLvL24VCe4ESGIMIXwoXKCBLfDGu1ZJxd9PeY?=
 =?us-ascii?Q?FIskKxzdRchPzF7U7eLJ0sg6sv2xDgL93IhlQvPMfLnifaVvLojKsl58EKFx?=
 =?us-ascii?Q?fz/UG0217OJX/1aTmStFlukSY3tDbgURSPIWCB4kh1E7HCq0+uLv9op1e2Xc?=
 =?us-ascii?Q?xe2aFmoQSjekwEjAK7rDU4I9anpJWxOtNVtE3sGVohCQSZgbf3ZCHU1HRzLw?=
 =?us-ascii?Q?jh7BtA8he/yA/Zngmdr/OHmYjtfxSpqUIHTxqpzq9RI3vCq2KyKFQCsjHkZK?=
 =?us-ascii?Q?zzcMPzvMPfXqpTltw8kTkjq0cg/nxDDLOyNbGrAFO6wvreWlqZhjSHnpyxGc?=
 =?us-ascii?Q?9tQR3YeLcyUNyvtRFCbMW9NF?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_0EDEB6A6227D4F89A3BC1FD73D458C68armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4699
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb5da4e4-c5ba-49bd-fd62-08d940545c35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TbMj2W1c9WTTOQdyQtSH0Wy8+PNrz8FALKzKs7xbDKQ0Djb31fKAqbLQlnbgTiqsJsE7GuSg7h7GaYL46UeCn+mTQDjgv9XlBivpz8Dc/9qfzyHze5FyRdKICFceyPCgc4HP8GxFzAzXev/T8WK7CeTlM3tat+1/zOmpmfmFzDJErQeGM/t4g+TzDlSicqXtNK3KzxHarxTEZg6rOKyA2odxuK87g5e09DCZhPJGef3OzA0KMRneirOi3LvFH7JU8wOkzBUi8Tj/Lxw9dWEe8hA3uDAwIQj2RKoFLpOMCNrp8cQixiuCoJhHsJHxG+jfEv9g60xk5Fm/fJ9zcwKG/udlJkG8hsEBhdPaeY1Ou6sK3pRSqNeV7UEoF0BtaxeAzEPcmk5D42PcPtXBxBct6VgQ+2n4dPI/5CD+usd2evheByIPxx0rGtJnFaQ6qOsiZz5Uif0uDSO62QTzZiKDdfXh8j8/r+QUiIrKtHX9ZSk7QVw6yn3m4OcJ7bAVgVyJjhw0emzL0lLoNoQdL79kaIF+BMncfsXBk+9H5M9HOCTODfjuGfKRScsyCS/5rDvzwM1AjRYPpFDNnGyAYICOFgbXNta3KuN8cGssHJ3uPay9a7OAT/CtnyHO+MkBtFV4yKtY9LDVdDLETwmotwL1mIwlBFsM+9b+TXiPYjXPN8o7MD8DKa8z78v46KZWahbUi1WfHzWGfmrKreJm5H0jVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966006)(36840700001)(110136005)(53546011)(54906003)(356005)(70206006)(8936002)(316002)(81166007)(8676002)(70586007)(5660300002)(6506007)(2906002)(83380400001)(36756003)(33656002)(2616005)(107886003)(6512007)(86362001)(478600001)(6486002)(36860700001)(186003)(47076005)(45080400002)(26005)(336012)(15650500001)(82740400003)(4326008)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 08:02:29.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a391ab-faf5-4f36-971b-08d9405466cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4055

--_000_0EDEB6A6227D4F89A3BC1FD73D458C68armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On 5 Jul 2021, at 18:48, Oleksandr Tyshchenko <olekstysh@gmail.com<mailto:o=
lekstysh@gmail.com>> wrote:

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com<mailto:oleksandr_=
tyshchenko@epam.com>>

At the moment, Xen on Arm64 expects the memory banks to be ordered.
Unfortunately, there may be a case when updated by firmware
device tree contains unordered banks. This means Xen will panic
when setting xenheap mappings for the subsequent bank with start
address being less than xenheap_mfn_start (start address of
the first bank).

As there is no clear requirement regarding ordering in the device
tree, update code to be able to deal with by sorting memory
banks. There is only one heap region on Arm32, so the sorting
is fine to be done in the common code.

Suggested-by: Julien Grall <jgrall@amazon.com<mailto:jgrall@amazon.com>>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com<mailto:o=
leksandr_tyshchenko@epam.com>>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org<mailto:sstabellini@=
kernel.org>>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

Cheers
Bertrand


---
  V2:
  - add Stefano's R-b
  - clarify patch description
  - clarify comment in code
  - drop "if (bootinfo.mem.nr_banks > 1)" check
---
xen/arch/arm/bootfdt.c | 25 +++++++++++++++++++++++++
1 file changed, 25 insertions(+)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dcff512..476e32e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -13,6 +13,7 @@
#include <xen/init.h>
#include <xen/device_tree.h>
#include <xen/libfdt/libfdt.h>
+#include <xen/sort.h>
#include <xsm/xsm.h>
#include <asm/setup.h>

@@ -395,6 +396,21 @@ static void __init early_print_info(void)
    printk("\n");
}

+/* This function assumes that memory regions are not overlapped */
+static int __init cmp_memory_node(const void *key, const void *elem)
+{
+    const struct membank *handler0 =3D key;
+    const struct membank *handler1 =3D elem;
+
+    if ( handler0->start < handler1->start )
+        return -1;
+
+    if ( handler0->start >=3D (handler1->start + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
/**
 * boot_fdt_info - initialize bootinfo from a DTB
 * @fdt: flattened device tree binary
@@ -412,6 +428,15 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t p=
addr)
    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);

    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+
+    /*
+     * On Arm64 setup_xenheap_mappings() expects to be called with the low=
est
+     * bank in memory first. There is no requirement that the DT will prov=
ide
+     * the banks sorted in ascending order. So sort them through.
+     */
+    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
+         cmp_memory_node, NULL);
+
    early_print_info();

    return fdt_totalsize(fdt);
--
2.7.4




--_000_0EDEB6A6227D4F89A3BC1FD73D458C68armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <441C6383024E4F4E9D6B624DCF89D193@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi Oleksandr,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 5 Jul 2021, at 18:48, Oleksandr Tyshchenko &lt;<a href=
=3D"mailto:olekstysh@gmail.com" class=3D"">olekstysh@gmail.com</a>&gt; wrot=
e:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_=
tyshchenko@epam.com" class=3D"">oleksandr_tyshchenko@epam.com</a>&gt;<br cl=
ass=3D"">
<br class=3D"">
At the moment, Xen on Arm64 expects the memory banks to be ordered.<br clas=
s=3D"">
Unfortunately, there may be a case when updated by firmware<br class=3D"">
device tree contains unordered banks. This means Xen will panic<br class=3D=
"">
when setting xenheap mappings for the subsequent bank with start<br class=
=3D"">
address being less than xenheap_mfn_start (start address of<br class=3D"">
the first bank).<br class=3D"">
<br class=3D"">
As there is no clear requirement regarding ordering in the device<br class=
=3D"">
tree, update code to be able to deal with by sorting memory<br class=3D"">
banks. There is only one heap region on Arm32, so the sorting<br class=3D""=
>
is fine to be done in the common code.<br class=3D"">
<br class=3D"">
Suggested-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" class=
=3D"">jgrall@amazon.com</a>&gt;<br class=3D"">
Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshche=
nko@epam.com" class=3D"">oleksandr_tyshchenko@epam.com</a>&gt;<br class=3D"=
">
Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.or=
g" class=3D"">sstabellini@kernel.org</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D""><br class=3D"">
---<br class=3D"">
&nbsp;&nbsp;V2:<br class=3D"">
&nbsp;&nbsp;- add Stefano's R-b<br class=3D"">
&nbsp;&nbsp;- clarify patch description<br class=3D"">
&nbsp;&nbsp;- clarify comment in code<br class=3D"">
&nbsp;&nbsp;- drop &quot;if (bootinfo.mem.nr_banks &gt; 1)&quot; check<br c=
lass=3D"">
---<br class=3D"">
xen/arch/arm/bootfdt.c | 25 +++++++++++++++++++++++++<br class=3D"">
1 file changed, 25 insertions(+)<br class=3D"">
<br class=3D"">
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c<br class=3D"">
index dcff512..476e32e 100644<br class=3D"">
--- a/xen/arch/arm/bootfdt.c<br class=3D"">
+++ b/xen/arch/arm/bootfdt.c<br class=3D"">
@@ -13,6 +13,7 @@<br class=3D"">
#include &lt;xen/init.h&gt;<br class=3D"">
#include &lt;xen/device_tree.h&gt;<br class=3D"">
#include &lt;xen/libfdt/libfdt.h&gt;<br class=3D"">
+#include &lt;xen/sort.h&gt;<br class=3D"">
#include &lt;xsm/xsm.h&gt;<br class=3D"">
#include &lt;asm/setup.h&gt;<br class=3D"">
<br class=3D"">
@@ -395,6 +396,21 @@ static void __init early_print_info(void)<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;printk(&quot;\n&quot;);<br class=3D"">
}<br class=3D"">
<br class=3D"">
+/* This function assumes that memory regions are not overlapped */<br clas=
s=3D"">
+static int __init cmp_memory_node(const void *key, const void *elem)<br cl=
ass=3D"">
+{<br class=3D"">
+ &nbsp;&nbsp;&nbsp;const struct membank *handler0 =3D key;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;const struct membank *handler1 =3D elem;<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( handler0-&gt;start &lt; handler1-&gt;start )<br cl=
ass=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( handler0-&gt;start &gt;=3D (handler1-&gt;start + h=
andler1-&gt;size) )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;return 0;<br class=3D"">
+}<br class=3D"">
+<br class=3D"">
/**<br class=3D"">
&nbsp;* boot_fdt_info - initialize bootinfo from a DTB<br class=3D"">
&nbsp;* @fdt: flattened device tree binary<br class=3D"">
@@ -412,6 +428,15 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t p=
addr)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(f=
dt), false);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;device_tree_for_each_node((void *)fdt, 0, early_sca=
n_node, NULL);<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;/*<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;* On Arm64 setup_xenheap_mappings() expects to be=
 called with the lowest<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;* bank in memory first. There is no requirement t=
hat the DT will provide<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;* the banks sorted in ascending order. So sort th=
em through.<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D"">
+ &nbsp;&nbsp;&nbsp;sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(s=
truct membank),<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmp_memory_node, NULL);<b=
r class=3D"">
+<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;early_print_info();<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;return fdt_totalsize(fdt);<br class=3D"">
-- <br class=3D"">
2.7.4<br class=3D"">
<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_0EDEB6A6227D4F89A3BC1FD73D458C68armcom_--

