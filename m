Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BD2D18B3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 19:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46925.83128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLTa-0000TT-JW; Mon, 07 Dec 2020 18:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46925.83128; Mon, 07 Dec 2020 18:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLTa-0000Sd-FR; Mon, 07 Dec 2020 18:43:10 +0000
Received: by outflank-mailman (input) for mailman id 46925;
 Mon, 07 Dec 2020 18:43:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifa4=FL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kmLTY-0000RY-MP
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 18:43:08 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e018ee22-3bd7-4ffd-a0e8-f1891747e665;
 Mon, 07 Dec 2020 18:43:05 +0000 (UTC)
Received: from AM6P192CA0043.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::20)
 by DB6PR0801MB2117.eurprd08.prod.outlook.com (2603:10a6:4:2e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Mon, 7 Dec
 2020 18:43:03 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::a0) by AM6P192CA0043.outlook.office365.com
 (2603:10a6:209:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Mon, 7 Dec 2020 18:43:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 18:43:02 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Mon, 07 Dec 2020 18:43:02 +0000
Received: from 7f1830ab4f86.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 928EE7B1-5115-45B7-87B2-0C3DA6117048.1; 
 Mon, 07 Dec 2020 18:42:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f1830ab4f86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Dec 2020 18:42:46 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6170.eurprd08.prod.outlook.com (2603:10a6:10:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 18:42:40 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3632.022; Mon, 7 Dec 2020
 18:42:40 +0000
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
X-Inumbo-ID: e018ee22-3bd7-4ffd-a0e8-f1891747e665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p01CoVpdQE0NVlpZRY0LQOE/3ZsylSlgSX9tml/Dv8w=;
 b=xjJqkxzv6OuW85O7ntYHaQixfihVxrvIdeB+h1prY0XsbzvtnGQEx1CBvbM19VUsjk02phEIWrQCPhu8ad3ou+3jJQG2vvAPQrccTae3I6/Yjm4aPrusbuqiJUAdO2MMvUm3O+QxT219mLhYx34Z1VaOCXm+YJoefdEupYfKFdk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c72496df9b7893e3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhPdYSXKcuQJqiaOY6FDzFGUssWwIqtZXZ4IIpSu9/XRx97vQHHvxy9/tSF0y4+dLq6TTZIH0ZZ2J9gX1CVVKDH6AkyLYGhDMANTGJSjlqm080dfr0jmEJpeVRh99Ac8djtlowBxy9e2e/VEuZkC8iIjyNpgiXiFPm2VSCYcJZ/1naV71XahJ4prxvl+Z5x1yiW6hOlf6q55dkXOjiz6wjo9pjfzyRvPLEczvfaZT1m8RqsH8MvaJGmR19VVS9T4IvgQT7FJLBx7pUnNsDwn9UfaWZg/2OjJURrQjyaLU7V1ZnuwQNM1Il2wsyr1QtbViLNBY0odWkMgVBnZB8W0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p01CoVpdQE0NVlpZRY0LQOE/3ZsylSlgSX9tml/Dv8w=;
 b=RSdxeB3y+1ER6EoEtryQ5byhJqogbtgjInLvrBPKGH01XrZ92TrsTOBFCVeZWlKBRHp96UnTkAj2tYkDvO4aesPxsEbWcemRwrQ7+9XQqrW16kJHVlB1ORHrNVaMIkc1w8QIqKbZ8GL/09yJNEaxSIx4kvqxAhTRSq2sTpYHHCd76H4hv/b2rvrhoy+YhQdKrWEXAP8vRu1wTQAb5BLYBbN37PUzu0fpdwoo27aAQtFKwB7uJstQFuI5G5mdYTOeccrpihLEIo067Js2i/ZDUgJyFkBmH6z2uayylygq+nbb07zNQuOOZucXy+2VwMeefmCuxQrTN7eWQvUxn/owVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p01CoVpdQE0NVlpZRY0LQOE/3ZsylSlgSX9tml/Dv8w=;
 b=xjJqkxzv6OuW85O7ntYHaQixfihVxrvIdeB+h1prY0XsbzvtnGQEx1CBvbM19VUsjk02phEIWrQCPhu8ad3ou+3jJQG2vvAPQrccTae3I6/Yjm4aPrusbuqiJUAdO2MMvUm3O+QxT219mLhYx34Z1VaOCXm+YJoefdEupYfKFdk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Index: AQHWxBX/ttp8YMNqT0KunkbXuSldmKnkBpwAgAeVnoCAAFuAgIAAEZOA
Date: Mon, 7 Dec 2020 18:42:40 +0000
Message-ID: <9F9A955B-815C-4771-9EC0-073E9CF3E995@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org>
 <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
 <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
In-Reply-To: <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08a26eb5-1d23-426b-b655-08d89adfedb2
x-ms-traffictypediagnostic: DBBPR08MB6170:|DB6PR0801MB2117:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB21171EA7F300919C70902DEEFCCE0@DB6PR0801MB2117.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PC2kM8g0cTcba9gJig+FiYVkdMRVWwTHscrcyZBa3xrHbCbZiDAc4cq8W/uvIcUoY4C/65eP1wDdoL+xHS1rOGRg9NAiQBjUZ8Wgy7WHzRG6ZdqNzrLOw8vf+xoeLw66l1ywPcS4WZA6biTrObyaGRIttEAGV5wdMCzRIl9CgesD8yxssHJm+z+lQiG5RphaS2uY3gopkmr5J4ignqatE5nqxFu6b9fKyYl4c5tSEGebuJ9M9dUEhh3vVTLDywhSOOzRutJlJCok7lpPkwdRjyEO/hEVA6PSctF8fEXUB7ujzv76P76EhXg8wmbG3vfsN+BZrWrLdFzI8oOrxuNnka+BwdrwqV24gw9gklfqaxKuafO48yKbAqJ+Z1J+3rm7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(6916009)(66476007)(54906003)(26005)(91956017)(76116006)(6486002)(53546011)(478600001)(5660300002)(4326008)(7416002)(64756008)(186003)(2616005)(6512007)(66446008)(8676002)(316002)(2906002)(86362001)(6506007)(33656002)(36756003)(66556008)(8936002)(71200400001)(83380400001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?gmYPyEnZxFsEtC9pOmjoJtvAJPzdK3mQN6yI6JUO4Hj82b6mxS0mybI6YU3K?=
 =?us-ascii?Q?LQznczmg+6+zewqDDgCbvxCOVg83bEPFakhujJSFqUk0bK0CwoTwmjPxJUKy?=
 =?us-ascii?Q?BUB0kSgwkVr10fsYHH5CDwnI8ZaE2B3H8KQcfmOfU8c1XAZZ5akFin7Hz8s1?=
 =?us-ascii?Q?1AfKmtHHj1QvccUq0SBurJ38U1d9QxNaB/2bkUgludMwos2H+tdwpesF6LgH?=
 =?us-ascii?Q?F/0SxsdhdEoZCQBkLUfgY/6Avx+eA+FasJPUrfnEYlzcjSzxaOOhIpv+WJXE?=
 =?us-ascii?Q?RGKfxZwranJsWB83BVUUK/q8V+34YdR/pr3pVog3y5gzgtnpa8eAqOeh+nRt?=
 =?us-ascii?Q?mmnKBAZZEeUY38msZpzoVf1vfsHvBDv+dSW8+BW/BxerUCTZchcmi7IoemfD?=
 =?us-ascii?Q?DBKLASZj7WydxyLq60Vkj2W66bS7kAlsznZwu8FKFvuvR4rZhugRoLIHMK3r?=
 =?us-ascii?Q?klxIqTnZBj7Bw9CA9m+h6sWiPRqmXm8lXOB9v8kyqfY+cybmzhlLV4Ey0KfO?=
 =?us-ascii?Q?lYDlr0e6iOHRXiT5eRxTFqm+cvfNRTiMHvN+fevozk4PVhgVitqSsQbxcgOU?=
 =?us-ascii?Q?qt9fnJ2p/7WsZqLURo+p7EbKpXENYIneHlkMZPDC9+J2ma87q1fhMW74iTTQ?=
 =?us-ascii?Q?WpJAuuOUeB/y9A6TAhLEzxetsH2QEcMGCJF/mFBahTLD0mqYYVn5ZXIJIubt?=
 =?us-ascii?Q?63sSflndtgLusrD6sjAVlEYZ7bnkMs0oDaIqgyleOuEUS1/hnaFLcHbVOaC1?=
 =?us-ascii?Q?yGqOom614IvbxOrONvmiycmPYkwCo76x1l3Txb0ekI7uZGUkvL8rtufbDFhb?=
 =?us-ascii?Q?WlCp3gdqwAm+BSw95yEeGHOALXveIFscjlrfagrcN5gFdd4TO3wZqI2KLHwJ?=
 =?us-ascii?Q?JGPa+B3La6/XhEer4Y1oA+RVFe/z8nvZoJKXI9bXUTJnpfaScGmbEdOulGX9?=
 =?us-ascii?Q?jdKInaw6fkx8pg1nWOThcRFjvaSZQEIhIcjciVC9v8HhRsZQIvYnV7dJSELi?=
 =?us-ascii?Q?9rkG?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3AEDA2C7E61E7841803E19D2EED68B6B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6170
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b709f1db-8a60-4158-0f0d-08d89adfe036
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gPUpfSMRP7I3phBPihT0dut+A+d17amxFkbXkWVCwEvIwDxh3tM4Ft62c+i/CCBafFYHqjQF1A/5Ti3BTCir2GHONB5tbPHzXUA1IYrBXt9ePtb6M6swn1jeGgO2ZuRLYx8yahOV0I0B1wNs7kb27uImNNWApa3YoJq7mCr0dbRxpTuZQEi//h0yn4V45YUnpSl9pGKocpcwx97drWdXIt6GZbLuMGdre4fY457uT1ZF468KlRwFfXq0QHKTU02f/pKDpW6x8A/5VKPIXRd2DUYySI6jkXL9RZTedXNLIEjxWDzbRSfshQ+vKZ0YJk2gIz+qVV4bydpn8Vm0eMeJkcBXYTzdul4aMgvSGSNzCpIjNLJq7ZYOclTdp5f5ADULeykc7NYoTTsUeb8ToMv+eQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(83380400001)(26005)(2616005)(336012)(47076004)(82740400003)(8936002)(53546011)(81166007)(5660300002)(36756003)(4326008)(8676002)(6506007)(82310400003)(478600001)(6486002)(2906002)(70586007)(6862004)(107886003)(316002)(54906003)(356005)(6512007)(33656002)(86362001)(70206006)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 18:43:02.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a26eb5-1d23-426b-b655-08d89adfedb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2117

Hello Julien,

> On 7 Dec 2020, at 5:39 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 07/12/2020 12:12, Rahul Singh wrote:
>>>> +typedef paddr_t dma_addr_t;
>>>> +typedef unsigned int gfp_t;
>>>> +
>>>> +#define platform_device device
>>>> +
>>>> +#define GFP_KERNEL 0
>>>> +
>>>> +/* Alias to Xen device tree helpers */
>>>> +#define device_node dt_device_node
>>>> +#define of_phandle_args dt_phandle_args
>>>> +#define of_device_id dt_device_match
>>>> +#define of_match_node dt_match_node
>>>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(n=
p, pname, out))
>>>> +#define of_property_read_bool dt_property_read_bool
>>>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
>>>> +
>>>> +/* Alias to Xen lock functions */
>>>> +#define mutex spinlock
>>>> +#define mutex_init spin_lock_init
>>>> +#define mutex_lock spin_lock
>>>> +#define mutex_unlock spin_unlock
>>>=20
>>> Hmm... mutex are not spinlock. Can you explain why this is fine to swit=
ch to spinlock?
>> Yes mutex are not spinlock. As mutex is not implemented in XEN I thought=
 of using spinlock in place of mutex as this is the only locking mechanism =
available in XEN.
>> Let me know if there is another blocking lock available in XEN. I will c=
heck if we can use that.
>=20
> There are no blocking lock available in Xen so far. However, if Linux wer=
e using mutex instead of spinlock, then it likely means they operations in =
the critical section can be long running.

Yes you are right Linux is using mutex when attaching a device to the SMMU =
as this operation might take longer time.
>=20
> How did you came to the conclusion that using spinlock in the SMMU driver=
 would be fine?

Mutex is replaced by spinlock  in the SMMU driver when there is a request t=
o assign a device to the guest. As we are in user context at that time its =
ok to use spinlock.
As per my understanding there is one scenario when CPU will spin when there=
 is a request from the user at the same time to assign another device to th=
e SMMU and I think that is very rare.

Please suggest how we can proceed on this.

Regards
Rahul
>=20
> Cheers,
>=20
> --=20
> Julien Grall


