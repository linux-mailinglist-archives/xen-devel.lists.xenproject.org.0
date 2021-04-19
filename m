Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98435363CFD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 09:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112679.214903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYOfr-00035o-Sb; Mon, 19 Apr 2021 07:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112679.214903; Mon, 19 Apr 2021 07:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYOfr-00035P-PJ; Mon, 19 Apr 2021 07:50:27 +0000
Received: by outflank-mailman (input) for mailman id 112679;
 Mon, 19 Apr 2021 07:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO6R=JQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lYOfp-00035K-EG
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 07:50:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a090dc-1b3e-4de0-b290-bb6558cd75af;
 Mon, 19 Apr 2021 07:50:23 +0000 (UTC)
Received: from AM6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::46)
 by VI1PR0802MB2430.eurprd08.prod.outlook.com (2603:10a6:800:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 07:50:21 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::eb) by AM6P191CA0069.outlook.office365.com
 (2603:10a6:209:7f::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 07:50:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 07:50:20 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Mon, 19 Apr 2021 07:50:20 +0000
Received: from ce6c7fc30df5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA545712-9929-4109-A97C-445C3120850F.1; 
 Mon, 19 Apr 2021 07:50:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce6c7fc30df5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Apr 2021 07:50:13 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4493.eurprd08.prod.outlook.com (2603:10a6:803:ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 07:50:10 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 07:50:10 +0000
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
X-Inumbo-ID: 32a090dc-1b3e-4de0-b290-bb6558cd75af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLumaIzRwjH8iZm1aCsVPawv5Cjn3kN69UEi02oIoOw=;
 b=kuhb+W0VkUZQ8RM0laTjIzjYMPBYZcvwbklVMM5mkvCc2j/K95Hv8Ne6LbimEFV9Q3BFixjiK4LqWDuctIy02myv7zB9koSETBu4WhTu/1ARHCsPZZDTY3QnkTdc26ZYFSxXrMM9eXdR6xlf32Mz1UxF43fx59WhLYnfbMXyuNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7774d707d912a93d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB0+81I6xuaaxtNN/m5rjLpL9Wrfrq1zHoI3my63KCxM0wD00YvPobR/EAhWFrXlsebFPfVLNtOqjfUo348QckpzS4Dtp/Xcs9960PB7lE9DDOF13x0/9JZreJtJaVfebI+U1e90l3lvGpAezFaWQUQwt9kG6VU980e36oJogxgRJbYnSWH7oDeTO9rNDuPrJVdLjqV0SjuH4tyf0lTcbDua3pEz7mk5+KGK9JwJOFR/o45oFPu4yVw9kpxlEilMjrGOKaY7OQuf68yM1CLgoS90c3Ml5RwPyQ1W4XSASFPMO2XnY5dw/H9Xf6a8nlWggJghGIo07XqvGNAG8qwbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLumaIzRwjH8iZm1aCsVPawv5Cjn3kN69UEi02oIoOw=;
 b=SphXLt6udT/BJI/9gx7OfQ6MXyMTDqIkiwxoRHjGbsUdzlyPQgXbzXmDpU9qvyCAA6aJO0HK/IJhDUqfz+xYjw9RQI/v7F8sAYhNTeEzisB0nesBprdmvJjljj7FsdxjFNUc7nH7mzxugTDFujEfcqBjkPZmCB+K+NQZOIg20K0zlM5ka25tzZ9E22DysIRKowUwH7cI5hvOJ91jzSv8L2eC1eCE0vR8u4LKrvBci5Q1enT3yrgwOZZwiW7DrhzcrD94Nm8UIqV+HeBi6INyOqo+MfLeF4D/WRJJM1o13WfDKq28PgqwIHfn7e+bMmrPymeVzd5RnxcCKIKt/8E2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLumaIzRwjH8iZm1aCsVPawv5Cjn3kN69UEi02oIoOw=;
 b=kuhb+W0VkUZQ8RM0laTjIzjYMPBYZcvwbklVMM5mkvCc2j/K95Hv8Ne6LbimEFV9Q3BFixjiK4LqWDuctIy02myv7zB9koSETBu4WhTu/1ARHCsPZZDTY3QnkTdc26ZYFSxXrMM9eXdR6xlf32Mz1UxF43fx59WhLYnfbMXyuNA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<julien@amazon.com>
Subject: Re: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
Thread-Topic: [PATCH] xen/arm: guest_walk: Only generate necessary
 offsets/masks
Thread-Index: AQHXKjesiGPIh/24CEW4HMn8sjGqgKq3YAMAgANJXACAAONvgA==
Date: Mon, 19 Apr 2021 07:50:10 +0000
Message-ID: <6803DD6A-69C1-48A5-8633-AB9D09DC9335@arm.com>
References: <20210405162046.9353-1-julien@xen.org>
 <964513D8-D6CD-4419-9804-CF77363B81FD@arm.com>
 <87889996-0dc8-f8d8-0b0f-ea68dd82e3f5@xen.org>
In-Reply-To: <87889996-0dc8-f8d8-0b0f-ea68dd82e3f5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25f5abc4-b5e4-43f2-88ca-08d90307c7fb
x-ms-traffictypediagnostic: VI1PR08MB4493:|VI1PR0802MB2430:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2430AE764B8380CED7ED13939D499@VI1PR0802MB2430.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G3wIMykV1iO7XVJNzv3cLMWzc/amPQ07d5bGnG/Cdgi80Sm06ae112J5oJyAYeMkWDe2XlIfcNmbp7OzwDn6HgnJlb8LRqlX8oXxp8NRW7Z1X3L+x2wL9jWi8ocdLfC4ShaQLSgUJETpE/4sckx2lBofFaWbM6rUm0OVj3jiQpHIzW/bplUHpm+0MVsIaVyrRjmINu+J66ogsfbia19nbCleVLoC2FmDHBA167CIyckq5/5yo1FYJaBZ1jJYpXsamGLl8HuRc1fAzfd2Y1FtFdfi38JPKHxUttlA4qRez/t3+wOPp4b+0ZvK5UO30ILlSpSZBh3vfaShYCM83fzXAHFlWEonVr8m8aPTWEbnG+eme6TyPDFAx1wfAGBSPl+iaonTVoGWLsWD9R+rRTElh0rYDbeAfRbxFBQrYc5WLuxc74k1EDKTW/R5gh9UKqd0qKmXh7nVKDPHIdxr/F9Vk7W8kAijCGCWM12OCHaG031su6PAhfp4Ubmdk2ugiVf+sjMpAWGeCx5E6TWgB8+RehsmQPa1TMPPCbPN6dSRrRq/tj8eQKo94S1xrSeAATeFWbbSwCFAWg+JZzjpesOap8FVJi97Ejte7vMcgWZcSOgTwlMM4ywuLS8RRo53RW/hQPVEjOGfvLgSkNMyA2QwkpQCb5Ooy7kuq1BwECz+bMI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(66476007)(71200400001)(316002)(6486002)(2616005)(36756003)(66946007)(8936002)(478600001)(4326008)(76116006)(5660300002)(8676002)(64756008)(66446008)(91956017)(66556008)(38100700002)(33656002)(54906003)(6512007)(2906002)(86362001)(6916009)(53546011)(186003)(122000001)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?98QFVM80uTymbx1xqS9wtnbgcQHjbxgbYJr+IMmB3+ryHjnG5rOk4vV6lZIK?=
 =?us-ascii?Q?KaaUASmWapmUpXPpOb/DRYSkE6iwj7bFy81XS0iKDvGl20BAQ92QOuZ/yhWg?=
 =?us-ascii?Q?UL2C19j947QkciRGhemIaodCFO4IrGrKYV/4VaX3VplX8tHcjKS6sqnOeNMI?=
 =?us-ascii?Q?GC/qW4N9WbZZkFLrNELdTQStkp42Xl5p0DbrleQILILpCvUYJYoZUl3aCK3G?=
 =?us-ascii?Q?9oEJCJuX4aFEr1OBjBPX5uccMxNex/tnUrILMmfTAiEDijU9pJ8GRFBZyehL?=
 =?us-ascii?Q?xXKxg1AFf0QfN9S5t8Ow7mWsQTdzkLX0hGNhbOn9OpRpTvcm1yq4dFFhMxkz?=
 =?us-ascii?Q?491JuQHQi5STdVjN1y99KBpIAHX5KoE2EUWjz6hZJ//T0vC/TX9TiC4+POvO?=
 =?us-ascii?Q?DT6vMakx0G4l5gQm+NONFTj0cLZvcJonhLPEvexMzBZ9zYxa2sl/YspAtOV4?=
 =?us-ascii?Q?04cHYLHsgL5YrB++B/UrqJP9XuWS9Op6rsqhE4mVvkQlIwbAlDsOMCoJ2Y00?=
 =?us-ascii?Q?5YGCAsUEKUhOFrUy/RIlOcHkTyhzoyE3WlduLk+p4OYq37alWKVBA/aMfGD8?=
 =?us-ascii?Q?n99txN+rgEtmiPP4O9sHzZhtJOFqXNeyAwnRX4e824tVuj2dY77szQ4wkDzw?=
 =?us-ascii?Q?Uut7qqou9IPPcgF9Us0ELhvxiYeY8O+9bZl3bEjrUC6M+/oOFZtmE9FuoBy5?=
 =?us-ascii?Q?uCzLeTrcAaze+oum4vZ41b8G/nISsXkabqkObm1ByiLpjoa19cCBqAlA/3Lq?=
 =?us-ascii?Q?eOZ+/LBulz06UAaK6rjf/922wBXiDMVa7xxchhZLebMCuctOR9DC554rakdU?=
 =?us-ascii?Q?/TjOQ96YcapvOD8ANRBOBBM4mh5SfV8gT3h5WgJCd7Ty+qBlvjbvV4yueLcA?=
 =?us-ascii?Q?jix91PrRCeE62fqQ16VABKv8x0nKV2nZFQMG/TzCKA6JU+USbV3UZ7zR3HZ3?=
 =?us-ascii?Q?DY+wvRyGW/IexAb+e5lU+4MovCZuSKbGt7Tjy4HzR8sFHkP4K+hI9aL+kgC5?=
 =?us-ascii?Q?KOIPk9DmoVEUuk084bRwwZdxR5nOb85z1I6Qw/99mhgmqnr1l9ZNzj+cmLYE?=
 =?us-ascii?Q?SNZyGmZociWerz0cnAdhXUIzjmdvg+M0zZ59fBWj8m0Xe0HW1Y+40ZpH3sAB?=
 =?us-ascii?Q?5z7AcmWEQ9sNZl9pjeCtndEn2Dqkv5MQonJlEK/VZ0uqX4CbSnZoOzDP6fX8?=
 =?us-ascii?Q?SlWt053GjJB9HfaY7pH7sSZcMjPNmm1j8MPBJyDEGWwVSL4GdqGny+hhF5M/?=
 =?us-ascii?Q?EVhzaS9t33k4jlCqTWqBWJ818iBhW2iTWwV1vzM7j7vcrAHZGADZwMbCiSjZ?=
 =?us-ascii?Q?E+bO2H0xQXWD8MgBY0Qo5jXWhPBJQ/sGgSL/qR6xjTXLEA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8907C8E7107E940A15A6D7483701C9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4493
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c1cc2a4-151c-4ee7-64be-08d90307c210
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	58mhICqK5So3RuVsrN/dirPZ0nDl1yoKP1xy67+wX/pnH2uz7t9cU/+DcdJxRku1tyMsbOs9R/MpLDWepiL/WZfZG8P+hmGV6QLBeoX4cJE3SSR65cp4UsDf8uVmIiBIu0uzTVt5wU4MDh/7zOD1R/tz8hPbBTlxBzqDlS15vNTiXQwATbKk1o5H0pOUIGspVSyP6v0KSU6/5lL5AZbtuaKoT14nfhRaTeLnwPbop+HvnFM5Uq83h3wqEqscZEx0gdEweDh5FEvju8gDxaE3Jl1wqeJoC829iqVHZoIemcvAF3XVngY9t5cNCMBHDcALRtUqlRvYfDbMaKHRzoS7QrzYj60f19aLEZCVAxgEP1sHYHQuzpGW6YxReLG/P0gE4tyWTc7mdTZ0qU5HzEdsXqcNjhLQaz6UpVmIhkDtXaMSu/f4W8bbVuckC9TSIGCxcg0apgGHP7BA0CaXCkXnKT+FR0FJpW1ZiIOUYQWW1I7fnowbqxbaHJ3u4XNRjF5i78VOapFQqHoTX/PQFFJ9QeSHE/HONJBOZc8On0s/SZ1X9DB/rY261KNtVtN8qSSaK5Jq1L/YjgSCPVRztX/FpUYjFRBUslgpESU7MGoHi0a7GvXF/Qn3xvWPGfwvcpVDnAe39vKSR/KqsKgkrj/ToA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(86362001)(54906003)(316002)(6486002)(8676002)(107886003)(70586007)(186003)(336012)(6862004)(2906002)(70206006)(36860700001)(478600001)(81166007)(5660300002)(6506007)(4326008)(47076005)(53546011)(26005)(356005)(2616005)(82740400003)(36756003)(82310400003)(6512007)(33656002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 07:50:20.2691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f5abc4-b5e4-43f2-88ca-08d90307c7fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2430

Hi Julien,

> On 18 Apr 2021, at 19:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 16/04/2021 17:04, Bertrand Marquis wrote:
>>> On 5 Apr 2021, at 17:20, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> At the moment, we are computing offsets/masks for each level and
>>> granularity. This is a bit of waste given that we only need to
>>> know the offsets/masks for the granularity used by the guest.
>>>=20
>>> All the LPAE information can easily be inferred with just the
>>> page shift for a given granularity and the level.
>>>=20
>>> So rather than providing a set of helpers per granularity, we can
>>> provide a single set that takes the granularity and the level in
>>> parameters.
>>>=20
>>> With the new helpers in place, we can rework guest_walk_ld() to
>>> only compute necessary information.
>>>=20
>>> Signed-off-by: Julien Grall <julien@amazon.com>
>> Very nice cleanup.
>=20
> I have a couple of more cleanup in that area to send. So far, we are usin=
g a completely different set of macros for Xen page-tables. I would like to=
 introduce a new set that will just pass PAGE_SHIFT to the existing helper.
>=20
> The nice part is this means it will be easier to support other page granu=
larity if we wanted :).

That would be awesome.
Do not hesitate to ping me if you need some help.

>=20
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks! I have committed the patch.
Great,

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


