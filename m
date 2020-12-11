Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA212D7BCD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 18:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50778.89541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knlmR-0000f5-PO; Fri, 11 Dec 2020 17:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50778.89541; Fri, 11 Dec 2020 17:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knlmR-0000eg-LW; Fri, 11 Dec 2020 17:00:31 +0000
Received: by outflank-mailman (input) for mailman id 50778;
 Fri, 11 Dec 2020 17:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df1x=FP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knlmP-0000eY-NB
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 17:00:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55299032-eb98-4d12-9ffa-bfe0d22833d5;
 Fri, 11 Dec 2020 17:00:26 +0000 (UTC)
Received: from MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::26) by
 HE1PR0802MB2267.eurprd08.prod.outlook.com (2603:10a6:3:ce::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Fri, 11 Dec 2020 17:00:24 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::a9) by MR2P264CA0014.outlook.office365.com
 (2603:10a6:500:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21 via Frontend
 Transport; Fri, 11 Dec 2020 17:00:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 17:00:23 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Fri, 11 Dec 2020 17:00:23 +0000
Received: from cd2b36560a49.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BE0F955-F7EE-4CF9-9CE8-0BF6BE1E286F.1; 
 Fri, 11 Dec 2020 17:00:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd2b36560a49.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 17:00:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Fri, 11 Dec
 2020 17:00:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 17:00:09 +0000
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
X-Inumbo-ID: 55299032-eb98-4d12-9ffa-bfe0d22833d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm+xZweXO57IT1cyV/up89eBv4of/vIUESJuZJppyw0=;
 b=JZNp0tMbJ47AHhfxvcDbstpgND045q45ib6MiqOa3ZaiR4UgBmEoe3kxS2fZfLwHH3d319ZLu4rlaGFSy71wcRvgZC//M+pmk5Qkpudx1g0y+RYV4NAXwgz0QFfLmyNQLaWVVrTV/ejOxeu/vRpobcbOay7JEaXt4egM5e49NJ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3a446d976d65dad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYJdqkxELPysEyUEGa6AwBUc+H3yFZc+vDDGVU2OYdJR1xJ80oGXNEPDeYdOTF+5cqxU5SwfjuFHvumox2dmgmjCYfbKaZ4H1UE7Q8Wq8g2ZxmbPAIW7tunHVgwHCc9vkCYZtJU/MwO8h3kD5s1JAt1lzrLzgvNGxrCeKzdNKmj2nWYiBctEvIF2fj2LeZII2Cawnvewi0gBdbnP9RU5he7arOki+FUfNBcawCT1w72fWZbDiPUio2Hp8UNO4VRSunjoZitSrzVi6maqRE8LUGOmqxFI7Bpcbz7rNrTZxjs1kL4ul7bFE2DGhZeAeFpS5PorvIv6GUzUzwcOS1tExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm+xZweXO57IT1cyV/up89eBv4of/vIUESJuZJppyw0=;
 b=TicDNRWk3a9VEL9w/NQGKWMG8rb+xqlZ8VNLVtuUwzwtA8+xuW+EOS9pmAFcfqwOjkWejdzlY6T3g1AoTxcPnFGgqRLwtQVpuqz0i1wqWv5VKL4Vlxz87Tw5fRxHwdd6bC/BtrdtX/CtBk0leOyc6eszbqs3bOD5RxbkMRmHXGkblPBVXlZHSl0ir27/bpQX0Kt8eauMGPmgX2iKogFSDQ3ESKv8Ho2+Z5EZ3CkSFAiV6UoD4XfOfT7lS/zBBLVekYyxOCZz0kZKyrMOZ08Y4UXW8xR/O1xl7uZnWQAfSw7UEd06vPFHERoVAhZiCwUtH5Z2GeipZBYIi8TWH1WC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm+xZweXO57IT1cyV/up89eBv4of/vIUESJuZJppyw0=;
 b=JZNp0tMbJ47AHhfxvcDbstpgND045q45ib6MiqOa3ZaiR4UgBmEoe3kxS2fZfLwHH3d319ZLu4rlaGFSy71wcRvgZC//M+pmk5Qkpudx1g0y+RYV4NAXwgz0QFfLmyNQLaWVVrTV/ejOxeu/vRpobcbOay7JEaXt4egM5e49NJ0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWzkloLLvBmqE820eVrJEh4IHR0KnvKSEAgAFJwQCAAHhlAIABNlCA
Date: Fri, 11 Dec 2020 17:00:09 +0000
Message-ID: <5C3F0DF9-417B-4946-A906-FE2A9CD4A38F@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s>
 <4B26BDEE-DA30-4B5B-A428-9D8D4659B581@arm.com>
 <alpine.DEB.2.21.2012101428030.20986@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012101428030.20986@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79335acb-ac39-473c-dbb3-08d89df64045
x-ms-traffictypediagnostic: DB7PR08MB3387:|HE1PR0802MB2267:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB226777F7341658F5FDB1E3419DCA0@HE1PR0802MB2267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CMKIr+/webm9Az8gRmmzDBrPV6ZV8eFHAXaQx4AecaujZ7p3kP5Fk68Zg9+a1oR7RaVwF4UiVefcJ0mqdHgMWYOrrRA7hP9TK1Ru3Ep8pOkOCA+eOBmQRJafH4nNLcipiW8iFcYoV0+y8T2veq/zmwrbQHaWIgODvidp8DXbgNl9tOuBOWpIyxHYp3uLSuHZCBU39FBfU1o9DP8redpDKzZlEz7l7lfFKpeZqrl02JKsrVVS81jtYgcTrs2F95LT1OK0MbSH+GaqUYdlEWlp5rKPJAzBWCsqHNHm+nomAr845mdEGfs2YL3kkKhtnV4w8WYtvPNWFjQNcsyIvXQWgyhWNbbKjgsoHDQff4+p2V/XSOtPwZxcJHzTtrZgj9X3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(66446008)(2616005)(66476007)(36756003)(6512007)(86362001)(6916009)(91956017)(2906002)(66946007)(64756008)(76116006)(26005)(6486002)(71200400001)(53546011)(6506007)(8676002)(4326008)(33656002)(186003)(8936002)(478600001)(316002)(54906003)(83380400001)(66556008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?/VHPKKuSAD1zk1GMAkOXJFXjdyiUT9g9AkDf4gMTy9fqe8C+8PZn6cFvasS6?=
 =?us-ascii?Q?I4qU9UVQHyu/EFMniswdfKujIfg8TyxFfI/w6C4Y7KoXz1uAj2NDLlaFHDNr?=
 =?us-ascii?Q?jcMoj/ZAXoA6s4HBEeJONrJnF6DSW9zrNB85CbuFt19GhVS5gczJ+6jvAhTo?=
 =?us-ascii?Q?UiSm5zDur1IxHBJRs3c74YaLHMQZXH2DhDsO3RAvwqe5nyLf8VBq+6nzC75j?=
 =?us-ascii?Q?uWkw6bMSAcdnEaewbo/HDwLjz78ThTp+3NjbK5a0xuaop/dJrvuNwcECHt/f?=
 =?us-ascii?Q?4A2/BaRyc1p9We0UaCCxMSUM+2N1J3TU4VaVFpO7Dp1VUFLZH0AOhosnDhix?=
 =?us-ascii?Q?IVlDKz/XiPrb6yywhmIYOqW2fEA3wY4i/BmExKsoVhMULyfSnosyh6rMYdkG?=
 =?us-ascii?Q?zb3gMGDpLo3XYG25jwIe2t/kG2q2wK8H6mHlycoCpaROlvHtH1M/zIdd7r3w?=
 =?us-ascii?Q?vnIyOZsmIqhhTR4YQvRZwIdWNXt65UxNtYYThHTRz7Mme3BD9cgsHaHScBch?=
 =?us-ascii?Q?uovevXpq0EdR8WomTmITvmgPAY7FKqrQA3AqvujGsjh4Km3P3ndFIN5An4qf?=
 =?us-ascii?Q?+jQ+zORxn6uInbK8HMUXQGeGw6yDUTH3qv2hGi7x8kSzRakgHkuwfPaEA5jH?=
 =?us-ascii?Q?tQKKhyjOQmueYt1B3NM5UUrRr/7I6CE2oQE6frBbbTVs/o8QEXxVA1a21TpH?=
 =?us-ascii?Q?0P8ZhegwOVt6EtWi1+PSf9USWIOCEDn8CU3/6mPmiCIhIxPTg9mo6T3MrgF/?=
 =?us-ascii?Q?x3cMwMfeljZpLPm/+yddnVkgz/Lo3jQxn1UOUwSZ1B8ZcOntd7qu+dRrRUAh?=
 =?us-ascii?Q?1nTeCBxRPse/V4qJ2wmyTBarjo07CCbIQoeLrGov/+dwG3SSI3tPdoay+lRX?=
 =?us-ascii?Q?RVLQsoYxIrVdcT3ywRRc47uCw/7p5gImZA5EwzwNvVtsJoDoSlMd5Io/LryF?=
 =?us-ascii?Q?v0gxwealz2jRNmRJR9BF1S0lf13CtIPe180v+YIitWXCdttRyPGgKN9KZLDU?=
 =?us-ascii?Q?3HiE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F17DAC197F0E694DA85183D123E3928D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ed1ff25-a378-4a9a-fdaa-08d89df637f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MWrWM26SjyHl9PbhJS8+kwaUIR8F+TB9Uzdjo3HgWfzcRa4xd4QjEdS2ao/LjgRiuDg8ozfVupHNFA/3xwhjg/C8oUJhk+l1YptubBX9c6Z0t3YxUmqo8JJIMJx1UHJe7sHCbo5Hzj++3jWHw1bkNZKn8Wl4VasrCf0MX8hN8X+GSv+/peef3h6yRMHxIsb2ngPtp44mX59FxfdVH4HCZtnM1T09+0+IQOL711fUB9s+ODECKos5bl4tnMs5cgZHmObZ0567HVG1xonx4NTo2EvcRTLlke9Rh9xz0yNQJmdfLKKqqhBKSqMjbcjvjdTX/hO84ixqvTZwYZu8Jsw+ypooB76z7Dng1XTMf5FosEQcPtpUqWvhOjSHOCK87v3JFUwMbtRs5iSGGEhXxXZFnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(54906003)(316002)(4326008)(8676002)(478600001)(6862004)(5660300002)(8936002)(336012)(2616005)(6512007)(83380400001)(6506007)(53546011)(70206006)(26005)(107886003)(2906002)(33656002)(82310400003)(70586007)(47076004)(81166007)(186003)(356005)(86362001)(6486002)(82740400003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 17:00:23.7441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79335acb-ac39-473c-dbb3-08d89df64045
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2267

Hi Stefano,

> On 10 Dec 2020, at 22:29, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 10 Dec 2020, Bertrand Marquis wrote:
>> Hi Stefano,
>>=20
>>> On 9 Dec 2020, at 19:38, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Wed, 9 Dec 2020, Bertrand Marquis wrote:
>>>> Add vsysreg emulation for registers trapped when TID3 bit is activated
>>>> in HSR.
>>>> The emulation is returning the value stored in cpuinfo_guest structure
>>>> for know registers and is handling reserved registers as RAZ.
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> Changes in V2: Rebase
>>>> Changes in V3:
>>>> Fix commit message
>>>> Fix code style for GENERATE_TID3_INFO declaration
>>>> Add handling of reserved registers as RAZ.
>>>>=20
>>>> ---
>>>> xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 53 insertions(+)
>>>>=20
>>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg=
.c
>>>> index 8a85507d9d..ef7a11dbdd 100644
>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>>>>        break;                                                         =
 \
>>>>    }
>>>>=20
>>>> +/* Macro to generate easily case for ID co-processor emulation */
>>>> +#define GENERATE_TID3_INFO(reg, field, offset)                       =
   \
>>>> +    case HSR_SYSREG_##reg:                                           =
   \
>>>> +    {                                                                =
   \
>>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,=
   \
>>>> +                          1, guest_cpuinfo.field.bits[offset]);      =
   \
>>>=20
>>> [...]
>>>=20
>>>> +    HSR_SYSREG_TID3_RESERVED_CASE:
>>>> +        /* Handle all reserved registers as RAZ */
>>>> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>=20
>>>=20
>>> We are implementing both the known and the implementation defined
>>> registers as read-as-zero. On write, we inject an exception.
>>>=20
>>> However, reading the manual, it looks like the implementation defined
>>> registers should be read-as-zero/write-ignore, is that right?
>>=20
>> In the documentation, I did find all those defined as RO (Arm Architectu=
re
>> reference manual, chapter D12.3.1). Do you think we should handle Read
>> only register as write ignore ? now i think of it RO does not explicitel=
y mean
>> if writes are ignored or should generate an exception.
>>=20
>>>=20
>>> I couldn't easily find in the manual if it is OK to inject an exception
>>> on write to a known register.
>>=20
>> I am actually unsure if it should or not.
>> I will try to run a test to check what is happening if this is done on t=
he
>> real hardware and come back to you on this one.
>=20
> Yeah, that's the best way to do it: if writes are ignored on real
> hardware, let's turn this into read-only/write-ignore, otherwise if they
> generate an exception then let's keep the code as is.
>=20
> Also you might want to do that both for a known register and also for an
> unknown register to see if it makes a difference.

I did a test with the following:
- WRITE_SYSREG64(0xf, S3_0_C0_C3_3)
- WRITE_SYSREG64(0xf, ID_MMFR0_EL1)
- WRITE_SYSREG64(0xf, ID_AA64MMFR0_EL1)

All generate exceptions like:
Hypervisor Trap. HSR=3D0x2000000 EC=3D0x0 IL=3D1 Syndrome=3D0x0

So I think it is right to generate an exception if one of them is accessed.

Regards
Bertrand

>=20
> Thank you!


