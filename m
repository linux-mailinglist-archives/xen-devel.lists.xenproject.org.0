Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739322D5F5D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:19:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49433.87419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNid-0001lc-3y; Thu, 10 Dec 2020 15:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49433.87419; Thu, 10 Dec 2020 15:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNid-0001lC-0b; Thu, 10 Dec 2020 15:18:59 +0000
Received: by outflank-mailman (input) for mailman id 49433;
 Thu, 10 Dec 2020 15:18:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNib-0001l7-56
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:18:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c535cb-7b91-45b0-9a97-ac5c6ddd8935;
 Thu, 10 Dec 2020 15:18:56 +0000 (UTC)
Received: from DB6PR0301CA0036.eurprd03.prod.outlook.com (2603:10a6:4:3e::46)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 15:18:54 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::ec) by DB6PR0301CA0036.outlook.office365.com
 (2603:10a6:4:3e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:18:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:18:54 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Thu, 10 Dec 2020 15:18:54 +0000
Received: from 25ad87520432.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F39FC8B-D8DB-4DCD-ADAE-D41E1779FC18.1; 
 Thu, 10 Dec 2020 15:18:38 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 25ad87520432.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:18:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:18:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:18:36 +0000
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
X-Inumbo-ID: e7c535cb-7b91-45b0-9a97-ac5c6ddd8935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZASlVesH782+AFLniPdwPzkyWVtP5yPWZKKhLBduk+Y=;
 b=kZfjcPIH6OyfmsEHrI7hlDU6QXpE+oOGRYWmfXugB/w6+PiF6bHxoKioH/pYYuD86EwyXdPnzSWPSFP1OVa3jzTQpo86xx0Ei07vkr4VC6/yjFp/pz8Ofxn/yJ7G4zGHbZGv2uTTQvwALzIkq81vGtvyAEU5Bk3BrvTkrAD3euU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 938ce5b525716768
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZPEWYbryKy86hAqihxwVg6TDOhnoNOZ2OOrJv5ArU209qt0MERgz2FZfwUNF6jsMIwmbJmLnQettafT43NGCwSh9txK8bVNFpJ8nPFQH7KRmnoAaLAh/wrs827Qu1j2u0T5TmmijFqQdSHWoT9MZ9AaZTEJuw1tT6J8CvWhq3xASmiOPWiSCIZ2hlDSAhu21xkE4ZNqzmEPXN/vO98I5J1WzEgerSyH0UFbpZXQ/VSDG12kW9+HXjriGkqDbhJfIEuxKCWBfzimMUvNFG1SvZKywof5k+0m/e/hMKp9Is438+RT8D7RUA6jzHrOF40FrLjinauAdJZw2pxCvGD3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZASlVesH782+AFLniPdwPzkyWVtP5yPWZKKhLBduk+Y=;
 b=kpps6bk5NCwgPd/aBdPK51dcN5ImvqP8GePpda+xrkYxxkjoUE9/c9VpCk0yKJGyqB9Mh3Bfu4ByBd/sDL+XD2nA3wIGDq17Ka2A3oyHy7hh7JvyOjqCi/eK55dqSq2tM/uAp0qSEab5K07jgHhRSooojSQcd6KozLdfthfI4Ugp6n+a58vQONBC6cq7U+hlRp2E0T8kMFN31TQYM8ox18JYq8SLAvHzxpG4jQtPdUBZLAyLMQTdfBFwGmu/YwfyX8j2hxsMN8zM4/iawIxxVfRY60MCcu14ke72gmvdO6YCSSH9JVtWSiXtS/bEshWhrjx6xIzmiNw6Dm0WCVJ8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZASlVesH782+AFLniPdwPzkyWVtP5yPWZKKhLBduk+Y=;
 b=kZfjcPIH6OyfmsEHrI7hlDU6QXpE+oOGRYWmfXugB/w6+PiF6bHxoKioH/pYYuD86EwyXdPnzSWPSFP1OVa3jzTQpo86xx0Ei07vkr4VC6/yjFp/pz8Ofxn/yJ7G4zGHbZGv2uTTQvwALzIkq81vGtvyAEU5Bk3BrvTkrAD3euU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWzkloLLvBmqE820eVrJEh4IHR0KnvKSEAgAFJwQA=
Date: Thu, 10 Dec 2020 15:18:36 +0000
Message-ID: <4B26BDEE-DA30-4B5B-A428-9D8D4659B581@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012091131350.20986@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c720d1ae-9d88-4422-462c-08d89d1ee811
x-ms-traffictypediagnostic: DBBPR08MB4821:|VI1PR0802MB2288:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB22881AC1D35C612E04D63B2D9DCB0@VI1PR0802MB2288.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8omD98Pb0ZfNz6sw9RREOJWuhxUzqvIlQ60fiBKEXSvbFDY+fS3bIyP+YWqiWcBxQcL8eMsaPrXeMO0dohkSbIX9dMpr+2ie8j7ZnnqZxdq+I7ItV9u9afyetGokQ4tru8byBeZFrYZhexvsjBEu5IJDh944W1AOFdjVXmBTiO+0q21QnCHFFA5C+TEJUVIeKruWoIRzFChZehAoMZwusME+3JBRlPHi2mVCL7dqdxzYIChdFKB/pkd+pd/6KdiJshm2v8fgXKd93vvZz4M+oMunFp5IZ4OuyYfdRs7BATCD4g18rriy/+NB33bPX9D4U6WeTEWtjueEFa1ENiYO1OZSN7D9LzmGB/5PIYt1OndogcHJArhT0vaGOAzy8zl1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(6506007)(5660300002)(316002)(6512007)(53546011)(4326008)(8676002)(76116006)(2616005)(2906002)(91956017)(71200400001)(26005)(54906003)(186003)(6916009)(83380400001)(66946007)(66476007)(36756003)(8936002)(64756008)(33656002)(66446008)(478600001)(6486002)(86362001)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?zEDwhg5J3AQLmVyuPrKljUcnDVM9imE+WlOB02tbT1r19mMPirG6gnHZV2pg?=
 =?us-ascii?Q?ngCB3qW7lT0V8JWq2TfxhuQN761xiG0Cqcm8KnqaiPWBrUh1QOa6pTA8h1l7?=
 =?us-ascii?Q?KSS44WWWI81iVTFeBkKhIIPPVdwCb/qXw4PSO54xTBDmRFPWJ05DDBfRzvZT?=
 =?us-ascii?Q?rgEfL64gEs8CqRwlceexcXNNfngDmxprbI9haOrJpyOVt8mW60JCis7R1o15?=
 =?us-ascii?Q?Kos5X5Ey1czpbB/etoluWrHdxr1mwu9kPfUOI/1IGMiIFud/GpD8GxFJtw+q?=
 =?us-ascii?Q?FMv1wlUUNHAP3VZllcQwbY7jflmHIW7jnfRP3y3G93UYbEWSqC9U3FLzgMNK?=
 =?us-ascii?Q?t1uYPv6M4aafTzxSQV64ZjAh43/xj5BoHwlQqH0FhAyiSrUIbE7Ea8dxfub6?=
 =?us-ascii?Q?MwrZLu7sjErSgkyUWqHU4CV+dnP10taSfqNXr4ypB63vzNPWpA2C/tR4z/5A?=
 =?us-ascii?Q?Xf+idl8Z/iH4P8aPoWlM6hjNftxPkCgU4csVkBjktM+WE7W66ryk6S/KtFa7?=
 =?us-ascii?Q?S1IbhQuf/1kkWpOoldGXXOj0lJB+mnlchTVnlkl2k/YaXObxxX6N+rT0zJ30?=
 =?us-ascii?Q?wJaXQBda/0YGVHAMhyT4zc6ZAJUDsKnAq6iyUzQGGEtmPm7IZYyHN2zsKQOE?=
 =?us-ascii?Q?of/YzQmAGIAmXxN0XLTOAkcsYW7gd31eMleF2SrLgCdRWmdL/a+NtFt+kFCJ?=
 =?us-ascii?Q?hzCY+6BrFyXsx1aPIks3yl2I4i1N1e4hegxrSIahMg7X/jNt8kSUMfbTaD6+?=
 =?us-ascii?Q?piys3r/xoNhk4bNHOZSrp/sMw0RMafKDB+dv5g5iT1GKTVXNyKAQSk+WSRm5?=
 =?us-ascii?Q?32b/dUjNiKt4Kzey77P28/IME3OqOvTIosBYYR1aKuSVq47b0bNGbn9VRbOj?=
 =?us-ascii?Q?MwwoQxXKAr+Xkyb3FRh1iWsfnSoOuxQo8zZ7S+Qralkybz5yJ9EsWxoIe95f?=
 =?us-ascii?Q?rvHAxAcvOxHaADyt669A9zdia+BNIN3mmakawJ4qrED5u21kYQ31DH3HLU+K?=
 =?us-ascii?Q?CPZq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE9F331D14450B4995446F34947D180A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6de977b2-6fa4-4a0c-ae4e-08d89d1eddc3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+EDUP7tgDSE5PQ1BSffBPwLlH3IHnCA5/tfznTWfjzwLsuuUUvTyVMBzCAdKeJjdEV8z3KB8074kLFA6RA0KJ+BlBZP6r/xCfLbAhz9f1lZtcd4Gb2pmVYR+S1KsG0kfHyAqdp0loOeBUfKlkianiyXrrCvYVPjIPX41lN3ieVMbvlX6V2a+0Ba28fLNc+z55y7wPQSRQmrRbaXItRq6HRG1Oix3J0B6RXSxDZmnBOHCoVNJT11Tgi7lZuLWrMe1Jd37crjXLXzYQY0P0L3MPZOYDJ1+3gsT503uU+Xa/4feQnJ6rjcfPAQNhzj0xtyXt/J9+xsSI0ea2YNPpp6n977GOUS/AtBngdKLgP2I+kV748FI+Sk97iEFE6Bliki+/VPmfdCsTDxrEo421ZKRVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(5660300002)(107886003)(70586007)(53546011)(336012)(70206006)(8936002)(82310400003)(26005)(6506007)(2616005)(478600001)(6512007)(81166007)(86362001)(186003)(8676002)(2906002)(356005)(47076004)(4326008)(83380400001)(36756003)(54906003)(6486002)(316002)(6862004)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:18:54.0891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c720d1ae-9d88-4422-462c-08d89d1ee811
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288

Hi Stefano,

> On 9 Dec 2020, at 19:38, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 9 Dec 2020, Bertrand Marquis wrote:
>> Add vsysreg emulation for registers trapped when TID3 bit is activated
>> in HSR.
>> The emulation is returning the value stored in cpuinfo_guest structure
>> for know registers and is handling reserved registers as RAZ.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>  Fix commit message
>>  Fix code style for GENERATE_TID3_INFO declaration
>>  Add handling of reserved registers as RAZ.
>>=20
>> ---
>> xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
>> 1 file changed, 53 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index 8a85507d9d..ef7a11dbdd 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>>         break;                                                          =
\
>>     }
>>=20
>> +/* Macro to generate easily case for ID co-processor emulation */
>> +#define GENERATE_TID3_INFO(reg, field, offset)                         =
 \
>> +    case HSR_SYSREG_##reg:                                             =
 \
>> +    {                                                                  =
 \
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,  =
 \
>> +                          1, guest_cpuinfo.field.bits[offset]);        =
 \
>=20
> [...]
>=20
>> +    HSR_SYSREG_TID3_RESERVED_CASE:
>> +        /* Handle all reserved registers as RAZ */
>> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
>=20
>=20
> We are implementing both the known and the implementation defined
> registers as read-as-zero. On write, we inject an exception.
>=20
> However, reading the manual, it looks like the implementation defined
> registers should be read-as-zero/write-ignore, is that right?

In the documentation, I did find all those defined as RO (Arm Architecture
reference manual, chapter D12.3.1). Do you think we should handle Read
only register as write ignore ? now i think of it RO does not explicitely m=
ean
if writes are ignored or should generate an exception.

>=20
> I couldn't easily find in the manual if it is OK to inject an exception
> on write to a known register.

I am actually unsure if it should or not.
I will try to run a test to check what is happening if this is done on the
real hardware and come back to you on this one.

Cheers
Bertrand



